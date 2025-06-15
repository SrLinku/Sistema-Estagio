package com.sistemaestagio.dao;

import java.sql.*;
import java.util.*;

import com.sistemaestagio.bean.Professor;

public class ProfessorDao {

    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sistemaestagio", "root", "1234");
        } catch (Exception e) {
            System.out.println(e);
        }
        return con;
    }

    public static int addProfessor(Professor p) {
        int status = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO professor (nome, email, matricula, departamento, telefone, titulacao, area_atuacao, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
            ps.setString(1, p.getNome());
            ps.setString(2, p.getEmail());
            ps.setString(3, p.getMatricula());
            ps.setString(4, p.getDepartamento());
            ps.setString(5, p.getTelefone());
            ps.setString(6, p.getTitulacao());
            ps.setString(7, p.getArea_atuacao());
            ps.setBoolean(8, p.isStatus());
            status = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }

    public static int updateProfessor(Professor p) {
        int status = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(
                "UPDATE professor SET nome=?, email=?, matricula=?, departamento=?, telefone=?, titulacao=?, area_atuacao=?, status=? WHERE id_professor=?");
            ps.setString(1, p.getNome());
            ps.setString(2, p.getEmail());
            ps.setString(3, p.getMatricula());
            ps.setString(4, p.getDepartamento());
            ps.setString(5, p.getTelefone());
            ps.setString(6, p.getTitulacao());
            ps.setString(7, p.getArea_atuacao());
            ps.setBoolean(8, p.isStatus());
            ps.setInt(9, p.getId_professor());
            status = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }

    public static int deleteProfessor(int id) {
        int status = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("DELETE FROM professor WHERE id_professor=?");
            ps.setInt(1, id);
            status = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }

    public static List<Professor> getAllProfessores() {
        List<Professor> list = new ArrayList<>();
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM professor");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Professor p = new Professor();
                p.setId_professor(rs.getInt("id_professor"));
                p.setNome(rs.getString("nome"));
                p.setEmail(rs.getString("email"));
                p.setMatricula(rs.getString("matricula"));
                p.setDepartamento(rs.getString("departamento"));
                p.setTelefone(rs.getString("telefone"));
                p.setTitulacao(rs.getString("titulacao"));
                p.setArea_atuacao(rs.getString("area_atuacao"));
                p.setStatus(rs.getBoolean("status"));
                p.setData_cadastro(rs.getTimestamp("data_cadastro"));
                list.add(p);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public static Professor getProfessorById(int id) {
        Professor p = null;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM professor WHERE id_professor=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                p = new Professor();
                p.setId_professor(rs.getInt("id_professor"));
                p.setNome(rs.getString("nome"));
                p.setEmail(rs.getString("email"));
                p.setMatricula(rs.getString("matricula"));
                p.setDepartamento(rs.getString("departamento"));
                p.setTelefone(rs.getString("telefone"));
                p.setTitulacao(rs.getString("titulacao"));
                p.setArea_atuacao(rs.getString("area_atuacao"));
                p.setStatus(rs.getBoolean("status"));
                p.setData_cadastro(rs.getTimestamp("data_cadastro"));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return p;
    }

    public static int getProfessorCount() {
        int count = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) FROM professor");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return count;
    }

    public static List<Professor> getProfessoresByPage(int page, int pageSize) {
        List<Professor> list = new ArrayList<>();
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM professor LIMIT ? OFFSET ?");
            ps.setInt(1, pageSize);
            ps.setInt(2, (page - 1) * pageSize);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Professor p = new Professor();
                p.setId_professor(rs.getInt("id_professor"));
                p.setNome(rs.getString("nome"));
                p.setEmail(rs.getString("email"));
                p.setMatricula(rs.getString("matricula"));
                p.setDepartamento(rs.getString("departamento"));
                p.setTelefone(rs.getString("telefone"));
                p.setTitulacao(rs.getString("titulacao"));
                p.setArea_atuacao(rs.getString("area_atuacao"));
                p.setStatus(rs.getBoolean("status"));
                p.setData_cadastro(rs.getTimestamp("data_cadastro"));
                list.add(p);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
}
