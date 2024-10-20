package com.quangthuc.thucbqpc08717_asm_java_3.service;

import com.quangthuc.thucbqpc08717_asm_java_3.model.UserModel;

import java.util.List;

public interface UserInterface {
    String TABLE_NAME = "[user]";
    String COLUMN_ID_USER = "id_user";
    String COLUMN_FULL_NAME = "full_name";
    String COLUNM_USER_NAME = "username";
    String COLUMN_PASSWORD = "password";
    String COLUMN_GENDER = "gender";
    String COLUMN_ROLE = "role";
    String COLUMN_EMAIL = "email";
    String COLUMN_PHONE = "phone";
    String COLUMN_DATE_CREATED = "date_created";
    String COLUMN_STATUS = "status_user";
    String DATE_INSERT = "GETDATE()";

    String USER_SELECT_ALL = String.format("SELECT * FROM %s WHERE %s = 0", TABLE_NAME, COLUMN_ROLE);
    String USER_SELECT_BY_ID = String.format("SELECT * FROM %s WHERE %s = ?", TABLE_NAME, COLUMN_ID_USER);
    String USER_SELECT_BY_USERNAME = String.format("SELECT * FROM %s WHERE %s=? AND %s = 1", TABLE_NAME, COLUNM_USER_NAME, COLUMN_STATUS);
    String USER_INSERT = String.format("INSERT INTO %s (%s, %s, %s, %s, %s, %s, %s, %s, %s) VALUES (?, ?, ?, ?, ?, ?, ?, %s, ?)",TABLE_NAME, COLUMN_FULL_NAME, COLUNM_USER_NAME, COLUMN_PASSWORD, COLUMN_GENDER, COLUMN_ROLE, COLUMN_EMAIL, COLUMN_PHONE, COLUMN_DATE_CREATED, COLUMN_STATUS, DATE_INSERT);
    String USER_UPDATE = String.format("UPDATE %s SET %s = ?, %s = ?, %s = ?, %s = ?, %s = ?, %s = ?, %s = ?, %s = ? WHERE %s=?", TABLE_NAME, COLUMN_FULL_NAME, COLUNM_USER_NAME, COLUMN_PASSWORD, COLUMN_GENDER, COLUMN_ROLE, COLUMN_EMAIL, COLUMN_PHONE, COLUMN_STATUS, COLUMN_ID_USER);
    String USER_DELETE = String.format("DELETE FROM %s WHERE %s = ?", TABLE_NAME, COLUMN_ID_USER);
    String USER_UPDATE_MANAGER = String.format("UPDATE %s SET %s = ?, %s = ?, %s = ?, %s = ?, %s = ? WHERE %s=?", TABLE_NAME, COLUMN_FULL_NAME, COLUMN_GENDER, COLUMN_EMAIL, COLUMN_PHONE, COLUMN_STATUS, COLUMN_ID_USER);


    public List<UserModel> selectAll();

    public UserModel selectById(int id);

    public UserModel selectByUsername(String username);

    public boolean insert(UserModel userModel);

    public boolean update(UserModel userModel);

    public boolean delete(int idUser);

    public boolean updatePassword(UserModel userModel);
}
