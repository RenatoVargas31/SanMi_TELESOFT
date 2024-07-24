package com.example.sanmi_telesoft.daos;

import com.example.sanmi_telesoft.beans.Usuario;

import java.sql.*;

public class UserDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/proyecto-iweb?serverTimezone=America/Lima&useSSL=false&allowPublicKeyRetrieval=true";
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
        String sql = "INSERT INTO usuarios (Roles_idRoles, correoUsuario, passwordUsuario, nombreUsuario, apellidoUsuario, dniUsuario, direccionUsuario, telefonoUsuario, Urbanizacion_idUrbanizacion, genero) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
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
            preparedStatement.setInt(10, usuario.getGenero());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int contarVecinos() {
        String sql = "SELECT COUNT(*) AS total FROM usuarios WHERE Roles_idRoles = 4 and is_active=1";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt("total");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return 0;
    }
    public int contarCoordi() {
        String sql = "SELECT COUNT(*) AS total FROM usuarios WHERE Roles_idRoles = 3 and is_active=1";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt("total");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return 0;
    }

    public boolean dniExists(String dni) {
        String sql = "SELECT COUNT(*) FROM usuarios WHERE dniUsuario = ?";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, dni);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public boolean correoExists(String correo) {
        String sql = "SELECT COUNT(*) FROM usuarios WHERE correoUsuario = ?";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, correo);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
