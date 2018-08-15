package com.zugo.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zugo.domain.House;
import com.zugo.domain.HousePic;
import com.zugo.domain.User;
import com.zugo.factory.BeanFactory;
import com.zugo.service.HousePicService;
import com.zugo.service.HouseService;



/**
 * 显示房屋信息
 */
@WebServlet("/front/showHouseInfo")
public class ShowHouseInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
    HouseService houseService=BeanFactory.getInstance("houseService", HouseService.class);
     HousePicService housePicService=BeanFactory.getInstance("housePicService", HousePicService.class);
     
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			 String token =System.currentTimeMillis()+"";
			  request.getSession().setAttribute("token", token);  //在服务器使用session保存token(令牌)
		     User user=(User) request.getSession().getAttribute("user");
			String house_id=request.getParameter("house_id");
			 House house=houseService.findHouseInfo(house_id);
			 List<HousePic> housePics=housePicService.findHousePic(house_id);
			 request.setAttribute("house", house);
			 request.setAttribute("housePics", housePics);
			 request.getRequestDispatcher("houseinfo.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
