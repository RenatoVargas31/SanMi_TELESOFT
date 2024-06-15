package com.example.sanmi_telesoft.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ServletSistema", value = "/ServletSistema")
public class ServletSistema extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Redirige a sis-confirmresetpass.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("sis-verificarEmailPassOlvidada.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Redirige a sis-confirmresetpass.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("sis-confirmresetpass.jsp");
        dispatcher.forward(request, response);
    }
}