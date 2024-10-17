package com.quangthuc.thucbqpc08717_asm_java_3.service;

import com.quangthuc.thucbqpc08717_asm_java_3.model.CategoryModel;

import java.util.List;

public interface CategoryInterface {
    String TABLE_NAME = "category";
    String COLUMN_ID = "id_category";
    String COLUMN_NAME = "name_category";
    String COLUMN_STATUS = "status_category";

    String CATEGORY_SELECT_ALL = String.format("SELECT * FROM %s ", TABLE_NAME);
    String CATEGORY_SELECT_BY_ID = String.format("SELECT * FROM %s WHERE %s = ?", TABLE_NAME, COLUMN_ID);
    String CATEGORY_SELECT_BY_NAME = String.format("SELECT * FROM %s WHERE %s LIKE ?", TABLE_NAME, COLUMN_NAME);
    String CATEGORY_INSERT = String.format("INSERT INTO %s (%s, %s) VALUES (?, ?) ", TABLE_NAME, COLUMN_NAME, COLUMN_STATUS);
    String CATEGORY_UPDATE = String.format("UPDATE %s SET %s = ?, %s = ? WHERE %s = ?", TABLE_NAME, COLUMN_NAME, COLUMN_STATUS, COLUMN_ID);
    String CATEGORY_DELETE = String.format("DELETE FROM %s WHERE %s = ?", TABLE_NAME, COLUMN_ID);

    public List<CategoryModel> selectAll();

    public CategoryModel selectById(int id);

    public List<CategoryModel> selectByName(String nameCategory);

    public boolean insert(CategoryModel categoryModel);

    public boolean update(CategoryModel categoryModel);

    public boolean delete(int id);

}
