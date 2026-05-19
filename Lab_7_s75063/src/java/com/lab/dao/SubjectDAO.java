package com.lab.dao;

import com.lab.bean.SubjectBean;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class SubjectDAO {

    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/lab7_db", "root", "");
    }

    // Temporary testing version to see the exact database error
    public boolean registerSubject(String matricNo, String code, String name) throws Exception {
        String sql = "INSERT INTO registered_subjects (id, matric_no, subject_code, subject_name) VALUES (NULL, ?, ?, ?)";
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, matricNo);
            pstmt.setString(2, code);
            pstmt.setString(3, name);

            return pstmt.executeUpdate() > 0;
        }
        // REMOVE the try-catch block here so the real exception bubbles up to your browser screen!
    }

    public List<SubjectBean> getSubjectsByStudent(String matricNo) {
        List<SubjectBean> list = new ArrayList<>();
        String sql = "SELECT * FROM registered_subjects WHERE matric_no = ?";
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, matricNo);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                SubjectBean sub = new SubjectBean();
                sub.setId(rs.getInt("id"));
                sub.setMatricNo(rs.getString("matric_no"));
                sub.setSubjectCode(rs.getString("subject_code"));
                sub.setSubjectName(rs.getString("subject_name"));
                list.add(sub);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public SubjectBean getSubjectByIdAndStudent(int id, String matricNo) {
        String sql = "SELECT * FROM registered_subjects WHERE id = ? AND matric_no = ?";
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.setString(2, matricNo);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                SubjectBean sub = new SubjectBean();
                sub.setId(rs.getInt("id"));
                sub.setMatricNo(rs.getString("matric_no"));
                sub.setSubjectCode(rs.getString("subject_code"));
                sub.setSubjectName(rs.getString("subject_name"));
                return sub;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateSubject(int id, String matricNo, String code, String name) {
        String sql = "UPDATE registered_subjects SET subject_code = ?, subject_name = ? WHERE id = ? AND matric_no = ?";
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, code);
            pstmt.setString(2, name);
            pstmt.setInt(3, id);
            pstmt.setString(4, matricNo);
            return pstmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteSubject(int id, String matricNo) {
        String sql = "DELETE FROM registered_subjects WHERE id = ? AND matric_no = ?";
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.setString(2, matricNo);
            return pstmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
