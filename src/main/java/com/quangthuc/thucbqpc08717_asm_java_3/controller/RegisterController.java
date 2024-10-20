package com.quangthuc.thucbqpc08717_asm_java_3.controller;

import com.quangthuc.thucbqpc08717_asm_java_3.DAO.CartDAO;
import com.quangthuc.thucbqpc08717_asm_java_3.DAO.DataDAO;
import com.quangthuc.thucbqpc08717_asm_java_3.DAO.UserDAO;
import com.quangthuc.thucbqpc08717_asm_java_3.model.UserModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

@WebServlet("/register")
public class RegisterController extends HttpServlet {
    private static DataSource dataSource;
    @Override
    public void init() throws ServletException {
        Connection connection = null;
        try {
            connection = DataDAO.getConnectionData();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        if (connection == null) {
            throw new ServletException("Unable to obtain a connection from DataSource");
        } else {
            try {
                connection.close(); // Đóng kết nối ngay sau khi kiểm tra
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/jsp/Login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fullname = req.getParameter("fullName");
        String username = req.getParameter("userName");
        String password = req.getParameter("password");
        int gender = Integer.parseInt(req.getParameter("gender"));
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        int status = Integer.parseInt(req.getParameter("status"));
        int role = Integer.parseInt(req.getParameter("role"));

        boolean isEmailUnique = checkEmailUnique(email);
        boolean isPhoneUnique = checkPhoneUnique(phone);

        if (!isEmailUnique) {
            req.setAttribute("error", "Email đã tồn tại.");
            req.getRequestDispatcher("/views/jsp/Login.jsp").forward(req, resp);

            return;
        }

        if (!isPhoneUnique) {
            req.setAttribute("error", "Số điện thoại đã tồn tại.");
            req.getRequestDispatcher("/views/jsp/Login.jsp").forward(req, resp);
            return;
        }

        Date date = new Date();
        System.out.println(date);
        ArrayList alert = register(fullname, username, password, gender, email, phone, status, role);
        System.out.println(alert);
        req.setAttribute("alert", alert);
        req.getRequestDispatcher("/views/jsp/Login.jsp").forward(req, resp);
    }

    public static ArrayList register(String fullname, String username, String password, int gender, String email, String phone, int status, int role) throws ServletException, IOException {
        UserDAO userDAO = new UserDAO();
        UserModel user = new UserModel(fullname, username, password, gender, role, email, phone, status);
        ArrayList alert = new ArrayList();
        boolean type = false;
        String message = "";
        int idUser = userDAO.insertGetGeneratedID(user);
        System.out.println(idUser);
        if (idUser != -1 ) {
            try {
                CartDAO cartDAO = new CartDAO();
                cartDAO.insert(idUser);
                message = "Đăng kí thành công";
                type = true;
            } catch (Exception e) {
                throw new ServletException(e);
            }
        } else {
            message = "Tên đăng nhập đã tồn tại";
        }

        alert.add(message);
        alert.add(type);
        return alert;
    }

    private boolean checkEmailUnique(String email) {
        boolean isUnique = true;

        String query = "SELECT COUNT(*) FROM [user] WHERE email = ?";
        try (Connection connection = DataDAO.getConnectionData();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next() && rs.getInt(1) > 0) {
                isUnique = false;  // Email already exists
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return isUnique;
    }

    private boolean checkPhoneUnique(String phoneNumber) {
        boolean isUnique = true;

        String query = "SELECT COUNT(*) FROM [user] WHERE phone = ?";
        try (Connection connection = DataDAO.getConnectionData();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, phoneNumber);
            ResultSet rs = ps.executeQuery();

            if (rs.next() && rs.getInt(1) > 0) {
                isUnique = false;  // Phone number already exists
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return isUnique;
    }
}
