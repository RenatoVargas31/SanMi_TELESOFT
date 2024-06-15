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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");

        String action = request.getParameter("action") == null ? "mostrarInicio" : request.getParameter("action");

        //Instancia de la clase DaoAdministrador (métodos)
        DaoAdministrador daoAdministrador = new DaoAdministrador();

        switch (action){
            case "mostrarInicio":
                request.setAttribute("activeMenu", "Inicio");
                request.getRequestDispatcher("WEB-INF/Administrador/adm-inicio.jsp").forward(request, response);
                break;
            case "mostrarSolicitudesRegistro":
                request.setAttribute("activeMenuToggle", "Usuarios");
                request.setAttribute("activeMenu", "SolicitudesRegistro");
                request.getRequestDispatcher("WEB-INF/Administrador/adm-solicitudesRegistro.jsp").forward(request, response);
                break;
            case "mostrarUsuariosHabilitados":
                request.setAttribute("activeMenuToggle", "Usuarios");
                request.setAttribute("activeMenu", "UsuariosHabilitados");
                request.getRequestDispatcher("WEB-INF/Administrador/adm-usuariosHabilitados.jsp").forward(request, response);
                break;
            case "mostrarUsuariosBaneados":
                request.setAttribute("activeMenuToggle", "Usuarios");
                request.setAttribute("activeMenu", "UsuariosBaneados");
                request.getRequestDispatcher("WEB-INF/Administrador/adm-usuariosBaneados.jsp").forward(request, response);
                break;
            case "mostrarDeCampo":
                request.setAttribute("activeMenuToggle", "PersonalSerenazgo");
                request.setAttribute("activeMenu", "DeCampo");
                request.getRequestDispatcher("WEB-INF/Administrador/adm-SerenazgoDeCampo.jsp").forward(request, response);
                break;
            case "mostrarDispatcher":
                request.setAttribute("activeMenuToggle", "PersonalSerenazgo");
                request.setAttribute("activeMenu", "Dispatcher");
                request.getRequestDispatcher("WEB-INF/Administrador/adm-SerenazgoDispatcher.jsp").forward(request, response);
                break;
            case "mostrarInstructores":
                request.setAttribute("activeMenu", "Instructores");
                //Listar instructores
                ArrayList<Profesor> listaProfesores = daoAdministrador.listarProfesores();
                request.setAttribute("listaProfesores", listaProfesores);
                //Redireccionar a la vista
                request.getRequestDispatcher("WEB-INF/Administrador/adm-instructores.jsp").forward(request, response);
                break;
            case "nuevoProfesor":
                request.setAttribute("activeMenu", "Instructores");
                request.getRequestDispatcher("WEB-INF/Administrador/adm-registrarInstructor.jsp").forward(request, response);
                break;
            case "actualizarProfesor":
                request.setAttribute("activeMenu", "Instructores");
                String id = request.getParameter("idProfesor");
                Profesor profesor = daoAdministrador.buscarProfesorPorId(id);

                if(profesor != null){
                    request.setAttribute("profesor",profesor);
                    String checkedForm = profesor.getTipoProfesor();
                    if(checkedForm.equals("Deporte")){
                        request.setAttribute("checkedForm", "Deporte");
                    }else{
                        request.setAttribute("checkedForm", "Cultura");
                    }

                    request.getRequestDispatcher("WEB-INF/Administrador/adm-editarInstructor.jsp").forward(request,response);
                }else{
                    response.sendRedirect(request.getContextPath() + "/ServletAdministrador?action=mostrarInstructores");
                }

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
                response.sendRedirect(request.getContextPath() + "/ServletAdministrador?action=mostrarInstructores");
                break;
            case "mostrarAyuda":
                request.setAttribute("activeMenu", "Ayuda");
                request.getRequestDispatcher("WEB-INF/Administrador/adm-ayuda.jsp").forward(request, response);
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
                response.sendRedirect(request.getContextPath() + "/ServletAdministrador?action=mostrarInstructores");
                break;
            case "editarProfesor":
                String tipoProfesorEdit = request.getParameter("tipoProfesor");
                String nombreProfesorEdit = request.getParameter("nombreProfesor");
                String apellidoProfesorEdit = request.getParameter("apellidoProfesor");
                String dniProfesorEdit = request.getParameter("dniProfesor");
                String cursoProfesorEdit = request.getParameter("cursoProfesor");
                String idProfesorEdit = request.getParameter("idProfesor");

                boolean isAllValid2 = true;

                if(dniProfesorEdit.length() > 8){
                    isAllValid2 = false;
                }
                if(isAllValid2) {
                    Profesor profesor = new Profesor();
                    profesor.setNombreProfesor(nombreProfesorEdit);
                    profesor.setApellidoProfesor(apellidoProfesorEdit);
                    profesor.setDniProfesor(dniProfesorEdit);
                    profesor.setTipoProfesor(tipoProfesorEdit);
                    profesor.setCursoProfesor(cursoProfesorEdit);
                    profesor.setIdProfesores(Integer.parseInt(idProfesorEdit));

                    daoAdministrador.actualizar(profesor);
                    response.sendRedirect(request.getContextPath() + "/ServletAdministrador?action=mostrarInstructores");
                }else{
                        request.setAttribute("job",daoAdministrador.buscarProfesorPorId(dniProfesorEdit));
                        request.getRequestDispatcher("WEB-INF/Administrador/adm-inicio.jsp").forward(request,response);
                    }
                break;
        }
    }
}
