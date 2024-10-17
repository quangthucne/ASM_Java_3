package com.quangthuc.thucbqpc08717_asm_java_3.DAO;

import com.quangthuc.thucbqpc08717_asm_java_3.model.ImageModel;
import com.quangthuc.thucbqpc08717_asm_java_3.service.ImageInterface;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ImageDAO extends DataDAO implements ImageInterface {
    @Override
    public List<ImageModel> selectAll() {
        List<ImageModel> list = new ArrayList<>();
        try {
            Connection con = getConnection();
            ResultSet rs = query(IMAGE_SELECT_ALL);
            while (rs.next()) {
                int idImage = rs.getInt(COLUMN_ID_IMAGE);
                int idProduct = rs.getInt(COLUMN_ID_PRODUCT);
                String nameImage = rs.getString(COLUMN_NAME_IMAGE);
                list.add(new ImageModel(idImage, idProduct, nameImage));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    @Override
    public ImageModel selectById(String id) {
        ImageModel imageModel = null;
        try {
            Connection con = getConnection();
            ResultSet rs = query(IMAAGE_SELECT_BY_ID, id);
            while (rs.next()) {
                int idImage = rs.getInt(COLUMN_ID_IMAGE);
                int idProduct = rs.getInt(COLUMN_ID_PRODUCT);
                String nameImage = rs.getString(COLUMN_NAME_IMAGE);
                imageModel = new ImageModel(idImage, idProduct, nameImage);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return imageModel;
    }

    @Override
    public List<ImageModel> selectByProductId(int idProduct) {
        List<ImageModel> list = new ArrayList<>();
        try {
            Connection con = getConnection();
            ResultSet rs = query(IMAGE_SELECT_BY_ID_PRODUCT, idProduct);
            while (rs.next()) {
                int idImage = rs.getInt(COLUMN_ID_IMAGE);
                String nameImage = rs.getString(COLUMN_NAME_IMAGE);
                list.add(new ImageModel(idImage, idProduct, nameImage));

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    @Override
    public boolean insert(ImageModel image) {
        boolean rs = false;
        try {
            Connection con = getConnection();
            update(IMAGE_INSERT,
                    image.getIdProduct(),
                    image.getNameImage()
            );
            rs = true;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return rs;
    }

    @Override
    public boolean update(ImageModel image) {
        boolean rs = false;
        try {
            Connection con = getConnection();
            update(IMAGE_UPDATE,
                    image.getIdProduct(),
                    image.getNameImage(),
                    image.getIdImage()
            );
            rs = true;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return rs;
    }

    @Override
    public boolean delete(int idImage) {
        boolean rs = false;
        try {
            Connection con = getConnection();
            update(IMAGE_DELETE, idImage);
            rs = true;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return rs;
    }

    @Override
    public boolean deleteByProductId(int idProduct) {
        boolean rs = false;
        try {
            Connection con = getConnection();
            update(IMAGE_DELETE_PRODUCT, idProduct);
            rs = true;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return rs;
    }
}
