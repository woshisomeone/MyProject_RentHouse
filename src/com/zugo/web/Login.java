package com.zugo.web;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.zugo.domain.House;
import com.zugo.domain.User;
import com.zugo.factory.BeanFactory;
import com.zugo.service.HouseService;
import com.zugo.service.UserService;
import com.zugo.util.FileUtil;


/**
 * Servlet implementation class HousePicAdd
 */
@WebServlet("/front/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService userService=BeanFactory.getInstance("userService", UserService.class);
     
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user_phone=request.getParameter("user_phone");
		String user_pwd=request.getParameter("user_pwd");
		try {
			User user=userService.findUserByPhone(user_phone);
			if(user != null) {
				if(user.getUser_pwd().equals(user_pwd)) {
					request.getSession().setAttribute("user", user);
//					response.getWriter().append("<script>alert('登陆成功！');window.history.back(-1)</script>");
					response.getWriter().append(user.getUser_name());
				}else {
					response.getWriter().append("密码错误！");
				}
			}else {
				response.getWriter().append("没有该用户");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
