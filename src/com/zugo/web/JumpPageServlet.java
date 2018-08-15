package com.zugo.web;

import com.zugo.domain.House;
import com.zugo.domain.HousePic;
import com.zugo.domain.PageBean;
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
import java.util.*;

@WebServlet(name = "JumpPageServlet",urlPatterns = "/front/jump")
public class JumpPageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pageSize=4;
        int currentPage=1;
        HouseService houseService=BeanFactory.getInstance("houseservice",HouseService.class);
        HousePicService housePicService=BeanFactory.getInstance("housePicService",HousePicService.class);
        List<Map<String,Object>> params= (List<Map<String, Object>>) request.getSession().getAttribute("params");
        String ps=request.getParameter("pageSize");
        if (ps!=null){
            pageSize=Integer.parseInt(ps);
        }
        String cp=request.getParameter("currentPage");
        if (cp!=null){
            currentPage= Integer.parseInt(cp);
        }
            Map<House,List<HousePic>> housemap=new LinkedHashMap<>();
        PageBean pageBean=houseService.queryHouses(params,currentPage,pageSize);
        for (House house:
             pageBean.getHouses()) {
            try {
                housemap.put(house,housePicService.findHousePic(house.getHouse_id()));
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        request.setAttribute("pb",pageBean);
        request.setAttribute("houseMap",housemap);
        Map<House,List<HousePic>> randmap=new LinkedHashMap<>();
        List<House> houses=houseService.queryHousesRand(2);
        if (houses.size()!=0){
            for (House _house:
                 houses) {
                try {
                    randmap.put(_house,housePicService.findHousePic(_house.getHouse_id()));
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            request.setAttribute("randHouse",randmap);
            System.out.println(randmap);
        }
        request.getRequestDispatcher("forrent.jsp").forward(request,response);
    }
}
