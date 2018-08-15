package com.zugo.web;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.Collection;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import com.zugo.domain.House;
import com.zugo.domain.HousePic;
import com.zugo.domain.User;
import com.zugo.factory.BeanFactory;
import com.zugo.service.HousePicService;
import com.zugo.service.HouseService;
import com.zugo.service.UserService;
import com.zugo.util.FileUtil;
import com.zugo.util.UUIDUtil;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class HousePicAdd
 */
@WebServlet("/publishHouse")
public class PublishHouse extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HouseService houseService = BeanFactory.getInstance("houseService", HouseService.class);
	HousePicService housePicService = BeanFactory.getInstance("housePicService", HousePicService.class);

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user=(User) request.getSession().getAttribute("user");
		House house = new House();
		try {
			BeanUtils.populate(house, request.getParameterMap());
			house.setHouse_id(UUIDUtil.randomUUID());
			house.setHouse_status(0);
			house.setUser_id(user.getUser_id());
			house.setPublish_time(new Date());
			houseService.addHouse(house);
			HousePic housePic=new HousePic(UUIDUtil.randomUUID(),house.getHouse_id(),"default.jpg");
			housePicService.uploadpic(housePic);
			response.getWriter().append("<script>window.location.href='"+request.getContextPath()+"/front/houseList?method=showOwn'</script>");
		}catch(SQLException|IllegalAccessException|InvocationTargetException e){
		e.printStackTrace();
		response.getWriter().append("<script>alert('发布失败！');window.location.href='" + request.getContextPath()+ "/front/uploadhouse.jsp'</script>");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
