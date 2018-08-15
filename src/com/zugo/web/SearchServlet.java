package com.zugo.web;

import com.zugo.domain.House;
import com.zugo.domain.PageBean;
import com.zugo.factory.BeanFactory;
import com.zugo.service.HouseService;
import com.zugo.util.MapUtil;
import org.apache.commons.collections.MapUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet(name = "SearchServlet",urlPatterns = "/front/search")
public class SearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String province=request.getParameter("province");
        String city=request.getParameter("city");
        String type=request.getParameter("type");
        String rent=request.getParameter("rent");
        List<Map<String,Object>> params=new ArrayList<Map<String,Object>>();
        if (!(("".equals(province))||province==null)){
            params.add(MapUtil.addCondition("house_province","=","\'"+province+"\'"));
        }
        if (!(("".equals(city))||city==null)){
            params.add(MapUtil.addCondition("house_city","=","\'"+city+"\'"));
        }
        if (!(("".equals(type))||type==null)){
            params.add(MapUtil.addCondition("house_type","=","\'"+type+"\'"));
        }
        if (!(("".equals(rent))||rent==null)){
            params.add(MapUtil.addCondition("house_rent","<=",rent));
        }
        request.getSession().setAttribute("params",params);
        request.getRequestDispatcher("jump").forward(request,response);
        /*for (House house:
                houses) {
            System.out.println(house.getHouse_province()+" "+house.getHouse_city()+" "+house.getHouse_type());
        }*/


    }
}
