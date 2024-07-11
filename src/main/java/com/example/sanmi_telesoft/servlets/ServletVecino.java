package com.example.sanmi_telesoft.servlets;

import com.example.sanmi_telesoft.beans.Evento;
import com.example.sanmi_telesoft.daos.DaoEvento;
import com.example.sanmi_telesoft.daos.DaoIncidencia;
import com.example.sanmi_telesoft.beans.Incidencia;
import com.example.sanmi_telesoft.beans.Usuario;
import com.example.sanmi_telesoft.daos.UserDAO;
import com.example.sanmi_telesoft.dto.DiaconHoras;
import com.example.sanmi_telesoft.filters.Sanitizer;

import java.net.URLEncoder;
import java.nio.file.Paths;
import java.nio.file.Path;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.io.File;
import java.io.InputStream;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.util.ArrayList;
import java.util.List;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.OutputStream;
import java.sql.SQLException;
//import org.apache.commons.lang3.StringEscapeUtils;
import jakarta.servlet.http.Part;
import jdk.jfr.Event;
import org.json.JSONObject;
import java.util.HashMap;
import java.util.Map;



@WebServlet(name = "ServletVecino", value = "/ServletVecino")
@MultipartConfig
public class ServletVecino extends HttpServlet {
    private DaoEvento eventoDao  = new DaoEvento();
    private DaoIncidencia incidenciaDao  = new DaoIncidencia();
    private UserDAO userDAO  = new UserDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "mostrarInicio" : request.getParameter("action");
        RequestDispatcher view;
        HttpSession session = request.getSession(false);


