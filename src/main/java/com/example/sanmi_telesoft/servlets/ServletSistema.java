package com.example.sanmi_telesoft.servlets;

import com.example.sanmi_telesoft.beans.Usuario;
import com.example.sanmi_telesoft.daos.UserDAO;
import com.example.sanmi_telesoft.util.PassUtil;
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
                request.getRequestDispatcher("/sis-register.jsp").forward(request, response);
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
        String action = request.getParameter("action") == null ? "mostrarInicio" : request.getParameter("action");
        switch (action){
            case "insertarUsuario":
                String email = request.getParameter("email");
                String nombre = request.getParameter("Nombre");
                String apellido = request.getParameter("Apellido");
                String telefono = request.getParameter("Telefono");
                String dni = request.getParameter("DNI");
                String direccion = request.getParameter("Direccion");
                int urbanizacionId = Integer.parseInt(request.getParameter("IDUrbanizacion"));

                // Generar una contraseña temporal
                String tempPassword = PassUtil.generateRandomPassword();
                String token = PassUtil.generateRandomPassword();

                // Crear un nuevo usuario
                Usuario usuario = new Usuario();
                usuario.setCorreoUsuario(email);
                usuario.setNombreUsuario(nombre);
                usuario.setApellidoUsuario(apellido);
                usuario.setTelefonoUsuario(telefono);
                usuario.setDniUsuario(dni);
                usuario.setDireccionUsuario(direccion);
                usuario.setIdUrbanizacion(urbanizacionId);
                usuario.setPasswordUsuario(tempPassword);

                UserDAO userDAO = new UserDAO();
                userDAO.registerUser(usuario);

                // Guardar el usuario en la sesión
                //request.getSession().setAttribute("usuario", usuario);

                // Redirigir a la página de datos del usuario
                response.sendRedirect(request.getContextPath() + "/ServletSistema?action=verificarEmail");
                break;
        }
    }
}