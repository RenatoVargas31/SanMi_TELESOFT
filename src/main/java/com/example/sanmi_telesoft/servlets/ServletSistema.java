package com.example.sanmi_telesoft.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ServletSistema", value = "/ServletSistema")
public class ServletSistema extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        String action = request.getParameter("action") == null ? "mostrarInicio" : request.getParameter("action");
        switch (action){
            case "registrarUsuario":
                request.getRequestDispatcher("/sis-register-multisteps.jsp").forward(request, response);
                break;
            case "passOlvidada":
                request.getRequestDispatcher("/sis-passOlvidada.jsp").forward(request, response);
                break;
            case "resetPass":
                request.getRequestDispatcher("/sis-resetpass.jsp").forward(request, response);
                break;
            case "confirmResetPass":
                request.getRequestDispatcher("/sis-confirmresetpass.jsp").forward(request, response);
                break;
            case "verificarEmail":
                request.getRequestDispatcher("/sis-verificarEmail.jsp").forward(request, response);
                break;
            case "verificarEmail2":
                request.getRequestDispatcher("/sis-verificarEmailPassOlvidada.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}