package com.quangthuc.thucbqpc08717_asm_java_3.model;

import java.sql.Date;

public class OrderModel {
    private int idOrder;
    private int idUser;
    private String phone;
    private String address;
    private String fullName;
    private Date dateCreated;
    private int status;
    private int totalAmount;

    private UserModel userModel;

    public OrderModel() {}

    public OrderModel(int idOrder, String phone, String address, String fullName, Date dateCreated, int status, int totalAmount, UserModel userModel) {
        this.idOrder = idOrder;
        this.phone = phone;
        this.address = address;
        this.fullName = fullName;
        this.dateCreated = dateCreated;
        this.status = status;
        this.totalAmount = totalAmount;
        this.userModel = userModel;
    }

    public OrderModel(int idOrder, int idUser, String phone, String address, String fullName, Date dateCreated, int status, int totalAmount) {
        this.idOrder = idOrder;
        this.idUser = idUser;
        this.phone = phone;
        this.address = address;
        this.fullName = fullName;
        this.dateCreated = dateCreated;
        this.status = status;
        this.totalAmount = totalAmount;
    }

    public int getIdOrder() {
        return idOrder;
    }

    public void setIdOrder(int idOrder) {
        this.idOrder = idOrder;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(int totalAmount) {
        this.totalAmount = totalAmount;
    }

    public UserModel getUserModel() {
        return userModel;
    }

    public void setUserModel(UserModel userModel) {
        this.userModel = userModel;
    }

}
