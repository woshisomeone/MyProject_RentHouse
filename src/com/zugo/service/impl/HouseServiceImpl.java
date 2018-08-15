package com.zugo.service.impl;

import com.zugo.dao.HouseDao;
import com.zugo.dao.impl.HouseDaoImpl;
import com.zugo.domain.House;
import com.zugo.domain.HouseWithPic;
import com.zugo.domain.PageBean;
import com.zugo.factory.BeanFactory;
import com.zugo.service.HouseService;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: skylin
 * Date: 2018-07-24
 * Time: 下午7:12
 */
public class HouseServiceImpl implements HouseService{
    private HouseDao houseDao= BeanFactory.getInstance("housedao",HouseDao.class);

    @Override
    public void updateStatus(String house_id, int house_status) {
        try {
            houseDao.updateStatus(house_id,house_status);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public House queryHouse(String house_id) {
        try {
            return houseDao.queryHouse(house_id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<House> queryHouses(List<Map<String, Object>> params){
        try {
            return houseDao.queryHouses(params);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public PageBean queryHouses(List<Map<String, Object>> params, int currentPage, int pageSize) {
        PageBean pageBean=null;
        try {
            int count=houseDao.queryHouses(params).size();
            int totalPage= (int) Math.ceil(count*1.0/pageSize);
            List<House> houses=houseDao.queryHouses(params,currentPage,pageSize);
            pageBean=new PageBean();
            pageBean.setCurrentPage(currentPage);
            pageBean.setPageSize(pageSize);
            pageBean.setTotalPage(totalPage);
            pageBean.setHouses(houses);

            return pageBean;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<House> queryHousesRand(int limit) {
        try {
            return houseDao.queryHousesRand(limit);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /*xzz*/
    @Override
    public List<House> findHouseByUser(String userid) throws SQLException {
        return houseDao.findHouseByUser(userid);
    }

    @Override
    public void addHouse(House house) throws SQLException {
        houseDao.addHouse(house);
    }

    @Override
    public List<HouseWithPic> findHouseWithPic(String user_id) throws SQLException {
        return houseDao.findHouseWithPic(user_id);

    }

    @Override
    public House findHouseInfo(String house_id) throws SQLException {
        return houseDao.findHouseInfoById(house_id);
    }

    @Override
    public void updateHouse(House house) throws SQLException {
        houseDao.updateHouse(house);
    }

    @Override
    public void deleteHouse(String house_id) throws SQLException {
        houseDao.deleteHouse(house_id);
    }
    @Override
    public List<HouseWithPic> findHouseWithPicNoRent(String user_id) throws SQLException {
        return houseDao.findHouseWithPicNoRent(user_id);
    }
}
