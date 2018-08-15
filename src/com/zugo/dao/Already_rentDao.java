package com.zugo.dao;

import com.zugo.domain.Already_rent;

import java.sql.SQLException;
import java.util.List;

public interface Already_rentDao {
    public void insert(Already_rent already_rent)throws SQLException;
    public List<Already_rent> query(String user_id)throws SQLException;
}
