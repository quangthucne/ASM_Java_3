package com.quangthuc.thucbqpc08717_asm_java_3.service;

import com.quangthuc.thucbqpc08717_asm_java_3.model.AdressModel;

import java.util.List;

public interface AdressInterface {
    String TABLE_NAME = "address";
    String COLUMN_ID_ADRESS = "id_adress";
    String COLUMN_ID_USER = "id_user";
    String COLUMN_PHONE = "phone";
    String COLUMN_ADDRESS = "address";
    String COLUMN_FULL_NAME = "full_name";

    String ADRESS_SELECT_ALL = String.format("SELECT * FROM %s", TABLE_NAME);
    String ADRESS_SELECT_BY_ID = String.format("SELECT * FROM %s WHERE %s = ?", TABLE_NAME, COLUMN_ID_ADRESS);
    String ADRESS_SELECT_BY_ID_USER = String.format("SELECT * FROM %s WHERE %s = ?", TABLE_NAME, COLUMN_ID_USER);
    String ADRESS_INSERT = String.format("INSERT INTO %s (%s, %s, %s, %s) VALUES (?, ?, ?, ?)", TABLE_NAME, COLUMN_ID_USER, COLUMN_PHONE, COLUMN_ADDRESS, COLUMN_FULL_NAME);
    String ADRESS_UPDATE = String.format("UPDATE %s SET %s = ?, SET %s = ?, SET %s = ?, SET %s = ?  WHERE %s = ?", TABLE_NAME, COLUMN_ID_USER, COLUMN_PHONE, COLUMN_ADDRESS, COLUMN_FULL_NAME, COLUMN_ID_ADRESS);
    String ADRESS_DELETE = String.format("DELETE FROM %s WHERE %s = ?", TABLE_NAME, COLUMN_ID_ADRESS);

    public List<AdressModel> selectAll();

    public AdressModel selectById(int id);

    public List<AdressModel> selectByIdUser(int idUser);

    public boolean insert(AdressModel adressModel);

    public boolean update(AdressModel adressModel);

    public boolean delete(AdressModel adressModel);
}
