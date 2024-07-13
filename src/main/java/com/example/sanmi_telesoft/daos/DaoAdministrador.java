package com.example.sanmi_telesoft.daos;

import com.example.sanmi_telesoft.beans.Profesor;
import com.example.sanmi_telesoft.beans.Serenazgo;
import com.example.sanmi_telesoft.beans.TipoSereno;
import com.example.sanmi_telesoft.beans.Usuario;

import java.sql.*;
import java.util.ArrayList;

public class DaoAdministrador extends BaseDao {
    //////////Usuarios//////////
    public Usuario buscarUsuarioPorId(String id){
            Usuario usuario = new Usuario();

            String sql = "select * from usuarios where idUsuarios = ?";

            try(Connection conn = getConection();
                PreparedStatement pstmt = conn.prepareStatement(sql)){

                pstmt.setString(1,id);

                try(ResultSet rs = pstmt.executeQuery()){
                    while (rs.next()){
                        usuario.setIdUsuarios(rs.getInt("idUsuarios"));
                        usuario.setIdRoles(rs.getInt("Roles_idRoles"));
                        usuario.setCorreoUsuario(rs.getString("correoUsuario"));
                        usuario.setNombreUsuario(rs.getString("nombreUsuario"));
                        usuario.setApellidoUsuario(rs.getString("apellidoUsuario"));
                        usuario.setTelefonoUsuario(rs.getString("telefonoUsuario"));
                        usuario.setDniUsuario(rs.getString("dniUsuario"));
                        usuario.setDireccionUsuario(rs.getString("direccionUsuario"));
                        usuario.setIdUrbanizacion(rs.getInt("Urbanizacion_idUrbanizacion"));
                        usuario.setPasswordUsuario(rs.getString("passwordUsuario"));
                    }
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            return usuario;
    }
    public ArrayList<Usuario> listarUsuarios(){
        ArrayList<Usuario> listaUsuarios = new ArrayList<>();

        String sql = "select * from usuarios u join urbanizacion b on u.Urbanizacion_idUrbanizacion = b.idUrbanizacion";

        try(Connection conn = getConection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql)){

            while (rs.next()){
                Usuario usuario = new Usuario();
                usuario.setIdUsuarios(rs.getInt("idUsuarios"));
                usuario.setIdRoles(rs.getInt("Roles_idRoles"));
                usuario.setCorreoUsuario(rs.getString("correoUsuario"));
                usuario.setNombreUsuario(rs.getString("nombreUsuario"));
                usuario.setApellidoUsuario(rs.getString("apellidoUsuario"));
                usuario.setTelefonoUsuario(rs.getString("telefonoUsuario"));
                usuario.setDniUsuario(rs.getString("dniUsuario"));
                usuario.setDireccionUsuario(rs.getString("direccionUsuario"));
                usuario.setIdUrbanizacion(rs.getInt("Urbanizacion_idUrbanizacion"));
                usuario.setIsActive(rs.getString("is_active"));
                usuario.setIsBannedApp(rs.getString("is_bannedApp"));
                usuario.setMotivoBannedApp(rs.getString("motivo_bannedApp"));
                usuario.setUrbanizacion(rs.getString("nameUrbanizacion"));
                usuario.setPostulacion(rs.getString("postulacion"));
                usuario.setIdTipoCoordinadora(rs.getInt("TipoCoordinadora_idTipoCoordinadora"));
                usuario.setPasswordUsuario(rs.getString("passwordUsuario"));
                listaUsuarios.add(usuario);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaUsuarios;
    }
    public void borrarUsuario(String idUsuario) throws SQLException {
        String sql = "delete from usuarios where idUsuarios = ?";
        try(Connection connection = getConection();
            PreparedStatement pstmt = connection.prepareStatement(sql)){

            pstmt.setString(1,idUsuario);

            pstmt.executeUpdate();

        }
    }
    public void aceptarCoordinadora(Usuario vecino, String idTipo) throws SQLException {
        String sql = "insert into usuarios (Roles_idRoles, correoUsuario, passwordUsuario, nombreUsuario, apellidoUsuario, dniUsuario, direccionUsuario, telefonoUsuario, Urbanizacion_idUrbanizacion, is_active, nacimientoDate, TipoCoordinadora_idTipoCoordinadora, postulacion) values ('3',?,?,?,?,?,?,?,?,'1',?,?,'0')";
        try(Connection connection = getConection();
            PreparedStatement pstmt = connection.prepareStatement(sql)){

            pstmt.setString(1,vecino.getCorreoUsuario());
            pstmt.setString(2,vecino.getPasswordUsuario());
            pstmt.setString(3,vecino.getNombreUsuario());
            pstmt.setString(4,vecino.getApellidoUsuario());
            pstmt.setString(5,vecino.getDniUsuario());
            pstmt.setString(6,vecino.getDireccionUsuario());
            pstmt.setString(7,vecino.getTelefonoUsuario());
            pstmt.setInt(8,vecino.getIdUrbanizacion());
            pstmt.setString(9,vecino.getNacimientoDate());
            pstmt.setString(10,idTipo);

            pstmt.executeUpdate();
        }
    }
    public void aceptarVecino(String idUsuario) throws SQLException {
        String sql = "update usuarios set is_active='1' where idUsuarios = ?";
        try(Connection connection = getConection();
            PreparedStatement pstmt = connection.prepareStatement(sql)){

            pstmt.setString(1,idUsuario);

            pstmt.executeUpdate();

        }
    }
    public void borrarPostulacion(String idUsuario) throws SQLException {
        String sql = "update usuarios set postulacion='0' where idUsuarios = ?";
        try(Connection connection = getConection();
            PreparedStatement pstmt = connection.prepareStatement(sql)){

            pstmt.setString(1,idUsuario);

            pstmt.executeUpdate();

        }
    }
    /////////SerenazgosDeCampo///////////
    public Serenazgo buscarDeCampoPorId(String id){
        Serenazgo deCampo = new Serenazgo();
        TipoSereno tipoSereno = new TipoSereno();

        String sql = "select * from serenazgos s join tiposereno t on s.TipoSereno_idTipoSereno = t.idTipoSereno where idSerenazgos = ?";

        try(Connection conn = getConection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1,id);

            try(ResultSet rs = pstmt.executeQuery()){
                while (rs.next()){
                    deCampo.setIdSerenazgos(rs.getInt("idSerenazgos"));
                    deCampo.setNombreSereno(rs.getString("nombreSereno"));
                    deCampo.setApellidoSereno(rs.getString("apellidoSereno"));
                    deCampo.setDniSereno(rs.getString("dniSereno"));
                    deCampo.setTurnoSereno(rs.getString("turnoSereno"));
                    deCampo.setDireccionSereno(rs.getString("direccionSereno"));
                    deCampo.setTelefonoSereno(rs.getString("telefonoSereno"));
                    deCampo.setIsEnable(rs.getString("isEnable"));
                    tipoSereno.setIdTipoSereno(rs.getInt("idTipoSereno"));
                    tipoSereno.setNameTipo(rs.getString("nameTipo"));
                    deCampo.setTipoSereno(tipoSereno);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return deCampo;
    }
    public TipoSereno buscarTipoSerenazgoPorId(String id){
        TipoSereno tipoSereno = new TipoSereno();

        String sql = "select * from tiposereno where idTipoSereno = ?";

        try(Connection conn = getConection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1,id);

            try(ResultSet rs = pstmt.executeQuery()){
                while (rs.next()){
                    tipoSereno.setIdTipoSereno(rs.getInt("idTipoSereno"));
                    tipoSereno.setNameTipo(rs.getString("nameTipo"));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return tipoSereno;
    }
    public void crearDeCampo(String nombreDeCampo, String apellidoDeCampo, String dniDeCampo, String turnoDeCampo, String direccionDeCampo, String telefonoDeCampo, int idTipoSereno){
        String sql = "insert into serenazgos (nombreSereno, apellidoSereno, dniSereno, turnoSereno, direccionSereno, telefonoSereno, TipoSereno_idTipoSereno) values (?,?,?,?,?,?,?)";

        try(Connection connection = getConection();
            PreparedStatement pstmt = connection.prepareStatement(sql)){

            pstmt.setString(1,nombreDeCampo);
            pstmt.setString(2,apellidoDeCampo);
            pstmt.setString(3,dniDeCampo);
            pstmt.setString(4,turnoDeCampo);
            pstmt.setString(5,direccionDeCampo);
            pstmt.setString(6,telefonoDeCampo);
            pstmt.setInt(7,idTipoSereno);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public ArrayList<Serenazgo> listarDeCampo(){
        ArrayList<Serenazgo> listaDeCampo = new ArrayList<>();

        String sql = "select * from serenazgos s join tiposereno t on s.TipoSereno_idTipoSereno = t.idTipoSereno";

        try(Connection conn = getConection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql)){

            while (rs.next()){
                Serenazgo deCampo = new Serenazgo();
                TipoSereno tipoSereno = new TipoSereno();

                deCampo.setIdSerenazgos(rs.getInt("idSerenazgos"));
                deCampo.setNombreSereno(rs.getString("nombreSereno"));
                deCampo.setApellidoSereno(rs.getString("apellidoSereno"));
                deCampo.setDniSereno(rs.getString("dniSereno"));
                deCampo.setTurnoSereno(rs.getString("turnoSereno"));
                deCampo.setDireccionSereno(rs.getString("direccionSereno"));
                deCampo.setTelefonoSereno(rs.getString("telefonoSereno"));
                deCampo.setIsEnable(rs.getString("isEnable"));
                tipoSereno.setNameTipo(rs.getString("nameTipo"));
                deCampo.setTipoSereno(tipoSereno);

                listaDeCampo.add(deCampo);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaDeCampo;
    }
    public ArrayList<TipoSereno> listarTipoSereno(){
        ArrayList<TipoSereno> listaTipoSereno = new ArrayList<>();

        String sql = "select * from tiposereno";

        try(Connection conn = getConection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql)){

            while (rs.next()){
                TipoSereno tipoSereno = new TipoSereno();
                tipoSereno.setIdTipoSereno(rs.getInt("idTipoSereno"));
                tipoSereno.setNameTipo(rs.getString("nameTipo"));
                listaTipoSereno.add(tipoSereno);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaTipoSereno;
    }
    public void actualizarDeCampo(Serenazgo serenazgo){
        String sql = "update serenazgos set nombreSereno=?, apellidoSereno=?, dniSereno=?, turnoSereno=?, direccionSereno=?, telefonoSereno=?, TipoSereno_idTipoSereno=? where idSerenazgos = ?";

        try(Connection connection = getConection();
            PreparedStatement pstmt = connection.prepareStatement(sql)){

            pstmt.setString(1,serenazgo.getNombreSereno());
            pstmt.setString(2,serenazgo.getApellidoSereno());
            pstmt.setString(3,serenazgo.getDniSereno());
            pstmt.setString(4,serenazgo.getTurnoSereno());
            pstmt.setString(5,serenazgo.getDireccionSereno());
            pstmt.setString(6,serenazgo.getTelefonoSereno());
            pstmt.setInt(7,serenazgo.getTipoSereno().getIdTipoSereno());
            pstmt.setInt(8,serenazgo.getIdSerenazgos());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void borrarDeCampo(String idDeCampo) throws SQLException {
        String sql = "update serenazgos set isEnable='0' where idSerenazgos = ?";
        try(Connection connection = getConection();
            PreparedStatement pstmt = connection.prepareStatement(sql)){

            pstmt.setString(1,idDeCampo);

            pstmt.executeUpdate();

        }
    }
    ////////SerenazgosDispatcher////////
    public Usuario buscarDispatcherPorId(String id){
        Usuario dispatcher = new Usuario();

        String sql = "select idUsuarios, nombreUsuario, apellidoUsuario, dniUsuario, telefonoUsuario, direccionUsuario, correoUsuario, nacimientoDate from usuarios where idUsuarios = ?";

        try(Connection conn = getConection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1,id);

            try(ResultSet rs = pstmt.executeQuery()){
                while (rs.next()){
                    dispatcher.setIdUsuarios(rs.getInt(1));
                    dispatcher.setNombreUsuario(rs.getString(2));
                    dispatcher.setApellidoUsuario(rs.getString(3));
                    dispatcher.setDniUsuario(rs.getString(4));
                    dispatcher.setTelefonoUsuario(rs.getString(5));
                    dispatcher.setDireccionUsuario(rs.getString(6));
                    dispatcher.setCorreoUsuario(rs.getString(7));
                    dispatcher.setNacimientoDate(rs.getString(8));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return dispatcher;
    };
    public void crearDispatcher(String nombreDispatcher, String apellidodDispatcher, String dniDispatcher, String telefonoDispatcher, String correoDispatcher, String nacimientoDispatcher, String direccionDispatcher, String passwordDispatcher){
        String sql = "insert into usuarios (nombreUsuario, apellidoUsuario, dniUsuario, telefonoUsuario, correoUsuario, nacimientoDate,direccionUsuario, passwordUsuario, Roles_idRoles) values (?,?,?,?,?,?,?,?,'2'); ";
        try(Connection connection = getConection();
            PreparedStatement pstmt = connection.prepareStatement(sql)){

            pstmt.setString(1,nombreDispatcher);
            pstmt.setString(2,apellidodDispatcher);
            pstmt.setString(3,dniDispatcher);
            pstmt.setString(4,telefonoDispatcher);
            pstmt.setString(5,correoDispatcher);
            pstmt.setString(6,nacimientoDispatcher);
            pstmt.setString(7,direccionDispatcher);
            pstmt.setString(8,passwordDispatcher);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public ArrayList<Usuario> listarDispatchers(){
        ArrayList<Usuario> listaDispatchers = new ArrayList<>();

        String sql = "select idUsuarios, nombreUsuario, apellidoUsuario, dniUsuario, telefonoUsuario, direccionUsuario, correoUsuario, is_active from usuarios where Roles_idRoles = '2'";

        try(Connection conn = getConection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql)){

            while (rs.next()){
                Usuario dispatcher = new Usuario();
                dispatcher.setIdUsuarios(rs.getInt(1));
                dispatcher.setNombreUsuario(rs.getString(2));
                dispatcher.setApellidoUsuario(rs.getString(3));
                dispatcher.setDniUsuario(rs.getString(4));
                dispatcher.setTelefonoUsuario(rs.getString(5));
                dispatcher.setDireccionUsuario(rs.getString(6));
                dispatcher.setCorreoUsuario(rs.getString(7));
                dispatcher.setIsActive(rs.getString(8));
                listaDispatchers.add(dispatcher);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaDispatchers;
    }
    public void actualizarDispatcher(Usuario dispatcher){
        String sql = "update usuarios set nombreUsuario=?, apellidoUsuario=?, dniUsuario=?, telefonoUsuario=?, direccionUsuario=?, correoUsuario=?, nacimientoDate=? where idUsuarios = ?";

        try(Connection connection = getConection();
            PreparedStatement pstmt = connection.prepareStatement(sql)){

            pstmt.setString(1,dispatcher.getNombreUsuario());
            pstmt.setString(2,dispatcher.getApellidoUsuario());
            pstmt.setString(3,dispatcher.getDniUsuario());
            pstmt.setString(4,dispatcher.getTelefonoUsuario());
            pstmt.setString(5,dispatcher.getDireccionUsuario());
            pstmt.setString(6,dispatcher.getCorreoUsuario());
            pstmt.setString(7,dispatcher.getNacimientoDate());
            pstmt.setInt(8,dispatcher.getIdUsuarios());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void borrarDispatcher(String idDispatcher) throws SQLException {

        String sql = "update usuarios set is_active='0' where idUsuarios = ?";

        try(Connection connection = getConection();
            PreparedStatement pstmt = connection.prepareStatement(sql)){

            pstmt.setString(1,idDispatcher);

            pstmt.executeUpdate();

        }
    }
    ////////Instructores////////
    public Profesor buscarProfesorPorId(String id) {

        Profesor profesor = new Profesor();

        String sql = "select * from profesores where idProfesores = ?";


        try (Connection conn = getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1,id);

            try(ResultSet rs = pstmt.executeQuery()){
                while (rs.next()) {
                    profesor = new Profesor();
                    profesor.setIdProfesores(rs.getInt(1));
                    profesor.setNombreProfesor(rs.getString(2));
                    profesor.setApellidoProfesor(rs.getString(3));
                    profesor.setDniProfesor(rs.getString(4));
                    profesor.setTipoProfesor(rs.getString(5));
                    profesor.setCursoProfesor(rs.getString(6));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return profesor;
    }
    public void crearProfesores(String nombreProfesor, String apellidoProfesor, String dniProfesor, String tipoProfesor, String cursoProfesor){

        String sql = "insert into profesores (nombreProfesor, apellidoProfesor, dniProfesor, tipoProfesor, cursoProfesor) values (?,?,?,?,?)";

        try(Connection connection = getConection();
            PreparedStatement pstmt = connection.prepareStatement(sql)){

            pstmt.setString(1,nombreProfesor);
            pstmt.setString(2,apellidoProfesor);
            pstmt.setString(3,dniProfesor);
            pstmt.setString(4,tipoProfesor);
            pstmt.setString(5,cursoProfesor);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public ArrayList<Profesor> listarProfesores(){
        ArrayList<Profesor> listaProfesores = new ArrayList<>();

        String sql = "select * from profesores";

        //Ejecución de la consulta
        try (Connection conn = getConection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            //Recorrido de los resultados
            while (rs.next()) {
                Profesor profesor = new Profesor();
                profesor.setIdProfesores(rs.getInt("idProfesores"));
                profesor.setNombreProfesor(rs.getString("nombreProfesor"));
                profesor.setApellidoProfesor(rs.getString("apellidoProfesor"));
                profesor.setDniProfesor(rs.getString("dniProfesor"));
                profesor.setTipoProfesor(rs.getString("tipoProfesor"));
                profesor.setCursoProfesor(rs.getString("cursoProfesor"));
                profesor.setIsEnable(rs.getBoolean("isEnable"));
                listaProfesores.add(profesor);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        return listaProfesores;
    }
    public void actualizarProfesor(Profesor profesor){

        String sql = "update profesores set nombreProfesor=?, apellidoProfesor=?, dniProfesor=?, tipoProfesor = ?, cursoProfesor = ? where idProfesores = ?";

        try(Connection connection = getConection();
            PreparedStatement pstmt = connection.prepareStatement(sql)){

            pstmt.setString(1,profesor.getNombreProfesor());
            pstmt.setString(2,profesor.getApellidoProfesor());
            pstmt.setString(3,profesor.getDniProfesor());
            pstmt.setString(4,profesor.getTipoProfesor());
            pstmt.setString(5,profesor.getCursoProfesor());
            pstmt.setInt(6,profesor.getIdProfesores());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void borrarProfesores(String idprofesor) throws SQLException {

        String sql = "update profesores set isEnable='0' where idProfesores = ?";

        try(Connection connection = getConection();
            PreparedStatement pstmt = connection.prepareStatement(sql)){

            pstmt.setString(1,idprofesor);

            pstmt.executeUpdate();

        }
    }

}
