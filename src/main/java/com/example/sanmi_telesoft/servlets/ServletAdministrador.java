package com.example.sanmi_telesoft.servlets;

import com.example.sanmi_telesoft.beans.Profesor;
import com.example.sanmi_telesoft.daos.DaoAdministrador;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "ServletAdministrador", value = "/ServletAdministrador")
public class ServletAdministrador extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        String action = request.getParameter("action") == null ? "listarProfesores" : request.getParameter("action");

        //Instancia de la clase DaoAdministrador (métodos)
        DaoAdministrador daoAdministrador = new DaoAdministrador();

        switch (action){
            case "listarProfesores":
                //Sacar del modelo
                ArrayList<Profesor> listaProfesores = daoAdministrador.listarProfesores();
                //Mandar a la vista -> adm-instructores.jsp
                request.setAttribute("listaProfesores", listaProfesores);
                RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/Administrador/adm-instructores.jsp");
                rd.forward(request, response);
                break;
            case "eliminarProfesor":
                String idDelete = request.getParameter("idProfesor");
                Profesor profesorDelete = daoAdministrador.buscarProfesorPorId(idDelete);

                if(profesorDelete != null){
                    try {
                        daoAdministrador.borrarProfesores(idDelete);
                    } catch (SQLException e) {
                        System.out.println("Log: excepcion: " + e.getMessage());
                    }
                }
                response.sendRedirect(request.getContextPath() + "/ServletAdministrador");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        String action = request.getParameter("action") == null ? "crearProfesor" : request.getParameter("action");

        //Instancia de la clase DaoAdministrador (métodos)
        DaoAdministrador daoAdministrador = new DaoAdministrador();

        switch (action){
            case "crearProfesor":
                String tipoProfesor = request.getParameter("tipoProfesor");
                String nombreProfesor = request.getParameter("nombreProfesor");
                String apellidoProfesor = request.getParameter("apellidoProfesor");
                String dniProfesor = request.getParameter("dniProfesor");
                String cursoProfesor = request.getParameter("cursoProfesor");
                System.out.println(tipoProfesor + nombreProfesor + apellidoProfesor + dniProfesor + cursoProfesor);
                daoAdministrador.crearProfesores(nombreProfesor, apellidoProfesor, dniProfesor, tipoProfesor, cursoProfesor);
                response.sendRedirect(request.getContextPath() + "/ServletAdministrador");
                break;
            case "editarProfesor":
                String idEdit = request.getParameter("idProfesor");
                String nombreProfesorEdit = request.getParameter("nombreProfesor");
                String apellidoProfesorEdit = request.getParameter("apellidoProfesor");
                String dniProfesorEdit = request.getParameter("dniProfesor");
                String tipoProfesorEdit = request.getParameter("tipoProfesor");
                String cursoProfesorEdit = request.getParameter("cursoProfesor");

                Profesor profesor = new Profesor();
                profesor.setIdProfesores(Integer.parseInt(idEdit));
                profesor.setNombreProfesor(nombreProfesorEdit);
                profesor.setApellidoProfesor(apellidoProfesorEdit);
                profesor.setDniProfesor(dniProfesorEdit);
                profesor.setTipoProfesor(tipoProfesorEdit);
                profesor.setCursoProfesor(cursoProfesorEdit);

                daoAdministrador.actualizar(profesor);
                response.sendRedirect(request.getContextPath() + "/ServletAdministrador");
                break;
        }
    }
}
