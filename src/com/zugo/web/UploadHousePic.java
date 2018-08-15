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
@WebServlet("/front/uploadHousePic")
@MultipartConfig(maxFileSize = 5765004, fileSizeThreshold = 1000)
public class UploadHousePic extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HouseService houseService = BeanFactory.getInstance("houseService", HouseService.class);
	HousePicService housePicService = BeanFactory.getInstance("housePicService", HousePicService.class);
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		String houseid = null;
		String savepath = null;
		JSONObject jsonObject = new JSONObject();
		try {
			houseid = request.getParameter("house_id");
			if (houseid != null) {
					Collection<Part> parts = request.getParts();
					String uploadpath = "housepic";
					for (Part part : parts) {
						if (part.getSubmittedFileName() != null&&part.getSubmittedFileName()!="") {
							part = request.getPart("file");
							String header = part.getHeader("Content-Disposition");
							String filename = FileUtil.getFileName(header);
							filename = filename.replace(" ", "");
							File file = new File("E:\\Apache Software Foundation\\Tomcat 9.0\\zugo\\" + uploadpath
									+ File.separator + user.getUser_name()+ File.separator+houseid);
							file.mkdirs();
						 if(file.exists()) {
								System.out.println("已存在"+file.getPath());
							}
							savepath = user.getUser_name() + File.separator +houseid+ File.separator + filename;
							String fianlPath = "E:\\Apache Software Foundation\\Tomcat 9.0\\zugo\\" + uploadpath+ File.separator + savepath;
							part.write(fianlPath);
							String pic_id=UUIDUtil.randomUUID();
							HousePic housePic=new HousePic(pic_id, houseid, savepath);
							housePicService.uploadpic(housePic);
						}
					}
				jsonObject.put("result", "ok");
				response.getWriter().write(jsonObject.toString());
			}
		} catch (SQLException e) {
			jsonObject.put("result", "fail");
			response.getWriter().write(jsonObject.toString());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
