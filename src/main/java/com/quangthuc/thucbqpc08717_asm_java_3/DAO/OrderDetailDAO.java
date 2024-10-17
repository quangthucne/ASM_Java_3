package com.quangthuc.thucbqpc08717_asm_java_3.DAO;



import com.quangthuc.thucbqpc08717_asm_java_3.model.OrderDetailModel;
import com.quangthuc.thucbqpc08717_asm_java_3.service.OrderDetailInterface;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDetailDAO extends DataDAO implements OrderDetailInterface {
    @Override
    public List<OrderDetailModel> selectAll() {
        List<OrderDetailModel> list = new ArrayList<>();
        try {
            Connection connection = getConnection();
            ResultSet rs = query(ORDER_DETAIL_SELECT_ALL);
            while (rs.next()) {
                int idOrderDetail = rs.getInt(COLUMN_ID_ORDER_DETAIL);
                int idOrder = rs.getInt(COLUMN_ID_ORDER);
                int idProduct = rs.getInt(COLUMN_ID_PRODUCT);
                int price = rs.getInt(COLUMN_PRICE);
                int quantity = rs.getInt(COLUMN_QUANTITY);
                list.add(new OrderDetailModel(idOrderDetail, idOrder, idProduct, price, quantity));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    @Override
    public OrderDetailModel selectById(int idOrderDetail) {
        OrderDetailModel orderDetailModel = null;
        try {
            Connection connection = getConnection();
            ResultSet rs = query(ORDER_DETAIL_SELECT_BY_ID, idOrderDetail);
            while (rs.next()) {
                int idOrder = rs.getInt(COLUMN_ID_ORDER);
                int idProduct = rs.getInt(COLUMN_ID_PRODUCT);
                int price = rs.getInt(COLUMN_PRICE);
                int quantity = rs.getInt(COLUMN_QUANTITY);
                orderDetailModel = new OrderDetailModel(idOrderDetail, idOrder, idProduct, price, quantity);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return orderDetailModel;
    }

    @Override
    public OrderDetailModel selectByIdProduct(int idProduct) {
        OrderDetailModel orderDetailModel = null;
        try {
            Connection connection = getConnection();
            ResultSet rs = query(ORDER_DETAIL_SELECT_BY_ID_PRODUCT, idProduct);
            while (rs.next()){
                int idOrderDetail = rs.getInt(COLUMN_ID_ORDER_DETAIL);
                int idOrder = rs.getInt(COLUMN_ID_ORDER);
                int price = rs.getInt(COLUMN_PRICE);
                int quantity = rs.getInt(COLUMN_QUANTITY);
                orderDetailModel = new OrderDetailModel(idOrderDetail, idOrder, idProduct, price, quantity);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    @Override
    public boolean insert(OrderDetailModel orderDetailModel) {
        boolean rs = false;
        try {
            Connection connection = getConnection();
            update(ORDER_DETAIL_INSERT,
                    orderDetailModel.getIdOrder(),
                    orderDetailModel.getIdProduct(),
                    orderDetailModel.getPrice(),
                    orderDetailModel.getQuantity()
            );
            rs = true;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return rs;
    }

    @Override
    public boolean update(OrderDetailModel orderDetailModel) {
        boolean rs = false;
        try {
            Connection connection = getConnection();
            update(ORDER_DETAIL_UPDATE,
                    orderDetailModel.getIdOrder(),
                    orderDetailModel.getIdProduct(),
                    orderDetailModel.getPrice(),
                    orderDetailModel.getQuantity(),
                    orderDetailModel.getIdOrderDetail()
            );
            rs = true;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return rs;
    }

    @Override
    public boolean delete(OrderDetailModel orderDetailModel) {
        boolean rs = false;
        try {
            Connection connection = getConnection();
            update(ORDER_DETAIL_DELETE, orderDetailModel.getIdOrderDetail());
            rs = true;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return rs;
    }
}
