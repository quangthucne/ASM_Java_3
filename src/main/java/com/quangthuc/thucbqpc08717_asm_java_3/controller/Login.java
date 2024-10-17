package com.quangthuc.thucbqpc08717_asm_java_3.controller;

import com.quangthuc.thucbqpc08717_asm_java_3.DAO.UserDAO;
import com.quangthuc.thucbqpc08717_asm_java_3.model.UserModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
@WebServlet("/login")
public class Login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/jsp/Login.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        UserDAO userDAO = new UserDAO();
        UserModel userModel= null;

        
        try{
            userModel = userDAO.selectByUsername(username);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        System.out.println(userModel.getRole());
        
        if (userModel != null && password.equals(userModel.getPassword())) {

            Cookie idUser = new Cookie("idUser", String.valueOf(userModel.getIdUser()));
            idUser.setMaxAge(60);
            Cookie roleUser = new Cookie("roleUser", String.valueOf(userModel.getRole()));
            roleUser.setMaxAge(60);
            if (userModel.getRole() == 1) {
                resp.sendRedirect(req.getContextPath() + "/admin");
            }
            else {
                resp.sendRedirect(req.getContextPath() + "/home");
            }
            return;
        }
        req.getRequestDispatcher("/views/jsp/Login.jsp").forward(req, resp);
    }
}
