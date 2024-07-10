package com.example.sanmi_telesoft.servlets;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.example.sanmi_telesoft.daos.EmailService;


import java.io.IOException;

@WebServlet("/sendEmail")
public class ServletGmail extends HttpServlet {

    EmailService emailService;


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        emailService = new EmailService();
        String to = request.getParameter("to");
        String subject = request.getParameter("subject");
        String content = request.getParameter("content");



        if (emailService.asd(to, subject, content)) response.getWriter().write("Correo enviado correctamente.");
    }
}
