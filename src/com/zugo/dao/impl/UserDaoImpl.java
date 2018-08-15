package com.zugo.dao.impl;

import com.zugo.dao.UserDao;
import com.zugo.domain.User;
import com.zugo.domain.UserWithHouse;
import com.zugo.util.C3P0Util;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: skylin
 * Date: 2018-07-23
 * Time: 下午9:38
 */
public class UserDaoImpl implements UserDao {
    private QueryRunner runner=new QueryRunner(C3P0Util.ds);

    @Override
    public void addUser(User user) throws SQLException {
        runner.update("insert into user (user_id,user_name,user_pwd,user_phone) values (?,?,?,?)",
                user.getUser_id(),user.getUser_name(),user.getUser_pwd(),user.getUser_phone());
    }

	@Override
	public User queryUserByPhone(String phone) throws SQLException {
		return runner.query("select * from user where user_phone=?", new BeanHandler<User>(User.class),phone);
	}

	@Override
	public void updateUser(User user) throws SQLException {
		runner.update("update user set user_name=?,user_pwd=?,user_phone=? where user_id=?",user.getUser_name(),user.getUser_pwd(),user.getUser_phone(),user.getUser_id());
	}

	@Override
	public List<UserWithHouse> queryGoodUser() throws SQLException {
		return runner.query("SELECT u.*,t.num house_num ,COUNT(house_status) rent_num,COUNT(house_status)/t.num rate from house h,user u,(SELECT user_id,COUNT(house_id) num from house GROUP BY user_id) t where house_status=1 and h.user_id=u.user_id and u.user_id=t.user_id GROUP BY user_id HAVING COUNT(h.house_status)/t.num<1 limit 0,10"
				, new BeanListHandler<>(UserWithHouse.class));
	}

	@Override
	public User queryUserById(String user_id) throws SQLException {
		return runner.query("select * from user where user_id =?", new BeanHandler<>(User.class),user_id);
	}
}
