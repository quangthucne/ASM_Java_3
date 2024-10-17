package com.quangthuc.thucbqpc08717_asm_java_3.controller;

import com.quangthuc.thucbqpc08717_asm_java_3.DAO.UserDAO;
import com.quangthuc.thucbqpc08717_asm_java_3.model.UserModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import java.util.ArrayList;
import java.util.Date;

@WebServlet("/register")
public class RegisterController extends HttpServlet {
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
        Date date = new Date();
        System.out.println(date);
        register(fullname, username, password, gender, email, phone, status, role);



        req.getRequestDispatcher("/views/jsp/Login.jsp").forward(req, resp);
    }

    public static ArrayList register(String fullname, String username, String password, int gender, String email, String phone, int status, int role) {
        UserDAO userDAO = new UserDAO();
        UserModel user = new UserModel(fullname, username, password, gender, role, email, phone, status);
        ArrayList alert = new ArrayList();
        boolean type = false;
        String message = "";
        if (userDAO.insert(user)) {
            message = "Đăng kí thành công";
            type = true;
        } else {
            message = "Đăng kí thất bại";
        }
        alert.add(message);
        alert.add(type);
        return alert;
    }
}
