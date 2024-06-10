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

        ArrayList<String> filtrado = new ArrayList<>();
        filtrado.add("Todo");
        filtrado.add("Deporte");
        filtrado.add("Cultura");
        request.setAttribute("filtrado", filtrado);
        String tipo = request.getParameter("tipo");

        switch(action){
            case "lista":
                if ("Todo".equals(tipo)) {
                    request.setAttribute("listarEventos",eventoDao.listaEventos());
                }else if("Deporte".equals(tipo)){
                    request.setAttribute("listarEventos",eventoDao.listaEventosDeporte());
                }else if("Cultura".equals(tipo)){
                    request.setAttribute("listarEventos",eventoDao.listaEventosCultura());

                }
                view = request.getRequestDispatcher("/vecino/listaEventos.jsp");
                view.forward(request, response);
                break;
            case "view":
                String id = request.getParameter("id");
                if(eventoDao.searchEventobyId(Integer.parseInt(id)) != null){
                eventoDao.searchEventobyId(Integer.parseInt(id));}
                view = request.getRequestDispatcher("/vecino/viewEventos.jsp");
                view.forward(request, response);
                break;
            case "inscribir":
                view = request.getRequestDispatcher("/vecino/inscribirEvento.jsp");
                view.forward(request, response);
                break;

        }
    }

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

                request.getRequestDispatcher("/vecino/listaEventos.jsp").forward(request, response);
                break;

        }
            }



        }



