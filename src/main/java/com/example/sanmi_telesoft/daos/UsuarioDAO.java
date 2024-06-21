package com.example.sanmi_telesoft.daos;

import com.example.sanmi_telesoft.beans.Usuario;

import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
                usuario.setIdUrbanizacion(rs.getInt("idUrbanizacion"));
                usuario.setActivationToken(rs.getString("activationToken"));
                usuario.setIsActive(rs.getString("isActive"));
                usuario.setNacimientoDate(rs.getString("nacimientoDate"));
                usuario.setIdTipoCoordinadora(rs.getInt("idTipoCoordinadora"));
                usuario.setIdEstadoVecinoEvento(rs.getInt("idEstadoVecinoEvento"));
                usuario.setBannedApp(rs.getBoolean("isBannedApp"));
                usuario.setMotivoBannedApp(rs.getString("motivoBannedApp"));
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
}