package com.example.sanmi_telesoft.servlets;

import com.example.sanmi_telesoft.beans.Evento;
import com.example.sanmi_telesoft.daos.DaoEvento;
import com.example.sanmi_telesoft.daos.DaoIncidencia;
import com.example.sanmi_telesoft.beans.Incidencia;

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
        String action = request.getParameter("action") == null ? "listaEventos" : request.getParameter("action");
        switch (action) {
            case "buscarEventos":
                manejarBuscarEventos(request, response);
                break;
            case "guardarIncidencia":
                guardarIncidencia(request, response);
                break;
            default:
                doGet(request, response);
                break;
        }
    }
    private void mostrarFormularioReportarIncidencia(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/Vecino/vecino-reportarIncidencia.jsp");
        dispatcher.forward(request, response);
    }
    private void guardarIncidencia(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombreIncidencia = request.getParameter("fullname");
        String lugarExacto = request.getParameter("LugarExacto");
        String referencia = request.getParameter("Referencia");
        String telefonoStr = request.getParameter("phone");
        boolean requiereAmbulancia = request.getParameter("ambulancia") != null;
        int telefono = telefonoStr != null && !telefonoStr.isEmpty() ? Integer.parseInt(telefonoStr) : 0;

        Incidencia incidencia = new Incidencia();
        incidencia.setNombreIncidencia(nombreIncidencia);
        incidencia.setLugarIncidencia(lugarExacto);
        incidencia.setReferenciaIncidencia(referencia);
        incidencia.setTelefono(telefono);
        incidencia.setRequiereAmbulancia(requiereAmbulancia);

        incidenciaDao.guardarIncidencia(incidencia);

        response.sendRedirect(request.getContextPath() + "/ServletVecino?action=incidenciasGenerales");
    }

    private void manejarListaEventos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tipo = request.getParameter("tipoFiltrado");
        ArrayList<String> filtrado = new ArrayList<>();
        filtrado.add("Todo");
        filtrado.add("Deporte");
        filtrado.add("Cultura");
        request.setAttribute("filtrado", filtrado);

        List<Evento> listaEventos;
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
        String textSearch = request.getParameter("buscar");
        List<Evento> lista = eventoDao.searchEventobyName(textSearch);
        request.setAttribute("listarEventos", lista);
        request.getRequestDispatcher("/WEB-INF/Vecino/listaEventos.jsp").forward(request, response);
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