package com.quangthuc.thucbqpc08717_asm_java_3.controller;

import com.quangthuc.thucbqpc08717_asm_java_3.DAO.OrderDAO;
import com.quangthuc.thucbqpc08717_asm_java_3.model.OrderModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/order-manage")
public class OrderManageController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<OrderModel> orderModelList = getAllOrder();
        req.setAttribute("orderList", orderModelList);
        req.getRequestDispatcher("/views/jsp/Admin/OrderManage.jsp").forward(req, resp);
    }
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        editOrder(req, resp);
        req.getRequestDispatcher("/views/jsp/Admin/OrderManage.jsp").forward(req, resp);

    }

    public static List<OrderModel> getAllOrder(){
        OrderDAO orderDAO = new OrderDAO();
        List<OrderModel> list = orderDAO.selectAll();
        return list;
    }
    public static void editOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int orderId = Integer.parseInt(req.getParameter("orderId"));
        int orderStatus = Integer.parseInt(req.getParameter("status"));
        OrderDAO orderDAO = new OrderDAO();
        orderDAO.updateStatus(orderId, orderStatus);
        req.setAttribute("orderList", orderDAO.selectAll());
    }
}
