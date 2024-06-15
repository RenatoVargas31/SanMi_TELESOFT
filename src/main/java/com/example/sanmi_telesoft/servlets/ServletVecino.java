package com.example.sanmi_telesoft.servlets;

import com.example.sanmi_telesoft.beans.Evento;
import com.example.sanmi_telesoft.daos.DaoEvento;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ServletVecino", value = "/ServletVecino")
public class ServletVecino extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action")==null?"lista":request.getParameter("action");
        RequestDispatcher view;
        DaoEvento eventoDao = new DaoEvento();
        String id= "";

        ArrayList<String> filtrado = new ArrayList<>();
        filtrado.add("Todo");
        filtrado.add("Deporte");
        filtrado.add("Cultura");
        request.setAttribute("filtrado", filtrado);
        String tipo = request.getParameter("tipoFiltrado");

        switch(action) {
            case "lista":

                request.setAttribute("listarEventos", eventoDao.listaEventos());
                if ("Deporte".equals(tipo)) {
                    request.setAttribute("listarEventos", eventoDao.listaEventosDeporte());
                } else if ("Cultura".equals(tipo)) {
                    request.setAttribute("listarEventos", eventoDao.listaEventosCultura());

                }
                view = request.getRequestDispatcher("WEB-INF/Vecino/listaEventos.jsp");
                view.forward(request, response);
                break;
            case "view":
                id = request.getParameter("id");
                if (id != null && !id.isEmpty()) {
                    try {
                        int eventId = Integer.parseInt(id);
                        Evento evento = eventoDao.searchEventobyId(eventId);
                        if (evento != null) {
                            request.setAttribute("evento", evento);
                            view = request.getRequestDispatcher("WEB-INF/Vecino/viewEventos.jsp");
                            view.forward(request, response);
                        } else {
                            // Manejo de evento no encontrado
                            request.setAttribute("error", "Evento no encontrado");
                            view = request.getRequestDispatcher("WEB-INF/Vecino/error.jsp");
                            view.forward(request, response);
                        }
                    } catch (NumberFormatException e) {
                        // Manejo de formato de número inválido
                        request.setAttribute("error", "ID de evento inválido");
                        view = request.getRequestDispatcher("WEB-INF/Vecino/error.jsp");
                        view.forward(request, response);
                    }
                } else {
                    // Manejo de ID nulo o vacío
                    request.setAttribute("error", "ID de evento no proporcionado");
                    view = request.getRequestDispatcher("WEB-INF/Vecino/error.jsp");
                    view.forward(request, response);
                }
                break;
            case "inscribir":
                id = request.getParameter("id");
                if (id != null && !id.isEmpty()) {
                    try {
                        int eventId = Integer.parseInt(id);
                        Evento evento = eventoDao.searchEventobyId(eventId);
                        if (evento != null) {
                            request.setAttribute("evento", evento);
                            view = request.getRequestDispatcher("WEB-INF/Vecino/inscribirEvento.jsp");
                            view.forward(request, response);
                        } else {
                            // Manejo de evento no encontrado
                            request.setAttribute("error", "Evento no encontrado");
                            view = request.getRequestDispatcher("WEB-INF/Vecino/error.jsp");
                            view.forward(request, response);
                        }
                    } catch (NumberFormatException e) {
                        // Manejo de formato de número inválido
                        request.setAttribute("error", "ID de evento inválido");
                        view = request.getRequestDispatcher("WEB-INF/Vecino/error.jsp");
                        view.forward(request, response);
                    }
                } else {
                    // Manejo de ID nulo o vacío
                    request.setAttribute("error", "ID de evento no proporcionado");
                    view = request.getRequestDispatcher("WEB-INF/Vecino/error.jsp");
                    view.forward(request, response);
                }
                break;
        }}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action")==null?"lista":request.getParameter("action");
        ArrayList<Evento> lista;
        ArrayList<String> filtrado = new ArrayList<>();
        filtrado.add("Todo");
        filtrado.add("Deporte");
        filtrado.add("Cultura");
        request.setAttribute("filtrado", filtrado);
        DaoEvento eventoDao = new DaoEvento();
        switch (action) {
            case "buscar":
                String textSearch = request.getParameter("buscar");
                lista = eventoDao.searchEventobyName(textSearch);
                request.setAttribute("listarEventos", lista);

                request.getRequestDispatcher("/Vecino/listaEventos.jsp").forward(request, response);
                break;

        }
            }



        }



