package com.zugo.web;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import com.zugo.domain.House;
import com.zugo.domain.HousePic;
import com.zugo.domain.HouseWithPic;
import com.zugo.domain.User;
import com.zugo.domain.UserWithHouse;
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
@WebServlet("/front/findGoodUser")
public class FindGoodUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 UserService userService=BeanFactory.getInstance("userService", UserService.class);
	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			List<UserWithHouse> userWithHouse=userService.queryGoodUser();
			request.setAttribute("userWithHouse", userWithHouse);
			request.getRequestDispatcher("agents.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
