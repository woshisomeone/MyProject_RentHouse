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
@WebServlet("/front/updateHouseInfo")
public class UpdateHouseInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
     HousePicService housePicService=BeanFactory.getInstance("housePicService", HousePicService.class);
     HouseService houseService = BeanFactory.getInstance("houseService", HouseService.class);
     
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 /*boolean b = isRepeatSubmit(request,response);//判断用户是否是重复提交
        if(b==true){
        	System.out.println("jj");
            response.sendRedirect("houseList?method=showOwn");
        }else */{
			String oper = request.getParameter("oper");
			switch (oper) {
			case "deleteHouse":
				deleteHouse(request, response);
				break;
			case "updateHouse":
			  updateHouse(request, response);
			   break;
			case "deletePic":
				deletePic(request, response);
				break;
			default:
				break;
			}
        }
	}

	private void deletePic(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String str=request.getParameter("str");
		try {
			str=str.substring(1, str.length()-1);
			String[] piclist=str.split("/");
			for( String pic_id:piclist) {
				housePicService.deletePic(pic_id);
			}
			response.getWriter().append("yes");
			}catch (SQLException e) {
				 e.printStackTrace();
		}
		
	}

	private void updateHouse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String house_id=request.getParameter("house_id");
		if(house_id!=null) {
			House house=new House();
			try {
				BeanUtils.populate(house, request.getParameterMap());
				house.setPublish_time(new Date());
				house.setHouse_id(house_id);
				houseService.updateHouse(house);
				request.getRequestDispatcher("showHouseInfo").forward(request, response);
			} catch (IllegalAccessException | InvocationTargetException | SQLException e1) {
				e1.printStackTrace();
			}
		}
	}

	private void deleteHouse(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String house_id=request.getParameter("house_id");
		if(house_id!=null) {
			try {
				houseService.deleteHouse(house_id);
				response.getWriter().append("删除成功！");
			} catch (SQLException e1) {
				response.getWriter().append("删除失败！");
				e1.printStackTrace();
			}
		}
	}
    private boolean isRepeatSubmit(HttpServletRequest request,HttpServletResponse response) throws IOException {
        String client_token = request.getParameter("token");
        if(client_token==null){
            return true;
        }
        String server_token = (String) request.getSession().getAttribute("token");
        if(server_token==null){
            return true;
        }
        if(!client_token.equals(server_token)){
            return true;
        }
        return false;
    }

}
