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

@WebServlet(name = "ServletVecino", value = "/ServletVecino")
public class ServletVecino extends HttpServlet {
    private DaoEvento eventoDao  = new DaoEvento();
    private DaoIncidencia incidenciaDao  = new DaoIncidencia();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "listaEventos" : request.getParameter("action");
        RequestDispatcher view;
        String id = "";

        switch (action) {
            case "listaEventos":
                manejarListaEventos(request, response);
                break;
            case "viewEvento":
                manejarViewEvento(request, response);
                break;
            case "inscribirEvento":
                manejarInscribirEvento(request, response);
                break;
            case "incidenciasGenerales":
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
        String victima = request.getParameter("victima");
        Part fotoPart = request.getPart("foto");

        Incidencia incidencia = new Incidencia();
        incidencia.setIdIncidencias(idIncidencia);
        incidencia.setLugarIncidencia(lugarExacto);
        incidencia.setReferenciaIncidencia(referencia);
        incidencia.setTelefono(telefono != null ? Integer.parseInt(telefono) : 0);
        incidencia.setRequiereAmbulancia(requiereAmbulancia);
        incidencia.setVictima(victima);

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
        String afectado = request.getParameter("afectado");
        Part fotoPart = request.getPart("foto");

        Incidencia incidencia = new Incidencia();
        incidencia.setNombreIncidencia(nombreIncidencia);
        incidencia.setTelefono(telefono != null ? Integer.parseInt(telefono) : 0);
        incidencia.setLugarIncidencia(lugarExacto);
        incidencia.setReferenciaIncidencia(referencia);
        incidencia.setRequiereAmbulancia(requiereAmbulancia);
        incidencia.setTipo("mi_persona".equals(afectado) ? 1 : 2);

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
        ArrayList<String> filtrado = new ArrayList<>();
        filtrado.add("Todo");
        filtrado.add("Deporte");
        filtrado.add("Cultura");
        request.setAttribute("filtrado", filtrado);
        String tipoFiltrado = request.getParameter("tipoFiltrado");
        ArrayList<Evento> lista;

        if ("Deporte".equals(tipoFiltrado)) {
            lista = eventoDao.searchEventobyNameFiltrado(textSearch, 1);
        } else if ("Cultura".equals(tipoFiltrado)) {
            lista = eventoDao.searchEventobyNameFiltrado(textSearch, 2);
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
}