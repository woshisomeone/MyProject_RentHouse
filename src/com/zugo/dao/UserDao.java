package com.zugo.dao;

import com.zugo.domain.User;
import com.zugo.domain.UserWithHouse;

import java.sql.SQLException;
import java.util.List;

public interface UserDao {
    public void addUser(User user) throws SQLException;
    public void updateUser(User user)throws SQLException;
    public User queryUserByPhone(String phone)throws SQLException;
    List<UserWithHouse> queryGoodUser()throws SQLException;
    User queryUserById(String user_id)throws SQLException;
}

