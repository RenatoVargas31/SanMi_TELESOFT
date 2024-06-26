package com.example.sanmi_telesoft.servlets;

import com.example.sanmi_telesoft.beans.*;
import com.example.sanmi_telesoft.daos.DaoCoordinadora;
import com.example.sanmi_telesoft.daos.DaoEvento;
import com.example.sanmi_telesoft.daos.DaoIncidencia;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;

@WebServlet(name = "ServletCoordinadora", value = "/ServletCoordinadora")
@MultipartConfig
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
                break;

            case "listarIncidencias":
                DaoIncidencia daoIncidencia = new DaoIncidencia();
                ArrayList<Incidencia> listaIncidencias = daoIncidencia.listarIncidencias();
                request.setAttribute("listaIncidencias", listaIncidencias);
                request.setAttribute("activeMenu", "Incidencias");
                request.setAttribute("activeMenuSub", "Incidencias2");
                request.getRequestDispatcher("WEB-INF/coordinadora/listaIncidenciasCoordinadora.jsp").forward(request, response);
                break;

            case "mostrarImagen":
                int id = Integer.parseInt(request.getParameter("id"));
                DaoIncidencia dao = new DaoIncidencia();
                Incidencia im = dao.obtenerIncidencia(id);

                if (im != null) {
                    response.setContentType("image/jpeg");
                    response.setContentLength(im.getFotoIncidencia().length);
                    OutputStream os = response.getOutputStream();
                    os.write(im.getFotoIncidencia());
                    os.flush();
                }
                break;

            case "listarMisIncidencias":
                DaoIncidencia daoIncidencia1 = new DaoIncidencia();
                ArrayList<Incidencia> listaMisIncidencias = daoIncidencia1.listarMisIncidencias(1);
                request.setAttribute("listaMisIncidencias", listaMisIncidencias);
                request.setAttribute("activeMenu", "Incidencias");
                request.setAttribute("activeMenuSub", "Incidencias3");

                request.getRequestDispatcher("WEB-INF/coordinadora/misIncidencias.jsp").forward(request, response);
                break;

            case "mostrarActualizarIncidencia":
                if (request.getParameter("id") != null) {
                    String id4 = request.getParameter("id");
                    int incId = 0;
                    try {
                        incId = Integer.parseInt(id4);
                    } catch (NumberFormatException ex) {
                        response.sendRedirect("EmployeeServlet");

                    }
                    DaoIncidencia daoIncidencia3 = new DaoIncidencia();

                    Incidencia i = daoIncidencia3.obtenerIncidencia(incId);

                    if (i != null) {
                        request.setAttribute("incidencia", i);
                        request.setAttribute("activeMenu", "Incidencias");
                        request.setAttribute("activeMenuSub", "Incidencias3");

                        request.getRequestDispatcher("WEB-INF/coordinadora/actualizarIncidencia.jsp").forward(request, response);
                    } else {
                        response.sendRedirect("EmployeeServlet");
                    }

                } else {
                    response.sendRedirect("EmployeeServlet");
                }

                break;


            case "listarEventos":
                ArrayList<Evento> listaEventos = daoCoordinadora.listaEventos();
                request.setAttribute("listaEventos", listaEventos);
                request.getRequestDispatcher("WEB-INF/coordinadora/listaEventos.jsp").forward(request, response);
                break;

            case "detalleEvento":
                String id2 = request.getParameter("id");
                if (id2.isEmpty() || !daoCoordinadora.validarIdEvento(id2)) {
                    response.sendRedirect(request.getContextPath() + "/ServletCoordinadora?action=listarEventos");
                }else {
                    request.getRequestDispatcher("indexCoordinadora.jsp").forward(request, response);
                }
                break;
                
            case "borrarIncidencia":
                if (request.getParameter("id") != null) {
                    String incIdString = request.getParameter("id");
                    int incId = 0;
                    try {
                        incId = Integer.parseInt(incIdString);
                    } catch (NumberFormatException ex) {
                        response.sendRedirect("EmployeeServlet");
                    }
                    DaoIncidencia daoIncidencia3 = new DaoIncidencia();
                    daoIncidencia3.eliminarIncidencia(incId);

                }

                response.sendRedirect("ServletCoordinadora?action=listarMisIncidencias");
                break;
            case "crearEventos":
                request.setAttribute("activeMenu", "Eventos");
                request.setAttribute("activeMenuSub", "Eventos2");
                request.getRequestDispatcher("WEB-INF/coordinadora/crearEvento.jsp").forward(request, response);
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
        DaoEvento eventoDao = new DaoEvento();

        String nombreIncidencia = request.getParameter("fullname");
        String telefono = request.getParameter("phone");
        String lugarExacto = request.getParameter("LugarExacto");
        String referencia = request.getParameter("Referencia");
        boolean requiereAmbulancia = request.getParameter("ambulancia") != null;
        boolean requiereBombero = request.getParameter("bomberos") != null;
        boolean requiereSerenazo = request.getParameter("serenazgos") != null;
        InputStream fotito = request.getPart("file").getInputStream();
        byte[] foto = fotito.readAllBytes();

        Incidencia incidencia = new Incidencia();
        incidencia.setNombreIncidencia(nombreIncidencia);
        //incidencia.setTelefono(Integer.parseInt(telefono));
        incidencia.setLugarIncidencia(lugarExacto);
        incidencia.setReferenciaIncidencia(referencia);
        incidencia.setRequiereAmbulancia(requiereAmbulancia);
        incidencia.setRequiereBombero(requiereBombero);
        incidencia.setRequierePolicia(requiereSerenazo);
        incidencia.setFotoIncidencia(foto);

        switch (action){
            case "reportarIncidencia":
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
            case "resetIncidencia":
                incidencia.setIdIncidencias(Integer.parseInt(request.getParameter("incidencia_id"))); //no olvidar que para actualizar se debe enviar el ID

                incidenciaDao.actualizarIncidencia(incidencia);

                response.sendRedirect(request.getContextPath() + "/ServletCoordinadora?action=listarMisIncidencias");

                break;

            case "guardarEventos":
                String nombreEvento = request.getParameter("nombre");
                String vacantes = request.getParameter("vacantes");
                String descripcion = request.getParameter("descripcion");
                String ubicacion = request.getParameter("LugarExacto");
                String FechaInicio = request.getParameter("FechaInicio");
                String FechaFin = request.getParameter("FechaFin");
                String tipoEvento = (((request.getParameter("tipoEvento"))));
                String horaInicio = request.getParameter("horaInicio");
                String horaFin = request.getParameter("horaFin");

                InputStream fotoEvento = request.getPart("file").getInputStream();
                byte[] fotoEvento2 = fotito.readAllBytes();

                Evento evento = new Evento();
                evento.setNombreEvento(nombreEvento);
                evento.setVacantesDisp(Integer.parseInt(vacantes));
                evento.setDescriptionEvento(descripcion);
                evento.setLugarEvento(ubicacion);
                evento.setFechaEventoStart(FechaInicio);
                evento.setFechaEventoEnd(FechaFin);
                evento.setHoraEventoStart(horaInicio);
                evento.setHoraEventoEnd(horaFin);
                evento.setFotosStart(fotoEvento2);
                //lineas asquerosas
                Profesor profesor = new Profesor();
                profesor.setIdProfesores(1);
                evento.setProfesor(profesor);
                TipoEvento tipoEvento1 = new TipoEvento();
                tipoEvento1.setNameTipo(tipoEvento);
                FrecuenciaEvento frecuenciaEvento = new FrecuenciaEvento();
                frecuenciaEvento.setIdFrecuenciaEvento(1);
                evento.setFrecuenciaEvento(frecuenciaEvento);
                EstadoEvento estadoEvento = new EstadoEvento();
                estadoEvento.setIdEstadoEvento(1);

                evento.setEstadoEvento(estadoEvento);
                //no estoy orgulloso de esto
                evento.setTipoEvento(tipoEvento1);
                eventoDao.crearEvento(evento);
                response.sendRedirect(request.getContextPath() + "/ServletCoordinadora");
                break;


        }

    }
}
