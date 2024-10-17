package com.quangthuc.thucbqpc08717_asm_java_3.controller;

import com.quangthuc.thucbqpc08717_asm_java_3.DAO.ProductDAO;
import com.quangthuc.thucbqpc08717_asm_java_3.model.ProductModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/product")
public class product extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("list" , getProduct());
        req.getRequestDispatcher("/views/jsp/product.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("list" , getProduct());
        req.getRequestDispatcher("/views/jsp/product.jsp").forward(req, resp);

    }

    public List<ProductModel> getProduct() {
        ProductDAO proDao = new ProductDAO();
        List<ProductModel> list = proDao.selectAll();
        return list;
    }
}