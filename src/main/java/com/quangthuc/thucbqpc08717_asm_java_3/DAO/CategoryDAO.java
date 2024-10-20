package com.quangthuc.thucbqpc08717_asm_java_3.DAO;

import com.quangthuc.thucbqpc08717_asm_java_3.model.CategoryModel;
import com.quangthuc.thucbqpc08717_asm_java_3.service.CategoryInterface;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO extends DataDAO implements CategoryInterface {
    @Override
    public List<CategoryModel> selectAll() {
        List<CategoryModel> list = new ArrayList<>();
        try {
            Connection con = getConnection();
            ResultSet rs = query(CATEGORY_SELECT_ALL);
            while (rs.next()) {
                int idCategory = rs.getInt(COLUMN_ID);
                String name = rs.getString(COLUMN_NAME);
                int status = rs.getInt(COLUMN_STATUS);
                list.add(new CategoryModel(idCategory, name, status));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    @Override
    public List<CategoryModel> selectAllByStatus(int status) {
        List<CategoryModel> list = new ArrayList<>();
        try {
            Connection con = getConnection();
            ResultSet rs = query(CATEGORY_SELECT_ALL_BY_STATUS, status);
            while (rs.next()) {
                int idCategory = rs.getInt(COLUMN_ID);
                String name = rs.getString(COLUMN_NAME);
                list.add(new CategoryModel(idCategory, name, status));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    @Override
    public CategoryModel selectById(int id) {
        CategoryModel categoryModel = null;
        try {
            Connection connection = getConnection();
            ResultSet rs = query(CATEGORY_SELECT_BY_ID, id);
            while (rs.next()) {
                String name = rs.getString(COLUMN_NAME);
                int status = rs.getInt(COLUMN_STATUS);
                categoryModel = new CategoryModel(id, name, status);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return categoryModel;
    }

    @Override
    public List<CategoryModel> selectByName(String nameCategory) {
        List<CategoryModel> list = new ArrayList<>();
        try {
            Connection con = getConnection();
            ResultSet rs = query(CATEGORY_SELECT_BY_NAME, nameCategory);
            while (rs.next()) {
                int idCategory = rs.getInt(COLUMN_ID);
                String name = rs.getString(COLUMN_NAME);
                int status = rs.getInt(COLUMN_STATUS);
                list.add(new CategoryModel(idCategory, name, status));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    @Override
    public boolean insert(CategoryModel categoryModel) {
        boolean rs = false;
        try {
            Connection connection = getConnection();
            update(CATEGORY_INSERT,
                    categoryModel.getName(),
                    categoryModel.getStatus()
            );
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return rs;
    }

    @Override
    public boolean update(CategoryModel categoryModel) {
        boolean rs = false;
        try {
            Connection connection = getConnection();
            update(CATEGORY_UPDATE,
                    categoryModel.getName(),
                    categoryModel.getStatus(),
                    categoryModel.getIdCategory()
            );
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return rs;
    }

    @Override
    public boolean delete(int id) {
        boolean rs = false;
        try {
            Connection connection = getConnection();
            update(CATEGORY_DELETE, id);
            rs = true;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return rs;
    }
}
