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

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
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
            case "mostrarReportarIncidencias":
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
                ArrayList<Incidencia> listaMisIncidencias = daoIncidencia1.listarMisIncidencias(3);
                request.setAttribute("listaMisIncidencias", listaMisIncidencias);
                request.setAttribute("activeMenu", "Incidencias");
                request.setAttribute("activeMenuSub", "Incidencias3");

                request.getRequestDispatcher("WEB-INF/coordinadora/misIncidencias.jsp").forward(request, response);
                break;

            case "mostrarActualizarIncidencia":
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
        response.setContentType("text/html");
        String action = request.getParameter("action");
        if (action == null) {
            doGet(request, response);
            return;
        }

        DaoIncidencia incidenciaDao = new DaoIncidencia();

        switch (action){
            case "reportarIncidencia":
                String nombreIncidencia = request.getParameter("fullname");
                String telefono = request.getParameter("phone");
                String lugarExacto = request.getParameter("LugarExacto");
                String referencia = request.getParameter("Referencia");
                boolean requiereAmbulancia = request.getParameter("ambulancia") != null;
                boolean requiereBombero = request.getParameter("bomberos") != null;
                boolean requiereSerenazo = request.getParameter("serenazgos") != null;

                Incidencia incidencia = new Incidencia();
                incidencia.setNombreIncidencia(nombreIncidencia);
                incidencia.setTelefono(Integer.parseInt(telefono));
                incidencia.setLugarIncidencia(lugarExacto);
                incidencia.setReferenciaIncidencia(referencia);
                incidencia.setRequiereAmbulancia(requiereAmbulancia);
                incidencia.setRequiereBombero(requiereAmbulancia);
                incidencia.setRequierePolicia(requiereSerenazo);


                /*if (fotoPart != null && fotoPart.getSize() > 0) {
                    String fileName = Paths.get(fotoPart.getSubmittedFileName()).getFileName().toString();
                    incidencia.setFotoIncidencia(fileName);
                    File uploads = new File("/path/to/uploads");
                    File file = new File(uploads, fileName);
                    try (InputStream input = fotoPart.getInputStream()) {
                        Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
                    }
                }*/

                incidenciaDao.insertarIncidencia(incidencia);
                response.sendRedirect(request.getContextPath() + "/ServletCoordinadora?action=listarIncidencias");
                break;
            case "yolo":
                break;
        }

    }
}
