package com.quangthuc.thucbqpc08717_asm_java_3.DAO;



import com.quangthuc.thucbqpc08717_asm_java_3.model.OrderModel;
import com.quangthuc.thucbqpc08717_asm_java_3.model.UserModel;
import com.quangthuc.thucbqpc08717_asm_java_3.service.OrderInterface;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO extends DataDAO implements OrderInterface {
    @Override
    public List<OrderModel> selectAll() {
        List<OrderModel> list = new ArrayList<>();
        try {
            Connection connection = getConnection();
            ResultSet rs = query(ORDER_SELECT_ALL);
            while (rs.next()) {
                int idOrder = rs.getInt(COLUMN_ID_ORDER);
                int idUser = rs.getInt(COLUMN_ID_USER);
                String phone = rs.getString(COLUMN_PHONE);
                String address = rs.getString(COLUMN_ADDRESS);
                String fullName = rs.getString(COLUMN_FULL_NAME);
                Date dateCreated = rs.getDate(COLUMN_DATE_CREATED);
                int status = rs.getInt(COLUMN_STATUS);
                int totalAmount = rs.getInt(COLUMN_TOTAL_AMOUNT);
                UserDAO userDao = new UserDAO();
                UserModel user = userDao.selectById(idUser);
                list.add(new OrderModel(idOrder, phone, address, fullName, dateCreated, status, totalAmount, user));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    @Override
    public OrderModel selectById(int idOrder) {
        OrderModel orderModel = null;
        try {
            Connection connection = getConnection();
            ResultSet rs = query(ORDER_SELECT_BY_ID, idOrder);
            while (rs.next()) {
                int idUser = rs.getInt(COLUMN_ID_USER);
                String phone = rs.getNString(COLUMN_PHONE);
                String address = rs.getString(COLUMN_ADDRESS);
                String fullName = rs.getString(COLUMN_FULL_NAME);
                Date dateCreated = rs.getDate(COLUMN_DATE_CREATED);
                int status = rs.getInt(COLUMN_STATUS);
                int totalAmount = rs.getInt(COLUMN_TOTAL_AMOUNT);
                UserDAO userDAO = new UserDAO();
                UserModel userModel = userDAO.selectById(idOrder);
                orderModel = new OrderModel(idOrder, phone, address, fullName, dateCreated, status, totalAmount, userModel);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return orderModel;
    }

    @Override
    public OrderModel selectByIdUser(int idUser) {
        OrderModel orderModel = null;
        try {
            Connection connection = getConnection();
            ResultSet rs = query(ORDER_SELECT_BY_ID_USER, idUser);
            while (rs.next()) {
                int idOrder = rs.getInt(COLUMN_ID_ORDER);
                String phone = rs.getNString(COLUMN_PHONE);
                String address = rs.getString(COLUMN_ADDRESS);
                String fullName = rs.getString(COLUMN_FULL_NAME);
                Date dateCreated = rs.getDate(COLUMN_DATE_CREATED);
                int status = rs.getInt(COLUMN_STATUS);
                int totalAmount = rs.getInt(COLUMN_TOTAL_AMOUNT);
                UserDAO userDAO = new UserDAO();
                UserModel userModel = userDAO.selectById(idUser);
                orderModel = new OrderModel(idOrder, phone, address, fullName, dateCreated, status, totalAmount, userModel);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return orderModel;
    }

    @Override
    public boolean insert(OrderModel orderModel) {
        boolean rs = false;
        try {
            Connection connection = getConnection();
            update(ORDER_INSERT,
                    orderModel.getUserModel().getIdUser(),
                    orderModel.getPhone(),
                    orderModel.getAddress(),
                    orderModel.getFullName(),
                    orderModel.getDateCreated(),
                    orderModel.getStatus(),
                    orderModel.getTotalAmount()
            );
            rs = true;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return rs;
    }

    @Override
    public boolean update(OrderModel orderModel) {
        boolean rs = false;
        try {
            Connection connection = getConnection();
            update(ORDER_UPDATE,
                    orderModel.getPhone(),
                    orderModel.getAddress(),
                    orderModel.getFullName(),
                    orderModel.getDateCreated(),
                    orderModel.getStatus(),
                    orderModel.getTotalAmount(),
                    orderModel.getIdOrder()
            );
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return rs;
    }

    @Override
    public boolean updateStatus(int idOrder, int statusOrder) {
        boolean rs = false;
        try {
            Connection connection = getConnection();
            update(ORDER_UPDATE_STATUS,
                    statusOrder,
                    idOrder
            );
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return rs;
    }

    @Override
    public boolean delete(OrderModel orderModel) {
        boolean rs = false;
        try {
            Connection connection = getConnection();
            update(ORDER_DELETE, orderModel.getIdOrder());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return rs;
    }
}
