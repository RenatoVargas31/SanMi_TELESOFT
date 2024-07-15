package com.example.sanmi_telesoft.servlets;

import com.example.sanmi_telesoft.beans.*;
import com.example.sanmi_telesoft.daos.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import com.example.sanmi_telesoft.filters.Sanitizer;
import com.example.sanmi_telesoft.daos.DaoTipoIncidencias;
import com.example.sanmi_telesoft.daos.DaoUrbanizacion;
import com.example.sanmi_telesoft.daos.DaoIncidencia;

import jakarta.servlet.http.Part;
import org.json.JSONObject;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "ServletCoordinadora", value = "/ServletCoordinadora")
@MultipartConfig
public class ServletCoordinadora extends HttpServlet {
    private DaoIncidencia incidenciaDao;
    public void init() throws ServletException {
        super.init();
        incidenciaDao = new DaoIncidencia();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action") == null ? "mostrarInicio" : request.getParameter("action");
        DaoProfesor daoProfesor = new DaoProfesor();
        DaoEvento daoEvento = new DaoEvento();
        DaoCoordinadora daoCoordinadora = new DaoCoordinadora();
        request.setAttribute("listaProfesores",daoProfesor.listarProfesores());
        UserDAO userDAO = new UserDAO();

        switch (action){
            case "mostrarInicio":
                // Obtener el usuario de la sesión
                Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");

                if (usuario != null) {
                    // Obtener el id del usuario como String
                    String idUsuario = String.valueOf(usuario.getIdUsuarios());

                    // Obtener el idUsuario de los parámetros de la solicitud (si se pasa como parámetro en el GET)
                    String idUsuarioParametro = request.getParameter("idUsuario");

                    // Verificar y asegurar que el idUsuario sea correcto y no nulo
                    if (idUsuarioParametro != null && !idUsuarioParametro.isEmpty()) {
                        idUsuario = idUsuarioParametro;
                    }

                    // Obtener lista de eventos del coordinador
                    ArrayList<Evento> listaMisEventos = daoEvento.listaEventosCoordinadora(Integer.parseInt(idUsuario));

                    // Establecer atributos en el request
                    request.setAttribute("listaMisEventos", listaMisEventos);
                    request.setAttribute("activeMenu", "Inicio");

                    // Contar coordinadores activos
                    int contadorCoordi = userDAO.contarCoordi();
                    request.setAttribute("coordiActivos", contadorCoordi);

                    // Determinar tipo de filtrado (Cultura o Deporte)
                    String tipoFiltrado = "Todo";

                    if (usuario.getIdTipoCoordinadora() == 1) {
                        tipoFiltrado = "Cultura";
                    } else if (usuario.getIdTipoCoordinadora() == 2) {
                        tipoFiltrado = "Deporte";
                    }

                    // Obtener lista de eventos según el tipo de filtrado
                    ArrayList<Evento> listaEventos = null;

                    if ("Deporte".equals(tipoFiltrado)) {
                        listaEventos = daoEvento.listaEventosDeporte(0, 10000);
                    } else if ("Cultura".equals(tipoFiltrado)) {
                        listaEventos = daoEvento.listaEventosCultura(0, 10000);
                    }

                    request.setAttribute("listarEventos", listaEventos);
                }

                // Redirigir al JSP correspondiente
                request.getRequestDispatcher("WEB-INF/coordinadora/indexCoordinadora.jsp").forward(request, response);
                break;

            case "mostrarAyuda":
                request.setAttribute("activeMenu", "Ayuda");
                request.getRequestDispatcher("WEB-INF/coordinadora/ayudaCoordinadora.jsp").forward(request, response);
                break;
            case "mostrarReportarIncidencias":
                mostrarFormularioReportarIncidencia(request, response);
                break;

            case "listarIncidencias":
                DaoIncidencia daoIncidencia = new DaoIncidencia();
                ArrayList<Incidencia> listaIncidencias = daoIncidencia.listarIncidencias();
                request.setAttribute("listaIncidencias", listaIncidencias);
                request.setAttribute("activeMenu", "Incidencias");
                request.setAttribute("activeMenuSub", "Incidencias2");
                request.getRequestDispatcher("WEB-INF/coordinadora/listaIncidenciasCoordinadora.jsp").forward(request, response);
                break;

            case "mostrarImagen":
                int id = Integer.parseInt(request.getParameter("id"));
                DaoIncidencia dao = new DaoIncidencia();
                Incidencia im = dao.obtenerIncidencia(id);

                if (im != null) {
                    response.setContentType("image/jpeg");
                    response.setContentLength(im.getFotoIncidencia().length);
                    OutputStream os = response.getOutputStream();
                    os.write(im.getFotoIncidencia());
                    os.flush();
                }
                break;



            case "listarMisIncidencias":
                DaoIncidencia daoIncidencia1 = new DaoIncidencia();
                ArrayList<Incidencia> listaMisIncidencias = daoIncidencia1.listarMisIncidencias(1);
                request.setAttribute("listaMisIncidencias", listaMisIncidencias);
                request.setAttribute("activeMenu", "Incidencias");
                request.setAttribute("activeMenuSub", "Incidencias3");

                request.getRequestDispatcher("WEB-INF/coordinadora/misIncidencias.jsp").forward(request, response);
                break;

            case "mostrarActualizarIncidencia":
                mostrarFormularioActualizarIncidencia(request, response);

                break;


            case "listarEventos":
                Usuario usuario0 = (Usuario) request.getSession().getAttribute("usuario");

                request.setAttribute("activeMenu", "Eventos");
                request.setAttribute("activeMenuToggle", "Eventos1");
                manejarListaEventos(request, response,usuario0);
                break;

            case "detalleEvento":
                String id2 = request.getParameter("id");
                if (id2.isEmpty() || !daoCoordinadora.validarIdEvento(id2)) {
                    response.sendRedirect(request.getContextPath() + "/ServletCoordinadora?action=listarEventos");
                }else {
                    request.getRequestDispatcher("indexCoordinadora.jsp").forward(request, response);
                }
                break;

            case "servirImagenEvento":
                int idk = Integer.parseInt(request.getParameter("id"));
                DaoEvento dao10 = new DaoEvento();
                Evento im2 = dao10.searchEventobyId(idk);

                if (im2 != null) {
                    response.setContentType("image/jpeg");
                    response.setContentLength(im2.getFotosStart().length);
                    OutputStream os = response.getOutputStream();
                    os.write(im2.getFotosStart());
                    os.flush();
                }
                break;
            case "servirImagenIncidencia":
                servirImagenIncidencia(request, response);
                break;
                
            case "borrarIncidencia":
                if (request.getParameter("id") != null) {
                    String incIdString = request.getParameter("id");
                    int incId = 0;
                    try {
                        incId = Integer.parseInt(incIdString);
                    } catch (NumberFormatException ex) {
                        response.sendRedirect("EmployeeServlet");
                    }
                    DaoIncidencia daoIncidencia3 = new DaoIncidencia();
                    daoIncidencia3.eliminarIncidencia(incId);

                }

                response.sendRedirect("ServletCoordinadora?action=listarMisIncidencias");
                break;

            case "borrarEvento":
                if (request.getParameter("id") != null) {
                    String incIdString = request.getParameter("id");
                    int eventoId = 0;
                    try {
                        eventoId = Integer.parseInt(incIdString);
                    } catch (NumberFormatException ex) {
                        response.sendRedirect("WEB-INF/coordinadora/error.jsp");
                    }
                    daoEvento.borrarEvento(eventoId);

                }

                response.sendRedirect("ServletCoordinadora?action=verMisEventos");
                break;

            case "borrarInscripcion":
                if (request.getParameter("id") != null) {
                    String incIdString = request.getParameter("id");
                    String user = request.getParameter("user");
                    int eventoId = 0;
                    int userId=0;
                    try {
                        eventoId = Integer.parseInt(incIdString);
                        userId = Integer.parseInt(user);
                    } catch (NumberFormatException ex) {
                        response.sendRedirect("WEB-INF/coordinadora/error.jsp");
                    }
                    daoEvento.borrarInscripcion(userId, eventoId);
                    response.sendRedirect("ServletCoordinadora?action=verUsuariosporEvento&id="+eventoId);

                }

                break;


            case "crearEventos":
                request.setAttribute("activeMenu", "Eventos");
                request.setAttribute("activeMenuSub", "Eventos2");

                request.getRequestDispatcher("WEB-INF/coordinadora/crearEvento.jsp").forward(request, response);
                break;
            case "actualizarEvento":
                String idEvento = request.getParameter("id");
                if (idEvento != null && !idEvento.isEmpty()) {
                    int eventoId = 0;
                    try {
                        eventoId = Integer.parseInt(idEvento);
                    } catch (NumberFormatException ex) {
                        // Manejar el caso donde idEvento no es un número válido
                        // Redirigir a una página de error o a la página principal de coordinadora
                        response.sendRedirect(request.getContextPath() + "/ServletCoordinadora");
                        return;
                    }

                    Evento evento = daoEvento.searchEventobyId(eventoId);

                    if (evento != null) {
                        request.setAttribute("evento", evento);
                        request.setAttribute("activeMenu", "Incidencias");
                        request.setAttribute("activeMenuSub", "Incidencias3");

                        request.getRequestDispatcher("WEB-INF/coordinadora/actualizarEvento.jsp").forward(request, response);
                    } else {
                        // Manejar el caso donde no se encontró el evento
                        // Redirigir a una página de error o a la página principal de coordinadora
                        response.sendRedirect(request.getContextPath() + "/ServletCoordinadora");
                    }
                } else {
                    // Manejar el caso donde el parámetro id es nulo o vacío
                    // Redirigir a una página de error o a la página principal de coordinadora
                    response.sendRedirect(request.getContextPath() + "/ServletCoordinadora");
                }
                break;


            case "viewEvento":
                request.setAttribute("activeMenuSub", "Eventos1");
                request.setAttribute("activeMenu", "Eventos");
                manejarViewEvento(request, response);
                break;

            case "miViewEvento":
                request.setAttribute("activeMenuSub", "Eventos3");
                request.setAttribute("activeMenu", "Eventos");
                manejarMiViewEvento(request, response);
                break;

            case "banearEvento":
                request.setAttribute("activeMenuSub", "Eventos3");
                request.setAttribute("activeMenu", "Eventos");
                Usuario usuario00 = (Usuario) request.getSession().getAttribute("usuario");

                    String idUsuario00 = String.valueOf(usuario00.getIdUsuarios());

                    // Obtener el idUsuario de los parámetros de la solicitud (si se pasa como parámetro en el GET)
                    String idUsuarioParametro00 = request.getParameter("idUsuario");

                    // Verificar y asegurar que el idUsuario sea correcto y no nulo
                    if (idUsuarioParametro00 != null && !idUsuarioParametro00.isEmpty()) {
                        idUsuario00 = idUsuarioParametro00;
                    }
                    ArrayList<Evento> listaMisEventos2 = daoEvento.listaEventosCoordinadora(Integer.parseInt(idUsuario00));

                    // Establecer atributos en el request
                    request.setAttribute("listaMisEventos", listaMisEventos2);
                request.getRequestDispatcher("WEB-INF/coordinadora/misEventos.jsp").forward(request, response);
                break;


            case "verMisEventos":
                // Obtener el usuario de la sesión
                Usuario usuario2 = (Usuario) request.getSession().getAttribute("usuario");

                if (usuario2 != null) {
                    // Obtener el id del usuario como String
                    String idUsuario = String.valueOf(usuario2.getIdUsuarios());

                    // Obtener el idUsuario de los parámetros de la solicitud (si se pasa como parámetro en el GET)
                    String idUsuarioParametro = request.getParameter("idUsuario");

                    // Verificar y asegurar que el idUsuario sea correcto y no nulo
                    if (idUsuarioParametro != null && !idUsuarioParametro.isEmpty()) {
                        idUsuario = idUsuarioParametro;
                    }

                    // Llamar al método listaEventosCoordinadora con el id del usuario
                    ArrayList<Evento> listaMisEventos = daoEvento.listaEventosCoordinadora(Integer.parseInt(idUsuario));

                    // Establecer atributos en el request
                    request.setAttribute("listaMisEventos", listaMisEventos);
                    request.setAttribute("activeMenu", "Eventos");
                    request.setAttribute("activeMenuSub", "Eventos3");

                    // Redirigir a la página JSP correspondiente
                    request.getRequestDispatcher("WEB-INF/coordinadora/misEventos.jsp").forward(request, response);
                } else {
                    // Manejar el caso donde el usuario no está en sesión
                    // Por ejemplo, redirigir a una página de error o hacer alguna otra acción
                    response.sendRedirect("WEB-INF/coordinadora/error.jsp");
                }
                break;

            case "verUsuariosporEvento":
                manejarVerUsuariosporEvento(request, response);
                break;


        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        String idUsuario;

        if (usuario != null) {
            // Obtener el id del usuario como String
            idUsuario = String.valueOf(usuario.getIdUsuarios());

            // Obtener el idUsuario de los parámetros de la solicitud (si se pasa como parámetro en el GET)
            String idUsuarioParametro = request.getParameter("idUsuario");

            // Verificar y asegurar que el idUsuario sea correcto y no nulo
            if (idUsuarioParametro != null && !idUsuarioParametro.isEmpty()) {
                idUsuario = idUsuarioParametro;
            }
            }

        response.setContentType("text/html");
        String action = request.getParameter("action");
        if (action == null) {
            doGet(request, response);
            return;
        }
        DaoEvento eventoDao = new DaoEvento();

        boolean lunesActive = false;
        boolean martesActive = false;
        boolean miercolesActive = false;
        boolean juevesActive = false;
        boolean viernesActive = false;
        boolean sabadoActive = false;
        boolean domingoActive = false;


        switch (action){
            case "buscarEventos":
                manejarBuscarEventos(request, response,usuario);
                break;

            case "banearEvento":
                String baneo = request.getParameter("baneo");
                int idUsuario2 = Integer.parseInt(request.getParameter("user"));
                int idEvento2 = Integer.parseInt(request.getParameter("id"));
                eventoDao.banearUsuario(idUsuario2,idEvento2, baneo);
                System.out.println(baneo);
                response.sendRedirect(request.getContextPath() + "/ServletCoordinadora?action=verUsuariosporEvento&id="+request.getParameter("id"));

                break;

            case "reportarIncidencia":
                reportarIncidencia(request, response);
                break;
            case "actualizarIncidencia":
                actualizarIncidencia(request, response);

                break;

            case "guardarEventos":
                try {
                    String nombreEvento = request.getParameter("nombre");
                    String vacantes = request.getParameter("vacantes");
                    String descripcion = request.getParameter("descripcion");
                    String ubicacion = request.getParameter("LugarExacto");
                    String FechaInicio = request.getParameter("FechaInicio");
                    String FechaFin = request.getParameter("FechaFin");
                    String Materiales = request.getParameter("materiales");
                    int idEvento = Integer.parseInt(request.getParameter("tipoEvento"));
                    String horaInicio = request.getParameter("horaInicio");
                    int idProfesor = Integer.parseInt(request.getParameter("profesorId"));
                    String horaFin = request.getParameter("horaFin");
                    int idCoordinadora = Integer.parseInt(request.getParameter("idCoordinadora"));

                    // Validaciones
                    if (nombreEvento.isEmpty()) {
                        request.setAttribute("errorMessage", "El nombre del evento no puede ser nulo.");
                        request.getRequestDispatcher("WEB-INF/coordinadora/error.jsp").forward(request, response);
                        return;
                    }
                    if (descripcion.length() > 255) {
                        request.setAttribute("errorMessage", "La descripción no puede exceder los 255 caracteres.");
                        request.getRequestDispatcher("WEB-INF/coordinadora/error.jsp").forward(request, response);
                        return;
                    }
                    if (Materiales != null && Materiales.length() > 255) {
                        request.setAttribute("errorMessage", "Los materiales no pueden exceder los 255 caracteres.");
                        request.getRequestDispatcher("WEB-INF/coordinadora/error.jsp").forward(request, response);
                        return;
                    }
                    if (FechaFin.compareTo(FechaInicio) < 0) {
                        request.setAttribute("errorMessage", "La fecha de fin debe ser mayor o igual a la fecha de inicio.");
                        request.getRequestDispatcher("WEB-INF/coordinadora/error.jsp").forward(request, response);
                        return;
                    }
                    if (FechaFin.equals(FechaInicio) && horaFin.compareTo(horaInicio) <= 0) {
                        request.setAttribute("errorMessage", "Si la fecha de fin es igual a la fecha de inicio, la hora de fin debe ser mayor a la hora de inicio.");
                        request.getRequestDispatcher("WEB-INF/coordinadora/error.jsp").forward(request, response);
                        return;
                    }

                    InputStream fotoEvento = request.getPart("file").getInputStream();
                    byte[] fotoEvento2 = fotoEvento.readAllBytes();

                    Evento evento = new Evento();
                    evento.setNombreEvento(nombreEvento);
                    evento.setVacantesDisp(Integer.parseInt(vacantes));
                    evento.setDescriptionEvento(descripcion);
                    evento.setLugarEvento(ubicacion);
                    evento.setFechaEventoStart(FechaInicio);
                    evento.setFechaEventoEnd(FechaFin);
                    evento.setMaterialesEvento(Materiales);
                    evento.setHoraEventoStart(horaInicio);
                    evento.setHoraEventoEnd(horaFin);
                    evento.setFotosStart(fotoEvento2);

                    Profesor profesor = new Profesor();
                    profesor.setIdProfesores(idProfesor);
                    evento.setProfesor(profesor);

                    TipoEvento tipoEvento1 = new TipoEvento();
                    tipoEvento1.setIdTipoEvento(idEvento);
                    evento.setTipoEvento(tipoEvento1);

                    // Validacion de la frecuencia
                    String[] diasSeleccionados = request.getParameterValues("diasSemana");

                    if (diasSeleccionados != null) {
                        for (String dia : diasSeleccionados) {
                            switch (dia) {
                                case "lunesActive":
                                    evento.setLunesActive(true);
                                    break;
                                case "martesActive":
                                    evento.setMartesActive(true);
                                    break;
                                case "miercolesActive":
                                    evento.setMiercolesActive(true);
                                    break;
                                case "juevesActive":
                                    evento.setJuevesActive(true);
                                    break;
                                case "viernesActive":
                                    evento.setViernesActive(true);
                                    break;
                                case "sabadoActive":
                                    evento.setSabadoActive(true);
                                    break;
                                case "domingoActive":
                                    evento.setDomingoActive(true);
                                    break;
                            }
                        }
                    }

                    EstadoEvento estadoEvento = new EstadoEvento();
                    estadoEvento.setIdEstadoEvento(1); // Estado NoIniciado
                    evento.setEstadoEvento(estadoEvento);

                    evento.setIdCoordinadora(idCoordinadora);

                    eventoDao.crearEvento(evento);
                    response.sendRedirect(request.getContextPath() + "/ServletCoordinadora?action=verMisEventos");
                } catch (NumberFormatException e) {
                    // Manejo de error si no se puede parsear algún número
                    request.setAttribute("errorMessage", "Error: uno de los valores numéricos no es válido.");
                    request.getRequestDispatcher("WEB-INF/coordinadora/error.jsp").forward(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                    request.setAttribute("errorMessage", "Error al guardar el evento.");
                    request.getRequestDispatcher("WEB-INF/coordinadora/error.jsp").forward(request, response);
                }
                break;


            case "actualizarEvento":
                try {
                    String nombreEvento1 = request.getParameter("nombre");
                    String vacantes1 = request.getParameter("vacantes");
                    String descripcion1 = request.getParameter("descripcion");
                    String ubicacion1 = request.getParameter("LugarExacto");
                    String FechaInicio1 = request.getParameter("FechaInicio");
                    String FechaFin1 = request.getParameter("FechaFin");
                    String horaInicio1 = request.getParameter("horaInicio");
                    String horaFin1 = request.getParameter("horaFin");
                    int idProfesor1 = Integer.parseInt(request.getParameter("profesorId"));
                    int idCoordinadora1 = Integer.parseInt(request.getParameter("idCoordinadora"));
                    String materiales1 = request.getParameter("materiales");

                    // Validaciones

                    if (nombreEvento1.isEmpty()) {
                        request.setAttribute("errorMessage", "El nombre del evento no tiene que ser nulo.");
                        request.getRequestDispatcher("WEB-INF/coordinadora/error.jsp").forward(request, response);
                        return;
                    }
                    if (descripcion1.length() > 255) {
                        request.setAttribute("errorMessage", "La descripción no puede exceder los 255 caracteres.");
                        request.getRequestDispatcher("WEB-INF/coordinadora/error.jsp").forward(request, response);
                        return;
                    }

                    if (materiales1 != null && materiales1.length() > 255) {
                        request.setAttribute("errorMessage", "Los materiales no pueden exceder los 255 caracteres.");
                        request.getRequestDispatcher("WEB-INF/coordinadora/error.jsp").forward(request, response);
                        return;
                    }

                    if (FechaFin1.compareTo(FechaInicio1) < 0) {
                        request.setAttribute("errorMessage", "La fecha de fin debe ser mayor o igual a la fecha de inicio.");
                        request.getRequestDispatcher("WEB-INF/coordinadora/error.jsp").forward(request, response);
                        return;
                    }

                    if (FechaFin1.equals(FechaInicio1) && horaFin1.compareTo(horaInicio1) <= 0) {
                        request.setAttribute("errorMessage", "Si la fecha de fin es igual a la fecha de inicio, la hora de fin debe ser mayor a la hora de inicio.");
                        request.getRequestDispatcher("WEB-INF/coordinadora/error.jsp").forward(request, response);
                        return;
                    }

                    byte[] fotoEvento3 = null;
                    Part filePart = request.getPart("file");
                    if (filePart.getSize() > 0) {
                        InputStream fotoEvento1 = filePart.getInputStream();
                        fotoEvento3 = fotoEvento1.readAllBytes();
                    } else {
                        // Mantener la foto existente
                        Evento eventoExistente = eventoDao.searchEventobyId(Integer.parseInt(request.getParameter("idEvento")));
                        fotoEvento3 = eventoExistente.getFotosStart();
                    }


                    Evento evento1 = new Evento();
                    evento1.setIdEventos(Integer.parseInt(request.getParameter("idEvento")));
                    evento1.setNombreEvento(nombreEvento1);
                    evento1.setVacantesDisp(Integer.parseInt(vacantes1));
                    evento1.setDescriptionEvento(descripcion1);
                    evento1.setLugarEvento(ubicacion1);
                    evento1.setFechaEventoStart(FechaInicio1);
                    evento1.setFechaEventoEnd(FechaFin1);
                    evento1.setHoraEventoStart(horaInicio1);
                    evento1.setHoraEventoEnd(horaFin1);
                    evento1.setFotosStart(fotoEvento3);
                    evento1.setMaterialesEvento(materiales1);

                    Profesor profesor1 = new Profesor();
                    profesor1.setIdProfesores(idProfesor1);
                    evento1.setProfesor(profesor1);

                    // Validacion de la frecuencia
                    String[] diasSeleccionados2 = request.getParameterValues("diasSemana");


                    if (diasSeleccionados2 != null) {
                        for (String dia : diasSeleccionados2) {
                            switch (dia) {
                                case "lunesActive":
                                    lunesActive = true;
                                    break;
                                case "martesActive":
                                    martesActive = true;
                                    break;
                                case "miercolesActive":
                                    miercolesActive = true;
                                    break;
                                case "juevesActive":
                                    juevesActive = true;
                                    break;
                                case "viernesActive":
                                    viernesActive = true;
                                    break;
                                case "sabadoActive":
                                    sabadoActive = true;
                                    break;
                                case "domingoActive":
                                    domingoActive = true;
                                    break;
                            }
                        }
                    }

                    evento1.setLunesActive(lunesActive);
                    evento1.setMartesActive(martesActive);
                    evento1.setMiercolesActive(miercolesActive);
                    evento1.setJuevesActive(juevesActive);
                    evento1.setViernesActive(viernesActive);
                    evento1.setSabadoActive(sabadoActive);
                    evento1.setDomingoActive(domingoActive);

                    EstadoEvento estadoEvento1 = new EstadoEvento();
                    // Inicializar con el estado NoIniciado
                    estadoEvento1.setIdEstadoEvento(1);
                    evento1.setEstadoEvento(estadoEvento1);
                    evento1.setIdCoordinadora(idCoordinadora1);

                    eventoDao.actualizarEvento(evento1);
                    response.sendRedirect(request.getContextPath() + "/ServletCoordinadora?action=verMisEventos");
                } catch (NumberFormatException e) {
                    // Manejo de error si no se puede parsear el idEvento
                    request.setAttribute("errorMessage", "Error: el ID del evento no es válido.");
                    request.getRequestDispatcher("WEB-INF/coordinadora/error.jsp").forward(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                    request.setAttribute("errorMessage", "Error al actualizar el evento.");
                    request.getRequestDispatcher("WEB-INF/coordinadora/error.jsp").forward(request, response);
                }
                break;




            default:
                doGet(request, response);
                break;


        }

    }
    private void servirImagenIncidencia(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            int idIncidencia = Integer.parseInt(request.getParameter("id"));
            byte[] foto = incidenciaDao.obtenerFotoIncidencia(idIncidencia);

            if (foto != null) {
                response.setContentType("image/jpeg");
                response.getOutputStream().write(foto);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
    private void mostrarFormularioActualizarIncidencia(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Usuario usuario = (Usuario) session.getAttribute("usuario");
        if (usuario == null) {
            response.sendRedirect(request.getContextPath() + "/ServletLoguin");
            return;
        }

        try {
            int idIncidencia = Integer.parseInt(request.getParameter("id"));
            Incidencia incidencia = incidenciaDao.obtenerIncidencia(idIncidencia);

            if (incidencia != null) {
                DaoTipoIncidencias tipoIncidenciaDAO = new DaoTipoIncidencias();
                DaoUrbanizacion urbanizacionDAO = new DaoUrbanizacion();
                ArrayList<TipoIncidencia> tipos = tipoIncidenciaDAO.getTipoIncidencias();
                ArrayList<Urbanizacion> urbanizaciones = urbanizacionDAO.getUrbanizaciones();

                request.setAttribute("tipos", tipos);
                request.setAttribute("urbanizaciones", urbanizaciones);
                request.setAttribute("incidencia", incidencia);

                request.getRequestDispatcher("/WEB-INF/coordinadora/actualizarIncidencia.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/ServletCoordinadora?action=listarMisIncidencias");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/ServletCoordinadora?action=listarMisIncidencias");
        }
    }
    private void actualizarIncidencia(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String nombreIncidencia = request.getParameter("fullname");
        String telefono = request.getParameter("phone");
        int id = Integer.parseInt(request.getParameter("incidencia_id"));
        String lugarExacto = request.getParameter("LugarExacto");
        String referencia = request.getParameter("Referencia");
        int tipoIncidenciaId = Integer.parseInt(request.getParameter("tipoIncidencia"));
        int urbanizacionId = Integer.parseInt(request.getParameter("urbanizacion"));
        Part fotoPart = request.getPart("file");
        boolean requiereAmbulancia = request.getParameter("requiereAmbulancia") != null;

        Map<String, String> errores = new HashMap<>();

        if (nombreIncidencia == null || nombreIncidencia.isEmpty() || nombreIncidencia.length() > 100) {
            errores.put("nombreIncidencia", "Nombre de la incidencia no válido.");
        }

        if (telefono != null && !telefono.isEmpty() && !telefono.matches("\\d{9}")) {
            errores.put("telefono", "Número de teléfono no válido.");
        }

        if (lugarExacto == null || lugarExacto.isEmpty() || lugarExacto.length() > 100) {
            errores.put("lugarExacto", "Lugar exacto no válido.");
        }

        if (referencia == null || referencia.isEmpty() || referencia.length() > 255) {
            errores.put("referencia", "Referencia no válida.");
        }

        if (tipoIncidenciaId < 1 || tipoIncidenciaId > 13) {
            errores.put("tipoIncidencia", "Tipo de incidencia no válido. Debe estar entre 1 y 13.");
        }

        if (urbanizacionId < 1 || urbanizacionId > 16) {
            errores.put("urbanizacion", "Urbanización no válida. Debe estar entre 1 y 16.");
        }

        if (fotoPart != null && fotoPart.getSize() > 0) {
            String fileName = fotoPart.getSubmittedFileName();
            String[] parts = fileName.split("\\.");
            if (parts.length < 2) {
                errores.put("fotoincidencia", "El nombre del archivo no contiene una extensión válida.");
            } else {
                String fileExtension = parts[parts.length - 1].toLowerCase();
                if (!fileExtension.equals("jpg") && !fileExtension.equals("jpeg") && !fileExtension.equals("png")) {
                    errores.put("fotoincidencia", "El archivo debe ser una imagen en formato PNG o JPG.");
                } else if (fotoPart.getSize() > 5 * 1024 * 1024) { // 5 MB máximo
                    errores.put("fotoincidencia", "El archivo es demasiado grande. Máximo permitido es 5MB.");
                }
            }
        }

        if (!errores.isEmpty()) {
            JSONObject jsonResponse = new JSONObject(errores);
            response.getWriter().write(jsonResponse.toString());
            return;
        }

        HttpSession session = request.getSession(false);
        Usuario usuario = (Usuario) session.getAttribute("usuario");
        if (usuario == null) {
            response.sendRedirect(request.getContextPath() + "/ServletLoguin");
            return;
        }

        try {
            Incidencia incidenciaExistente = incidenciaDao.obtenerIncidencia(id);
            if (incidenciaExistente == null) {
                request.setAttribute("errorMessage", "La incidencia no existe.");
                request.getRequestDispatcher("WEB-INF/coordinadora/actualizarIncidencia.jsp").forward(request, response);
                return;
            }

            Incidencia incidencia = new Incidencia();
            incidencia.setIdIncidencias(id);
            incidencia.setNombreIncidencia(nombreIncidencia);
            incidencia.setTelefono(telefono != null ? Integer.parseInt(telefono) : 0);
            incidencia.setLugarIncidencia(lugarExacto);
            incidencia.setReferenciaIncidencia(referencia);
            incidencia.setRequiereAmbulancia(requiereAmbulancia);
            incidencia.setUsuarioId(usuario.getIdUsuarios());
            incidencia.setIdTipoIncidencia(tipoIncidenciaId);
            incidencia.setIdUrbanizacion(urbanizacionId);

            if (fotoPart != null && fotoPart.getSize() > 0) {
                try (InputStream inputStream = fotoPart.getInputStream()) {
                    byte[] fotoBytes = inputStream.readAllBytes();
                    incidencia.setFotoIncidencia(fotoBytes);
                }
            } else {
                byte[] fotoExistente = incidenciaDao.obtenerFotoIncidencia(id);
                incidencia.setFotoIncidencia(fotoExistente);
            }

            incidenciaDao.actualizarIncidencia(incidencia);
            JSONObject jsonResponse = new JSONObject();
            jsonResponse.put("success", true);
            response.getWriter().write(jsonResponse.toString());
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error al actualizar la incidencia", e);
        }
    }
    private void mostrarFormularioReportarIncidencia(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Usuario usuario = (Usuario) session.getAttribute("usuario");
        if (usuario == null) {
            response.sendRedirect(request.getContextPath() + "/ServletLoguin");
            return;
        }

        DaoTipoIncidencias tipoIncidenciaDAO = new DaoTipoIncidencias();
        DaoUrbanizacion urbanizacionDAO = new DaoUrbanizacion();

        ArrayList<TipoIncidencia> tipos = tipoIncidenciaDAO.getTipoIncidencias();
        ArrayList<Urbanizacion> urbanizaciones = urbanizacionDAO.getUrbanizaciones();

        request.setAttribute("tipos", tipos);
        request.setAttribute("urbanizaciones", urbanizaciones);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/coordinadora/reportarIncidencias.jsp");
        dispatcher.forward(request, response);
    }

    private void reportarIncidencia(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String nombreIncidencia = Sanitizer.sanitize(request.getParameter("nombreIncidencia"));
        String telefono = Sanitizer.sanitize(request.getParameter("phone"));
        String lugarExacto = Sanitizer.sanitize(request.getParameter("LugarExacto"));
        String referencia = Sanitizer.sanitize(request.getParameter("Referencia"));
        int tipoIncidenciaId;
        int urbanizacionId;
        boolean requiereAmbulancia = false;

        String requiereAmbulanciaParam = request.getParameter("requiereAmbulancia");

        if (requiereAmbulanciaParam != null) {
            if ("on".equals(requiereAmbulanciaParam)) {
                requiereAmbulancia = true;
            } else {
                Map<String, String> errores = new HashMap<>();
                errores.put("requiereAmbulancia", "Valor no válido para requiere ambulancia.");
                JSONObject jsonResponse = new JSONObject(errores);
                response.getWriter().write(jsonResponse.toString());
                return;
            }
        }

        Part fotoPart = request.getPart("fotoincidencia");
        Map<String, String> errores = new HashMap<>();

        // Validaciones
        if (nombreIncidencia == null || nombreIncidencia.isBlank() || nombreIncidencia.length() > 100) {
            errores.put("nombreIncidencia", "Nombre de la incidencia no válido.");
        }

        if (telefono != null && !telefono.isBlank() && !telefono.matches("\\d{9}")) {
            errores.put("telefono", "Número de teléfono no válido.");
        }

        if (lugarExacto == null || lugarExacto.isBlank() || lugarExacto.length() > 100) {
            errores.put("lugarExacto", "Lugar exacto no válido.");
        }

        if (referencia == null || referencia.isBlank() || referencia.length() > 255) {
            errores.put("referencia", "Referencia no válida.");
        }
        try {
            tipoIncidenciaId = Integer.parseInt(request.getParameter("tipoIncidencia"));
            if (tipoIncidenciaId < 1 || tipoIncidenciaId > 13) {
                throw new NumberFormatException();
            }
        } catch (NumberFormatException e) {
            tipoIncidenciaId = -1; // Valor inválido
            errores.put("tipoIncidencia", "Tipo de incidencia no válido. Debe estar entre 1 y 13.");
        }

        // Validar urbanizacionId
        try {
            urbanizacionId = Integer.parseInt(request.getParameter("urbanizacion"));
            if (urbanizacionId < 1 || urbanizacionId > 16) {
                throw new NumberFormatException();
            }
        } catch (NumberFormatException e) {
            urbanizacionId = -1; // Valor inválido
            errores.put("urbanizacion", "Urbanización no válida. Debe estar entre 1 y 16.");
        }

        if (fotoPart != null && fotoPart.getSize() > 0) {
            String fileName = fotoPart.getSubmittedFileName();
            // Validar nombre del archivo
            String[] parts = fileName.split("\\.");
            if (parts.length < 2) {
                errores.put("fotoincidencia", "El nombre del archivo no contiene una extensión válida.");
            } else {
                String fileExtension = parts[parts.length - 1].toLowerCase();
                if (!fileExtension.equals("jpg") && !fileExtension.equals("jpeg") && !fileExtension.equals("png")) {
                    errores.put("fotoincidencia", "El archivo debe ser una imagen en formato PNG o JPG.");
                } else if (fotoPart.getSize() > 5 * 1024 * 1024) { // 5 MB máximo
                    errores.put("fotoincidencia", "El archivo es demasiado grande. Máximo permitido es 5MB.");
                } else if (!isImageFile(fotoPart)) {
                    errores.put("fotoincidencia", "El archivo subido no es una imagen válida.");
                }
            }
        }

        if (!errores.isEmpty()) {
            JSONObject jsonResponse = new JSONObject(errores);
            response.getWriter().write(jsonResponse.toString());
            return;
        }

        HttpSession session = request.getSession(false);
        Usuario usuario = (Usuario) session.getAttribute("usuario");
        if (usuario == null) {
            response.sendRedirect(request.getContextPath() + "/ServletLoguin");
            return;
        }

        Incidencia incidencia = new Incidencia();
        incidencia.setNombreIncidencia(nombreIncidencia);
        incidencia.setTelefono(telefono != null && !telefono.isBlank() ? Integer.parseInt(telefono) : 0);
        incidencia.setLugarIncidencia(lugarExacto);
        incidencia.setReferenciaIncidencia(referencia);
        incidencia.setRequiereAmbulancia(requiereAmbulancia);
        incidencia.setUsuarioId(usuario.getIdUsuarios());
        incidencia.setIdTipoIncidencia(tipoIncidenciaId);
        incidencia.setIdUrbanizacion(urbanizacionId);

        if (fotoPart != null && fotoPart.getSize() > 0) {
            try (InputStream inputStream = fotoPart.getInputStream()) {
                byte[] fotoBytes = inputStream.readAllBytes();
                incidencia.setFotoIncidencia(fotoBytes);
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            incidencia.setFotoIncidencia(null);
        }

        try {
            DaoIncidencia incidenciaDao = new DaoIncidencia();
            incidenciaDao.insertarIncidencia(incidencia);
            JSONObject jsonResponse = new JSONObject();
            jsonResponse.put("success", true);
            response.getWriter().write(jsonResponse.toString());
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error al insertar la incidencia", e);
        }
    }

    private boolean isImageFile(Part filePart) {
        try (InputStream inputStream = filePart.getInputStream()) {
            byte[] buffer = new byte[8];
            inputStream.read(buffer, 0, 8);
            String format = bytesToHex(buffer).toUpperCase();
            return format.startsWith("FFD8FF") || format.startsWith("89504E47"); // JPEG or PNG magic numbers
        } catch (IOException e) {
            return false;
        }
    }

    private String bytesToHex(byte[] bytes) {
        StringBuilder sb = new StringBuilder();
        for (byte b : bytes) {
            sb.append(String.format("%02x", b));
        }
        return sb.toString();
    }




    private void manejarListaEventos(HttpServletRequest request, HttpServletResponse response, Usuario usuario) throws ServletException, IOException {
        DaoEvento eventoDao = new DaoEvento();
        ArrayList<Evento> listaEventos;
        int total ;
        String tipo="Todo";
            assert usuario != null;
            if (usuario.getIdTipoCoordinadora()==1){ tipo="Cultura";}
        if (usuario.getIdTipoCoordinadora()==2){ tipo="Deporte";}

        //Jala el total de eventos por filtro
        if ("Deporte".equals(tipo)) {
            total = eventoDao.listaEventosDeporte(0, 1000000).size();
        } else if ("Cultura".equals(tipo)) {
            total = eventoDao.listaEventosCultura(0, 1000000).size();
        } else {
            total = eventoDao.listaEventos(0, 1000000).size();
        }

        // Página inicial
        int pg = 1;
        //Ahora se valida el id
        if(request.getParameter("pg") != null){
            try{
                pg = Integer.parseInt(request.getParameter("pg"));
                if(pg < 1) pg = 100000;
            } catch (NumberFormatException e) {
                pg = 100000;
            }

        }

        int eventosPorPagina = 9; // Número de eventos por página
        int offset = (pg - 1) * eventosPorPagina;

        //Se jala la lista de eventos por filtro
        if ("Deporte".equals(tipo)) {
            listaEventos = eventoDao.listaEventosDeporte(offset, eventosPorPagina);
        } else if ("Cultura".equals(tipo)) {
            listaEventos = eventoDao.listaEventosCultura(offset, eventosPorPagina);
        } else {
            listaEventos = eventoDao.listaEventos(offset, eventosPorPagina);
        }

        //Se envía lo atributos y nos redirige a la vista
        request.setAttribute("currentPage", pg);
        request.setAttribute("listarEventos", listaEventos);
        request.setAttribute("total", total);
        RequestDispatcher view = request.getRequestDispatcher("WEB-INF/coordinadora/listaEventos.jsp");
        view.forward(request, response);
    }
    private void manejarBuscarEventos(HttpServletRequest request, HttpServletResponse response, Usuario usuario) throws ServletException, IOException {
        String textSearch = request.getParameter("textoBuscar");
        DaoEvento eventoDao = new DaoEvento();
            String tipoFiltrado="Todo";
            assert usuario != null;
            if (usuario.getIdTipoCoordinadora()==1){ tipoFiltrado="Cultura";}
            if (usuario.getIdTipoCoordinadora()==2){ tipoFiltrado="Deporte";}

        ArrayList<Evento> lista;
        int pg = 1;
        request.setAttribute("currentPage", pg);

        if ("Deporte".equals(tipoFiltrado)) {
            lista = eventoDao.searchEventobyNameFiltrado(textSearch, 2);
        } else if ("Cultura".equals(tipoFiltrado)) {
            lista = eventoDao.searchEventobyNameFiltrado(textSearch, 1);
        } else {
            lista = eventoDao.searchEventobyName(textSearch);
        }
        int total = lista.size();
        request.setAttribute("total", total);

        request.setAttribute("currentPage", pg);

        if ("Deporte".equals(tipoFiltrado)) {
            lista = eventoDao.searchEventobyNameFiltrado(textSearch, 2);
        } else if ("Cultura".equals(tipoFiltrado)) {
            lista = eventoDao.searchEventobyNameFiltrado(textSearch, 1);
        } else {
            lista = eventoDao.searchEventobyName(textSearch);
        }


        request.setAttribute("listarEventos", lista);
        request.getRequestDispatcher("WEB-INF/coordinadora/listaEventos.jsp").forward(request, response);
    }
    private void manejarErrorEvento(HttpServletRequest request, HttpServletResponse response, String mensaje) throws ServletException, IOException {
        request.setAttribute("errorEvento", mensaje);
        RequestDispatcher view = request.getRequestDispatcher("errorEvento.jsp");
        view.forward(request, response);
    }

    private void manejarViewEvento(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        String id3 = request.getParameter("id");
        DaoEvento daoEvento = new DaoEvento();
        if (id3 != null && !id3.isEmpty()) {
            try {
                int eventId = Integer.parseInt(id3);
                Evento evento = daoEvento.searchEventobyId(eventId);
                if (evento != null && evento.getTipoEvento().getIdTipoEvento() == usuario.getIdTipoCoordinadora()) {
                    request.setAttribute("evento", evento);
                    RequestDispatcher view = request.getRequestDispatcher("WEB-INF/coordinadora/viewEvento.jsp");
                    view.forward(request, response);
                } else {
                    response.sendRedirect(request.getContextPath() + "/ServletCoordinadora?action=listarEventos");
                }
            } catch (NumberFormatException e) {
                response.sendRedirect(request.getContextPath() + "/ServletCoordinadora?action=listarEventos");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/ServletCoordinadora?action=listarEventos");
        }
    }

    private void manejarVerUsuariosporEvento(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        String id3 = request.getParameter("id");
        DaoEvento daoEvento = new DaoEvento();
        if (id3 != null && !id3.isEmpty()) {
            try {
                // Intentar obtener la lista de usuarios inscritos para el evento especificado por 'id'
                int eventId = Integer.parseInt(request.getParameter("id"));
                ArrayList<Integer> listaUsuariosporEvento = daoEvento.usuariosInscritosporEvento(eventId);
                Evento e = daoEvento.searchEventobyId(eventId);

                if( e != null && e.getIdCoordinadora() == usuario.getIdUsuarios()){
                    // Establecer atributos en el request para pasar datos a la JSP
                    request.setAttribute("listaUsuariosporEvento", listaUsuariosporEvento);
                    request.setAttribute("activeMenu", "Eventos");
                    request.setAttribute("activeMenuSub", "Eventos3");

                    request.getRequestDispatcher("WEB-INF/coordinadora/listaUsuarioPorEvento.jsp").forward(request, response);

                } else {
                    response.sendRedirect(request.getContextPath() + "/ServletCoordinadora?action=verMisEventos");

                }

            } catch (NumberFormatException | SQLException e) {
                // En caso de excepción, redirigir a ServletCoordinadora
                response.sendRedirect(request.getContextPath() + "/ServletCoordinadora?action=verMisEventos");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/ServletCoordinadora?action=verMisEventos");
        }

    }

    private void manejarMiViewEvento(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        String id3 = request.getParameter("id");
        DaoEvento daoEvento = new DaoEvento();
        if (id3 != null && !id3.isEmpty()) {
            try {
                int eventId = Integer.parseInt(id3);
                Evento evento = daoEvento.searchEventobyId(eventId);
                if (evento != null && evento.getIdCoordinadora() == usuario.getIdUsuarios()) {
                    request.setAttribute("evento", evento);
                    RequestDispatcher view = request.getRequestDispatcher("WEB-INF/coordinadora/viewEvento.jsp");
                    view.forward(request, response);
                } else {
                    response.sendRedirect(request.getContextPath() + "/ServletCoordinadora?action=verMisEventos");
                }
            } catch (NumberFormatException e) {
                response.sendRedirect(request.getContextPath() + "/ServletCoordinadora?action=verMisEventos");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/ServletCoordinadora?action=verMisEventos");
        }
    }
}

