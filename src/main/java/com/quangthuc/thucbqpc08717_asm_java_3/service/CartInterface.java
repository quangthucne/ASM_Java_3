package com.quangthuc.thucbqpc08717_asm_java_3.service;



import com.quangthuc.thucbqpc08717_asm_java_3.model.CartModel;

import java.util.List;

public interface CartInterface {
    String TABLE_NAME = "cart";
    String COLUMN_ID_CART = "id_cart";
    String COLUMN_ID_USER = "id_user";

    String CART_SELECT_ALL = String.format("SELECT * FROM %s", TABLE_NAME);
    String CART_SELECT_BY_ID = String.format("SELECT * FROM %s WHERE %s = ?", TABLE_NAME, COLUMN_ID_CART);
    String CART_SELECT_BY_ID_USER = String.format("SELECT * FROM %s WHERE %s = ?", TABLE_NAME, COLUMN_ID_USER);
    String CART_INSERT  = String.format("INSERT INTO %s (%s) VALUES (?)", TABLE_NAME, COLUMN_ID_USER);


    public List<CartModel> selectAll();


    public CartModel selectById(int idCart);

    public CartModel selectByIdUser(int idUser);

    public boolean insert(int idUser);

}
