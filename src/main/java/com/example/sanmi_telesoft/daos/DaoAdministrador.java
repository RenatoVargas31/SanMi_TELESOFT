package com.example.sanmi_telesoft.daos;

import com.example.sanmi_telesoft.beans.Profesor;
import com.example.sanmi_telesoft.beans.Serenazgo;

import java.sql.*;
import java.util.ArrayList;

public class DaoAdministrador extends BaseDao {
    //Método para buscar profesor por ID
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
    //Método para crear profesor (Create)
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
    //Método para listar profesores (Read)
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
                profesor.setIsEnable(rs.getString("isEnable"));
                listaProfesores.add(profesor);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        return listaProfesores;
    }
    //Método para actualizar profesor (Update)
    public void actualizar(Profesor profesor){

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
    //Método para borrar profesor (Delete)
    public void borrarProfesores(String idprofesor) throws SQLException {

        String sql = "update profesores set isEnable='0' where idProfesores = ?";

        try(Connection connection = getConection();
            PreparedStatement pstmt = connection.prepareStatement(sql)){

            pstmt.setString(1,idprofesor);

            pstmt.executeUpdate();

        }
    }

}
