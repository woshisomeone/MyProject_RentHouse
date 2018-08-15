package com.zugo.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.zugo.dao.HousePicDao;
import com.zugo.domain.HousePic;
import com.zugo.util.C3P0Util;

/**  
 * 类说明
 * @author xzz
 * @date 2018年7月25日下午4:54:06
 */
public class HousePicDaoImpl implements HousePicDao{
	 private QueryRunner runner=new QueryRunner(C3P0Util.ds);
	 
	 @Override
		public List<HousePic> findHousePic(String house_id) throws SQLException {
			return runner.query("select * from house_pic where house_id=?", new BeanListHandler<HousePic>(HousePic.class),house_id);
		}

	@Override
	public void deletePic(String pic_id) throws SQLException {
		runner.update("delete  from house_pic where pic_id=?",pic_id);
	}

	@Override
	public void addpic(HousePic housePic) throws SQLException {
		runner.update("insert into house_pic(pic_id,house_id,pic_path) values(?,?,?)",housePic.getPic_id(),housePic.getHouse_id(),housePic.getPic_path());
	}

}
