package com.zugo.dao.impl;

import com.zugo.dao.Already_rentDao;
import com.zugo.domain.Already_rent;
import com.zugo.util.C3P0Util;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: skylin
 * Date: 2018-07-26
 * Time: 下午4:22
 */
public class Already_rentDaoImpl implements Already_rentDao{
    private QueryRunner runner=new QueryRunner(C3P0Util.ds);
    @Override
    public void insert(Already_rent already_rent) throws SQLException {
        runner.update("insert into already_rent (house_id,user_id,rent_time) values (?,?,current_date())",already_rent.getHouse_id(),already_rent.getUser_id());
    }

    @Override
    public List<Already_rent> query(String user_id) throws SQLException {
        return runner.query("select * from already_rent where user_id=?",new BeanListHandler<Already_rent>(Already_rent.class),user_id);
    }
}
