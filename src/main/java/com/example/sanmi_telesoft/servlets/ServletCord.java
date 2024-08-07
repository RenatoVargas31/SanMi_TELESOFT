package com.example.sanmi_telesoft.servlets;

import com.example.sanmi_telesoft.beans.Usuario;
import com.example.sanmi_telesoft.daos.UsuarioDAO;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.Part;
import java.io.InputStream;

import java.io.IOException;

@WebServlet(name = "ServletCord", value = "/ServletCord")
@MultipartConfig(maxFileSize = 16177215) // 16MB

public class ServletCord extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "mostrarInicio" : request.getParameter("action");

        UsuarioDAO usuarioDAO = new UsuarioDAO();
        HttpSession session = request.getSession(false);
        Usuario usuario = (Usuario) session.getAttribute("usuario");
        request.setAttribute("usuario", usuario);
        switch (action) {
            case "mostrarPerfil":
                request.getRequestDispatcher("WEB-INF/coordinadora/cord-perfil.jsp").forward(request, response);
                break;
            case "mostrarPerfil2":
                request.getRequestDispatcher("WEB-INF/Vecino/veci-perfil.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("updateProfile".equals(action)) {
            handleUpdateProfile(request, response);
        } else if ("updateProfile1".equals(action)) {
            handleUpdateProfile1(request, response);
        } else if ("changePassword".equals(action)) {
            handleChangePassword(request, response);
        }
    }



    private void handleUpdateProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String phoneNumber = request.getParameter("phoneNumber");
        String direccion = request.getParameter("direccion");

        if (!validatePhoneNumber(phoneNumber, request, response, "WEB-INF/coordinadora/cord-perfil.jsp")) return;
        if (!validateAddress(direccion, request, response, "WEB-INF/coordinadora/cord-perfil.jsp")) return;

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

    private void handleUpdateProfile1(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String phoneNumber = request.getParameter("phoneNumber");
        String direccion = request.getParameter("direccion");
        Part filePart = request.getPart("profilePhoto");
        String resetPhoto = request.getParameter("resetPhoto");

        if (!validatePhoneNumber(phoneNumber, request, response, "WEB-INF/Vecino/veci-perfil.jsp")) return;
        if (!validateAddress(direccion, request, response, "WEB-INF/Vecino/veci-perfil.jsp")) return;

        HttpSession session = request.getSession(false);
        Usuario usuario = (Usuario) session.getAttribute("usuario");
        usuario.setTelefonoUsuario(phoneNumber);
        usuario.setDireccionUsuario(direccion);

        if ("true".equals(resetPhoto)) {
            usuario.setFotoPerfil(null);
        } else if (filePart != null && filePart.getSize() > 0) {
            // Validar tamaño del archivo
            long fileSize = filePart.getSize();
            if (fileSize > 2 * 1024 * 1024) { // 2 MB
                request.setAttribute("errorMessage", "El tamaño del archivo no debe exceder 2 MB.");
                request.setAttribute("usuario", usuario);
                request.getRequestDispatcher("WEB-INF/Vecino/veci-perfil.jsp").forward(request, response);
                return;
            }

            // Validar formato del archivo
            String fileName = filePart.getSubmittedFileName();
            String[] parts = fileName.split("\\.");
            if (parts.length < 2) {
                request.setAttribute("errorMessage", "El nombre del archivo no contiene una extensión válida.");
                request.setAttribute("usuario", usuario);
                request.getRequestDispatcher("WEB-INF/Vecino/veci-perfil.jsp").forward(request, response);
                return;
            }
            String fileExtension = parts[parts.length - 1].toLowerCase();
            if (!fileExtension.equals("jpg") && !fileExtension.equals("jpeg") && !fileExtension.equals("png")) {
                request.setAttribute("errorMessage", "Formato de archivo no permitido. Solo se permiten JPG o PNG.");
                request.setAttribute("usuario", usuario);
                request.getRequestDispatcher("WEB-INF/Vecino/veci-perfil.jsp").forward(request, response);
                return;
            }

            // Leer y validar la imagen
            try (InputStream inputStream = filePart.getInputStream()) {
                byte[] fotoPerfil = inputStream.readAllBytes();
                if (fotoPerfil.length == 0) {
                    request.setAttribute("errorMessage", "El archivo de imagen está vacío o es inválido.");
                    request.setAttribute("usuario", usuario);
                    request.getRequestDispatcher("WEB-INF/Vecino/veci-perfil.jsp").forward(request, response);
                    return;
                }
                usuario.setFotoPerfil(fotoPerfil);
            } catch (IOException e) {
                request.setAttribute("errorMessage", "Error al procesar la imagen. Intente nuevamente.");
                request.setAttribute("usuario", usuario);
                request.getRequestDispatcher("WEB-INF/Vecino/veci-perfil.jsp").forward(request, response);
                return;
            }
        }


        UsuarioDAO usuarioDAO = new UsuarioDAO();
        usuarioDAO.actualizarUsuario(usuario);
        session.setAttribute("usuario", usuario);


        request.setAttribute("successMessage", "Perfil actualizado correctamente.");
        request.setAttribute("usuario", usuario);
        request.getRequestDispatcher("WEB-INF/Vecino/veci-perfil.jsp").forward(request, response);
    }

    private void handleChangePassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Usuario usuario = (Usuario) session.getAttribute("usuario");

        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmNewPassword");

        UsuarioDAO usuarioDAO = new UsuarioDAO();

        if (!usuarioDAO.validarUsuario1(usuario.getCorreoUsuario(), currentPassword)) {
            request.setAttribute("errorMessage", "La contraseña actual es incorrecta.");
            request.getRequestDispatcher("WEB-INF/Vecino/veci-perfil.jsp").forward(request, response);
            return;
        }

        if (!newPassword.matches("^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%!&/]).{8,}$")) {
            request.setAttribute("errorMessage", "La nueva contraseña no cumple con los requisitos mínimos.");
            request.getRequestDispatcher("WEB-INF/Vecino/veci-perfil.jsp").forward(request, response);
            return;
        }

        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("errorMessage", "La confirmación de la contraseña no coincide.");
            request.getRequestDispatcher("WEB-INF/Vecino/veci-perfil.jsp").forward(request, response);
            return;
        }

        usuarioDAO.cambiarContrasena1(usuario.getIdUsuarios(), newPassword);

        request.setAttribute("successMessage", "Contraseña actualizada correctamente.");
        request.getRequestDispatcher("WEB-INF/Vecino/veci-perfil.jsp").forward(request, response);
    }

    private boolean validatePhoneNumber(String phoneNumber, HttpServletRequest request, HttpServletResponse response, String forwardPage) throws ServletException, IOException {
        if (!phoneNumber.matches("\\d{9}")) {
            request.setAttribute("errorMessage", "El número de teléfono debe tener exactamente 9 dígitos.");
            request.getRequestDispatcher(forwardPage).forward(request, response);
            return false;
        }
        return true;
    }

    private boolean validateAddress(String direccion, HttpServletRequest request, HttpServletResponse response, String forwardPage) throws ServletException, IOException {
        if (direccion.matches("\\d*") || direccion.matches("\\s*")) {
            request.setAttribute("errorMessage", "La dirección no puede contener solo números o espacios.");
            request.getRequestDispatcher(forwardPage).forward(request, response);
            return false;
        }
        return true;
    }
}