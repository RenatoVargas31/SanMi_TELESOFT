package com.example.sanmi_telesoft.servlets;

import com.example.sanmi_telesoft.beans.*;
import com.example.sanmi_telesoft.daos.DaoCoordinadora;
import com.example.sanmi_telesoft.daos.DaoEvento;
import com.example.sanmi_telesoft.daos.DaoIncidencia;
import com.example.sanmi_telesoft.daos.DaoProfesor;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Arrays;

@WebServlet(name = "ServletCoordinadora", value = "/ServletCoordinadora")
@MultipartConfig
public class ServletCoordinadora extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action") == null ? "mostrarInicio" : request.getParameter("action");
        DaoProfesor daoProfesor = new DaoProfesor();
        DaoEvento daoEvento = new DaoEvento();
        DaoCoordinadora daoCoordinadora = new DaoCoordinadora();
        request.setAttribute("listaProfesores",daoProfesor.listarProfesores());

        switch (action){
            case "mostrarInicio":
                request.setAttribute("activeMenu", "Inicio");
                request.getRequestDispatcher("WEB-INF/coordinadora/indexCoordinadora.jsp").forward(request, response);
                break;

            case "mostrarAyuda":
                request.setAttribute("activeMenu", "Ayuda");
                request.getRequestDispatcher("WEB-INF/coordinadora/ayudaCoordinadora.jsp").forward(request, response);
                break;
            case "mostrarReportarIncidencias":
                request.setAttribute("activeMenu", "Incidencias");
                request.setAttribute("activeMenuSub", "Incidencias1");
                request.getRequestDispatcher("WEB-INF/coordinadora/reportarIncidencias.jsp").forward(request, response);
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
                if (request.getParameter("id") != null) {
                    String id4 = request.getParameter("id");
                    int incId = 0;
                    try {
                        incId = Integer.parseInt(id4);
                    } catch (NumberFormatException ex) {
                        response.sendRedirect("EmployeeServlet");

                    }
                    DaoIncidencia daoIncidencia3 = new DaoIncidencia();

                    Incidencia i = daoIncidencia3.obtenerIncidencia(incId);

                    if (i != null) {
                        request.setAttribute("incidencia", i);
                        request.setAttribute("activeMenu", "Incidencias");
                        request.setAttribute("activeMenuSub", "Incidencias3");

                        request.getRequestDispatcher("WEB-INF/coordinadora/actualizarIncidencia.jsp").forward(request, response);
                    } else {
                        response.sendRedirect("EmployeeServlet");
                    }

                } else {
                    response.sendRedirect("EmployeeServlet");
                }

                break;


            case "listarEventos":
                Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");

                request.setAttribute("activeMenu", "Eventos");
                request.setAttribute("activeMenuToggle", "Eventos1");
                manejarListaEventos(request, response,usuario);
                break;

            case "detalleEvento":
                String id2 = request.getParameter("id");
                if (id2.isEmpty() || !daoCoordinadora.validarIdEvento(id2)) {
                    response.sendRedirect(request.getContextPath() + "/ServletCoordinadora?action=listarEventos");
                }else {
                    request.getRequestDispatcher("indexCoordinadora.jsp").forward(request, response);
                }
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
            case "crearEventos":
                request.setAttribute("activeMenu", "Eventos");
                request.setAttribute("activeMenuSub", "Eventos2");

                request.getRequestDispatcher("WEB-INF/coordinadora/crearEvento.jsp").forward(request, response);
                break;
            case "actualizarEvento":
                if (request.getParameter("id") != null) {
                    String idEvento = request.getParameter("id");
                    int eventoId = 0;
                    try {
                        eventoId = Integer.parseInt(idEvento);
                    } catch (NumberFormatException ex) {
                        response.sendRedirect("ServletCoordinadora");

                    }

                    Evento evento = daoEvento.searchEventobyId(eventoId);

                    if (evento != null) {
                        request.setAttribute("evento", evento);
                        request.setAttribute("activeMenu", "Incidencias");
                        request.setAttribute("activeMenuSub", "Incidencias3");

                        request.getRequestDispatcher("WEB-INF/coordinadora/actualizarEvento.jsp").forward(request, response);
                    } else {
                        response.sendRedirect("ServletCoordinadora");
                    }

                } else {
                    response.sendRedirect("ServletCoordinadora");
                }
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



        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
            case "reportarIncidencia":
                DaoIncidencia incidenciaDao = new DaoIncidencia();

                String nombreIncidencia = request.getParameter("fullname");
                String telefono = request.getParameter("phone");
                String lugarExacto = request.getParameter("LugarExacto");
                String referencia = request.getParameter("Referencia");
                boolean requiereAmbulancia = request.getParameter("ambulancia") != null;
                boolean requiereBombero = request.getParameter("bomberos") != null;
                boolean requiereSerenazo = request.getParameter("serenazgos") != null;
                InputStream fotito = request.getPart("file").getInputStream();
                byte[] foto = fotito.readAllBytes();

                Incidencia incidencia = new Incidencia();
                incidencia.setNombreIncidencia(nombreIncidencia);
                //incidencia.setTelefono(Integer.parseInt(telefono));
                incidencia.setLugarIncidencia(lugarExacto);
                incidencia.setReferenciaIncidencia(referencia);
                incidencia.setRequiereAmbulancia(requiereAmbulancia);
                incidencia.setRequiereBombero(requiereBombero);
                incidencia.setRequierePolicia(requiereSerenazo);
                incidencia.setFotoIncidencia(foto);
                incidenciaDao.insertarIncidencia(incidencia);
                response.sendRedirect(request.getContextPath() + "/ServletCoordinadora?action=listarIncidencias");
                break;
            case "resetIncidencia":
                DaoIncidencia incidenciaDao2 = new DaoIncidencia();

                String nombreIncidencia2 = request.getParameter("fullname");
                String telefono2 = request.getParameter("phone");
                String lugarExacto2 = request.getParameter("LugarExacto");
                String referencia2 = request.getParameter("Referencia");
                boolean requiereAmbulancia2 = request.getParameter("ambulancia") != null;
                boolean requiereBombero2 = request.getParameter("bomberos") != null;
                boolean requiereSerenazo2 = request.getParameter("serenazgos") != null;
                InputStream fotito2 = request.getPart("file").getInputStream();
                byte[] foto2 = fotito2.readAllBytes();

                Incidencia incidencia2 = new Incidencia();
                incidencia2.setNombreIncidencia(nombreIncidencia2);
                incidencia2.setTelefono(Integer.parseInt(telefono2));
                incidencia2.setLugarIncidencia(lugarExacto2);
                incidencia2.setReferenciaIncidencia(referencia2);
                incidencia2.setRequiereAmbulancia(requiereAmbulancia2);
                incidencia2.setRequiereBombero(requiereBombero2);
                incidencia2.setRequierePolicia(requiereSerenazo2);
                incidencia2.setFotoIncidencia(foto2);
                incidencia2.setIdIncidencias(Integer.parseInt(request.getParameter("incidencia_id"))); //no olvidar que para actualizar se debe enviar el ID

                incidenciaDao2.actualizarIncidencia(incidencia2);

                response.sendRedirect(request.getContextPath() + "/ServletCoordinadora?action=listarMisIncidencias");

                break;

            case "guardarEventos":
                String nombreEvento = request.getParameter("nombre");
                String vacantes = request.getParameter("vacantes");
                String descripcion = request.getParameter("descripcion");
                String ubicacion = request.getParameter("LugarExacto");
                String FechaInicio = request.getParameter("FechaInicio");
                String FechaFin = request.getParameter("FechaFin");
                String Materiales = request.getParameter("materiales");
                int idEvento = Integer.parseInt((((request.getParameter("tipoEvento")))));
                String horaInicio = request.getParameter("horaInicio");
                int idProfesor = Integer.parseInt((((request.getParameter("profesorId")))));
                String horaFin = request.getParameter("horaFin");
                int idCoordinadora= Integer.parseInt((((request.getParameter("idCoordinadora")))));

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

                //Validacion de la frecuencia

                String[] diasSeleccionados = request.getParameterValues("diasSemana");
                System.out.println(Arrays.toString(diasSeleccionados));

                if (diasSeleccionados != null) {
                    for (String dia : diasSeleccionados) {
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

                evento.setLunesActive(lunesActive);
                evento.setMartesActive(martesActive);
                evento.setMiercolesActive(miercolesActive);
                evento.setJuevesActive(juevesActive);
                evento.setViernesActive(viernesActive);
                evento.setSabadoActive(sabadoActive);
                evento.setDomingoActive(domingoActive);
                EstadoEvento estadoEvento = new EstadoEvento();
                //Todos se inicializan con el estado NoIniciado
                estadoEvento.setIdEstadoEvento(1);
                evento.setIdCoordinadora(idCoordinadora);
                evento.setEstadoEvento(estadoEvento);
                evento.setTipoEvento(tipoEvento1);
                eventoDao.crearEvento(evento);
                response.sendRedirect(request.getContextPath() + "/ServletCoordinadora?action=verMisEventos");
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

                    InputStream fotoEvento1 = request.getPart("file").getInputStream();
                    byte[] fotoEvento3 = fotoEvento1.readAllBytes();

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
            total = eventoDao.listaEventosDeporte().size();
        } else if ("Cultura".equals(tipo)) {
            total = eventoDao.listaEventosCultura().size();
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
            listaEventos = eventoDao.listaEventosDeporte();
        } else if ("Cultura".equals(tipo)) {
            listaEventos = eventoDao.listaEventosCultura();
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

        request.setAttribute("listarEventos", lista);
        request.getRequestDispatcher("WEB-INF/coordinadora/listaEventos.jsp").forward(request, response);
    }



}
