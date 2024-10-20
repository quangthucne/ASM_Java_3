package com.quangthuc.thucbqpc08717_asm_java_3.controller;

import com.quangthuc.thucbqpc08717_asm_java_3.DAO.CartDetailDAO;
import com.quangthuc.thucbqpc08717_asm_java_3.DAO.CategoryDAO;
import com.quangthuc.thucbqpc08717_asm_java_3.DAO.ProductDAO;
import com.quangthuc.thucbqpc08717_asm_java_3.DAO.UserDAO;
import com.quangthuc.thucbqpc08717_asm_java_3.model.CartDetailModel;
import com.quangthuc.thucbqpc08717_asm_java_3.model.CategoryModel;
import com.quangthuc.thucbqpc08717_asm_java_3.model.ProductModel;
import com.quangthuc.thucbqpc08717_asm_java_3.model.UserModel;
import jakarta.faces.lifecycle.LifecycleFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/home")
public class HomeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cookie[] cookies = req.getCookies();
        int role;
        int idUser;

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("roleUser")) {
                    role = Integer.parseInt(cookie.getValue());

                }
                if (cookie.getName().equals("idUser")) {
                    idUser = Integer.parseInt(cookie.getValue());
                    UserModel userModel = getUserById(idUser);
                    req.setAttribute("user", userModel);
                }
            }
        }


        req.setAttribute("list", getProduct());
        req.setAttribute("category", getCategory());
        req.setAttribute("cartDetail", getAllCartDetail());
        req.getRequestDispatcher("views/jsp/index.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.getRequestDispatcher("views/jsp/index.jsp").forward(req, resp);

    }

    public List<ProductModel> getProduct() {
        ProductDAO proDao = new ProductDAO();
        List<ProductModel> list = proDao.selectAllByStatus();
        return list;
    }
    public List<CategoryModel> getCategory() {
        CategoryDAO cDao = new CategoryDAO();
        List<CategoryModel> list = cDao.selectAllByStatus(1);
        return list;
    }
    public static List<CartDetailModel> getAllCartDetail(){
        CartDetailDAO cartDetailDAO = new CartDetailDAO();
        List<CartDetailModel> list = cartDetailDAO.selectAll();
        return list;
    }

    public static UserModel getUserById(int idUser) {
        UserDAO userDao = new UserDAO();
        UserModel user = userDao.selectById(idUser);
        return user;
    }

}
