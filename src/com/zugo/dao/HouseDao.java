package com.zugo.dao;

import com.zugo.domain.House;
import com.zugo.domain.HouseWithPic;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: skylin
 * Date: 2018-07-24
 * Time: 下午7:07
 */
public interface HouseDao {
	  public void updateStatus(String house_id,int house_status)throws SQLException;
	    public House queryHouse(String house_id)throws SQLException;
	    public List<House> queryHousesRand(int limit) throws SQLException;
	    public List<House> queryHouses(List<Map<String,Object>> params) throws SQLException;
	    public List<House> queryHouses(List<Map<String,Object>> params,int currentPage,int pageSize) throws SQLException;



/*xzz*/
    List<House> findHouseByUser(String userid)throws SQLException;
    void addHouse(House house)throws SQLException;
    List<HouseWithPic>findHouseWithPic(String userid)throws SQLException;
    List<HouseWithPic>findHouseWithPicNoRent(String userid)throws SQLException;
    House findHouseInfoById(String house_id)throws SQLException;
    void updateHouse(House house)throws SQLException;
    void deleteHouse(String house_id)throws SQLException;
}
