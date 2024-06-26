package com.example.sanmi_telesoft.daos;

import com.example.sanmi_telesoft.beans.Usuario;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UserDAO {
    private String jdbcURL = "jdbc:mysql://127.0.0.1:3306/proyecto-iweb";
    private String jdbcUsername = "root";
    private String jdbcPassword = "root";
    private String jdbcDriver = "com.mysql.cj.jdbc.Driver";

    public UserDAO() {}

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

    public void registerUser(Usuario usuario) {
        String sql = "INSERT INTO usuarios (Roles_idRoles, correoUsuario, passwordUsuario, nombreUsuario, apellidoUsuario, dniUsuario, direccionUsuario, telefonoUsuario, Urbanizacion_idUrbanizacion) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, 4); // Assuming role vecino for new users, adjust as needed
            preparedStatement.setString(2, usuario.getCorreoUsuario());
            preparedStatement.setString(3, usuario.getPasswordUsuario());
            preparedStatement.setString(4, usuario.getNombreUsuario());
            preparedStatement.setString(5, usuario.getApellidoUsuario());
            preparedStatement.setString(6, usuario.getDniUsuario());
            preparedStatement.setString(7, usuario.getDireccionUsuario());
            preparedStatement.setString(8, usuario.getTelefonoUsuario());
            preparedStatement.setInt(9, usuario.getIdUrbanizacion());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}