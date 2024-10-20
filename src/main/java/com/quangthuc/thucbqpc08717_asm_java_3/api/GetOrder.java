package com.quangthuc.thucbqpc08717_asm_java_3.api;

import com.google.gson.Gson;
import com.quangthuc.thucbqpc08717_asm_java_3.DAO.CategoryDAO;
import com.quangthuc.thucbqpc08717_asm_java_3.DAO.OrderDAO;
import com.quangthuc.thucbqpc08717_asm_java_3.model.CategoryModel;
import com.quangthuc.thucbqpc08717_asm_java_3.model.OrderModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/order/api")
public class GetOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int orderId = Integer.parseInt(req.getParameter("orderId"));

        OrderDAO orderDAO = new OrderDAO();
        OrderModel orderModel = orderDAO.selectById(orderId);

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(new Gson().toJson(orderModel));
    }
}
