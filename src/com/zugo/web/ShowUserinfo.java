package com.zugo.web;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.zugo.domain.House;
import com.zugo.domain.User;
import com.zugo.factory.BeanFactory;
import com.zugo.service.HouseService;
import com.zugo.service.UserService;
import com.zugo.util.FileUtil;
import com.zugo.util.UUIDUtil;


/**
 * 显示用户信息
 */
@WebServlet("/front/showUserInfo")
public class ShowUserinfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
     UserService userService=BeanFactory.getInstance("userService", UserService.class);
     
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method=request.getParameter("method");
		if("showByUser".equals(method)) {
			showUserInfo(request, response);
			}
		else if("showByHouse".equals(method))
			showByHouse(request, response);
	}

	private void showUserInfo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			User user=(User) request.getSession().getAttribute("user");
			 user=userService.findUserByPhone(user.getUser_phone());
			 request.setAttribute("userinfo", user);
			 request.getRequestDispatcher("userinfo.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private void showByHouse(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String user_id=request.getParameter("user_id");
		try {
			User user=userService.queryUserById(user_id);
			//System.out.println(user.getUser_name());
			//response.getWriter().write(user.getUser_name());
			response.getWriter().append(user.getUser_name()+","+user.getUser_phone());
		} catch (SQLException e) {
			response.getWriter().append("error");
			e.printStackTrace();
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
