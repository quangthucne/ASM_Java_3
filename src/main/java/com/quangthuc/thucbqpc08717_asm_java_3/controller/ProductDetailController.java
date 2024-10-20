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

@WebServlet("/product/detail")
public class ProductDetailController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int productId = Integer.parseInt(req.getParameter("id"));
        req.setAttribute("product", getProductById(productId));
        req.getRequestDispatcher("/views/jsp/product-detail.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/jsp/product-detail.jsp").forward(req, resp);
    }
    public static ProductModel getProductById(int productId) {
        ProductDAO productDAO = new ProductDAO();
        ProductModel productModel = productDAO.selectById(productId);
        return productModel;
    }
}
