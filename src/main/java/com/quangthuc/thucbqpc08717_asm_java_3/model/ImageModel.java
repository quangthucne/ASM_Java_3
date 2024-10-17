package com.quangthuc.thucbqpc08717_asm_java_3.model;

public class ImageModel {
    private int idImage;
    private int idProduct;
    private String nameImage;

    public ImageModel() {
    }

    public ImageModel(int idImage, int idProduct, String nameImage) {
        this.idImage = idImage;
        this.idProduct = idProduct;
        this.nameImage = nameImage;
    }

    public ImageModel(int idProduct, String nameImage) {
        this.idProduct = idProduct;
        this.nameImage = nameImage;
    }

    public int getIdImage() {
        return idImage;
    }

    public void setIdImage(int idImage) {
        this.idImage = idImage;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public String getNameImage() {
        return nameImage;
    }

    public void setNameImage(String nameImage) {
        this.nameImage = nameImage;
    }
}
