package com.example.sanmi_telesoft.daos;

import com.example.sanmi_telesoft.beans.Usuario;

import java.security.MessageDigest;
import java.sql.*;

public class UsuarioDAO {
    private String jdbcURL = "jdbc:mysql://34.139.185.159:3306/proyecto-iweb?serverTimezone=America/Lima&useSSL=false&allowPublicKeyRetrieval=true";
    private String jdbcUsername = "root";
    private String jdbcPassword = "root";
    private String jdbcDriver = "com.mysql.cj.jdbc.Driver";

    public UsuarioDAO() {}

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName(jdbcDriver);
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }

    public Usuario validarUsuario(String correoUsuario, String passwordUsuario) {
        Usuario usuario = null;
        String sql = "SELECT * FROM usuarios WHERE correoUsuario = ? AND passwordUsuario = sha2(?,256) ";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, correoUsuario);
            /*preparedStatement.setString(2, hashPassword(passwordUsuario));*/
            preparedStatement.setString(2, passwordUsuario);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                usuario = new Usuario();
                usuario.setIdUsuarios(rs.getInt("idUsuarios"));
                usuario.setIdRoles(rs.getInt("Roles_idRoles"));
                usuario.setCorreoUsuario(rs.getString("correoUsuario"));
                usuario.setPasswordUsuario(rs.getString("passwordUsuario"));
                usuario.setNombreUsuario(rs.getString("nombreUsuario"));
                usuario.setApellidoUsuario(rs.getString("apellidoUsuario"));
                usuario.setDniUsuario(rs.getString("dniUsuario"));
                usuario.setDireccionUsuario(rs.getString("direccionUsuario"));
                usuario.setTelefonoUsuario(rs.getString("telefonoUsuario"));
                usuario.setIdUrbanizacion(rs.getInt("Urbanizacion_idUrbanizacion"));
                usuario.setActivationToken(rs.getString("activation_token"));
                usuario.setIsActive(rs.getString("is_active"));
                usuario.setNacimientoDate(rs.getString("nacimientoDate"));
                usuario.setIdTipoCoordinadora(rs.getInt("TipoCoordinadora_idTipoCoordinadora"));
                //usuario.setIdEstadoVecinoEvento(rs.getInt("idEstadoVecinoEvento"));
                usuario.setIsBannedApp(rs.getString("is_bannedApp"));
                usuario.setMotivoBannedApp(rs.getString("motivo_bannedApp"));
                usuario.setGenero(rs.getInt("genero"));
                usuario.setFotoPerfil(rs.getBytes("fotoPerfil"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return usuario;
    }

    private String hashPassword(String password) {
        String hashedPassword = null;
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] encodedHash = digest.digest(password.getBytes("UTF-8"));
            StringBuilder hexString = new StringBuilder();
            for (byte b : encodedHash) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) hexString.append('0');
                hexString.append(hex);
            }
            hashedPassword = hexString.toString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return hashedPassword;
    }

    public Usuario obtenerDatosporId(int usuarioId) {
        Usuario usuario = null;
        String sql = "SELECT * FROM usuarios WHERE idUsuarios = ?";

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, usuarioId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                String nombre = resultSet.getString("nombreUsuario");
                String apellido = resultSet.getString("apellidoUsuario");
                String correo = resultSet.getString("correoUsuario");
                String dni = resultSet.getString("dniUsuario");
                String telefono =  resultSet.getString("telefonoUsuario");

                // Crear un objeto Usuario con los datos recuperados
                usuario = new Usuario();
                usuario.setIdUsuarios(resultSet.getInt(1));
                usuario.setNombreUsuario(nombre);
                usuario.setApellidoUsuario(apellido);
                usuario.setCorreoUsuario(correo);
                usuario.setDniUsuario(dni);
                usuario.setTelefonoUsuario(telefono);
                usuario.setFotoPerfil(resultSet.getBytes("fotoPerfil"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return usuario;
    }
    public Usuario obtenerDatosporDni(String dni) {
        Usuario usuario = null;
        String sql = "SELECT nombreUsuario, apellidoUsuario, correoUsuario FROM usuarios WHERE dniUsuario = ?";

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, dni);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                String nombre = resultSet.getString("nombreUsuario");
                String apellido = resultSet.getString("apellidoUsuario");
                String correo = resultSet.getString("correoUsuario");
                // Crear un objeto Usuario con los datos recuperados
                usuario = new Usuario();
                usuario.setNombreUsuario(nombre);
                usuario.setApellidoUsuario(apellido);
                usuario.setCorreoUsuario(correo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return usuario;
    }

    public Usuario obtenerDatosporCorreo(String correo) {
        Usuario usuario = null;
        String sql = "SELECT idUsuarios, nombreUsuario, apellidoUsuario, correoUsuario FROM usuarios WHERE correoUsuario = ?";

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, correo);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {

                String nombre = resultSet.getString("nombreUsuario");
                String apellido = resultSet.getString("apellidoUsuario");
                String correo1 = resultSet.getString("correoUsuario");
                // Crear un objeto Usuario con los datos recuperados
                usuario = new Usuario();
                usuario.setIdUsuarios(resultSet.getInt(1));
                usuario.setNombreUsuario(nombre);
                usuario.setApellidoUsuario(apellido);
                usuario.setCorreoUsuario(correo1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


        return usuario;
    }

    public void cambiarContrasena(int id, String pass){
        String sql = "UPDATE usuarios SET passWordUsuario = sha2(?, 256) WHERE idUsuarios = ?;";

        try(Connection con = this.getConnection();
           PreparedStatement st = con.prepareStatement(sql)){

            st.setString(1, pass);
            st.setInt(2, id);
            st.executeUpdate();

        } catch (SQLException e){
            e.printStackTrace();
        }
    }

    public void actualizarUsuario(Usuario usuario) {
        String sql = "UPDATE usuarios SET telefonoUsuario = ?, direccionUsuario = ?, fotoPerfil = ? WHERE idUsuarios = ?";

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, usuario.getTelefonoUsuario());
            preparedStatement.setString(2, usuario.getDireccionUsuario());
            preparedStatement.setBytes(3, usuario.getFotoPerfil());
            preparedStatement.setInt(4, usuario.getIdUsuarios());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void cambiarContrasena1(int id, String pass) {
        String sql = "UPDATE usuarios SET passwordUsuario = sha2(?, 256) WHERE idUsuarios = ?";

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, pass);
            preparedStatement.setInt(2, id);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean validarUsuario1(String correoUsuario, String passwordUsuario) {
        String sql = "SELECT * FROM usuarios WHERE correoUsuario = ? AND passwordUsuario = sha2(?,256)";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, correoUsuario);
            preparedStatement.setString(2, passwordUsuario);
            ResultSet rs = preparedStatement.executeQuery();

            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


}