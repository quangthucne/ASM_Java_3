package com.quangthuc.thucbqpc08717_asm_java_3.DAO;


import com.quangthuc.thucbqpc08717_asm_java_3.model.CartModel;
import com.quangthuc.thucbqpc08717_asm_java_3.service.CartInterface;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartDAO extends DataDAO implements CartInterface {
    @Override
    public List<CartModel> selectAll() {
        List<CartModel> list = new ArrayList<>();
        try {
            Connection conn = getConnection();
            ResultSet rs = query(CART_SELECT_ALL);
            while (rs.next()) {
                int idCart = rs.getInt(COLUMN_ID_CART);
                int idUser = rs.getInt(COLUMN_ID_USER);
                list.add(new CartModel(idCart, idUser));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    @Override
    public CartModel selectById(String idCart) {
        CartModel cartModel = null;
        try {
            Connection conn = getConnection();
            ResultSet rs = query(CART_SELECT_BY_ID, idCart);
            while (rs.next()) {
                int id = rs.getInt(COLUMN_ID_CART);
                int idUser = rs.getInt(COLUMN_ID_USER);
                cartModel = new CartModel(id, idUser);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return cartModel;
    }

    @Override
    public CartModel selectByIdUser(String idUser) {
        CartModel cartModel = null;
        try {
            Connection conn = getConnection();
            ResultSet rs = query(CART_SELECT_BY_ID_USER, idUser);
            while (rs.next()) {
                int idCart = rs.getInt(COLUMN_ID_CART);
                int id = rs.getInt(COLUMN_ID_USER);
                cartModel = new CartModel(idCart, id);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return cartModel;
    }

    @Override
    public boolean insert(int idUser) {
        boolean result = false;
        try {
            Connection conn = getConnection();
            update(CART_INSERT, idUser);
            result = true;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return result;
    }
}
