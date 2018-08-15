package com.zugo.service;

import com.zugo.domain.Already_rent;

import java.util.List;

public interface Already_rentService {
    public void insert(Already_rent already_rent);
    public List<Already_rent> query(String user_id);
}
