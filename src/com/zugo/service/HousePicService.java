package com.zugo.service;

import java.sql.SQLException;
import java.util.List;

import com.zugo.domain.HousePic;

/**  
 * 类说明
 * @author xzz
 * @date 2018年7月25日下午4:55:23
 */
public interface HousePicService {
	List<HousePic> findHousePic(String house_id)throws SQLException;
	void deletePic(String pic_id)throws SQLException;
	 void uploadpic(HousePic housePic) throws SQLException;
}
