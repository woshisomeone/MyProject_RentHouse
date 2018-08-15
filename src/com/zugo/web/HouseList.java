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
import com.zugo.factory.BeanFactory;
import com.zugo.service.HousePicService;
import com.zugo.service.HouseService;
import com.zugo.util.FileUtil;
import com.zugo.util.UUIDUtil;

import net.sf.json.JSONObject;



/**
 * Servlet implementation class HousePicAdd
 */
@WebServlet("/front/houseList")
public class HouseList extends HttpServlet {
	private static final long serialVersionUID = 1L;
     HouseService houseService=BeanFactory.getInstance("houseService", HouseService.class);
     HousePicService housePicService=BeanFactory.getInstance("housePicService", HousePicService.class);
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method=request.getParameter("method");
		if("showOwn".equals(method))
			showOwnhouseList(request, response);
		else if("showOther".equals(method))
			showOtherhouseList(request, response);
	}

	private void showOwnhouseList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user=(User) request.getSession().getAttribute("user");
		try {
				List<HouseWithPic> houselist=houseService.findHouseWithPic(user.getUser_id());
				if(houselist!=null) {
				request.setAttribute("houses", houselist);
				request.getRequestDispatcher("houselist.jsp").forward(request, response);
				}
			}catch (SQLException e) {
				 e.printStackTrace();
		}
	}

	private void showOtherhouseList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String user_id= request.getParameter("user_id");
		String user_phone= request.getParameter("user_phone");
		try {
				List<HouseWithPic> houselist=houseService.findHouseWithPicNoRent(user_id);
				if(houselist!=null) {
				request.setAttribute("houses", houselist);
				request.setAttribute("user_phone", user_phone);
				request.getRequestDispatcher("houselistShowOther.jsp").forward(request, response);
				}
			}catch (SQLException e) {
				 e.printStackTrace();
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
