package com.quangthuc.thucbqpc08717_asm_java_3.controller;

import com.quangthuc.thucbqpc08717_asm_java_3.DAO.CartDAO;
import com.quangthuc.thucbqpc08717_asm_java_3.DAO.CartDetailDAO;
import com.quangthuc.thucbqpc08717_asm_java_3.model.CartDetailModel;
import com.quangthuc.thucbqpc08717_asm_java_3.model.CartModel;
import com.quangthuc.thucbqpc08717_asm_java_3.model.ProductModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/cart")
public class CartShoppingController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int idUser = getUserId(req, resp);
        req.setAttribute("cartDetail", getCartDetailList(idUser));
        req.getRequestDispatcher("/views/jsp/cart-shopping.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/jsp/cart-shopping.jsp").forward(req, resp);

    }

    public static int getUserId(HttpServletRequest req, HttpServletResponse resp) {
        Cookie[] cookies = req.getCookies();
        int role;
        int idUser = -1;

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("roleUser")) {
                    role = Integer.parseInt(cookie.getValue());

                }
                if (cookie.getName().equals("idUser")) {
                    idUser = Integer.parseInt(cookie.getValue());

                }
            }
        }
        return idUser;
    }

    public static List<CartDetailModel> getCartDetailList(int idUser) {
        CartDAO cartDAO = new CartDAO();
        CartModel cartModel = cartDAO.selectByIdUser(idUser);
        System.out.println("id cart " + cartModel.getIdCart());
        System.out.println("id user " + cartModel.getUserId());
        List<CartDetailModel> list = cartModel.getCartDetailModelList();
        return list;
    }
}
