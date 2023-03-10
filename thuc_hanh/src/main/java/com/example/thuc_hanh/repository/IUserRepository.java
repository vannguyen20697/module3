package com.example.thuc_hanh.repository;

import com.example.thuc_hanh.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserRepository {
    // sao cai co cai khong
    public void insertUser(User user) throws SQLException;

    public User selectUser(int id);

    public List<User> selectAllUsers();

    public boolean deleteUser(int id) throws SQLException;

    public boolean updateUser(User user) throws SQLException;

    public List<User> selectUserByCountry(String country);

    public List<User> sortUserByName();

    User getUserById(int id);

    void insertUserStore(User user) throws SQLException;
}
