package com.example.sanmi_telesoft.daos;

import com.example.sanmi_telesoft.beans.Token;
import com.example.sanmi_telesoft.beans.Usuario;

import java.sql.*;

public class DaoToken extends BaseDao {
    public Token CreateToken(Usuario usuario) {
        Token token = null;
        String sql = "INSERT INTO token (id, fecha, usuarios_idUsuarios, tiempo) values (sha2(concat(DATE_FORMAT(NOW(), '%Y%m%d%H%i%s'), ?), 256), ?, ? , 300000);";

        try (Connection conn = this.getConection();
        PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, usuario.getIdUsuarios());
            ps.setTimestamp(2, new Timestamp(System.currentTimeMillis() + 300000));
            ps.setInt(3, usuario.getIdUsuarios());
            ps.executeUpdate();

        } catch (SQLException e){
            e.printStackTrace();
        }

        String sql2 = "select *from token order by fecha desc limit 1;";

        try (Connection conn = this.getConection();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(sql2)){

            while (rs.next()) {
                token = new Token();
                token.setFecha(rs.getTimestamp("fecha"));
                token.setId(rs.getString("id"));
                token.setUser(rs.getInt("usuarios_idUsuarios"));
                token.setTiempo(rs.getInt("tiempo"));
            }



        } catch (SQLException eq){
            eq.printStackTrace();
        }

        return token;

    }

    public Token GetToken(String id) {
        Token token = null;
        String sql = "SELECT * FROM token WHERE id = ?;";

        try(Connection conn = this.getConection();
        PreparedStatement st = conn.prepareStatement(sql)){
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()){
                token = new Token();
                token.setFecha(rs.getTimestamp("fecha"));
                token.setId(rs.getString("id"));
                token.setTiempo(rs.getInt("tiempo"));
                token.setUser(rs.getInt("usuarios_idUsuarios"));

            }

        } catch (SQLException P){
            P.printStackTrace();
        }

        return token;

    }
}
