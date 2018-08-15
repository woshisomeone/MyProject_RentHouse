package com.zugo.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.zugo.dao.HousePicDao;
import com.zugo.domain.HousePic;
import com.zugo.service.HousePicService;

/**  
 * 类说明
 * @author xzz
 * @date 2018年7月25日下午4:56:06
 */
public class HousePicServiceImpl implements HousePicService{
	HousePicDao housePicDao=com.zugo.factory.BeanFactory.getInstance("housePicDao", HousePicDao.class);

	@Override
	public List<HousePic> findHousePic(String house_id) throws SQLException {
		return housePicDao.findHousePic(house_id);
	}

	@Override
	public void deletePic(String pic_id) throws SQLException {
		housePicDao.deletePic(pic_id);
	}

	@Override
	public void uploadpic(HousePic housePic) throws SQLException {
		housePicDao.addpic(housePic);
	}
	
	
	
}
