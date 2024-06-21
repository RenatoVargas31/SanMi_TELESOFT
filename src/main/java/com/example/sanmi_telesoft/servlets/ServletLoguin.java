package com.example.sanmi_telesoft.servlets;

import com.example.sanmi_telesoft.beans.Usuario;
import com.example.sanmi_telesoft.daos.UsuarioDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
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

        Usuario usuario = usuarioDAO.validarUsuario(correoUsuario, passwordUsuario);

        if (usuario != null) {
            HttpSession session = request.getSession();
            session.setAttribute("usuario", usuario);
            // Redirigir según el rol del usuario
            switch (usuario.getIdRoles()) {
                case 1: // Rol de Administrador
                    response.sendRedirect(request.getContextPath()+"/ServletAdministrador");
                    break;
                case 2: // Rol de Coordinadora
                    response.sendRedirect(request.getContextPath()+"/ServletCoordinadora");
                    break;
                case 3: // Rol de Serenazgo
                    response.sendRedirect(request.getContextPath()+"/ServletSerenazgo");
                    break;
                case 4: // Rol de Vecino
                    response.sendRedirect(request.getContextPath()+"/ServletVecino");
                    break;
                default:
                    response.sendRedirect("index.jsp?error");
                    break;
            }
        } else {
            response.sendRedirect("index.jsp?error");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action") == null ?
                "loginform" : request.getParameter("action");
        RequestDispatcher view;

        switch (action) {
            case "loginform":
                view = request.getRequestDispatcher("login/loginForm.jsp");
                view.forward(request, response);
                break;
        }
        doPost(request, response);
    }
}