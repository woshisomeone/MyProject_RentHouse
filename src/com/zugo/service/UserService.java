package com.zugo.service;

import java.sql.SQLException;
import java.util.List;

import com.zugo.domain.User;
import com.zugo.domain.UserWithHouse;

/**  
 * 用户服务层
 * @author xzz
 * @date 2018年7月24日下午8:50:03
 */
public interface UserService {
	User findUserByPhone(String phone) throws SQLException;
	void addUser(User user) throws SQLException;
	void updateUser(User user)throws SQLException;
	List<UserWithHouse> queryGoodUser()throws SQLException;
	User queryUserById(String user_id)throws SQLException;
}