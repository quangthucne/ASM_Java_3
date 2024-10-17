package com.quangthuc.thucbqpc08717_asm_java_3.model;

public class CategoryModel {
    private int idCategory;
    private String name;
    private int status;

    public CategoryModel() {

    }

    public CategoryModel(int idCategory, String name, int status) {
        this.idCategory = idCategory;
        this.name = name;
        this.status = status;
    }

    public CategoryModel(String name, int status) {
        this.name = name;
        this.status = status;
    }

    public int getIdCategory() {
        return idCategory;
    }

    public void setIdCategory(int idCategory) {
        this.idCategory = idCategory;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
