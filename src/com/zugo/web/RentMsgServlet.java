package com.zugo.web;

import com.zugo.domain.House;
import com.zugo.domain.PageBean;
import com.zugo.factory.BeanFactory;
import com.zugo.service.HouseService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RentMsgServlet",urlPatterns = "/front/rentmsg")
public class RentMsgServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String house_id=request.getParameter("house_id");
        String rent_time=request.getParameter("rent_time");
        HouseService houseService= BeanFactory.getInstance("houseservice",HouseService.class);
        House house=houseService.queryHouse(house_id);
        if (house!=null){
            request.setAttribute("house",house);
            request.setAttribute("rent_time",rent_time);
            request.getRequestDispatcher("rentMsg.jsp").forward(request,response);
        }
    }
}
