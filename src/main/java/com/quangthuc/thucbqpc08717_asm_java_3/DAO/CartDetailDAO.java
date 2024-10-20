package com.quangthuc.thucbqpc08717_asm_java_3.DAO;


import com.quangthuc.thucbqpc08717_asm_java_3.model.CartDetailModel;
import com.quangthuc.thucbqpc08717_asm_java_3.model.ProductModel;
import com.quangthuc.thucbqpc08717_asm_java_3.service.CartDetailInterface;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartDetailDAO extends DataDAO implements CartDetailInterface {
    @Override
    public List<CartDetailModel> selectAll() {
        List<CartDetailModel> list = new ArrayList<>();
        try {
            Connection conn = getConnection();
            ResultSet rs = query(CART_DETAIL_SELECT_ALL);
            while (rs.next()) {
                int idCartDetail = rs.getInt(COLUMN_ID_CART_DETAIL);
                int idCart = rs.getInt(COLUMN_ID_CART);
                int idProduct = rs.getInt(COLUMN_ID_PRODUCT);
                int quantityProduct = rs.getInt(COLUMN_ID_QUANTITY_PRODUCT);
                ProductDAO productDAO = new ProductDAO();
                ProductModel products = productDAO.selectAllByIdCartDetail(idCartDetail);
                list.add(new CartDetailModel(idCartDetail, idCart, idProduct, quantityProduct, products));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    @Override
    public CartDetailModel selectById(int idCartDetail) {
        CartDetailModel cartDetailModel = null;
        try {
            Connection conn = getConnection();
            ResultSet rs = query(CART_DETAIL_SELECT_BY_ID, idCartDetail);
            while (rs.next()) {
                int id = rs.getInt(COLUMN_ID_CART_DETAIL);
                int idCart = rs.getInt(COLUMN_ID_CART);
                int idProduct = rs.getInt(COLUMN_ID_PRODUCT);
                int quantityProduct = rs.getInt(COLUMN_ID_QUANTITY_PRODUCT);
                cartDetailModel = new CartDetailModel(id, idCart, idProduct, quantityProduct);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return cartDetailModel;
    }

    @Override
    public List<CartDetailModel> selectByIdCart(int idCart) {
        List<CartDetailModel> list = new ArrayList<>();
        try {
            Connection conn = getConnection();
            ResultSet rs = query(CART_DETAIL_SELECT_BY_ID_CART, idCart);
            while (rs.next()) {
                int idCartDetail = rs.getInt(COLUMN_ID_CART_DETAIL);
                int idProduct = rs.getInt(COLUMN_ID_PRODUCT);
                int quantityProduct = rs.getInt(COLUMN_ID_QUANTITY_PRODUCT);
                ProductDAO productDAO = new ProductDAO();
                ProductModel products = productDAO.selectAllByIdCartDetail(idCartDetail);
                list.add(new CartDetailModel(idCartDetail, idCart, idProduct, quantityProduct, products));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    @Override
    public boolean insert(CartDetailModel cartDetailModel) {
        boolean rs = false;
        try {
            Connection conn = getConnection();
            update(CART_DEATIL_INSERT,
                    cartDetailModel.getIdCart(),
                    cartDetailModel.getIdProduct(),
                    cartDetailModel.getQuantityProduct()
            );
            rs = true;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return rs;
    }

    @Override
    public boolean update(CartDetailModel cartDetailModel) {
        boolean rs = false;
        try {
            Connection conn = getConnection();
            update(CART_DETAIL_UPDATE,
                    cartDetailModel.getIdCart(),
                    cartDetailModel.getIdProduct(),
                    cartDetailModel.getQuantityProduct(),
                    cartDetailModel.getIdCartDetail()
            );
            rs = true;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return rs;
    }

    @Override
    public boolean delete(CartDetailModel cartDetailModel) {
        boolean rs = false;
        try {
            Connection conn = getConnection();
            update(CART_DETAIL_DELETE,
                    cartDetailModel.getIdCartDetail()
            );
            rs = true;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return rs;
    }
}
