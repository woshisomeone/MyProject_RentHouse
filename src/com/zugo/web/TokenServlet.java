package com.zugo.web;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "TokenServlet",urlPatterns = "/front/token")
public class TokenServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String token=""+System.currentTimeMillis();
        request.getSession().setAttribute("token",token);
        String houseId=request.getParameter("houseId");
        String user_phone=request.getParameter("user_phone");
        response.sendRedirect("housemsg?houseId="+houseId+"&user_phone="+user_phone);
    }
}
