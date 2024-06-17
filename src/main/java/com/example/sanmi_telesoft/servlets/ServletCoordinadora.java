package com.example.sanmi_telesoft.servlets;

import com.example.sanmi_telesoft.beans.Evento;
import com.example.sanmi_telesoft.beans.Incidencia;
import com.example.sanmi_telesoft.beans.Profesor;
import com.example.sanmi_telesoft.daos.DaoAdministrador;
import com.example.sanmi_telesoft.daos.DaoCoordinadora;
import com.example.sanmi_telesoft.daos.DaoIncidencia;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ServletCoordinadora", value = "/ServletCoordinadora")
public class ServletCoordinadora extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "mostrarInicio" : request.getParameter("action");

        DaoCoordinadora daoCoordinadora = new DaoCoordinadora();

        switch (action){
            case "mostrarInicio":
                request.setAttribute("activeMenu", "Inicio");
                request.getRequestDispatcher("WEB-INF/coordinadora/indexCoordinadora.jsp").forward(request, response);
                break;

            case "mostrarAyuda":
                request.setAttribute("activeMenu", "Ayuda");
                request.getRequestDispatcher("WEB-INF/coordinadora/ayudaCoordinadora.jsp").forward(request, response);
                break;
            case "reportarIncidencias":
                request.setAttribute("activeMenu", "Incidencias");
                request.setAttribute("activeMenuSub", "Incidencias1");
                request.getRequestDispatcher("WEB-INF/coordinadora/reportarIncidencias.jsp").forward(request, response);

            case "listarIncidencias":
                DaoIncidencia daoIncidencia = new DaoIncidencia();
                ArrayList<Incidencia> listaIncidencias = daoIncidencia.listarIncidencias();
                request.setAttribute("listaIncidencias", listaIncidencias);
                request.setAttribute("activeMenu", "Incidencias");
                request.setAttribute("activeMenuSub", "Incidencias2");
                request.getRequestDispatcher("WEB-INF/coordinadora/listaIncidenciasCoordinadora.jsp").forward(request, response);
                break;

            case "listarMisIncidencias":
                DaoIncidencia daoIncidencia1 = new DaoIncidencia();
                ArrayList<Incidencia> listaMisIncidencias = daoIncidencia1.listarMisIncidencias(2);
                request.setAttribute("listaMisIncidencias", listaMisIncidencias);
                request.setAttribute("activeMenu", "Incidencias");
                request.setAttribute("activeMenuSub", "Incidencias3");

                request.getRequestDispatcher("WEB-INF/coordinadora/misIncidencias.jsp").forward(request, response);
                break;

            case "actualizarIncidencia":
                request.setAttribute("activeMenu", "Incidencias");
                request.setAttribute("activeMenuSub", "Incidencias3");

                request.getRequestDispatcher("WEB-INF/coordinadora/actualizarIncidencia.jsp").forward(request, response);
                break;


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
                    request.getRequestDispatcher("indexCoordinadora.jsp").forward(request, response);
                }
                break;
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
