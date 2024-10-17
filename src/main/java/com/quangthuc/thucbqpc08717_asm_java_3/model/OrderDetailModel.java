package com.quangthuc.thucbqpc08717_asm_java_3.model;

public class OrderDetailModel {
    private int idOrderDetail;
    private int idOrder;
    private int idProduct;
    private int price;
    private int quantity;

    public OrderDetailModel() {
    }

    public OrderDetailModel(int idOrderDetail, int idOrder, int idProduct, int price, int quantity) {
        this.idOrderDetail = idOrderDetail;
        this.idOrder = idOrder;
        this.idProduct = idProduct;
        this.price = price;
        this.quantity = quantity;
    }

    public int getIdOrderDetail() {
        return idOrderDetail;
    }

    public void setIdOrderDetail(int idOrderDetail) {
        this.idOrderDetail = idOrderDetail;
    }

    public int getIdOrder() {
        return idOrder;
    }

    public void setIdOrder(int idOrder) {
        this.idOrder = idOrder;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
