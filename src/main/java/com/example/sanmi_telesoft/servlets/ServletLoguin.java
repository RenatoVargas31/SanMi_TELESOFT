package com.example.sanmi_telesoft.servlets;

import com.example.sanmi_telesoft.beans.Usuario;
import com.example.sanmi_telesoft.daos.UsuarioDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/LoginServlet")
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
            switch (usuario.getIdRoles()){
                case 1:
                    response.sendRedirect("/SanMi_TELESOFT/ServletAdministrador");
                case 2:
                    response.sendRedirect("/SanMi_TELESOFT/ServletSerenazgo");
                case 3:
                    response.sendRedirect("/SanMi_TELESOFT/ServletCoordinadora");
                case 4:
                    response.sendRedirect("/SanMi_TELESOFT/ServletVecino");
            }
        } else {
            response.sendRedirect("index.jsp?error=true");
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}