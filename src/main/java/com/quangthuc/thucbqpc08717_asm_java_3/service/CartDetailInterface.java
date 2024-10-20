package com.quangthuc.thucbqpc08717_asm_java_3.service;


import com.quangthuc.thucbqpc08717_asm_java_3.model.CartDetailModel;

import java.util.List;

public interface CartDetailInterface {
    String TABLE_NAME = "cart_detail";
    String COLUMN_ID_CART_DETAIL = "id_cart_detail";
    String COLUMN_ID_CART = "id_cart";
    String COLUMN_ID_PRODUCT = "id_product";
    String COLUMN_ID_QUANTITY_PRODUCT = "quantity_product";

    String CART_DETAIL_SELECT_ALL = String.format("SELECT * FROM %s", TABLE_NAME);
    String CART_DETAIL_SELECT_BY_ID = String.format("SELECT * FROM %s WHERE %s = ?", TABLE_NAME, COLUMN_ID_CART_DETAIL);
    String CART_DETAIL_SELECT_BY_ID_CART = String.format("SELECT * FROM %s WHERE %s = ?", TABLE_NAME, COLUMN_ID_CART);
    String CART_DEATIL_INSERT = String.format("INSERT INTO %s (%s, %s, %s) VALUES (?, ?, ?)", TABLE_NAME, COLUMN_ID_CART, COLUMN_ID_PRODUCT, COLUMN_ID_QUANTITY_PRODUCT);
    String CART_DETAIL_UPDATE = String.format("UPDATE %s SET %s = ?, SET %s = ?, SET %s = ? WHERE %s = ?", TABLE_NAME, COLUMN_ID_CART, COLUMN_ID_PRODUCT, COLUMN_ID_QUANTITY_PRODUCT, COLUMN_ID_CART_DETAIL);
    String CART_DETAIL_DELETE = String.format("DELETE FROM %s WHERE %s = ?", TABLE_NAME, COLUMN_ID_CART_DETAIL);


    public List<CartDetailModel> selectAll();

    public CartDetailModel selectById(String idCartDetail);

    public CartDetailModel selectByIdCart(String idCart);

    public boolean insert(CartDetailModel cartDetailModel);

    public boolean update(CartDetailModel cartDetailModel);

    public boolean delete(CartDetailModel cartDetailModel);
}
