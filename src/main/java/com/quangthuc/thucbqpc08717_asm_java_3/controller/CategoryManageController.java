package com.quangthuc.thucbqpc08717_asm_java_3.controller;

import com.quangthuc.thucbqpc08717_asm_java_3.DAO.CategoryDAO;
import com.quangthuc.thucbqpc08717_asm_java_3.model.CategoryModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/category-manage")
public class CategoryManageController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<CategoryModel> list = getAllCategory();
        req.setAttribute("categoryList", list);
        req.getRequestDispatcher("/views/jsp/Admin/CategoryManage.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String typeActive = req.getParameter("typeActive");
        switch (typeActive) {
            case "add":
                addCategory(req, resp);
                break;
            case "edit":
                editCategory(req, resp);
                break;
            case "delete":
                deleteCategory(req, resp);
                break;
            case "search":
                searchCategory(req, resp);
                break;
        }
        req.getRequestDispatcher("/views/jsp/Admin/CategoryManage.jsp").forward(req, resp);
    }


    public static List<CategoryModel> getAllCategory() {
        List<CategoryModel> categoryList = new ArrayList<>();
        CategoryDAO categoryDAO = new CategoryDAO();
        categoryList = categoryDAO.selectAll();
        System.out.println(categoryList.get(0).getName());
        return categoryList;
    }

    public static void addCategory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String categoryName = req.getParameter("categoryName");
        String categoryStatus = req.getParameter("categoryStatus");

        CategoryModel categoryModel = new CategoryModel(categoryName, Integer.parseInt(categoryStatus));
        CategoryDAO categoryDAO = new CategoryDAO();
        categoryDAO.insert(categoryModel);

        List<CategoryModel> list = getAllCategory();
        req.setAttribute("categoryList", list);
    }

    public static void editCategory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String categoryName = req.getParameter("categoryName");
        int categoryStatus = Integer.parseInt(req.getParameter("categoryStatus"));
        int categoryId = Integer.parseInt(req.getParameter("categoryId"));
        System.out.println(categoryId);
        CategoryModel categoryModel = new CategoryModel(categoryId, categoryName, categoryStatus);
        CategoryDAO categoryDAO = new CategoryDAO();
        categoryDAO.update(categoryModel);

        List<CategoryModel> list = getAllCategory();
        req.setAttribute("categoryList", list);
    }

    public static void deleteCategory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int categoryId = Integer.parseInt(req.getParameter("categoryId"));
        System.out.println(categoryId);
        CategoryDAO categoryDAO = new CategoryDAO();
        categoryDAO.delete(categoryId);
        List<CategoryModel> list = getAllCategory();
        req.setAttribute("categoryList", list);
    }

    public static void searchCategory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String categoryName = req.getParameter("search");
        CategoryDAO categoryDAO = new CategoryDAO();
        if(!categoryName.isEmpty()) {
            List<CategoryModel> list = categoryDAO.selectByName(categoryName);
            req.setAttribute("categoryList", list);
        }
        else {
            List<CategoryModel> list = categoryDAO.selectAll();
            req.setAttribute("categoryList", list);
        }

    }
}