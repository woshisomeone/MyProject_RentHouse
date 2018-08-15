package com.zugo.web;

import com.zugo.domain.Already_rent;
import com.zugo.domain.User;
import com.zugo.factory.BeanFactory;
import com.zugo.service.Already_rentService;
import com.zugo.service.HouseService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AddRentMsgServlet",urlPatterns = "/front/addrent")
public class AddRentMsgServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String token= (String) request.getSession().getAttribute("token");//读取进入该房屋的时间戳
        request.getSession().removeAttribute("token");//移除session token，非法访问时token为null
        if (token != null) {
            String house_id = request.getParameter("house_id");
            User user= (User) request.getSession().getAttribute("user");
            //插入租房记录
            Already_rentService rentService = BeanFactory.getInstance("already_rentdaoservice", Already_rentService.class);
            Already_rent rent = new Already_rent();
            rent.setUser_id(user.getUser_id());
            rent.setHouse_id(house_id);
            rentService.insert(rent);
            //修改房屋状态
            HouseService houseService=BeanFactory.getInstance("houseservice",HouseService.class);
            houseService.updateStatus(house_id,1);
            response.sendRedirect("userRented");
        } else {
            response.getWriter().write("<script>alert('该房源已被租');window.location.href='index'</script>");
        }
    }
}
