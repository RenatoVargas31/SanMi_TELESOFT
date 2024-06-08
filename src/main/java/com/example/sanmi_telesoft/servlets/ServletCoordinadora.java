package com.example.sanmi_telesoft.servlets;

import com.example.sanmi_telesoft.beans.Evento;
import com.example.sanmi_telesoft.beans.Profesor;
import com.example.sanmi_telesoft.daos.DaoAdministrador;
import com.example.sanmi_telesoft.daos.DaoCoordinadora;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ServletCoordinadora", value = "/ServletCoordinadora")
public class ServletCoordinadora extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "listarEventos" : request.getParameter("action");

        DaoCoordinadora daoCoordinadora = new DaoCoordinadora();

        switch (action){
            case "listarEventos":
                ArrayList<Evento> listaEventos = daoCoordinadora.listaEventos();
                request.setAttribute("listaEventos", listaEventos);
                request.getRequestDispatcher("WEB-INF/coordinadora/listaEventos.jsp").forward(request, response);
                break;
            case "detalleEvento":
                String id = request.getParameter("id");
                if (id.isEmpty() || !daoCoordinadora.validarIdEvento(id)) {
                    response.sendRedirect(request.getContextPath() + "/ServletCoordinadora?action=listarEventos");
                }else {
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
                break;
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
