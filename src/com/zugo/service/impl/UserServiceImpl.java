package com.zugo.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.zugo.dao.HouseDao;
import com.zugo.dao.UserDao;
import com.zugo.domain.User;
import com.zugo.domain.UserWithHouse;
import com.zugo.service.UserService;

/**  
 * 用户服务具体实现
 * @author xzz
 * @date 2018年7月24日下午8:51:33
 */
public class UserServiceImpl implements UserService{
	UserDao userDao=com.zugo.factory.BeanFactory.getInstance("userDao", UserDao.class);
	
	@Override
	public User findUserByPhone(String phone) throws SQLException {
		return userDao.queryUserByPhone(phone);
	}

	@Override
	public void addUser(User user) throws SQLException {
		userDao.addUser(user);
	}

	@Override
	public void updateUser(User user) throws SQLException {
		userDao.updateUser(user);
	}


	@Override
	public List<UserWithHouse> queryGoodUser() throws SQLException {
		return userDao.queryGoodUser();
	}

	@Override
	public User queryUserById(String user_id) throws SQLException {
		return  userDao.queryUserById(user_id);
	}

}
