package com.quangthuc.thucbqpc08717_asm_java_3.controller;

import com.quangthuc.thucbqpc08717_asm_java_3.DAO.CategoryDAO;
import com.quangthuc.thucbqpc08717_asm_java_3.model.CategoryModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
@WebServlet("/category-manage/service")
public class CategoryService extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("category", getCategoryById(req, resp));
        req.getRequestDispatcher("/views/jsp/Admin/FormService/CategoryService.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/jsp/Admin/FormService/CategoryService.jsp").forward(req, resp);

    }

    public static CategoryModel getCategoryById(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CategoryModel categoryModel = new CategoryModel();
        if (req.getParameter("id") == null) {
            categoryModel = null;
        }
        else {
            int idCategory = Integer.parseInt(req.getParameter("id"));
            CategoryDAO categoryDAO = new CategoryDAO();
            categoryModel = categoryDAO.selectById(idCategory);

        }
        return categoryModel;
    }
}
