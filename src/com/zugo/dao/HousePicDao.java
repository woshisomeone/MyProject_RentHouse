package com.zugo.dao;

import java.sql.SQLException;
import java.util.List;

import com.zugo.domain.HousePic;

/**  
 * 类说明
 * @author xzz
 * @date 2018年7月25日下午4:53:19
 */
public interface HousePicDao {
	List<HousePic> findHousePic(String house_id)throws SQLException;
	void deletePic(String pic_id) throws SQLException;
	void addpic(HousePic housePic) throws SQLException;
}
