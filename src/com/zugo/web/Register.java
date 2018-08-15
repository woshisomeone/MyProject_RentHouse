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
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;
import com.zugo.domain.House;
import com.zugo.domain.User;
import com.zugo.factory.BeanFactory;
import com.zugo.service.HouseService;
import com.zugo.service.UserService;
import com.zugo.util.FileUtil;
import com.zugo.util.UUIDUtil;


/**
 * 注册
 */
@WebServlet("/register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
     UserService userService=BeanFactory.getInstance("userService", UserService.class);
     
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user=new User();
		try {
			BeanUtils.populate(user, request.getParameterMap());
			user.setUser_id(UUIDUtil.randomUUID());
			userService.addUser(user);
			response.getWriter().append("<script>alert('注册成功！');window.location.href='"+request.getContextPath()+"/front/index'</script>");
		} catch (SQLException | IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
