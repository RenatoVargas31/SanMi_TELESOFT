package com.example.sanmi_telesoft.servlets;

import com.example.sanmi_telesoft.beans.Usuario;
import com.example.sanmi_telesoft.daos.UsuarioDAO;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ServletCord", value = "/ServletCord")
public class ServletCord extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "mostrarInicio" : request.getParameter("action");

        UsuarioDAO usuarioDAO = new UsuarioDAO();
        switch (action) {
            case "mostrarPerfil":
                HttpSession session = request.getSession(false);
                Usuario usuario = (Usuario) session.getAttribute("usuario");
                request.setAttribute("usuario", usuario);
                request.getRequestDispatcher("WEB-INF/coordinadora/cord-perfil.jsp").forward(request, response);
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
                request.getRequestDispatcher("WEB-INF/coordinadora/cord-perfil.jsp").forward(request, response);
                return;
            }

            // Validación de la dirección: no debe ser solo números o espacios
            if (direccion.matches("\\d*") || direccion.matches("\\s*")) {
                request.setAttribute("errorMessage", "La dirección no puede contener solo números o espacios.");
                request.getRequestDispatcher("WEB-INF/coordinadora/cord-perfil.jsp").forward(request, response);
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
            request.getRequestDispatcher("WEB-INF/coordinadora/cord-perfil.jsp").forward(request, response);
        }
    }
}