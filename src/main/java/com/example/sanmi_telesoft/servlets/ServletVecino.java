package com.example.sanmi_telesoft.servlets;

import com.example.sanmi_telesoft.beans.Evento;
import com.example.sanmi_telesoft.daos.DaoEvento;
import com.example.sanmi_telesoft.daos.DaoIncidencia;
import com.example.sanmi_telesoft.beans.Incidencia;
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


@WebServlet(name = "ServletVecino", value = "/ServletVecino")
public class ServletVecino extends HttpServlet {
    private DaoEvento eventoDao  = new DaoEvento();
    private DaoIncidencia incidenciaDao  = new DaoIncidencia();
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

        switch (action) {

            case "mostrarInicio":
                request.setAttribute("activeMenu", "Inicio");
                request.setAttribute("listarEventos", eventoDao.listaEventos());
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
                request.getRequestDispatcher("WEB-INF/Vecino/eventosInscritos.jsp").forward(request, response);                break;

            case "incidenciasGenerales":
                request.setAttribute("activeMenu", "IncidenciasGenerales");
                request.setAttribute("activeMenuToggle", "Incidencias");
                manejarIncidenciasGenerales(request, response);
                break;
            case "misIncidencias":
                manejarMisIncidencias(request, response);
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
            case "obtenerDetallesIncidencia":
                obtenerDetallesIncidencia(request, response);
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
    private void mostrarFormularioActualizarIncidencia(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idIncidencia = Integer.parseInt(request.getParameter("id"));
        Incidencia incidencia = incidenciaDao.obtenerIncidencia(idIncidencia);
        request.setAttribute("incidencia", incidencia);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/Vecino/vecino-actualizarIncidencia.jsp");
        dispatcher.forward(request, response);
    }

    private void actualizarIncidencia(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idIncidencia = Integer.parseInt(request.getParameter("id"));
        String lugarExacto = request.getParameter("LugarExacto");
        String referencia = request.getParameter("Referencia");
        String telefono = request.getParameter("phone");
        boolean requiereAmbulancia = request.getParameter("ambulancia") != null;
        Part fotoPart = request.getPart("foto");

        Incidencia incidencia = new Incidencia();
        incidencia.setIdIncidencias(idIncidencia);
        incidencia.setLugarIncidencia(lugarExacto);
        incidencia.setReferenciaIncidencia(referencia);
        incidencia.setTelefono(telefono != null ? Integer.parseInt(telefono) : 0);
        incidencia.setRequiereAmbulancia(requiereAmbulancia);

        if (fotoPart != null && fotoPart.getSize() > 0) {
            String fileName = Paths.get(fotoPart.getSubmittedFileName()).getFileName().toString();
            incidencia.setFotoIncidencia(fileName);
            File uploads = new File("/path/to/uploads");
            File file = new File(uploads, fileName);
            try (InputStream input = fotoPart.getInputStream()) {
                Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
            }
        }

        incidenciaDao.actualizarIncidencia(incidencia);
        response.sendRedirect(request.getContextPath() + "/ServletVecino?action=misIncidencias");
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
        int idIncidencia = Integer.parseInt(request.getParameter("id"));
        incidenciaDao.eliminarIncidencia(idIncidencia);
        response.sendRedirect(request.getContextPath() + "/ServletVecino?action=misIncidencias");
    }
    private void manejarMisIncidencias(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer vecinoId = (Integer) session.getAttribute("usuarioId");
        if (vecinoId != null) {
            List<Incidencia> misIncidencias = incidenciaDao.listarIncidenciasPorVecino(vecinoId);
            request.setAttribute("misIncidencias", misIncidencias);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/Vecino/vecino-misIncidencias.jsp");
            dispatcher.forward(request, response);
        } else {
            manejarError(request, response, "Usuario no logueado");
        }
    }

    private void reportarIncidencia(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombreIncidencia = request.getParameter("fullname");
        String telefono = request.getParameter("phone");
        String lugarExacto = request.getParameter("LugarExacto");
        String referencia = request.getParameter("Referencia");
        boolean requiereAmbulancia = request.getParameter("ambulancia") != null;
        Part fotoPart = request.getPart("foto");

        Incidencia incidencia = new Incidencia();
        incidencia.setNombreIncidencia(nombreIncidencia);
        incidencia.setTelefono(telefono != null ? Integer.parseInt(telefono) : 0);
        incidencia.setLugarIncidencia(lugarExacto);
        incidencia.setReferenciaIncidencia(referencia);
        incidencia.setRequiereAmbulancia(requiereAmbulancia);

        if (fotoPart != null && fotoPart.getSize() > 0) {
            String fileName = Paths.get(fotoPart.getSubmittedFileName()).getFileName().toString();
            incidencia.setFotoIncidencia(fileName);
            File uploads = new File("/path/to/uploads");
            File file = new File(uploads, fileName);
            try (InputStream input = fotoPart.getInputStream()) {
                Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
            }
        }

        incidenciaDao.insertarIncidencia(incidencia);
        response.sendRedirect(request.getContextPath() + "/ServletVecino?action=incidenciasGenerales");
    }

    private void manejarListaEventos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tipo = request.getParameter("tipoFiltrado");
        ArrayList<String> filtrado = new ArrayList<>();
        filtrado.add("Todo");
        filtrado.add("Deporte");
        filtrado.add("Cultura");
        request.setAttribute("filtrado", filtrado);

        ArrayList<Evento> listaEventos;
        if ("Deporte".equals(tipo)) {
            listaEventos = eventoDao.listaEventosDeporte();
        } else if ("Cultura".equals(tipo)) {
            listaEventos = eventoDao.listaEventosCultura();
        } else {
            listaEventos = eventoDao.listaEventos();
            }
        request.setAttribute("listarEventos", listaEventos);

        RequestDispatcher view = request.getRequestDispatcher("WEB-INF/Vecino/listaEventos.jsp");
        view.forward(request, response);
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
                    manejarError(request, response, "Evento no encontrado");
                }
            } catch (NumberFormatException e) {
                manejarError(request, response, "ID de evento inválido");
            }
        } else {
            manejarError(request, response, "ID de evento no proporcionado");
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
                    manejarError(request, response, "Evento no encontrado");
                }
            } catch (NumberFormatException e) {
                manejarError(request, response, "ID de evento inválido");
            }
        } else {
            manejarError(request, response, "ID de evento no proporcionado");
        }
    }


    private void manejarBuscarEventos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String textSearch = request.getParameter("textoBuscar");

        String tipoFiltrado = request.getParameter("tipoFiltrado");
        ArrayList<Evento> lista;

        if ("Deporte".equals(tipoFiltrado)) {
            lista = eventoDao.searchEventobyNameFiltrado(textSearch, 2);
        } else if ("Cultura".equals(tipoFiltrado)) {
            lista = eventoDao.searchEventobyNameFiltrado(textSearch, 1);
        } else {
            lista = eventoDao.searchEventobyName(textSearch);
        }

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

    private void actualizarEntradas(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener los parámetros del formulario
        int id = Integer.parseInt(request.getParameter("id"));
        int entradas = 0;
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
            eventoDao.actualizarEntradas(id, entradas);
            // Redireccionar a la lista de eventos después de actualizar las entradas
            response.sendRedirect(request.getContextPath() + "/ServletVecino?action=listaEventos");
        } catch (Exception e) {
            // Manejar cualquier excepción que pueda ocurrir durante la actualización de entradas
            e.printStackTrace(); // o registra el error en los logs del servidor
            // Puedes redirigir a una página de error si es necesario
            // response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }


}
