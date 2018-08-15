package com.zugo.dao.impl;

import com.zugo.dao.HouseDao;
import com.zugo.domain.House;
import com.zugo.domain.HouseWithPic;
import com.zugo.util.C3P0Util;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: skylin
 * Date: 2018-07-24
 * Time: 下午7:09
 */
public class HouseDaoImpl implements HouseDao {
    private QueryRunner runner=new QueryRunner(C3P0Util.ds);

    @Override
    public void updateStatus(String house_id,int house_status) throws SQLException {
        runner.update("update house set house_status=? where house_id=?",house_status,house_id);
    }

    @Override
    public House queryHouse(String house_id) throws SQLException {
        return runner.query("select * from house where house_id=?",new BeanHandler<House>(House.class),house_id);
    }

    /*
     *不定参数查询未租房屋
     */
    @Override
    public List<House> queryHouses(List<Map<String, Object>> params) throws SQLException {
        StringBuffer buffer=new StringBuffer();
        buffer.append("select * from house where house_status=0 ");
        if (params!=null&&params.size()>0){
            for (Map<String,Object> map:
                    params) {
                buffer.append(" and "+map.get("name")+" "+map.get("rela")+" "+map.get("value")+" ");
            }
        }
        String sql=buffer.toString();
        List<House> houses=runner.query(sql,new BeanListHandler<House>(House.class));
        return houses;
    }

    @Override
    public List<House> queryHouses(List<Map<String, Object>> params, int currentPage, int pageSize) throws SQLException {
        StringBuffer buffer=new StringBuffer();
        buffer.append("select * from house where house_status=0 ");
        if (params!=null&&params.size()>0){
            for (Map<String,Object> map:
                    params) {
                buffer.append(" and "+map.get("name")+" "+map.get("rela")+" "+map.get("value")+" ");
            }
        }
        buffer.append(" limit ?,?");
        String sql=buffer.toString();
        List<House> houses=runner.query(sql,new BeanListHandler<House>(House.class),(currentPage-1)*pageSize,pageSize);
        return houses;
    }

    @Override
    public List<House> queryHousesRand(int limit) throws SQLException {
        return runner.query("select * from house where house_status=0 order by rand() limit ?",new BeanListHandler<House>(House.class),limit);
    }


    /*xzz*/
    @Override
    public List<House> findHouseByUser(String userid) throws SQLException {
        return runner.query("select * from house where user_id =?", new BeanListHandler<House>(House.class),userid);
    }

    @Override
    public void addHouse(House house) throws SQLException {
        runner.insert("insert into house(house_id,house_name,house_area,house_rent,house_province,house_city,house_detailaddr,house_desc,house_status,house_type,user_id,publish_time) values(?,?,?,?,?,?,?,?,?,?,?,?)",
                new BeanHandler<House>(House.class),house.getHouse_id(),house.getHouse_name(),house.getHouse_area(),house.getHouse_rent(),house.getHouse_province(),
                house.getHouse_city(),house.getHouse_detailaddr(),house.getHouse_desc(),house.getHouse_status(),house.getHouse_type(),house.getUser_id(),house.getPublish_time());
    }

    @Override
    public List<HouseWithPic> findHouseWithPic(String userid) throws SQLException {
        return  runner.query(
        		"select h.*,pic.pic_path from house h,house_pic pic  "
        		+ "where h.house_id=pic.house_id and user_id=? group by house_id", 
        		new BeanListHandler<HouseWithPic>
        		(HouseWithPic.class),userid);
    }

    @Override
    public void deleteHouse(String house_id) throws SQLException {
        runner.update("delete  from house where house_id=?",house_id);
    }
    @Override
    public List<HouseWithPic> findHouseWithPicNoRent(String userid) throws SQLException {
        return  runner.query("SELECT h.*,pic_path from house h,house_pic pic where user_id=? and house_status='0' GROUP BY house_id", new BeanListHandler<HouseWithPic>(HouseWithPic.class),userid);
    }

    @Override
    public House findHouseInfoById(String house_id) throws SQLException {
        return runner.query("select * from house where house_id=?", new BeanHandler<House>(House.class),house_id);
    }

    @Override
    public void updateHouse(House house) throws SQLException {
        runner.update("update  house set house_name=?,house_area=?,house_rent=?,house_province=?,house_city=?,house_detailaddr=?,house_desc=?,house_type=?,publish_time=? where house_id=?",
                house.getHouse_name(),house.getHouse_area(),house.getHouse_rent(),house.getHouse_province(),
                house.getHouse_city(),house.getHouse_detailaddr(),house.getHouse_desc(),house.getHouse_type(),house.getPublish_time(),house.getHouse_id());
    }
}