        if (session == null || session.getAttribute("usuario") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
        String id = "";
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        int idUsuario = 0;
        if (usuario != null) {
            // Obtener el id del usuario como String
            idUsuario = usuario.getIdUsuarios();
        }
        try {
            ArrayList<Integer> listaIdEventos= eventoDao.eventosInscritosporUsuario(idUsuario);
            request.setAttribute("eventosUsuario",listaIdEventos);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        ArrayList<Evento> listaMisEventos = eventoDao.listaEventosUser(idUsuario);
        request.setAttribute("listaMisEventos", listaMisEventos);

        switch (action) {

            case "mostrarInicio":
                request.setAttribute("activeMenu", "Inicio");
                request.setAttribute("vecinosActivos",userDAO.contarVecinos());
                request.setAttribute("listarEventos", eventoDao.listaEventos(0,10000));
                request.getRequestDispatcher("WEB-INF/Vecino/indexVecino.jsp").forward(request, response);
                break;

            case "mostrarAyuda":
                request.setAttribute("activeMenu", "Ayuda");
                request.getRequestDispatcher("WEB-INF/Vecino/ayudaVecino.jsp").forward(request, response);
                break;
            /*
            case "mostrarListaEventos":
                request.setAttribute("activeMenu", "CatalogoEventos");
                request.setAttribute("activeMenuToggle", "Eventos");
                request.getRequestDispatcher("WEB-INF/Vecino/listaEventos.jsp").forward(request, response);

                break;
            */
            case "listaEventos":
                request.setAttribute("activeMenu", "CatalogoEventos");
                request.setAttribute("activeMenuToggle", "Eventos");
                manejarListaEventos(request, response);
                break;

            case "viewEvento":
                request.setAttribute("activeMenu", "CatalogoEventos");
                request.setAttribute("activeMenuToggle", "Eventos");
                manejarViewEvento(request, response);
                break;

            case "inscribirEvento":
                request.setAttribute("activeMenu", "CatalogoEventos");
                request.setAttribute("activeMenuToggle", "Eventos");
                manejarInscribirEvento(request, response);
                break;

            case "eventosInscritos":
                request.setAttribute("activeMenu", "EventosInscritos");
                request.setAttribute("activeMenuToggle", "Eventos");

                request.getRequestDispatcher("WEB-INF/Vecino/eventosInscritos.jsp").forward(request, response);
                break;

            case "incidenciasGenerales":
                request.setAttribute("activeMenu", "IncidenciasGenerales");
                request.setAttribute("activeMenuToggle", "Incidencias");
                manejarIncidenciasGenerales(request, response);
                break;
            case "misIncidencias":
                manejarMisIncidencias(request, response);
                break;
            case "verDetallesIncidenciaGeneral":
                verDetallesIncidenciaGeneral(request, response);
                break;
            case "actualizarIncidencia":
                mostrarFormularioActualizarIncidencia(request, response);
                break;
            case "reportarIncidencia":
                mostrarFormularioReportarIncidencia(request, response);
                break;
            case "error":
                manejarError(request, response, "Ha ocurrido un error ! :c");
                break;
            case "filtrarIncidenciasSemana":
                filtrarIncidenciasSemana(request, response);
                break;
            case "verDetallesIncidencia":
                verDetallesIncidencia(request, response);
                break;
            case "filtrarIncidenciasDia":
                filtrarIncidenciasDia(request, response);
                break;
            case "errorEvento":
                manejarErrorEvento(request, response, "Ha ocurrido un error en evento! :c");
                break;
            case "obtenerDetallesIncidencia":
                obtenerDetallesIncidencia(request, response);
                break;
            case "servirImagenIncidencia":
                int idl = Integer.parseInt(request.getParameter("id"));
                DaoIncidencia dao = new DaoIncidencia();
                Incidencia im = dao.obtenerIncidencia(idl);

                if (im != null) {
                    response.setContentType("image/jpeg");
                    response.setContentLength(im.getFotoIncidencia().length);
                    OutputStream os = response.getOutputStream();
                    os.write(im.getFotoIncidencia());
                    os.flush();
                }
                break;
            case "servirImagenEvento":
                int idk = Integer.parseInt(request.getParameter("id"));
                DaoEvento dao2 = new DaoEvento();
                Evento im2 = dao2.searchEventobyId(idk);

                if (im2 != null) {
                    response.setContentType("image/jpeg");
                    response.setContentLength(im2.getFotosStart().length);
                    OutputStream os = response.getOutputStream();
                    os.write(im2.getFotosStart());
                    os.flush();
                }
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                break;


        }
    }

    @Override

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            doGet(request, response);
            return;
        }
        switch (action) {
            case "reportarIncidencia":
                reportarIncidencia(request, response);
                break;
            case "buscarEventos":
                manejarBuscarEventos(request, response);
                break;
            case "eliminarIncidencia":
                eliminarIncidencia(request, response);
                break;
            case "actualizarIncidencia":
                actualizarIncidencia(request, response);
                break;
            case "guardarInscripcion":
                actualizarEntradas(request, response);
                break;
            default:
                doGet(request, response);
                break;
        }
    }
    private void filtrarIncidenciasDia(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Incidencia> incidencias = incidenciaDao.listarIncidenciasDia();
        request.setAttribute("incidencias", incidencias);
        request.getRequestDispatcher("WEB-INF/Vecino/vecino-incidenciasGenerales.jsp").forward(request, response);
    }
    private void filtrarIncidenciasSemana(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Incidencia> incidencias = incidenciaDao.listarIncidenciasSemana();
        request.setAttribute("incidencias", incidencias);
        request.getRequestDispatcher("WEB-INF/Vecino/vecino-incidenciasGenerales.jsp").forward(request, response);
    }
    private void verDetallesIncidenciaGeneral(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idIncidencia = Integer.parseInt(request.getParameter("id"));
        Incidencia incidencia = incidenciaDao.obtenerIncidencia(idIncidencia);

        if (incidencia != null) {
            String nombreCompleto = incidenciaDao.obtenerNombreUsuarioPorIdIncidencia(idIncidencia);
            request.setAttribute("nombreCompletoUsuario", nombreCompleto);
            request.setAttribute("incidencia", incidencia);
            request.getRequestDispatcher("WEB-INF/Vecino/vecino-detallesIncidenciaGeneral.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/ServletVecino?action=incidenciasGenerales");
        }
    }
    private void mostrarFormularioActualizarIncidencia(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int idIncidencia = Integer.parseInt(request.getParameter("id"));
        Incidencia incidencia = incidenciaDao.obtenerIncidencia(idIncidencia);
        request.setAttribute("incidencia", incidencia);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/Vecino/vecino-ActualizarIncidencia.jsp");
        dispatcher.forward(request, response);
    }
    private void verDetallesIncidencia(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Usuario usuario = (Usuario) session.getAttribute("usuario");
        if (usuario == null) {
            response.sendRedirect(request.getContextPath() + "/ServletLoguin");
            return;
        }


        int idIncidencia = Integer.parseInt(request.getParameter("id"));
        Incidencia incidencia = incidenciaDao.obtenerIncidencia(idIncidencia);

        if (incidencia.getUsuarioId() != usuario.getIdUsuarios()) {
            request.setAttribute("errorMessage", "No tiene permiso para ver esta incidencia.");
            request.getRequestDispatcher("WEB-INF/Vecino/vecino-incidenciasGenerales.jsp").forward(request, response);
            return;
        }

        request.setAttribute("incidencia", incidencia);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/Vecino/vecino-detallesIncidencia.jsp");
        dispatcher.forward(request, response);
    }

    private void actualizarIncidencia(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        String nombreIncidencia = Sanitizer.sanitize(request.getParameter("fullname"));
        String telefono = Sanitizer.sanitize(request.getParameter("phone"));
        int id = Integer.parseInt(request.getParameter("incidencia_id"));
        String lugarExacto = Sanitizer.sanitize(request.getParameter("LugarExacto"));
        String referencia = Sanitizer.sanitize(request.getParameter("Referencia"));
        boolean requiereAmbulancia = request.getParameter("ambulancia") != null;
        Part fotoPart = request.getPart("file");

        Map<String, String> errores = new HashMap<>();

        System.out.println("Parametros recibidos:");
        System.out.println("nombreIncidencia: " + nombreIncidencia);
        System.out.println("telefono: " + telefono);
        System.out.println("lugarExacto: " + lugarExacto);
        System.out.println("referencia: " + referencia);
        System.out.println("requiereAmbulancia: " + requiereAmbulancia);
        System.out.println("fotoincidencia: " + (fotoPart != null ? fotoPart.getSubmittedFileName() : "null"));

        // Validaciones
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

        if (fotoPart != null && fotoPart.getSize() > 5 * 1024 * 1024) { // 5 MB máximo
            errores.put("fotoincidencia", "El archivo es demasiado grande. Máximo permitido es 5MB.");
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
        System.out.println("Usuario ID: " + usuario.getIdUsuarios());
        Incidencia incidenciaExistente = incidenciaDao.obtenerIncidencia(id);
        if (incidenciaExistente == null) {
            request.setAttribute("errorMessage", "La incidencia no existe.");
            request.getRequestDispatcher("WEB-INF/Vecino/vecino-incidenciasGenerales.jsp").forward(request, response);
            return;
        }
        if (incidenciaExistente.getUsuarioId() != usuario.getIdUsuarios()) {
            request.setAttribute("errorMessage", "No tiene permiso para actualizar esta incidencia.");
            request.getRequestDispatcher("WEB-INF/Vecino/vecino-incidenciasGenerales.jsp").forward(request, response);
            return;
        }

        if (incidenciaExistente.getEstado() != 1) {
            request.setAttribute("errorMessage", "No se puede actualizar una incidencia que no esté en estado 'nueva'.");
            request.getRequestDispatcher("WEB-INF/Vecino/vecino-incidenciasGenerales.jsp").forward(request, response);
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
        if (fotoPart != null && fotoPart.getSize() > 0) {
            try (InputStream inputStream = fotoPart.getInputStream()) {
                byte[] fotoBytes = inputStream.readAllBytes();
                incidencia.setFotoIncidencia(fotoBytes);
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            // Obtener la foto existente si no se ha subido una nueva
            try {
                byte[] fotoExistente = incidenciaDao.obtenerFotoIncidencia(id);
                incidencia.setFotoIncidencia(fotoExistente);
            } catch (SQLException e) {
                e.printStackTrace();
                throw new ServletException("Error al obtener la foto existente", e);
            }
        }



        incidenciaDao.actualizarIncidencia(incidencia);
        System.out.println("Incidencia actualizada correctamente.");

        JSONObject jsonResponse = new JSONObject();
        jsonResponse.put("success", true);
        response.getWriter().write(jsonResponse.toString());
    }
    private void mostrarFormularioReportarIncidencia(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/Vecino/vecino-reportarIncidencia.jsp");
        dispatcher.forward(request, response);
    }
    protected void obtenerDetallesIncidencia(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idIncidencia = Integer.parseInt(request.getParameter("idIncidencia"));
        Incidencia incidencia = incidenciaDao.obtenerIncidencia(idIncidencia);

        // Configura la respuesta para JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Convierte la incidencia a JSON
        String json = "{";
        json += "\"nombreIncidencia\": \"" + incidencia.getNombreIncidencia() + "\",";
        json += "\"lugarExacto\": \"" + incidencia.getLugarIncidencia() + "\",";
        json += "\"referenciaIncidencia\": \"" + incidencia.getReferenciaIncidencia() + "\",";
        json += "\"contactoIncidencia\": \"" + incidencia.getTelefono() + "\",";
        json += "\"requiereAmbulancia\": " + incidencia.isRequiereAmbulancia() + ",";
        json += "\"requierePolicia\": " + incidencia.isRequierePolicia() + ",";
        json += "\"requiereBombero\": " + incidencia.isRequiereBombero() + ",";
        json += "\"descripcionSolucion\": \"" + incidencia.getDescripcionSolucion() + "\",";
        json += "\"nameUsuario\": \"" + incidencia.getNameUsuario() + "\"";
        json += "}";

        // Escribe la respuesta
        PrintWriter out = response.getWriter();
        out.print(json);
        out.flush();
    }
    private void eliminarIncidencia(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        HttpSession session = request.getSession(false);
        Usuario usuario = (Usuario) session.getAttribute("usuario");
        if (usuario == null) {
            response.sendRedirect(request.getContextPath() + "/ServletLoguin");
            return;
        }
        System.out.println("Usuario ID: " + usuario.getIdUsuarios());




        Incidencia incidenciaExistente = incidenciaDao.obtenerIncidencia(id);

        if (incidenciaExistente == null) {
            request.setAttribute("errorMessage", "La incidencia no existe.");
            request.getRequestDispatcher("WEB-INF/Vecino/vecino-incidenciasGenerales.jsp").forward(request, response);
            return;
        }

        if (incidenciaExistente.getUsuarioId() != usuario.getIdUsuarios()) {
            request.setAttribute("errorMessage", "No tiene permiso para eliminar esta incidencia.");
            request.getRequestDispatcher("WEB-INF/Vecino/vecino-incidenciasGenerales.jsp").forward(request, response);
            return;
        }
        if (incidenciaExistente.getEstado() != 1) {
            request.setAttribute("errorMessage", "No se puede eliminar una incidencia que no esté en estado 'nueva'.");
            request.getRequestDispatcher("WEB-INF/Vecino/vecino-incidenciasGenerales.jsp").forward(request, response);
            return;
        }

        incidenciaDao.eliminarIncidencia(id);
        System.out.println("Incidencia eliminada correctamente.");

        response.sendRedirect(request.getContextPath() + "/ServletVecino?action=misIncidencias");
    }
    private void manejarMisIncidencias(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Usuario usuario = (Usuario) session.getAttribute("usuario");
        if (usuario != null) {
            int vecinoId = usuario.getIdUsuarios();
            List<Incidencia> misIncidencias = incidenciaDao.listarMisIncidencias(vecinoId);
            request.setAttribute("misIncidencias", misIncidencias);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/Vecino/vecino-misIncidencias.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void reportarIncidencia(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String nombreIncidencia = Sanitizer.sanitize(request.getParameter("nombreIncidencia"));
        String telefono = Sanitizer.sanitize(request.getParameter("phone"));
        String lugarExacto = Sanitizer.sanitize(request.getParameter("LugarExacto"));
        String referencia = Sanitizer.sanitize(request.getParameter("Referencia"));
        boolean requiereAmbulancia = request.getParameter("requiereAmbulancia") != null;
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

        if (fotoPart != null && fotoPart.getSize() > 0) {
            String fileName = fotoPart.getSubmittedFileName();
            if (!fileName.endsWith(".png") && !fileName.endsWith(".jpg") && !fileName.endsWith(".jpeg")) {
                errores.put("fotoincidencia", "El archivo debe ser una imagen en formato PNG o JPG.");
            } else if (fotoPart.getSize() > 5 * 1024 * 1024) { // 5 MB máximo
                errores.put("fotoincidencia", "El archivo es demasiado grande. Máximo permitido es 5MB.");
            } else if (!isImageFile(fotoPart)) {
                errores.put("fotoincidencia", "El archivo subido no es una imagen válida.");
            }
        }

        if (!errores.isEmpty()) {
            JSONObject jsonResponse = new JSONObject(errores);
            response.getWriter().write(jsonResponse.toString());
            return;
        }



        System.out.println("Parametros recibidos:");
        System.out.println("nombreIncidencia: " + nombreIncidencia);
        System.out.println("telefono: " + telefono);
        System.out.println("lugarExacto: " + lugarExacto);
        System.out.println("referencia: " + referencia);
        System.out.println("requiereAmbulancia: " + requiereAmbulancia);
        System.out.println("fotoincidencia: " + (fotoPart != null ? fotoPart.getSubmittedFileName() : "null"));

        HttpSession session = request.getSession(false);
        Usuario usuario = (Usuario) session.getAttribute("usuario");
        if (usuario == null) {
            response.sendRedirect(request.getContextPath() + "/ServletLoguin");
            return;
        }
        System.out.println("Usuario ID: " + usuario.getIdUsuarios());


        Incidencia incidencia = new Incidencia();
        incidencia.setNombreIncidencia(nombreIncidencia);
        incidencia.setTelefono(telefono != null && !telefono.isBlank() ? Integer.parseInt(telefono) : 0);
        incidencia.setLugarIncidencia(lugarExacto);
        incidencia.setReferenciaIncidencia(referencia);
        incidencia.setRequiereAmbulancia(requiereAmbulancia);
        incidencia.setUsuarioId(usuario.getIdUsuarios());





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
            incidenciaDao.insertarIncidencia_vecino(incidencia);
            JSONObject jsonResponse = new JSONObject();
            jsonResponse.put("success", true);
            response.getWriter().write(jsonResponse.toString());
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error al insertar la incidencia", e);
        }


    }


    private boolean isImageFile(Part filePart) {
        String fileName = filePart.getSubmittedFileName();
        return fileName.endsWith(".jpg") || fileName.endsWith(".jpeg") || fileName.endsWith(".png");
    }


    private void manejarListaEventos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Evento> listaEventos;
        int total ;
        String tipo = request.getParameter("tipoFiltrado");

        //Se envia el tipo de filtrado para el combobox;
        ArrayList<String> filtrado = new ArrayList<>();
        filtrado.add("Todo");
        filtrado.add("Deporte");
        filtrado.add("Cultura");
        request.setAttribute("filtrado", filtrado);

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
        RequestDispatcher view = request.getRequestDispatcher("WEB-INF/Vecino/listaEventos.jsp");
        view.forward(request, response);
    }
    private void servirImagenIncidencia(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        if (id == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Falta el parámetro id");
            return;
        }

        try {
            byte[] imgData = incidenciaDao.obtenerFotoIncidencia(Integer.parseInt(id));
            if (imgData != null) {
                response.setContentType("image/jpeg");
                try (OutputStream os = response.getOutputStream()) {
                    os.write(imgData);
                }
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Imagen no encontrada para id: " + id);
            }
        } catch (SQLException e) {
            throw new ServletException("Error al acceder a la base de datos", e);
        }
    }


    private void manejarViewEvento(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        if (id != null && !id.isEmpty()) {
            try {
                int eventId = Integer.parseInt(id);
                Evento evento = eventoDao.searchEventobyId(eventId);
                if (evento != null) {
                    request.setAttribute("evento", evento);
                    RequestDispatcher view = request.getRequestDispatcher("WEB-INF/Vecino/viewEventos.jsp");
                    view.forward(request, response);
                } else {
                    manejarErrorEvento(request, response, "Evento no encontrado");
                }
            } catch (NumberFormatException e) {
                manejarErrorEvento(request, response, "ID de evento inválido");
            }
        } else {
            manejarErrorEvento(request, response, "ID de evento no proporcionado");
        }
    }

    private void manejarInscribirEvento(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        if (id != null && !id.isEmpty()) {
            try {
                int eventId = Integer.parseInt(id);
                Evento evento = eventoDao.searchEventobyId(eventId);
                if (evento != null) {
                    request.setAttribute("evento", evento);

                    // Obtener evento2 y evento3 asegurando que sean diferentes
                    int idTipoEvento = evento.getTipoEvento().getIdTipoEvento();
                    ArrayList<Evento> eventos = eventoDao.crearEventoAleatorio(idTipoEvento, eventId);
                    Evento evento1 = eventos.get(0); // Obtener el primer evento
                    Evento evento2 = eventos.get(1); // Obtener el segundo evento
                    request.setAttribute("evento1", evento1);
                    request.setAttribute("evento2", evento2);

                    RequestDispatcher view = request.getRequestDispatcher("WEB-INF/Vecino/inscribirEvento.jsp");
                    view.forward(request, response);
                } else {
                    manejarErrorEvento(request, response, "Evento no encontrado");
                }
            } catch (NumberFormatException e) {
                manejarErrorEvento(request, response, "ID de evento inválido");
            }
        } else {
            manejarErrorEvento(request, response, "ID de evento no proporcionado");
        }
    }


    private void manejarBuscarEventos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String textSearch = request.getParameter("textoBuscar");

        int pg = 1;
        request.setAttribute("currentPage", pg);
        String tipoFiltrado = request.getParameter("tipoFiltrado");
        ArrayList<Evento> lista;

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
        request.getRequestDispatcher("WEB-INF/Vecino/listaEventos.jsp").forward(request, response);
    }

    private void manejarIncidenciasGenerales(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Incidencia> incidencias = incidenciaDao.listarIncidencias();
        request.setAttribute("incidencias", incidencias);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/Vecino/vecino-incidenciasGenerales.jsp");
        dispatcher.forward(request, response);
    }

    private void manejarError(HttpServletRequest request, HttpServletResponse response, String mensaje) throws ServletException, IOException {
        request.setAttribute("error", mensaje);
        RequestDispatcher view = request.getRequestDispatcher("WEB-INF/Vecino/error.jsp");
        view.forward(request, response);
    }
    private void manejarErrorEvento(HttpServletRequest request, HttpServletResponse response, String mensaje) throws ServletException, IOException {
        request.setAttribute("errorEvento", mensaje);
        RequestDispatcher view = request.getRequestDispatcher("errorEvento.jsp");
        view.forward(request, response);
    }

    private void actualizarEntradas(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener los parámetros del formulario
        int idEvento = Integer.parseInt(request.getParameter("id"));
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        int idUsuario = 0;
        if (usuario != null) {
            // Obtener el id del usuario como String
            idUsuario = usuario.getIdUsuarios();
            }
        System.out.println(idUsuario);
        int entradas = 1;
        String entradasParam = request.getParameter("entradas");

        // Validar y convertir la cantidad de entradas si está presente en el formulario
        if (entradasParam != null && !entradasParam.isEmpty()) {
            try {
                entradas = Integer.parseInt(entradasParam);
            } catch (NumberFormatException e) {
                // Manejar la conversión fallida de la cantidad de entradas
                e.printStackTrace(); // o manejar de otra manera, como mostrar un mensaje al usuario
            }
        }

        // Actualizar las entradas en la base de datos utilizando el DAO
        try {
            eventoDao.actualizarEntradas(idEvento, entradas,idUsuario);
            // Guardar el mensaje en un atributo de sesión para mostrarlo una vez
            String mensaje = "Se ha inscrito satisfactoriamente. En breve, las entradas llegarán a su correo";
            request.getSession().setAttribute("info", mensaje);

            // Redirigir al usuario a una URL sin parámetros de consulta
            response.sendRedirect(request.getContextPath() + "/ServletVecino?action=listaEventos");

        } catch (Exception e) {
            // Manejar cualquier excepción que pueda ocurrir durante la actualización de entradas
            e.printStackTrace(); // o registra el error en los logs del servidor
            // Puedes redirigir a una página de error si es necesario
            // response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }


}
