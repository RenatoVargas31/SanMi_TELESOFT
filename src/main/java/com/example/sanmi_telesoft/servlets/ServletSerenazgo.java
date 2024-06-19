package com.example.sanmi_telesoft.servlets;

import com.example.sanmi_telesoft.beans.Evento;
import com.example.sanmi_telesoft.beans.Usuario;
import com.example.sanmi_telesoft.beans.Incidencia;

import com.example.sanmi_telesoft.daos.DaoCoordinadora;
import com.example.sanmi_telesoft.daos.DaoIncidencia;
import com.example.sanmi_telesoft.daos.DaoSerenazgo;
import com.example.sanmi_telesoft.daos.DaoVecino;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ServletSerenazgo", value = "/ServletSerenazgo")
public class ServletSerenazgo extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "mostrarInicio" : request.getParameter("action");

        DaoSerenazgo daoSerenazgo = new DaoSerenazgo();

        switch (action){
            case "mostrarInicio":
                request.setAttribute("activeMenu", "Inicio");
                request.getRequestDispatcher("WEB-INF/Serenazgo/indexSerenazgo.jsp").forward(request, response);
                break;

            case "mostrarAyuda":
                request.setAttribute("activeMenu", "Ayuda");
                request.getRequestDispatcher("WEB-INF/Serenazgo/ayudaSerenazgo.jsp").forward(request, response);
                break;

            case "mostrarReportesIncidencias":
                DaoIncidencia daoIncidencia = new DaoIncidencia();
                ArrayList<Incidencia> listaIncidencias = daoIncidencia.listarIncidencias();
                request.setAttribute("listaIncidencias", listaIncidencias);
                request.setAttribute("activeMenuToggle", "Incidencias");
                request.setAttribute("activeMenu", "ReporteIncidencias");
                request.getRequestDispatcher("WEB-INF/Serenazgo/incidenciasSerenazgo.jsp").forward(request, response);
                break;

            case "mostrarIncidenciasFalsas":
                request.setAttribute("activeMenuToggle", "Incidencias");
                request.setAttribute("activeMenu", "IncidenciasFalsas");
                request.getRequestDispatcher("WEB-INF/Serenazgo/incidenciasFalsasSerenazgo.jsp").forward(request, response);
                break;
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
