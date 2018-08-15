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
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "IndexServlet",urlPatterns = "/front/index")
public class IndexServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HouseService houseService= BeanFactory.getInstance("houseservice",HouseService.class);
        HousePicService housePicService=BeanFactory.getInstance("housePicService",HousePicService.class);
        Map<House,List<HousePic>>map=new LinkedHashMap<>();
        List<House> houses=houseService.queryHousesRand(6);
        if (houses.size()!=0){
            for (House house:
                 houses) {
                try {
                    map.put(house,housePicService.findHousePic(house.getHouse_id()));
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            request.setAttribute("housesWithPic",map);
            request.getRequestDispatcher("index.jsp").forward(request,response);
        }
    }
}
