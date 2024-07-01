package com.example.sanmi_telesoft.daos;

import com.example.sanmi_telesoft.beans.Usuario;

import java.security.MessageDigest;
import java.sql.*;

public class UsuarioDAO {
    private String jdbcURL = "jdbc:mysql://127.0.0.1:3306/proyecto-iweb";
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
        String sql = "SELECT nombreUsuario, apellidoUsuario, correoUsuario FROM usuarios WHERE idUsuarios = ?";

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, usuarioId);
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
}