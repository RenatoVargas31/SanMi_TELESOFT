package com.example.sanmi_telesoft.servlets;

import com.example.sanmi_telesoft.beans.Evento;
import com.example.sanmi_telesoft.beans.Usuario;
import com.example.sanmi_telesoft.beans.Incidencia;

import com.example.sanmi_telesoft.daos.UsuarioDAO;
import com.example.sanmi_telesoft.daos.DaoIncidencia;
import com.example.sanmi_telesoft.daos.DaoSerenazgo;
import com.example.sanmi_telesoft.daos.DaoVecino;

import com.example.sanmi_telesoft.dto.IncidenciasFalsas;
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
        UsuarioDAO usuarioDAO = new UsuarioDAO();

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
                DaoIncidencia daoIncidenciaHistorial = new DaoIncidencia();
                ArrayList<Incidencia> listaIncidenciasHisorial = daoIncidenciaHistorial.listarIncidenciasHistorial();
                request.setAttribute("historial", listaIncidenciasHisorial);
                request.getRequestDispatcher("WEB-INF/Serenazgo/historial.jsp").forward(request, response);
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
                    DaoIncidencia daoIncidencia4 = new DaoIncidencia();
                    daoIncidencia4.falsearIncidencia(incId);

                }

                response.sendRedirect("ServletSerenazgo?action=mostrarReportesIncidencias");
                break;
            case "mostrarPerfil":
                HttpSession session = request.getSession(false);
                Usuario usuario = (Usuario) session.getAttribute("usuario");
                request.setAttribute("usuario", usuario);
                request.getRequestDispatcher("WEB-INF/Serenazgo/sere-perfil.jsp").forward(request, response);
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
}
