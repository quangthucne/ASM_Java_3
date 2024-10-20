package com.quangthuc.thucbqpc08717_asm_java_3.controller;

import java.io.IOException;

import com.quangthuc.thucbqpc08717_asm_java_3.DAO.CartDAO;
import com.quangthuc.thucbqpc08717_asm_java_3.DAO.CartDetailDAO;
import com.quangthuc.thucbqpc08717_asm_java_3.model.CartDetailModel;
import com.quangthuc.thucbqpc08717_asm_java_3.model.CartModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addtocart")
public class AddToCartController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println(getIdCartByUserId(req, resp));
        System.out.println(getQuantityCart(req, resp));
        System.out.println(getProductId(req, resp));
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int idCart = getIdCartByUserId(req, resp);
        int quantityCart = getQuantityCart(req, resp);
        int productId = getProductId(req, resp);
        addToCart(idCart, productId, quantityCart);
        resp.sendRedirect(req.getContextPath() + "/product/detail?id=" + productId);
    }

    public static int getIdCartByUserId(HttpServletRequest req, HttpServletResponse resp) {
        Cookie[] cookies = req.getCookies();
        CartModel cartModel = null;
        int role;
        int idUser = -1;

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("roleUser")) {
                    role = Integer.parseInt(cookie.getValue());

                }
                if (cookie.getName().equals("idUser")) {
                    idUser = Integer.parseInt(cookie.getValue());
                    CartDAO cartDAO = new CartDAO();
                    cartModel = cartDAO.selectByIdUser(idUser);
                    System.out.println(cartModel.getIdCart());

                }
            }
        }
        return cartModel.getIdCart();
    }

    public static int getProductId(HttpServletRequest req, HttpServletResponse resp) {
        int idProduct = Integer.parseInt(req.getParameter("idProduct"));
        return idProduct;
    }

    public static int getQuantityCart(HttpServletRequest req, HttpServletResponse resp) {
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        return quantity;
    }

    public static void addToCart(int idCart, int idProduct, int quantity) {
        CartDetailDAO cartDetailDAO = new CartDetailDAO();
        CartDetailModel cartDetailModel = new CartDetailModel(idCart, idProduct, quantity);
        cartDetailDAO.insert(cartDetailModel);
    }
    // hi
}
