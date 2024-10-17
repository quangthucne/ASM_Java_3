package com.quangthuc.thucbqpc08717_asm_java_3.service;



import com.quangthuc.thucbqpc08717_asm_java_3.model.OrderDetailModel;

import java.util.List;

public interface OrderDetailInterface {
    // thông tin của table databse
    String TABLE_NAME = "order_detail";
    String COLUMN_ID_ORDER_DETAIL = "id_order_detail";
    String COLUMN_ID_ORDER = "id_order";
    String COLUMN_ID_PRODUCT = "id_product";
    String COLUMN_QUANTITY = "quantity";
    String COLUMN_PRICE = "price";

    // query String
    String ORDER_DETAIL_SELECT_ALL = String.format("SELECT * FORM %s ", TABLE_NAME);
    String ORDER_DETAIL_SELECT_BY_ID = String.format("SELECT * FROM %s WHERE %s", TABLE_NAME, COLUMN_ID_ORDER_DETAIL);
    String ORDER_DETAIL_SELECT_BY_ID_PRODUCT = String.format("SELECT * FROM %s WHERE %s", TABLE_NAME, COLUMN_ID_PRODUCT);
    String ORDER_DETAIL_INSERT = String.format("INSERT INTO %s (%s, %s, %s, %s) VALUES (?, ?, ?, ? )", TABLE_NAME, COLUMN_ID_ORDER, COLUMN_ID_PRODUCT,  COLUMN_PRICE, COLUMN_QUANTITY);
    String ORDER_DETAIL_UPDATE = String.format("UPDATE %s SET %s = ?, %s = ?, %s = ?, %s = ? WHERE %s = ?", TABLE_NAME, COLUMN_ID_ORDER, COLUMN_ID_PRODUCT,  COLUMN_PRICE, COLUMN_QUANTITY, COLUMN_ID_ORDER_DETAIL);
    String ORDER_DETAIL_DELETE = String.format("DELETE FROM %s WHERE %s = ?", TABLE_NAME, COLUMN_ID_ORDER);

    // method

    public List<OrderDetailModel> selectAll();

    public OrderDetailModel selectById(int idOrderDetail);

    public OrderDetailModel selectByIdProduct(int idProduct);

    public boolean insert(OrderDetailModel orderDetailModel);

    public boolean update(OrderDetailModel orderDetailModel);

    public boolean delete(OrderDetailModel orderDetailModel);

}
