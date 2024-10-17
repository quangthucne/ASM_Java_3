package com.quangthuc.thucbqpc08717_asm_java_3.service;

import com.quangthuc.thucbqpc08717_asm_java_3.model.OrderModel;

import java.util.List;

public interface OrderInterface {
    String TABLE_NAME = "[order]";
    String COLUMN_ID_ORDER = "id_order";
    String COLUMN_ID_USER = "id_user";
    String COLUMN_PHONE = "phone";
    String COLUMN_ADDRESS = "address";
    String COLUMN_FULL_NAME = "full_name";
    String COLUMN_DATE_CREATED = "date_created";
    String COLUMN_STATUS = "status_order";
    String COLUMN_TOTAL_AMOUNT = "total_amount";

    String ORDER_SELECT_ALL = String.format("SELECT * FROM %s ", TABLE_NAME);
    String ORDER_SELECT_BY_ID = String.format("SELECT * FROM %s WHERE %s=?", TABLE_NAME, COLUMN_ID_ORDER);
    String ORDER_SELECT_BY_ID_USER = String.format("SELECT * FROM %s WHERE %s=?", TABLE_NAME, COLUMN_ID_USER);
    String ORDER_INSERT = String.format("INSERT INTO %s (%s, %s, %s, %s, %s, %s, %s) VALUES (?, ?, ?, ?, ?, ?, ?)", TABLE_NAME, COLUMN_ID_USER, COLUMN_PHONE, COLUMN_ADDRESS, COLUMN_FULL_NAME, COLUMN_DATE_CREATED, COLUMN_STATUS, COLUMN_TOTAL_AMOUNT);
    String ORDER_UPDATE = String.format("UPDATE %s SET  %s = ?, %s = ?, %s = ?, %s = ?, %s = ?, %s = ? WHERE %s=?", TABLE_NAME, COLUMN_PHONE, COLUMN_ADDRESS, COLUMN_FULL_NAME, COLUMN_DATE_CREATED, COLUMN_STATUS, COLUMN_TOTAL_AMOUNT, COLUMN_ID_ORDER);
    String ORDER_UPDATE_STATUS = String.format("UPDATE %s SET %s = ? WHERE %s=?", TABLE_NAME, COLUMN_STATUS, COLUMN_ID_ORDER);
    String ORDER_DELETE = String.format("DELETE FROM %s WHERE %s=?", TABLE_NAME, COLUMN_ID_ORDER);


    public List<OrderModel> selectAll();

    public OrderModel selectById(int idOrder);

    public OrderModel selectByIdUser(int idUser);

    public boolean insert(OrderModel orderModel);

    public boolean update(OrderModel orderModel);

    public boolean updateStatus(int idOrder, int statusOrder);

    public boolean delete(OrderModel orderModel);
}
