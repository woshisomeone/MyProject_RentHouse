package com.zugo.service;

import com.zugo.domain.House;
import com.zugo.domain.HouseWithPic;
import com.zugo.domain.PageBean;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface HouseService {
    public void updateStatus(String house_id,int house_status);
    public House queryHouse(String house_id);
    public List<House> queryHouses(List<Map<String,Object>> params);
    public List<House> queryHousesRand(int limit);
    public PageBean queryHouses(List<Map<String,Object>> params, int currentPage, int pageSize);



    /*xzz*/
    List<House> findHouseByUser(String userid) throws SQLException;
    void addHouse(House house) throws SQLException;
    List<HouseWithPic> findHouseWithPic(String user_id)throws SQLException;
    List<HouseWithPic> findHouseWithPicNoRent(String user_id)throws SQLException;
    House findHouseInfo(String house_id)throws SQLException;
    void updateHouse(House house)throws SQLException;
    void deleteHouse(String house_id)throws SQLException;

}
