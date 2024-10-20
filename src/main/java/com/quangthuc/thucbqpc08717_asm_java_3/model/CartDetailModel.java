package com.quangthuc.thucbqpc08717_asm_java_3.model;

import java.util.List;

public class CartDetailModel {
    private int idCartDetail;
    private int idCart;
    private int idProduct;
    private int quantityProduct;


    private List<ProductModel> productModelList;

    public CartDetailModel() {}

    public CartDetailModel(int idCartDetail, int idCart, int idProduct, int quantityProduct) {
        this.idCartDetail = idCartDetail;
        this.idCart = idCart;
        this.idProduct = idProduct;
        this.quantityProduct = quantityProduct;
    }

    public CartDetailModel(int idCart, int idProduct, int quantityProduct) {
        this.idCart = idCart;
        this.idProduct = idProduct;
        this.quantityProduct = quantityProduct;
    }

    public CartDetailModel(int idCartDetail, int idCart, int idProduct, int quantityProduct, List<ProductModel> productModelList) {
        this.idCartDetail = idCartDetail;
        this.idCart = idCart;
        this.idProduct = idProduct;
        this.quantityProduct = quantityProduct;
        this.productModelList = productModelList;
    }

    public int getIdCartDetail() {
        return idCartDetail;
    }

    public void setIdCartDetail(int idCartDetail) {
        this.idCartDetail = idCartDetail;
    }

    public int getIdCart() {
        return idCart;
    }

    public void setIdCart(int idCart) {
        this.idCart = idCart;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public int getQuantityProduct() {
        return quantityProduct;
    }

    public void setQuantityProduct(int quantityProduct) {
        this.quantityProduct = quantityProduct;
    }

    public List<ProductModel> getProductModelList() {
        return productModelList;
    }

    public void setProductModelList(List<ProductModel> productModelList) {
        this.productModelList = productModelList;
    }
}
