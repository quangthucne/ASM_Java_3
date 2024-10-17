package com.quangthuc.thucbqpc08717_asm_java_3.api;

import com.google.gson.Gson;
import com.quangthuc.thucbqpc08717_asm_java_3.DAO.CategoryDAO;
import com.quangthuc.thucbqpc08717_asm_java_3.model.CategoryModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/getIdCategory")
public class GetCategory extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int categoryId = Integer.parseInt(req.getParameter("categoryId"));

        CategoryDAO categoryDAO = new CategoryDAO();
        CategoryModel category = categoryDAO.selectById(categoryId);

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(new Gson().toJson(category));
    }
}
