package com.zugo.service.impl;

import com.zugo.dao.Already_rentDao;
import com.zugo.domain.Already_rent;
import com.zugo.factory.BeanFactory;
import com.zugo.service.Already_rentService;

import java.sql.SQLException;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: skylin
 * Date: 2018-07-26
 * Time: 下午5:23
 */
public class Already_rentServiceImpl implements Already_rentService{
    Already_rentDao already_rentDao= BeanFactory.getInstance("already_rentdao",Already_rentDao.class);
    @Override
    public void insert(Already_rent already_rent) {
        try {
            already_rentDao.insert(already_rent);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Already_rent> query(String user_id) {
        try {
            return already_rentDao.query(user_id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
