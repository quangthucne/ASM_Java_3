package com.quangthuc.thucbqpc08717_asm_java_3.controller;

import com.quangthuc.thucbqpc08717_asm_java_3.DAO.CartDetailDAO;
import com.quangthuc.thucbqpc08717_asm_java_3.model.CartDetailModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/cart")
public class CartShoppingController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("cartDetail", getAllCartDetail());
        req.getRequestDispatcher("/views/jsp/cart-shopping.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/jsp/cart-shopping.jsp").forward(req, resp);

    }

    public static List<CartDetailModel> getAllCartDetail(){
        CartDetailDAO cartDetailDAO = new CartDetailDAO();
        List<CartDetailModel> list = cartDetailDAO.selectAll();
        return list;
    }
}
