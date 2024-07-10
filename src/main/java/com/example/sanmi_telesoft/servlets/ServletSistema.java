package com.example.sanmi_telesoft.servlets;

import com.example.sanmi_telesoft.beans.Token;
import com.example.sanmi_telesoft.beans.Usuario;
import com.example.sanmi_telesoft.daos.DaoToken;
import com.example.sanmi_telesoft.daos.EmailService;
import com.example.sanmi_telesoft.daos.UserDAO;
import com.example.sanmi_telesoft.daos.UsuarioDAO;
import com.example.sanmi_telesoft.util.PassUtil;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.Time;
import java.sql.Timestamp;

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
                DaoToken daoToken = new DaoToken();
                UsuarioDAO usuarioDAO = new UsuarioDAO();
                String id = request.getParameter("id");
                Token token = daoToken.GetToken(id);
                Usuario usuario = usuarioDAO.obtenerDatosporId(token.getUser());

                if(token != null){
                    Timestamp now = new Timestamp(System.currentTimeMillis());
                    Timestamp limit = token.getFecha();
                    if(now.after(limit)) request.setAttribute("as", "as");
                    request.setAttribute("user", usuario);
                    request.getRequestDispatcher("/sis-resetpass.jsp").forward(request, response);
                } else {
                    response.sendRedirect(request.getContextPath() + "/ServletLoguin");
                }

                break;
            case "verificarEmail":
                request.getRequestDispatcher("/sis-verificarEmail.jsp").forward(request, response);
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
            case "verificarEmail2":
                String correo = request.getParameter("email");
                UsuarioDAO usuarioDAO = new UsuarioDAO();
                DaoToken daoToken = new DaoToken();
                EmailService emailService = new EmailService();

                String sub = "Restablecimiento de contraseña";
                String body;

                Usuario user = usuarioDAO.obtenerDatosporCorreo(correo);
                if(user != null){
                    Token token1 = daoToken.CreateToken(user);
                    body = "http://localhost:8080/SanMi_TELESOFT_war_exploded/ServletSistema?action=resetPass&id=" + token1.getId();
                    emailService.enviarLink(correo, sub, body);
                    request.getRequestDispatcher("/sis-verificarEmailPassOlvidada.jsp").forward(request, response);
                } else {
                    request.setAttribute("error", "ga");
                    request.getRequestDispatcher("/sis-passOlvidada.jsp").forward(request, response);
                }
                break;
            case "confirmResetPass":
                UsuarioDAO usuarioDao = new UsuarioDAO();
                String passNew = request.getParameter("new");
                String passConfirm = request.getParameter("confirm");
                int idUser = Integer.parseInt(request.getParameter("idUsuario"));


                if(passNew.equals(passConfirm)){
                    usuarioDao.cambiarContrasena(idUser, passNew);
                    request.getRequestDispatcher("/sis-confirmresetpass.jsp").forward(request, response);
                } else {
                    Usuario us = usuarioDao.obtenerDatosporId(idUser);
                    request.setAttribute("user", us);
                    request.setAttribute("ga", "ga");
                    request.getRequestDispatcher("/sis-resetpass.jsp").forward(request, response);
                }
                break;
        }
    }
}