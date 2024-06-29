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
import java.sql.SQLException;
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
                request.setAttribute("activeMenu", "Eventos");
                request.setAttribute("activeMenuToggle", "Eventos1");
                manejarListaEventos(request, response);
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


            case "verMisEventos":
                DaoEvento daoEvento = new DaoEvento();
                ArrayList<Evento> listaMisEventos = daoEvento.listaEventosUser(6);
                request.setAttribute("listaMisEventos", listaMisEventos);
                request.setAttribute("activeMenu", "Eventos");
                request.setAttribute("activeMenuSub", "Eventos3");

                request.getRequestDispatcher("WEB-INF/coordinadora/misEventos.jsp").forward(request, response);
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
        DaoEvento eventoDao = new DaoEvento();

        switch (action){
            case "buscarEventos":
                manejarBuscarEventos(request, response);
                break;
            case "reportarIncidencia":
                DaoIncidencia incidenciaDao = new DaoIncidencia();

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
                incidenciaDao.insertarIncidencia(incidencia);
                response.sendRedirect(request.getContextPath() + "/ServletCoordinadora?action=listarIncidencias");
                break;
            case "resetIncidencia":
                DaoIncidencia incidenciaDao2 = new DaoIncidencia();

                String nombreIncidencia2 = request.getParameter("fullname");
                String telefono2 = request.getParameter("phone");
                String lugarExacto2 = request.getParameter("LugarExacto");
                String referencia2 = request.getParameter("Referencia");
                boolean requiereAmbulancia2 = request.getParameter("ambulancia") != null;
                boolean requiereBombero2 = request.getParameter("bomberos") != null;
                boolean requiereSerenazo2 = request.getParameter("serenazgos") != null;
                InputStream fotito2 = request.getPart("file").getInputStream();
                byte[] foto2 = fotito2.readAllBytes();

                Incidencia incidencia2 = new Incidencia();
                incidencia2.setNombreIncidencia(nombreIncidencia2);
                incidencia2.setTelefono(Integer.parseInt(telefono2));
                incidencia2.setLugarIncidencia(lugarExacto2);
                incidencia2.setReferenciaIncidencia(referencia2);
                incidencia2.setRequiereAmbulancia(requiereAmbulancia2);
                incidencia2.setRequiereBombero(requiereBombero2);
                incidencia2.setRequierePolicia(requiereSerenazo2);
                incidencia2.setFotoIncidencia(foto2);
                incidencia2.setIdIncidencias(Integer.parseInt(request.getParameter("incidencia_id"))); //no olvidar que para actualizar se debe enviar el ID

                incidenciaDao2.actualizarIncidencia(incidencia2);

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
                byte[] fotoEvento2 = fotoEvento.readAllBytes();

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

            default:
                doGet(request, response);
                break;


        }

    }

    private void manejarListaEventos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DaoEvento eventoDao = new DaoEvento();
        ArrayList<Evento> listaEventos;
        int total ;
        String tipo = request.getParameter("tipoFiltrado");

        //Se envia el tipo de filtrado para el combobox;
        ArrayList<String> filtrado = new ArrayList<>();
        filtrado.add("Todo");
        filtrado.add("Deporte");
        filtrado.add("Cultura");
        request.setAttribute("filtrado", filtrado);

        //Jala el total de eventos por filtro
        if ("Deporte".equals(tipo)) {
            total = eventoDao.listaEventosDeporte().size();
        } else if ("Cultura".equals(tipo)) {
            total = eventoDao.listaEventosCultura().size();
        } else {
            total = eventoDao.listaEventos(0, 1000000).size();
        }

        // Página inicial
        int pg = 1;
        //Ahora se valida el id
        if(request.getParameter("pg") != null){
            try{
                pg = Integer.parseInt(request.getParameter("pg"));
                if(pg < 1) pg = 100000;
            } catch (NumberFormatException e) {
                pg = 100000;
            }

        }

        int eventosPorPagina = 9; // Número de eventos por página
        int offset = (pg - 1) * eventosPorPagina;

        //Se jala la lista de eventos por filtro
        if ("Deporte".equals(tipo)) {
            listaEventos = eventoDao.listaEventosDeporte();
        } else if ("Cultura".equals(tipo)) {
            listaEventos = eventoDao.listaEventosCultura();
        } else {
            listaEventos = eventoDao.listaEventos(offset, eventosPorPagina);
        }

        //Se envía lo atributos y nos redirige a la vista
        request.setAttribute("currentPage", pg);
        request.setAttribute("listarEventos", listaEventos);
        request.setAttribute("total", total);
        RequestDispatcher view = request.getRequestDispatcher("WEB-INF/coordinadora/listaEventos.jsp");
        view.forward(request, response);
    }
    private void manejarBuscarEventos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String textSearch = request.getParameter("textoBuscar");
        DaoEvento eventoDao = new DaoEvento();

        String tipoFiltrado = request.getParameter("tipoFiltrado");
        ArrayList<Evento> lista;
        int pg = 1;
        request.setAttribute("currentPage", pg);

        if ("Deporte".equals(tipoFiltrado)) {
            lista = eventoDao.searchEventobyNameFiltrado(textSearch, 2);
        } else if ("Cultura".equals(tipoFiltrado)) {
            lista = eventoDao.searchEventobyNameFiltrado(textSearch, 1);
        } else {
            lista = eventoDao.searchEventobyName(textSearch);
        }
        int total = lista.size();
        request.setAttribute("total", total);

        request.setAttribute("listarEventos", lista);
        request.getRequestDispatcher("WEB-INF/coordinadora/listaEventos.jsp").forward(request, response);
    }



}
