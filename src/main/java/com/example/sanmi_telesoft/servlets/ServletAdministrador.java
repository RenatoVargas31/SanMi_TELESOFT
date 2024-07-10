package com.example.sanmi_telesoft.servlets;

import com.example.sanmi_telesoft.beans.Profesor;
import com.example.sanmi_telesoft.beans.Serenazgo;
import com.example.sanmi_telesoft.beans.TipoSereno;
import com.example.sanmi_telesoft.beans.Usuario;
import com.example.sanmi_telesoft.daos.DaoAdministrador;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import com.example.sanmi_telesoft.util.PasswordUtil;

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
        DaoAdministrador daoAdministrador = new DaoAdministrador();
        //Instancia de la clase DaoAdministrador (métodos)

        switch (action){
            case "mostrarInicio":
                request.setAttribute("activeMenu", "Inicio");
                request.getRequestDispatcher("WEB-INF/Administrador/adm-inicio.jsp").forward(request, response);
                break;
            case "mostrarSolicitudesRegistro":
                request.setAttribute("activeMenuToggle", "Usuarios");
                request.setAttribute("activeMenu", "SolicitudesRegistro");

                ArrayList<Usuario> listaUsuariosSolicitudes = daoAdministrador.listarUsuarios();
                request.setAttribute("listaUsuarios", listaUsuariosSolicitudes);

                System.out.println("Log: " + listaUsuariosSolicitudes.size());

                request.getRequestDispatcher("WEB-INF/Administrador/adm-solicitudesRegistro.jsp").forward(request, response);
                System.out.println("Log: mostrarSolicitudesRegistro");
                break;
            case "mostrarUsuariosHabilitados":
                request.setAttribute("activeMenuToggle", "Usuarios");
                request.setAttribute("activeMenu", "UsuariosHabilitados");
                ArrayList<Usuario> listaUsuariosHabilitados = daoAdministrador.listarUsuarios();
                request.setAttribute("listaUsuarios", listaUsuariosHabilitados);

                request.getRequestDispatcher("WEB-INF/Administrador/adm-usuariosHabilitados.jsp").forward(request, response);
                break;
            case "mostrarUsuariosBaneados":
                request.setAttribute("activeMenuToggle", "Usuarios");
                request.setAttribute("activeMenu", "UsuariosBaneados");
                ArrayList<Usuario> listaUsuariosBaneados = daoAdministrador.listarUsuarios();
                request.setAttribute("listaUsuarios", listaUsuariosBaneados);

                request.getRequestDispatcher("WEB-INF/Administrador/adm-usuariosBaneados.jsp").forward(request, response);
                break;
            case "mostrarDeCampo":
                request.setAttribute("activeMenuToggle", "PersonalSerenazgo");
                request.setAttribute("activeMenu", "DeCampo");
                ArrayList<Serenazgo> listaDeCampo = daoAdministrador.listarDeCampo();
                request.setAttribute("listaDeCampo", listaDeCampo);

                request.getRequestDispatcher("WEB-INF/Administrador/adm-SerenazgoDeCampo.jsp").forward(request, response);
                break;
            case "nuevoDeCampo":
                request.setAttribute("activeMenuToggle", "PersonalSerenazgo");
                request.setAttribute("activeMenu", "DeCampo");
                ArrayList<TipoSereno> listaTipoSereno = daoAdministrador.listarTipoSereno();
                request.setAttribute("listaTipoSereno", listaTipoSereno);
                request.getRequestDispatcher("WEB-INF/Administrador/adm-registrarDeCampo.jsp").forward(request, response);
                break;
            case "actualizarDeCampo":
                request.setAttribute("activeMenuToggle", "PersonalSerenazgo");
                request.setAttribute("activeMenu", "DeCampo");
                //Para Combobox
                ArrayList<TipoSereno> listaTipoSerenoE = daoAdministrador.listarTipoSereno();
                request.setAttribute("listaTipoSereno", listaTipoSerenoE);
                ///////////////
                Serenazgo deCampo = daoAdministrador.buscarDeCampoPorId(request.getParameter("idDeCampo"));
                if(deCampo != null){
                    request.setAttribute("deCampo",deCampo);
                    request.getRequestDispatcher("WEB-INF/Administrador/adm-editarDeCampo.jsp").forward(request,response);
                }else{
                    response.sendRedirect(request.getContextPath() + "/ServletAdministrador?action=mostrarDeCampo");
                }

                break;
            case "eliminarDeCampo":
                String idDeleteDeCampo = request.getParameter("idDeCampo");
                Serenazgo deCampoDelete = daoAdministrador.buscarDeCampoPorId(idDeleteDeCampo);
                if(deCampoDelete != null){
                    System.out.println("Log: deCampo encontrado");
                    try {
                        daoAdministrador.borrarDeCampo(idDeleteDeCampo);
                    } catch (SQLException e) {
                        System.out.println("Log: excepcion: " + e.getMessage());
                    }
                }
                response.sendRedirect(request.getContextPath() + "/ServletAdministrador?action=mostrarDeCampo");
                break;
            case "mostrarDispatcher":
                request.setAttribute("activeMenuToggle", "PersonalSerenazgo");
                request.setAttribute("activeMenu", "Dispatcher");
                ArrayList<Usuario> listaDispatchers = daoAdministrador.listarDispatchers();
                request.setAttribute("listaDispatchers", listaDispatchers);
                request.getRequestDispatcher("WEB-INF/Administrador/adm-SerenazgoDispatcher.jsp").forward(request, response);
                break;
            case "nuevoDispatcher":
                request.setAttribute("activeMenuToggle", "PersonalSerenazgo");
                request.setAttribute("activeMenu", "Dispatcher");
                request.getRequestDispatcher("WEB-INF/Administrador/adm-registrarDispatcher.jsp").forward(request, response);
                break;
            case "actualizarDispatcher":
                request.setAttribute("activeMenuToggle", "PersonalSerenazgo");
                request.setAttribute("activeMenu", "Dispatcher");
                Usuario dispatcher = daoAdministrador.buscarDispatcherPorId(request.getParameter("idDispatcher"));
                if(dispatcher != null){
                    request.setAttribute("dispatcher",dispatcher);
                    request.getRequestDispatcher("WEB-INF/Administrador/adm-editarDispatcher.jsp").forward(request,response);
                }else{
                    response.sendRedirect(request.getContextPath() + "/ServletAdministrador?action=mostrarDispatcher");
                }
                break;
            case "eliminarDispatcher":
                String idDeleteDispatcher = request.getParameter("idDispatcher");
                Usuario dispatcherDelete = daoAdministrador.buscarDispatcherPorId(idDeleteDispatcher);

                if(dispatcherDelete != null){
                    System.out.println("Log: dispatcher encontrado");
                    try {
                        daoAdministrador.borrarDispatcher(idDeleteDispatcher);
                    } catch (SQLException e) {
                        System.out.println("Log: excepcion: " + e.getMessage());
                    }
                }
                response.sendRedirect(request.getContextPath() + "/ServletAdministrador?action=mostrarDispatcher");
                break;
            case "mostrarInstructores":
                request.setAttribute("activeMenu", "Instructores");
                //Listar instructores
                ArrayList<Profesor> listaProfesores = daoAdministrador.listarProfesores();
                //imprmir "isEnable" de cada profesor
                for (Profesor profesor : listaProfesores) {
                    System.out.println("Log: " + profesor.getIsEnable());
                }
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
                String idDeleteProfesor = request.getParameter("idProfesor");
                Profesor profesorDelete = daoAdministrador.buscarProfesorPorId(idDeleteProfesor);

                if(profesorDelete != null){
                    try {
                        daoAdministrador.borrarProfesores(idDeleteProfesor);
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
            case "mostrarPerfil":
                request.getRequestDispatcher("WEB-INF/Administrador/adm-perfil.jsp").forward(request, response);
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
            case "crearDeCampo":
                String nombreDeCampo = request.getParameter("nombreDeCampo");
                String apellidoDeCampo = request.getParameter("apellidoDeCampo");
                String dniDeCampo = request.getParameter("dniDeCampo");
                String telefonoDeCampo = request.getParameter("telefonoDeCampo");
                String tipoDeCampo = request.getParameter("tipoDeCampo");
                String turnoDeCampo = request.getParameter("turnoDeCampo");
                String direccionDeCampo = request.getParameter("direccionDeCampo");
                System.out.println("tipoCampo: "+ tipoDeCampo);
                TipoSereno tipoSereno = daoAdministrador.buscarTipoSerenazgoPorId(tipoDeCampo);
                System.out.println( "idTipoSereno: "+ tipoSereno.getIdTipoSereno());
                daoAdministrador.crearDeCampo(nombreDeCampo, apellidoDeCampo, dniDeCampo, turnoDeCampo, direccionDeCampo, telefonoDeCampo, tipoSereno.getIdTipoSereno());
                    response.sendRedirect(request.getContextPath() + "/ServletAdministrador?action=mostrarDeCampo");
                break;
            case "editarDeCampo":
                String nombreDeCampoEdit = request.getParameter("nombreDeCampo");
                String apellidoDeCampoEdit = request.getParameter("apellidoDeCampo");
                String dniDeCampoEdit = request.getParameter("dniDeCampo");
                String telefonoDeCampoEdit = request.getParameter("telefonoDeCampo");
                String tipoDeCampoEdit = request.getParameter("tipoDeCampo");
                String turnoDeCampoEdit = request.getParameter("turnoDeCampo");
                String direccionDeCampoEdit = request.getParameter("direccionDeCampo");
                String idDeCampoEdit = request.getParameter("idDeCampo");
                boolean isAllValid = true;

                if(dniDeCampoEdit.length() > 8){
                    isAllValid = false;
                }
                if(isAllValid) {
                    Serenazgo deCampo = new Serenazgo();
                    deCampo.setNombreSereno(nombreDeCampoEdit);
                    deCampo.setApellidoSereno(apellidoDeCampoEdit);
                    deCampo.setDniSereno(dniDeCampoEdit);
                    deCampo.setTelefonoSereno(telefonoDeCampoEdit);
                    deCampo.setTipoSereno(daoAdministrador.buscarTipoSerenazgoPorId(tipoDeCampoEdit));
                    deCampo.setTurnoSereno(turnoDeCampoEdit);
                    deCampo.setDireccionSereno(direccionDeCampoEdit);
                    deCampo.setIdSerenazgos(Integer.parseInt(idDeCampoEdit));

                    daoAdministrador.actualizarDeCampo(deCampo);
                    response.sendRedirect(request.getContextPath() + "/ServletAdministrador?action=mostrarDeCampo");
                }else{
                    request.setAttribute("deCampo",daoAdministrador.buscarDeCampoPorId(dniDeCampoEdit));
                    request.getRequestDispatcher("WEB-INF/Administrador/adm-inicio.jsp").forward(request,response);
                }
                break;
            case "crearDispatcher":
                String nombreDispatcher = request.getParameter("nombreDispatcher");
                String apellidodDispatcher = request.getParameter("apellidoDispatcher");
                String dniDispatcher = request.getParameter("dniDispatcher");
                String telefonoDispatcher = request.getParameter("telefonoDispatcher");
                String correoDispatcher = request.getParameter("correoDispatcher");
                String nacimientoDispatcher = request.getParameter("nacimientoDispatcher");
                String direccionDispatcher = request.getParameter("direccionDispatcher");
                String passwordDispatcher = PasswordUtil.generatePassword(45);

                daoAdministrador.crearDispatcher(nombreDispatcher, apellidodDispatcher, dniDispatcher, telefonoDispatcher, correoDispatcher, nacimientoDispatcher, direccionDispatcher, passwordDispatcher);
                response.sendRedirect(request.getContextPath() + "/ServletAdministrador?action=mostrarDispatcher");
                break;
            case "editarDispatcher":
                String nombreDispatcherEdit = request.getParameter("nombreDispatcher");
                String apellidodDispatcherEdit = request.getParameter("apellidoDispatcher");
                String dniDispatcherEdit = request.getParameter("dniDispatcher");
                String telefonoDispatcherEdit = request.getParameter("telefonoDispatcher");
                String correoDispatcherEdit = request.getParameter("correoDispatcher");
                String nacimientoDispatcherEdit = request.getParameter("nacimientoDispatcher");
                String direccionDispatcherEdit = request.getParameter("direccionDispatcher");
                String idDispatcherEdit = request.getParameter("idDispatcher");
                boolean isAllValid2Dispatch = true;

                if(dniDispatcherEdit.length() > 8){
                    isAllValid2Dispatch = false;
                }
                if(isAllValid2Dispatch) {
                    Usuario dispatcher = new Usuario();
                    dispatcher.setNombreUsuario(nombreDispatcherEdit);
                    dispatcher.setApellidoUsuario(apellidodDispatcherEdit);
                    dispatcher.setDniUsuario(dniDispatcherEdit);
                    dispatcher.setTelefonoUsuario(telefonoDispatcherEdit);
                    dispatcher.setCorreoUsuario(correoDispatcherEdit);
                    dispatcher.setNacimientoDate(nacimientoDispatcherEdit);
                    dispatcher.setDireccionUsuario(direccionDispatcherEdit);
                    dispatcher.setIdUsuarios(Integer.parseInt(idDispatcherEdit));

                    daoAdministrador.actualizarDispatcher(dispatcher);
                    response.sendRedirect(request.getContextPath() + "/ServletAdministrador?action=mostrarDispatcher");
                }else{
                    request.setAttribute("dispatcher",daoAdministrador.buscarProfesorPorId(dniDispatcherEdit));
                    request.getRequestDispatcher("WEB-INF/Administrador/adm-inicio.jsp").forward(request,response);
                }
                break;
            case "crearProfesor":
                String tipoProfesor = request.getParameter("tipoProfesor");
                String nombreProfesor = request.getParameter("nombreProfesor");
                String apellidoProfesor = request.getParameter("apellidoProfesor");
                String dniProfesor = request.getParameter("dniProfesor");
                String cursoProfesor = request.getParameter("cursoProfesor");
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

                    daoAdministrador.actualizarProfesor(profesor);
                    response.sendRedirect(request.getContextPath() + "/ServletAdministrador?action=mostrarInstructores");
                }else{
                        request.setAttribute("profesor",daoAdministrador.buscarProfesorPorId(dniProfesorEdit));
                        request.getRequestDispatcher("WEB-INF/Administrador/adm-inicio.jsp").forward(request,response);
                    }
                break;
        }
    }
}
