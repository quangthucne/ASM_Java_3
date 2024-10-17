package com.quangthuc.thucbqpc08717_asm_java_3.DAO;

import com.quangthuc.thucbqpc08717_asm_java_3.model.ImageModel;
import com.quangthuc.thucbqpc08717_asm_java_3.model.ProductModel;
import com.quangthuc.thucbqpc08717_asm_java_3.service.ProductInterface;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO extends DataDAO implements ProductInterface {
    // query all
    @Override
    public List<ProductModel> selectAll() {
        List<ProductModel> list = new ArrayList<>();
        try {
            Connection con = getConnection();

            ResultSet rs = query(PRODUCT_SELECT_ALL);
            while (rs.next()){
                //info SQl
                int idProduct = rs.getInt(COLUMN_ID_PRODUCT);
                int idCategory = rs.getInt(COLUMN_ID_CATEGORY);
                String nameCategory = rs.getString(COLUMN_NAME_CATEGORY);
                String nameImage = rs.getString(COLUMN_NAME_IMAGE);
                String name = rs.getString(COLUMN_NAME);
                String shortDesc = rs.getString(COLUMN_SHORT_DESC);
                String detail = rs.getString(COLUMN_DETAIL);
                int quantity = rs.getInt(COLUMN_QUANTITY);
                int price = rs.getInt(COLUMN_PRICE);
                Date dateCreated = rs.getDate(COLUMN_DATE_CREATED);
                int status = rs.getInt(COLUMN_STATUS);
                //img
                ImageModel imageModel = new ImageModel(idProduct, nameImage);
                list.add(new ProductModel(idProduct, idCategory, name, shortDesc, detail, quantity, price, dateCreated, status, imageModel));

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    @Override
    public ProductModel selectById(int id) {
        ProductModel productModel = null;
        try {
            Connection con = getConnection();
            ResultSet rs = query(PRODUCT_SELECT_BY_ID, id);
            while (rs.next()){
                int idCategory = rs.getInt(COLUMN_ID_CATEGORY);
                String name = rs.getString(COLUMN_NAME);
                String shortDesc = rs.getString(COLUMN_SHORT_DESC);
                String detail = rs.getString(COLUMN_DETAIL);
                int quantity = rs.getInt(COLUMN_QUANTITY);
                int price = rs.getInt(COLUMN_PRICE);
                Date dateCreated = rs.getDate(COLUMN_DATE_CREATED);
                int status = rs.getInt(COLUMN_STATUS);
                ImageDAO imageDAO = new ImageDAO();
                List<ImageModel> images = imageDAO.selectByProductId(id);
                productModel = new ProductModel(id, idCategory, name, shortDesc, detail, quantity, price, dateCreated, status, images);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return productModel;
    }

    @Override
    public int insert(ProductModel productModel) {

        int generatedID = -1;
        try {
            Connection con = getConnection();
            PreparedStatement statement = getConnection().prepareStatement(PRODUCT_INSERT, PreparedStatement.RETURN_GENERATED_KEYS);
            statement.setInt(1, productModel.getIdCategory());
            statement.setString(2, productModel.getName());
            statement.setString(3, productModel.getShortDesc());
            statement.setString(4, productModel.getDetail());
            statement.setInt(5, productModel.getQuantity());
            statement.setInt(6, productModel.getPrice());
            statement.setInt(7, productModel.getStatus());

            int rowsAffected = statement.executeUpdate();
            if (rowsAffected > 0) {
                ResultSet rs = statement.getGeneratedKeys();
                if (rs.next()) {
                    generatedID = rs.getInt(1);
                }
                rs.close();
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return generatedID;
    }

    @Override
    public boolean update(ProductModel productModel) {
        boolean rs = false;
        try {
            Connection con = getConnection();
            update(PRODUCT_UPDATE,
                    productModel.getIdCategory(),
                    productModel.getName(),
                    productModel.getShortDesc(),
                    productModel.getDetail(),
                    productModel.getPrice(),
                    productModel.getStatus(),
                    productModel.getIdProduct()
            );
            rs = true;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return rs;
    }

    @Override
    public boolean delete(int id) {
        boolean rs = false;
        try {
            Connection con = getConnection();
            update(PRODUCT_DELETE, id);
            rs = true;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return rs;
    }

    @Override
    public List<ProductModel> selectByName(String name) {
        List<ProductModel> list = new ArrayList<>();
        try {
            Connection con = getConnection();
            System.out.println(query(PRODUCT_SELECT_BY_NAME,  "%"+ name + "%"));
            ResultSet rs = query(PRODUCT_SELECT_BY_NAME,  "%"+ name + "%");
            while (rs.next()){
                int idProduct = rs.getInt(COLUMN_ID_PRODUCT);
                int idCategory = rs.getInt(COLUMN_ID_CATEGORY);
                String shortDesc = rs.getString(COLUMN_SHORT_DESC);
                String detail = rs.getString(COLUMN_DETAIL);
                int quantity = rs.getInt(COLUMN_QUANTITY);
                int price = rs.getInt(COLUMN_PRICE);
                Date dateCreated = rs.getDate(COLUMN_DATE_CREATED);
                int status = rs.getInt(COLUMN_STATUS);
                ImageDAO imageDAO = new ImageDAO();
                List<ImageModel> images = imageDAO.selectByProductId(idProduct);
                list.add(new ProductModel(idProduct, idCategory, name, shortDesc, detail, quantity, price, dateCreated, status, images));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return list;
    }
}