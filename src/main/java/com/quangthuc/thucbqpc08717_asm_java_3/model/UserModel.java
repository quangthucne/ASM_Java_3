package com.quangthuc.thucbqpc08717_asm_java_3.model;

import java.sql.Date;
import java.util.List;

public class UserModel {
    private int idUser;
    private String fullName;
    private String userName;
    private String password;
    private int gender;
    private int role;
    private String email;
    private String phone;
    private Date dateCreated;
    private int status;

    private List<AdressModel> adressList;


    public UserModel(){}

    public UserModel(int idUser, String fullName, String userName, String password, int gender, int role, String email, String phone, Date dateCreated, int status) {
        this.idUser = idUser;
        this.fullName = fullName;
        this.userName = userName;
        this.password = password;
        this.gender = gender;
        this.role = role;
        this.email = email;
        this.phone = phone;
        this.dateCreated = dateCreated;
        this.status = status;
    }

    public UserModel(int idUser, String fullName, String userName, String password, int gender, int role, String email, String phone, Date dateCreated, int status, List<AdressModel> adressList) {
        this.idUser = idUser;
        this.fullName = fullName;
        this.userName = userName;
        this.password = password;
        this.gender = gender;
        this.role = role;
        this.email = email;
        this.phone = phone;
        this.dateCreated = dateCreated;
        this.status = status;
        this.adressList = adressList;
    }

    public UserModel(String fullName, String userName, String password, int gender, int role, String email, String phone, int status) {
        this.fullName = fullName;
        this.userName = userName;
        this.password = password;
        this.gender = gender;
        this.role = role;
        this.email = email;
        this.phone = phone;
        this.status = status;
    }

    public UserModel(String fullName, int gender, String email, String phone, int status, int idUser) {
        this.fullName = fullName;
        this.gender = gender;
        this.email = email;
        this.phone = phone;
        this.status = status;
        this.idUser = idUser;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
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

    public List<AdressModel> getAdressList() {
        return adressList;
    }

    public void setAdressList(List<AdressModel> adressList) {
        this.adressList = adressList;
    }
}