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
@WebServlet("/profile")
public class Profile extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cookie[] cookies = req.getCookies();
        int role = -1;
        int idUser = -1;

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("roleUser")) {
                    role = Integer.parseInt(cookie.getValue());

                }
                if (cookie.getName().equals("idUser")) {
                    idUser = Integer.parseInt(cookie.getValue());
                    UserModel userModel = getUserById(idUser);
                    req.setAttribute("user", userModel);
                }
            }
        }
        if (role != -1 && idUser != -1 ) {
            req.getRequestDispatcher("/views/jsp/profile.jsp").forward(req, resp);
        } else {
            resp.sendRedirect(req.getContextPath() + "/login");
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/jsp/profile.jsp").forward(req, resp);
    }
    public static UserModel getUserById(int idUser) {
        UserDAO userDao = new UserDAO();
        UserModel user = userDao.selectById(idUser);
        return user;
    }
}
