package com.quangthuc.thucbqpc08717_asm_java_3.model;

public class CartModel {
    private int idCart;
    private int userId;

    public CartModel() {
    }

    public CartModel(int idCart, int userId) {
        this.idCart = idCart;
        this.userId = userId;
    }

    public int getIdCart() {
        return idCart;
    }

    public void setIdCart(int idCart) {
        this.idCart = idCart;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}
