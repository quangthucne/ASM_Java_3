package com.quangthuc.thucbqpc08717_asm_java_3.service;

import com.quangthuc.thucbqpc08717_asm_java_3.model.ImageModel;

import java.util.List;

public interface ImageInterface {
    String TABLE_NAME = "image";
    String COLUMN_ID_IMAGE = "id_image";
    String COLUMN_ID_PRODUCT = "id_product";
    String COLUMN_NAME_IMAGE = "name_image";

    String IMAGE_SELECT_ALL = String.format("SELECT * FROM %s",TABLE_NAME);
    String IMAAGE_SELECT_BY_ID = String.format("SELECT * FROM %s WHERE %s = ?",TABLE_NAME, COLUMN_ID_IMAGE);
    String IMAGE_SELECT_BY_ID_PRODUCT = String.format("SELECT * FROM %s WHERE %s = ?",TABLE_NAME, COLUMN_ID_PRODUCT);
    String IMAGE_INSERT = String.format("INSERT INTO %s (%s, %s) VALUES (?, ?)",TABLE_NAME,COLUMN_ID_PRODUCT, COLUMN_NAME_IMAGE);
    String IMAGE_UPDATE = String.format("UPDATE %s SET %s = ?, %s = ? WHERE %s = ?", TABLE_NAME, COLUMN_ID_PRODUCT, COLUMN_NAME_IMAGE, COLUMN_ID_IMAGE);
    String IMAGE_DELETE = String.format("DELETE FROM %s WHERE %s = ?", TABLE_NAME, COLUMN_ID_IMAGE);
    String IMAGE_DELETE_PRODUCT = String.format("DELETE FROM %s WHERE %s = ?", TABLE_NAME, COLUMN_ID_PRODUCT);

    public List<ImageModel> selectAll();

    public ImageModel selectById(String id);

    public List<ImageModel> selectByProductId(int idProduct);

    public boolean insert(ImageModel image);

    public boolean update(ImageModel image);

    public boolean delete(int idImage);

    public boolean deleteByProductId(int idProduct);
}
