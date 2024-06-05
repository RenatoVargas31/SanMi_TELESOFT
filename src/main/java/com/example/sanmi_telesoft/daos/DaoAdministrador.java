package com.example.sanmi_telesoft.daos;

import com.example.sanmi_telesoft.beans.Profesor;
import com.example.sanmi_telesoft.beans.Serenazgo;

import java.sql.*;
import java.util.ArrayList;

public class DaoAdministrador {

    //Método para crear profesor (Create)
    public void crearProfesores(String nombreProfesor, String apellidoProfesor, String dniProfesor, String tipoProfesor, String cursoProfesor){

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/proyecto-iweb";
        String username = "root";
        String password = "root";

        String sql = "insert into profesores (nombreProfesor, apellidoProfesor, dniProfesor, tipoProfesor, cursoProfesor) values (?,?,?,?,?)";

        try(Connection connection = DriverManager.getConnection(url,username,password);
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
    //Método para listar profesores (Read)
    public ArrayList<Profesor> listarProfesores(){
        ArrayList<Profesor> listaProfesores = new ArrayList<>();
        //Conexión a la base de datos
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        String url = "jdbc:mysql://localhost:3306/proyecto-iweb";
        String username = "root";
        String password = "root";

        String sql = "select * from profesores";

        //Ejecución de la consulta
        try (Connection conn = DriverManager.getConnection(url, username, password);
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

                listaProfesores.add(profesor);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        return listaProfesores;
    }
    //Método para actualizar profesor (Update)
    public void actualizar(Profesor profesor){

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/proyecto-iweb";
        String username = "root";
        String password = "root";

        String sql = "update profesores set tipoProfesor = ?, cursoProfesor = ? where idProfesores = ?";

        try(Connection connection = DriverManager.getConnection(url,username,password);
            PreparedStatement pstmt = connection.prepareStatement(sql)){

            pstmt.setString(1,profesor.getTipoProfesor());
            pstmt.setString(2,profesor.getCursoProfesor());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    //Método para borrar profesor (Delete)
    public void borrar(String idprofesor){

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/proyecto-iweb";
        String username = "root";
        String password = "root";

        String sql = "delete from profesores where idProfesores = ?";

        try(Connection connection = DriverManager.getConnection(url,username,password);
            PreparedStatement pstmt = connection.prepareStatement(sql)){

            pstmt.setString(1,idprofesor);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
