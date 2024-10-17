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
import java.util.List;

@WebServlet("/searchCategory")
public class SearchCategory extends HttpServlet {
    private CategoryDAO categoryDAO = new CategoryDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nameCategory = request.getParameter("search");
        List<CategoryModel> categoryList = categoryDAO.selectByName(nameCategory);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String json = new Gson().toJson(categoryList);
        response.getWriter().write(json);
    }
}
