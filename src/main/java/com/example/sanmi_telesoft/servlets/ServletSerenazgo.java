package com.example.sanmi_telesoft.servlets;

import com.example.sanmi_telesoft.beans.*;

import com.example.sanmi_telesoft.daos.*;

import com.example.sanmi_telesoft.dto.IncidenciasFalsas;
import com.example.sanmi_telesoft.dto.serenoYtipo;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "ServletSerenazgo", value = "/ServletSerenazgo")
public class ServletSerenazgo extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "mostrarInicio" : request.getParameter("action");

        DaoSerenazgo daoSerenazgo = new DaoSerenazgo();
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        DaoIncidencia daoIncidencia = new DaoIncidencia();

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
                ArrayList<Incidencia> listaIncidencias = daoIncidencia.listarIncidenciasSerenazo();
                request.setAttribute("listaIncidencias", listaIncidencias);
                request.setAttribute("activeMenuToggle", "Incidencias");
                request.setAttribute("activeMenu", "ReporteIncidencias");
                request.getRequestDispatcher("WEB-INF/Serenazgo/incidenciasSerenazgo.jsp").forward(request, response);
                break;

            case "mostrarIncidenciasFalsas":
                request.setAttribute("activeMenuToggle", "Incidencias");
                request.setAttribute("activeMenu", "IncidenciasFalsas");
                DaoIncidencia daoIncidenciaFalsas = new DaoIncidencia();
                ArrayList<IncidenciasFalsas> listaIncidenciasFalsas = daoIncidenciaFalsas.listarIncidenciasFalsas();
                request.setAttribute("Falsas", listaIncidenciasFalsas);
                request.getRequestDispatcher("WEB-INF/Serenazgo/incidenciasFalsasSerenazgo.jsp").forward(request, response);
                break;

            case "mostrarIncidenciasHistorial":
                request.setAttribute("activeMenuToggle", "Incidencias");
                request.setAttribute("activeMenu", "IncidenciasHistorial");
                ArrayList<Incidencia> listaIncidenciasHisorial = daoIncidencia.listarIncidenciasHistorial();
                request.setAttribute("historial", listaIncidenciasHisorial);
                request.getRequestDispatcher("WEB-INF/Serenazgo/historial.jsp").forward(request, response);
                break;

            case "mostrarMisIncidencias":
                HttpSession session2 = request.getSession(false);
                Usuario user = (Usuario) session2.getAttribute("usuario");
                ArrayList<Incidencia> misIncidencias = daoIncidencia.listarMisIncidenciasSerenazo(user.getIdUsuarios());
                request.setAttribute("incidencias", misIncidencias);
                request.setAttribute("activeMenuToggle", "Incidencias");
                request.setAttribute("activeMenu", "MisReportes");
                request.getRequestDispatcher("WEB-INF/Serenazgo/misIncidencias.jsp").forward(request, response);
                break;

            case "falsearIncidencia":
                if (request.getParameter("id") != null) {
                    String incIdString = request.getParameter("id");
                    int incId = 0;
                    try {
                        incId = Integer.parseInt(incIdString);
                    } catch (NumberFormatException ex) {
                        response.sendRedirect("EmployeeServlet");
                    }
                    daoIncidencia.falsearIncidencia(incId);

                }

                response.sendRedirect("ServletSerenazgo?action=mostrarReportesIncidencias");
                break;

            case "asignarIncidencia":
                HttpSession session3 = request.getSession(false);
                Usuario user1 = (Usuario) session3.getAttribute("usuario");
                int idIncidencia = Integer.parseInt(request.getParameter("idIncidencia"));

                daoIncidencia.insertarSerenazgoIncidencia(idIncidencia, user1.getIdUsuarios());
                response.sendRedirect("ServletSerenazgo?action=mostrarMisIncidencias");
                break;
            case "mostrarPerfil":
                HttpSession session = request.getSession(false);
                Usuario usuario = (Usuario) session.getAttribute("usuario");
                request.setAttribute("usuario", usuario);
                request.getRequestDispatcher("WEB-INF/Serenazgo/sere-perfil.jsp").forward(request, response);
                break;

            case "servirImagenIncidencia":
                servirImagenIncidencia(request, response);
                break;

            case "verDetalleIncidenciaGeneral":
                verDetallesIncidenciaGeneral(request, response);
                break;

            case "verDetallePersonal":
                verDetallesIncidenciaPersonal(request, response);
                break;

            case "verDetalleHistorial":
                verDetallesIncidenciaHistorial(request, response);
                break;

            case "mostrarActualizarIncidencia":
                mostrarActualizarIncidencia(request, response);
                break;

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("updateProfile".equals(action)) {
            String phoneNumber = request.getParameter("phoneNumber").trim();
            String direccion = request.getParameter("direccion").trim();

            // Validación del número de teléfono: solo 9 dígitos sin espacios ni caracteres especiales
            if (!phoneNumber.matches("\\d{9}")) {
                request.setAttribute("errorMessage", "El número de teléfono debe tener exactamente 9 dígitos.");
                request.getRequestDispatcher("WEB-INF/Serenazgo/sere-perfil.jsp").forward(request, response);
                return;
            }

            // Validación de la dirección: no debe ser solo números o espacios
            if (direccion.matches("\\d*") || direccion.matches("\\s*")) {
                request.setAttribute("errorMessage", "La dirección no puede contener solo números o espacios.");
                request.getRequestDispatcher("WEB-INF/Serenazgo/sere-perfil.jsp").forward(request, response);
                return;
            }

            // Si las validaciones pasan, actualizar el perfil en la base de datos
            HttpSession session = request.getSession(false);
            Usuario usuario = (Usuario) session.getAttribute("usuario");
            usuario.setTelefonoUsuario(phoneNumber);
            usuario.setDireccionUsuario(direccion);

            UsuarioDAO usuarioDAO = new UsuarioDAO();
            usuarioDAO.actualizarUsuario(usuario);

            request.setAttribute("successMessage", "Perfil actualizado correctamente.");
            request.setAttribute("usuario", usuario);
            request.getRequestDispatcher("WEB-INF/Serenazgo/sere-perfil.jsp").forward(request, response);
        }
    }

    private void verDetallesIncidenciaGeneral(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Validar usuario
        HttpSession session = request.getSession(false);
        Usuario usuario = (Usuario) session.getAttribute("usuario");
        if (usuario == null) {
            response.sendRedirect(request.getContextPath() + "/ServletLoguin");
            return;
        }

        DaoIncidencia incidenciaDao = new DaoIncidencia();
        String idIncidencia = request.getParameter("id");

        if(idIncidencia != null) {
            try{
                int id = Integer.parseInt(idIncidencia);
                Incidencia incidencia = incidenciaDao.obtenerIncidencia(id);
                if(incidencia != null) {
                    //Detalles de urbanizacion y tipo de incidencia
                    DaoTipoIncidencias tipoIncidenciaDAO = new DaoTipoIncidencias();
                    DaoUrbanizacion urbanizacionDAO = new DaoUrbanizacion();

                    ArrayList<TipoIncidencia> tipos = tipoIncidenciaDAO.getTipoIncidencias();
                    ArrayList<Urbanizacion> urbanizaciones = urbanizacionDAO.getUrbanizaciones();

                    TipoIncidencia tipoIncidencia = null;
                    for (TipoIncidencia t : tipos) {
                        if (t.getId() == incidencia.getIdTipoIncidencia()) {
                            tipoIncidencia = t;
                            break;
                        }
                    }

                    Urbanizacion urbanizacion = null;
                    for (Urbanizacion u : urbanizaciones) {
                        if (u.getId() == incidencia.getIdUrbanizacion()) {
                            urbanizacion = u;
                            break;
                        }
                    }

                    if (incidencia.getEstado() == 1){
                        String nombreCompleto = incidenciaDao.obtenerNombreUsuarioPorIdIncidencia(id);
                        request.setAttribute("nombreCompletoUsuario", nombreCompleto);
                        request.setAttribute("incidencia", incidencia);
                        request.setAttribute("tipoIncidencia", tipoIncidencia);
                        request.setAttribute("urbanizacion", urbanizacion);
                        request.setAttribute("activeMenuToggle", "Incidencias");
                        request.setAttribute("activeMenu", "ReporteIncidencia");
                        request.getRequestDispatcher("WEB-INF/Serenazgo/detalleGeneral.jsp").forward(request, response);
                    } else if(incidencia.getEstado() == 2){
                        String nombreCompleto = incidenciaDao.obtenerNombreUsuarioPorIdIncidencia(id);
                        request.setAttribute("nombreCompletoUsuario", nombreCompleto);
                        request.setAttribute("incidencia", incidencia);
                        request.setAttribute("tipoIncidencia", tipoIncidencia);
                        request.setAttribute("urbanizacion", urbanizacion);
                        request.setAttribute("activeMenuToggle", "Incidencias");
                        request.setAttribute("activeMenu", "ReporteIncidencia");
                        request.getRequestDispatcher("WEB-INF/Serenazgo/detallePersonal.jsp").forward(request, response);
                    } else if(incidencia.getEstado() == 3){
                        response.sendRedirect(request.getContextPath() + "/ServletSerenazgo?action=mostrarReportesIncidencias");
                    }
                } else {
                    response.sendRedirect(request.getContextPath() + "/ServletSerenazgo?action=mostrarReportesIncidencias");
                }

            } catch (NumberFormatException ex) {
                response.sendRedirect(request.getContextPath() + "/ServletSerenazgo?action=mostrarReportesIncidencias");
            }

        } else {
            response.sendRedirect(request.getContextPath() + "/ServletSerenazgo?action=mostrarReportesIncidencias");
        }

    }

    private void verDetallesIncidenciaHistorial(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Validar usuario
        HttpSession session = request.getSession(false);
        Usuario usuario = (Usuario) session.getAttribute("usuario");
        if (usuario == null) {
            response.sendRedirect(request.getContextPath() + "/ServletLoguin");
            return;
        }

        DaoIncidencia incidenciaDao = new DaoIncidencia();
        String idIncidencia = request.getParameter("id");

        if(idIncidencia != null) {
            try{
                int id = Integer.parseInt(idIncidencia);
                Incidencia incidencia = incidenciaDao.obtenerIncidencia(id);
                if(incidencia != null && incidencia.getEstado() == 3) {
                    //Detalles de urbanizacion y tipo de incidencia
                    DaoTipoIncidencias tipoIncidenciaDAO = new DaoTipoIncidencias();
                    DaoUrbanizacion urbanizacionDAO = new DaoUrbanizacion();

                    ArrayList<TipoIncidencia> tipos = tipoIncidenciaDAO.getTipoIncidencias();
                    ArrayList<Urbanizacion> urbanizaciones = urbanizacionDAO.getUrbanizaciones();

                    TipoIncidencia tipoIncidencia = null;
                    for (TipoIncidencia t : tipos) {
                        if (t.getId() == incidencia.getIdTipoIncidencia()) {
                            tipoIncidencia = t;
                            break;
                        }
                    }

                    Urbanizacion urbanizacion = null;
                    for (Urbanizacion u : urbanizaciones) {
                        if (u.getId() == incidencia.getIdUrbanizacion()) {
                            urbanizacion = u;
                            break;
                        }
                    }

                    String nombreCompleto = incidenciaDao.obtenerNombreUsuarioPorIdIncidencia(id);
                    request.setAttribute("nombreCompletoUsuario", nombreCompleto);
                    request.setAttribute("incidencia", incidencia);
                    request.setAttribute("tipoIncidencia", tipoIncidencia);
                    request.setAttribute("urbanizacion", urbanizacion);
                    request.setAttribute("activeMenuToggle", "Incidencias");
                    request.setAttribute("activeMenu", "IncidenciasHistorial");
                    request.getRequestDispatcher("WEB-INF/Serenazgo/detallePersonal.jsp").forward(request, response);

                } else {
                    response.sendRedirect(request.getContextPath() + "/ServletSerenazgo?action=mostrarIncidenciasHistorial");
                }

            } catch (NumberFormatException ex) {
                response.sendRedirect(request.getContextPath() + "/ServletSerenazgo?action=mostrarIncidenciasHistorial");
            }

        } else {
            response.sendRedirect(request.getContextPath() + "/ServletSerenazgo?action=mostrarIncidenciasHistorial");
        }

    }

    private void verDetallesIncidenciaPersonal(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Validar usuario
        HttpSession session = request.getSession(false);
        Usuario usuario = (Usuario) session.getAttribute("usuario");
        if (usuario == null) {
            response.sendRedirect(request.getContextPath() + "/ServletLoguin");
            return;
        }

        DaoIncidencia incidenciaDao = new DaoIncidencia();
        String idIncidencia = request.getParameter("id");

        if (idIncidencia != null) {
            try {
                int id = Integer.parseInt(idIncidencia);
                Incidencia incidencia = incidenciaDao.obtenerIncidencia(id);
                if (incidencia != null) {
                    
                    if (incidencia.getSerenazgoid() != usuario.getIdUsuarios()) {response.sendRedirect(request.getContextPath() + "/ServletSerenazgo?action=mostrarMisIncidencias");}
                    //Detalles de urbanizacion y tipo de incidencia
                    else {
                        DaoTipoIncidencias tipoIncidenciaDAO = new DaoTipoIncidencias();
                        DaoUrbanizacion urbanizacionDAO = new DaoUrbanizacion();

                        ArrayList<TipoIncidencia> tipos = tipoIncidenciaDAO.getTipoIncidencias();
                        ArrayList<Urbanizacion> urbanizaciones = urbanizacionDAO.getUrbanizaciones();

                        TipoIncidencia tipoIncidencia = null;
                        for (TipoIncidencia t : tipos) {
                            if (t.getId() == incidencia.getIdTipoIncidencia()) {
                                tipoIncidencia = t;
                                break;
                            }
                        }

                        Urbanizacion urbanizacion = null;
                        for (Urbanizacion u : urbanizaciones) {
                            if (u.getId() == incidencia.getIdUrbanizacion()) {
                                urbanizacion = u;
                                break;
                            }
                        }

                        String nombreCompleto = incidenciaDao.obtenerNombreUsuarioPorIdIncidencia(id);
                        request.setAttribute("nombreCompletoUsuario", nombreCompleto);
                        request.setAttribute("incidencia", incidencia);
                        request.setAttribute("tipoIncidencia", tipoIncidencia);
                        request.setAttribute("urbanizacion", urbanizacion);
                        request.setAttribute("activeMenuToggle", "Incidencias");
                        request.setAttribute("activeMenu", "MisReportes");
                        request.getRequestDispatcher("WEB-INF/Serenazgo/detallePersonal.jsp").forward(request, response);
                    }
                } else {
                    response.sendRedirect(request.getContextPath() + "/ServletSerenazgo?action=mostrarMisIncidencias");
                }

            } catch (NumberFormatException ex) {
                response.sendRedirect(request.getContextPath() + "/ServletSerenazgo?action=mostrarMisIncidencias");
            }

        } else {
            response.sendRedirect(request.getContextPath() + "/ServletSerenazgo?action=mostrarMisIncidencias");
        }
    }
    
    private void servirImagenIncidencia(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //validar usuario
        HttpSession session = request.getSession(false);
        Usuario usuario = (Usuario) session.getAttribute("usuario");

        if (usuario == null) {
            response.sendRedirect(request.getContextPath() + "/ServletLoguin");
            return;
        }
        DaoIncidencia incidenciaDao = new DaoIncidencia();
        String id = request.getParameter("id");
        if (id == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Falta el parámetro id");
            return;
        }

        try {
            byte[] imgData = incidenciaDao.obtenerFotoIncidencia(Integer.parseInt(id));
            if (imgData != null) {
                response.setContentType("image/jpeg");
                try (OutputStream os = response.getOutputStream()) {
                    os.write(imgData);
                }
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Imagen no encontrada para id: " + id);
            }
        } catch (SQLException e) {
            throw new ServletException("Error al acceder a la base de datos", e);
        }
    }

    private void mostrarActualizarIncidencia(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //validar usuario
        HttpSession session = request.getSession(false);
        Usuario usuario = (Usuario) session.getAttribute("usuario");

        if (usuario == null) {
            response.sendRedirect(request.getContextPath() + "/ServletLoguin");
            return;
        }

        DaoIncidencia incidenciaDao = new DaoIncidencia();
        DaoPrioridad prioridadDao = new DaoPrioridad();
        DaoPersonalAmbulancia personalAmbulanciaDao = new DaoPersonalAmbulancia();
        DaoTipoSereno tipoSerenazgoDao = new DaoTipoSereno();
        String id = request.getParameter("id");

        if(id != null) {
            try{
                int idIncidencia = Integer.parseInt(id);
                Incidencia i = incidenciaDao.obtenerIncidencia(idIncidencia);
                if(i != null && i.getSerenazgoid() == usuario.getIdUsuarios()) {
                    ArrayList<Prioridad> listaPrioridad = prioridadDao.getListaPrioridad();
                    ArrayList<PersonalAmbulancia> listaPersonalAmbulancia = personalAmbulanciaDao.getListaPersonalAmbulancia();
                    ArrayList<serenoYtipo> listaTipoSereno = tipoSerenazgoDao.getListaTipoSereno();

                    request.setAttribute("listaAmbulancia", listaPersonalAmbulancia);
                    request.setAttribute("listaSereno", listaTipoSereno);
                    request.setAttribute("listaPrioridad", listaPrioridad);
                    request.setAttribute("incidencia", i);
                    request.setAttribute("activeMenuToggle", "Incidencias");
                    request.setAttribute("activeMenu", "MisReportes");
                    request.getRequestDispatcher("WEB-INF/Serenazgo/editarIncidencia.jsp").forward(request, response);

                } else {
                    response.sendRedirect(request.getContextPath() + "/ServletSerenazgo?action=mostrarMisIncidencias");
                }

            } catch (NumberFormatException e){
                response.sendRedirect(request.getContextPath() + "/ServletSerenazgo?action=mostrarMisIncidencias");
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }

        } else {
            response.sendRedirect(request.getContextPath() + "/ServletSerenazgo?action=mostrarMisIncidencias");
        }
    }
}
