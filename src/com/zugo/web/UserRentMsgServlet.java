package com.zugo.web;

import com.zugo.domain.Already_rent;
import com.zugo.domain.House;
import com.zugo.domain.HousePic;
import com.zugo.domain.User;
import com.zugo.factory.BeanFactory;
import com.zugo.service.Already_rentService;
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

@WebServlet(name = "UserRentMsgServlet",urlPatterns = "/front/userRented")
public class UserRentMsgServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 User user=(User)request.getSession().getAttribute("user");
         String user_id=user.getUser_id();
         Already_rentService rentService= BeanFactory.getInstance("already_rentdaoservice",Already_rentService.class);
         HouseService houseService=BeanFactory.getInstance("houseservice",HouseService.class);
         HousePicService housePicService=BeanFactory.getInstance("housePicService",HousePicService.class);
         List<Already_rent> already_rents=rentService.query(user_id);
         if (already_rents.size()!=0){
             Map<House,String>renthouses=new LinkedHashMap<House, String>();
             for (Already_rent rent:
                  already_rents) {
                 renthouses.put(houseService.queryHouse(rent.getHouse_id()),rent.getRent_time());
             }
             request.setAttribute("renthouses",renthouses);//需要获取租赁信息

             //随机抽取3条信息
             Map<House,List<HousePic>> randmap=new LinkedHashMap<>();
             List<House> houses=houseService.queryHousesRand(3);
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
             request.getRequestDispatcher("userrentmsg.jsp").forward(request, response);
         }else {
             response.getWriter().write("<script>alert('您还没有租房');window.history.back(-1);</script>");
         }
    }
}
