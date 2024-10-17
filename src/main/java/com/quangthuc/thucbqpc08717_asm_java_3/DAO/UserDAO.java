package com.quangthuc.thucbqpc08717_asm_java_3.DAO;

import com.quangthuc.thucbqpc08717_asm_java_3.model.AdressModel;
import com.quangthuc.thucbqpc08717_asm_java_3.model.UserModel;
import com.quangthuc.thucbqpc08717_asm_java_3.service.UserInterface;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO extends DataDAO implements UserInterface {
    @Override
    public List<UserModel> selectAll() {
        List<UserModel> list = new ArrayList<>();
        try {
            Connection con = getConnection();
            ResultSet rs = query(USER_SELECT_ALL);
            while (rs.next()) {
                int id = rs.getInt(COLUMN_ID_USER);
                String fullName = rs.getString(COLUMN_FULL_NAME);
                String userName = rs.getString(COLUNM_USER_NAME);
                String password = rs.getString(COLUMN_PASSWORD);
                int gender = rs.getInt(COLUMN_GENDER);
                int role = rs.getInt(COLUMN_ROLE);
                String email = rs.getString(COLUMN_EMAIL);
                String phone = rs.getString(COLUMN_PHONE);
                Date dateCreated = rs.getDate(COLUMN_DATE_CREATED);
                int status = rs.getInt(COLUMN_STATUS);
                list.add(new UserModel(id, fullName, userName, password, gender, role, email, phone, dateCreated, status));
            }
            con.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return list;

    }

    @Override
    public UserModel selectById(int id) {
        UserModel userModel = null;
        try(Connection con = getConnection()) {
            ResultSet rs = query(USER_SELECT_BY_ID, id);
            while (rs.next()) {
                int idUser = rs.getInt(COLUMN_ID_USER);
                String fullName = rs.getString(COLUMN_FULL_NAME);
                String userName = rs.getString(COLUNM_USER_NAME);
                String password = rs.getString(COLUMN_PASSWORD);
                int gender = rs.getInt(COLUMN_GENDER);
                int role = rs.getInt(COLUMN_ROLE);
                String email = rs.getString(COLUMN_EMAIL);
                String phone = rs.getString(COLUMN_PHONE);
                Date dateCreated = rs.getDate(COLUMN_DATE_CREATED);
                int status = rs.getInt(COLUMN_STATUS);
                AdressDAO adressDAO = new AdressDAO();
                List<AdressModel> adressModelList = adressDAO.selectByIdUser(idUser);
                userModel = new UserModel(idUser, fullName, userName, password, gender, role, email, phone, dateCreated, status, adressModelList);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return userModel;
    }

    @Override
    public UserModel selectByUsername(String username) {
        UserModel userModel = null;
        try(Connection con = getConnection()) {
            ResultSet rs = query(USER_SELECT_BY_USERNAME, username);
            System.out.println(USER_SELECT_BY_USERNAME);
            while (rs.next()) {
                int idUser = rs.getInt(COLUMN_ID_USER);
                String fullName = rs.getString(COLUMN_FULL_NAME);
                String userName = rs.getString(COLUNM_USER_NAME);
                String password = rs.getString(COLUMN_PASSWORD);
                int gender = rs.getInt(COLUMN_GENDER);
                int role = rs.getInt(COLUMN_ROLE);
                String email = rs.getString(COLUMN_EMAIL);
                String phone = rs.getString(COLUMN_PHONE);
                Date dateCreated = rs.getDate(COLUMN_DATE_CREATED);
                int status = rs.getInt(COLUMN_STATUS);
                AdressDAO adressDAO = new AdressDAO();
                List<AdressModel> adressModelList = adressDAO.selectByIdUser(idUser);
                userModel = new UserModel(idUser, fullName, userName, password, gender, role, email, phone, dateCreated, status, adressModelList);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return userModel;
    }

    @Override
    public boolean insert(UserModel userModel) {
        boolean rs = false;
        try{
            Connection con = getConnection();
            update(USER_INSERT,
                    userModel.getFullName(),
                    userModel.getUserName(),
                    userModel.getPassword(),
                    userModel.getGender(),
                    userModel.getRole(),
                    userModel.getEmail(),
                    userModel.getPhone(),
                    userModel.getStatus()
            );
            rs = true;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return rs;
    }

    @Override
    public boolean update(UserModel userModel) {
        boolean rs = false;
        try {
            Connection con = getConnection();
            update(USER_UPDATE_MANAGER,
                    userModel.getFullName(),
                    userModel.getGender(),
                    userModel.getEmail(),
                    userModel.getPhone(),
                    userModel.getStatus(),
                    userModel.getIdUser()
            );
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return rs;
    }

    @Override
    public boolean delete(int idUser) {
        boolean rs = false;
        try {
            Connection con = getConnection();
            update(USER_DELETE, idUser);
            rs = true;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return rs;
    }

    @Override
    public boolean updatePassword(UserModel userModel) {
        return false;
    }
}