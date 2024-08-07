package com.example.sanmi_telesoft.servlets;

import com.example.sanmi_telesoft.beans.Profesor;
import com.example.sanmi_telesoft.beans.Serenazgo;
import com.example.sanmi_telesoft.beans.TipoSereno;
import com.example.sanmi_telesoft.beans.Usuario;
import com.example.sanmi_telesoft.daos.DaoAdministrador;
import com.example.sanmi_telesoft.daos.EmailService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import com.example.sanmi_telesoft.util.PasswordUtil;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.SQLOutput;
import java.util.ArrayList;

@WebServlet(name = "ServletAdministrador", value = "/ServletAdministrador")
public class ServletAdministrador extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");

        String action = request.getParameter("action") == null ? "mostrarInicio" : request.getParameter("action");
        DaoAdministrador daoAdministrador = new DaoAdministrador();
        EmailService emailService = new EmailService();
        //Instancia de la clase DaoAdministrador (métodos)

        switch (action){
            case "mostrarInicio":
                request.setAttribute("activeMenu", "Inicio");
                request.getRequestDispatcher("WEB-INF/Administrador/adm-inicio.jsp").forward(request, response);
                break;
            case "mostrarSolicitudesRegistro":
                request.setAttribute("activeMenuToggle", "Usuarios");
                request.setAttribute("activeMenu", "SolicitudesRegistro");

                ArrayList<Usuario> listaUsuariosSolicitudes = daoAdministrador.listarSolicitudesRegistro();
                //Imprimir los roles de los usuarios
                for (Usuario usuario : listaUsuariosSolicitudes) {
                    System.out.println("Log: " + usuario.getRol());
                }
                request.setAttribute("listaUsuarios", listaUsuariosSolicitudes);

                request.getRequestDispatcher("WEB-INF/Administrador/adm-solicitudesRegistro.jsp").forward(request, response);
                break;
            case "aceptarVecino":
                String idUsuarioVecino = request.getParameter("idDeUsuario");
                Usuario usuarioVecino = daoAdministrador.buscarUsuarioPorId(idUsuarioVecino);
                if(usuarioVecino != null){
                    System.out.println("Log: usuario encontrado");
                    try {
                        daoAdministrador.aceptarVecino(idUsuarioVecino);
                        emailService.aceptarVecino(usuarioVecino.getCorreoUsuario(), usuarioVecino.getNombreUsuario());
                    } catch (SQLException e) {
                        System.out.println("Log: excepcion: " + e.getMessage());
                    }
                }
                response.sendRedirect(request.getContextPath() + "/ServletAdministrador?action=mostrarSolicitudesRegistro");
                break;
            case "eliminarSolicitudRegistro":
                String idDeleteUsuario = request.getParameter("idDeUsuario");
                Usuario usuarioDelete = daoAdministrador.buscarUsuarioPorId(idDeleteUsuario);
                if(usuarioDelete != null){
                    System.out.println("Log: usuario encontrado");
                    try {
                        daoAdministrador.borrarUsuario(idDeleteUsuario);
                        emailService.aceptarVecino(usuarioDelete.getCorreoUsuario(), usuarioDelete.getNombreUsuario());
                    } catch (SQLException e) {
                        System.out.println("Log: excepcion: " + e.getMessage());
                    }
                }
                response.sendRedirect(request.getContextPath() + "/ServletAdministrador?action=mostrarSolicitudesRegistro");
                break;
            case "mostrarPostulaciones":
                request.setAttribute("activeMenuToggle", "Coordinadora");
                request.setAttribute("activeMenu", "mostrarPostulaciones");

                ArrayList<Usuario> listaUsuariosPostulaciones = daoAdministrador.listarUsuarios();
                //Imprimir los roles de los usuarios
                for (Usuario usuario : listaUsuariosPostulaciones) {
                    System.out.println("Log: " + usuario.getRol());
                    System.out.println("Log: " + usuario.getTipoCoordinadora());
                    System.out.println("Log: " + usuario.getPostulacion());
                }
                request.setAttribute("listaUsuarios", listaUsuariosPostulaciones);

                request.getRequestDispatcher("WEB-INF/Administrador/adm-postulaciones.jsp").forward(request, response);
                break;
            case "aceptarCoordinador":
                System.out.println("Log: aceptarCoordinador");
                String idUsuarioCoordinador = request.getParameter("idDeUsuario");
                String idTipo = request.getParameter("idTipo");
                System.out.println("Log: idUsuarioCoordinador: " + idUsuarioCoordinador);
                System.out.println("Log: idTipo: " + idTipo);
                Usuario usuarioCoordinador = daoAdministrador.buscarUsuarioPorId(idUsuarioCoordinador);
                System.out.println("Log: passUsuario: "+ usuarioCoordinador.getPasswordUsuario());
                if(usuarioCoordinador != null){
                    System.out.println("Log: usuario encontrado");
                    try {
                        daoAdministrador.borrarPostulacion(idUsuarioCoordinador);
                        daoAdministrador.aceptarCoordinadora(usuarioCoordinador,idTipo);
                    } catch (SQLException e) {
                        System.out.println("Log: excepcion: " + e.getMessage());
                    }
                }
                response.sendRedirect(request.getContextPath() + "/ServletAdministrador?action=mostrarPostulaciones");
                break;
            case "eliminarPostulacion":
                String idDeleteUsuarioPostulacion = request.getParameter("idDeUsuario");
                Usuario usuarioDeletePostulacion = daoAdministrador.buscarUsuarioPorId(idDeleteUsuarioPostulacion);
                if(usuarioDeletePostulacion != null){
                    System.out.println("Log: usuario encontrado");
                    try {
                        daoAdministrador.borrarPostulacion(idDeleteUsuarioPostulacion);
                    } catch (SQLException e) {
                        System.out.println("Log: excepcion: " + e.getMessage());
                    }
                }
                response.sendRedirect(request.getContextPath() + "/ServletAdministrador?action=mostrarPostulaciones");
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

                boolean validaNullCrearProfe= tipoProfesor != null && nombreProfesor != null && apellidoProfesor != null && dniProfesor != null && cursoProfesor != null;

                if(validaNullCrearProfe) {
                    boolean validaTipoProfesor = tipoProfesor.equals("Deporte") || tipoProfesor.equals("Cultura");
                    boolean validaNombreProfesor = nombreProfesor.length() < 101;
                    boolean validaApellidoProfesor = apellidoProfesor.length() < 101;
                    boolean validaCursoProfesor = cursoProfesor.length() < 101;
                    boolean validaDniProfesor = dniProfesor.length() == 8;
                    boolean validoCrearProfesor;

                    validoCrearProfesor = validaTipoProfesor && validaNombreProfesor && validaApellidoProfesor && validaCursoProfesor && validaDniProfesor && validaNullCrearProfe;

                    if (validoCrearProfesor) {
                        daoAdministrador.crearProfesores(nombreProfesor, apellidoProfesor, dniProfesor, tipoProfesor, cursoProfesor);
                        response.sendRedirect(request.getContextPath() + "/ServletAdministrador?action=mostrarInstructores");
                    } else {
                        if (!validaTipoProfesor) {
                            String mensaje = "* El tipo de profesor no es válido";
                            request.setAttribute("validaTipo", mensaje);
                        }
                        if (!validaNombreProfesor) {
                            String mensaje = "* El nombre no puede tener más de 100 caracteres";
                            request.setAttribute("validaNombre", mensaje);
                        }
                        if (!validaApellidoProfesor) {
                            String mensaje = "* El apellido no puede tener más de 100 caracteres";
                            request.setAttribute("validaApellido", mensaje);
                        }
                        if (!validaCursoProfesor) {
                            String mensaje = "* El curso no puede tener más de 100 caracteres";
                            request.setAttribute("validaCurso", mensaje);
                        }
                        if (!validaDniProfesor) {
                            String mensaje = "* El DNI debe tener 8 dígitos";
                            request.setAttribute("validaDNI", mensaje);
                        }
                        request.getRequestDispatcher("WEB-INF/Administrador/adm-registrarInstructor.jsp").forward(request, response);
                    }

                }else{
                    String mensaje = "* Todos los campos son obligatorios";
                    request.setAttribute("validaNull", mensaje);
                    request.getRequestDispatcher("WEB-INF/Administrador/adm-registrarInstructor.jsp").forward(request, response);
                }
                break;
            case "editarProfesor":
                String tipoProfesorEdit = request.getParameter("tipoProfesor");
                String nombreProfesorEdit = request.getParameter("nombreProfesor");
                String apellidoProfesorEdit = request.getParameter("apellidoProfesor");
                String dniProfesorEdit = request.getParameter("dniProfesor");
                String cursoProfesorEdit = request.getParameter("cursoProfesor");
                String idProfesorEdit = request.getParameter("idProfesor");
                ///////////////////////////////////////////////////////////////
                boolean validaEmptyEditarProfe= !tipoProfesorEdit.isEmpty() && !nombreProfesorEdit.isEmpty() && !apellidoProfesorEdit.isEmpty() && !dniProfesorEdit.isEmpty() && !cursoProfesorEdit.isEmpty();

                if(validaEmptyEditarProfe) {
                    boolean validaTipoProfesor = tipoProfesorEdit.equals("Deporte") || tipoProfesorEdit.equals("Cultura");
                    boolean validaNombreProfesor = nombreProfesorEdit.length() < 101;
                    boolean validaApellidoProfesor = apellidoProfesorEdit.length() < 101;
                    boolean validaCursoProfesor = cursoProfesorEdit.length() < 101;
                    boolean validaDniProfesor = dniProfesorEdit.length() == 8;
                    boolean validoEditarProfesor;

                    validoEditarProfesor = validaTipoProfesor && validaNombreProfesor && validaApellidoProfesor && validaCursoProfesor && validaDniProfesor && validaEmptyEditarProfe;

                    if (validoEditarProfesor) {
                        Profesor profesor = new Profesor();
                        profesor.setNombreProfesor(nombreProfesorEdit);
                        profesor.setApellidoProfesor(apellidoProfesorEdit);
                        profesor.setDniProfesor(dniProfesorEdit);
                        profesor.setTipoProfesor(tipoProfesorEdit);
                        profesor.setCursoProfesor(cursoProfesorEdit);
                        profesor.setIdProfesores(Integer.parseInt(idProfesorEdit));

                        daoAdministrador.actualizarProfesor(profesor);
                        response.sendRedirect(request.getContextPath() + "/ServletAdministrador?action=mostrarInstructores");
                    } else {
                        if (!validaTipoProfesor) {
                            request.getSession().setAttribute("validaTipo", "* El tipo de profesor no es válido");
                        }
                        if (!validaNombreProfesor) {
                            request.getSession().setAttribute("validaNombre", "* El nombre no puede tener más de 100 caracteres");
                        }
                        if (!validaApellidoProfesor) {
                            request.getSession().setAttribute("validaApellido", "* El apellido no puede tener más de 100 caracteres");
                        }
                        if (!validaCursoProfesor) {
                            request.getSession().setAttribute("validaCurso", "* El curso no puede tener más de 100 caracteres");
                        }
                        if (!validaDniProfesor) {
                            request.getSession().setAttribute("validaDNI", "* El DNI debe tener 8 dígitos");
                        }
                        response.sendRedirect(request.getContextPath() + "/ServletAdministrador?action=actualizarProfesor&idProfesor="+idProfesorEdit);
                    }
                    System.out.println("log: funciona la condicional");
                }else{

                    request.getSession().setAttribute("validaEmpty", "* Todos los campos son obligatorios");
                    response.sendRedirect(request.getContextPath() + "/ServletAdministrador?action=actualizarProfesor&idProfesor="+idProfesorEdit);

                }

                break;
        }
    }
}
