package com.quangthuc.thucbqpc08717_asm_java_3.model;

import java.util.List;

public class CartModel {
    private int idCart;
    private int userId;

    private List<CartDetailModel> cartDetailModelList;

    public CartModel() {
    }

    public CartModel(int idCart, int userId) {
        this.idCart = idCart;
        this.userId = userId;
    }

    public CartModel(int idCart, int userId, List<CartDetailModel> cartDetailModelList) {
        this.idCart = idCart;
        this.userId = userId;
        this.cartDetailModelList = cartDetailModelList;
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

    public List<CartDetailModel> getCartDetailModelList() {
        return cartDetailModelList;
    }

    public void setCartDetailModelList(List<CartDetailModel> cartDetailModelList) {
        this.cartDetailModelList = cartDetailModelList;
    }
}
