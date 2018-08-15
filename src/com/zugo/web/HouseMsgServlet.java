package com.zugo.web;

import com.zugo.domain.House;
import com.zugo.domain.HousePic;
import com.zugo.factory.BeanFactory;
import com.zugo.service.HousePicService;
import com.zugo.service.HouseService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "HouseMsgServlet",urlPatterns = "/front/housemsg")
public class HouseMsgServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String houseId=request.getParameter("houseId");
        String user_phone=request.getParameter("user_phone");
        HouseService houseService= BeanFactory.getInstance("houseservice",HouseService.class);
        HousePicService housePicService=BeanFactory.getInstance("housePicService",HousePicService.class);
        House house=houseService.queryHouse(houseId);

        List<HousePic>housePics = null;
        try {
            housePics=housePicService.findHousePic(houseId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Map<House,List<HousePic>> map=new LinkedHashMap<>();
        List<House> houses=houseService.queryHousesRand(4);
        if (houses.size()!=0){
            for (House _house:
                    houses) {
                try {
                    map.put(_house,housePicService.findHousePic(_house.getHouse_id()));
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            request.setAttribute("housesWithPic",map);
            request.setAttribute("house",house);
        	request.setAttribute("user_phone", user_phone);
            request.setAttribute("housePics",housePics);
            request.getRequestDispatcher("single.jsp").forward(request,response);
        }
    }
}
