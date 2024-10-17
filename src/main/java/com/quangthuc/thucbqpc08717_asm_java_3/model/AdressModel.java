package com.quangthuc.thucbqpc08717_asm_java_3.model;

public class AdressModel {
    private int idAddress;
    private int idUser;
    private String phone;
    private String adress;
    private String fullName;

    public AdressModel() {
    }

    public AdressModel(int idAddress, int idUser, String phone, String adress, String fullName) {
        this.idAddress = idAddress;
        this.idUser = idUser;
        this.phone = phone;
        this.adress = adress;
        this.fullName = fullName;
    }

    public int getIdAddress() {
        return idAddress;
    }

    public void setIdAddress(int idAddress) {
        this.idAddress = idAddress;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }
}
