package com.example.sanmi_telesoft.servlets;

import com.example.sanmi_telesoft.beans.Usuario;
import com.example.sanmi_telesoft.daos.UsuarioDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/ServletLoguin")
public class ServletLoguin extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UsuarioDAO usuarioDAO;

    public void init() {
        usuarioDAO = new UsuarioDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String correoUsuario = request.getParameter("email-username");
        String passwordUsuario = request.getParameter("password");
        String rememberMe = request.getParameter("remember-me");
        // Validaciones
        boolean valid = true;
        StringBuilder errorMsg = new StringBuilder();

        // Validar correo
        if (correoUsuario == null || correoUsuario.trim().isEmpty()) {
            valid = false;
            errorMsg.append("El correo es obligatorio.<br>");
        } else if (!correoUsuario.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
            valid = false;
            errorMsg.append("El formato del correo es incorrecto.<br>");
        }

        // Validar contraseña
        if (passwordUsuario == null || passwordUsuario.trim().isEmpty()) {
            valid = false;
            errorMsg.append("La contraseña es obligatoria.<br>");
        } else if (passwordUsuario.length() < 6) {
            valid = false;
            errorMsg.append("La contraseña debe tener al menos 6 caracteres.<br>");
        }

        if (!valid) {
            request.setAttribute("error", errorMsg.toString());
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        }

        Usuario usuario = usuarioDAO.validarUsuario(correoUsuario, passwordUsuario);

        if (usuario != null) {
            HttpSession session = request.getSession();
            session.setAttribute("usuario", usuario);
            session.setMaxInactiveInterval(30*60);

            if ("true".equals(rememberMe)) {
                Cookie userCookie = new Cookie("email-username", correoUsuario);
                Cookie passwordCookie = new Cookie("password", passwordUsuario);
                userCookie.setMaxAge(60 * 60 * 24 * 30); // 30 días
                passwordCookie.setMaxAge(60 * 60 * 24 * 30); // 30 días
                response.addCookie(userCookie);
                response.addCookie(passwordCookie);
            } else {
                Cookie userCookie = new Cookie("email-username", null);
                Cookie passwordCookie = new Cookie("password", null);
                userCookie.setMaxAge(0);
                passwordCookie.setMaxAge(0);
                response.addCookie(userCookie);
                response.addCookie(passwordCookie);
            }

            switch (usuario.getIdRoles()) {
                case 1:
                    response.sendRedirect(request.getContextPath() + "/ServletAdministrador");
                    break;
                case 3:
                    response.sendRedirect(request.getContextPath() + "/ServletCoordinadora");
                    break;
                case 2:
                    response.sendRedirect(request.getContextPath() + "/ServletSerenazgo");
                    break;
                case 4:
                    response.sendRedirect(request.getContextPath() + "/ServletVecino");
                    break;
                default:
                    request.setAttribute("error", "ga");
                    request.getRequestDispatcher("/index.jsp").forward(request, response);
                    break;
            }
        } else {
            request.setAttribute("error", "ga");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action") == null ?
                "loginform" : request.getParameter("action");
        RequestDispatcher view;

        switch (action) {
            case "loginform":
                HttpSession session = request.getSession();
                Usuario u = (Usuario) session.getAttribute("usuario");

                if (u != null && u.getIdUsuarios() != 0){
                    response.sendRedirect(request.getContextPath());
                } else {
                    Cookie[] cookies = request.getCookies();
                    if (cookies != null) {
                        for (Cookie cookie : cookies) {
                            if ("email-username".equals(cookie.getName())) {
                                request.setAttribute("email", cookie.getValue());
                            }
                            if ("password".equals(cookie.getName())) {
                                request.setAttribute("password", cookie.getValue());
                            }
                        }
                    }
                    view = request.getRequestDispatcher("/index.jsp");
                    view.forward(request, response);
                }
                break;
            case "logout":
                HttpSession sessionToInvalidate = request.getSession();
                sessionToInvalidate.invalidate();
                response.sendRedirect(request.getContextPath() + "/ServletLoguin");
                break;
            default:
                doPost(request, response);
                break;
        }
    }
}