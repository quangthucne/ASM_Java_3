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
import java.util.List;

@WebServlet("/user-manage")
public class UserManageController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<UserModel> list = getAllUser();
        req.setAttribute("userList", list);
        req.getRequestDispatcher("/views/jsp/Admin/UserManage.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String typeActive = req.getParameter("typeActive");
        switch (typeActive) {
            case "add":
                break;
            case "edit":
                editUserModel(req, resp);
                break;
            case "delete":
                deleteUserModel(req, resp);
                break;
        }
        req.getRequestDispatcher("/views/jsp/Admin/UserManage.jsp").forward(req, resp);

    }

    public static List<UserModel> getAllUser(){
        UserDAO userDAO = new UserDAO();
        List<UserModel> list = userDAO.selectAll();
        return list;
    }
    public static void editUserModel(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fullname = req.getParameter("fullName");
        int gender = Integer.parseInt(req.getParameter("gender"));
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        int status = Integer.parseInt(req.getParameter("status"));
        int userId = Integer.parseInt(req.getParameter("userId"));
        System.out.println(fullname);
        System.out.println(gender);
        System.out.println(email);
        System.out.println(phone);
        System.out.println(status);
        System.out.println(userId);
        UserDAO userDAO = new UserDAO();
        UserModel userModel = new UserModel(fullname, gender, email, phone, status, userId);
        userDAO.update(userModel);

        List<UserModel> list = userDAO.selectAll();
        req.setAttribute("userList", list);
    }


    public static void deleteUserModel(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userId = Integer.parseInt(req.getParameter("userId"));
        UserDAO userDAO = new UserDAO();
        userDAO.delete(userId);
        List<UserModel> list = userDAO.selectAll();
        req.setAttribute("userList", list);
    }
}
