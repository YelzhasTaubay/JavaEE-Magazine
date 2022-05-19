package com.shop.servlets;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "logout", value = "/logout")
public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getSession().removeAttribute("USER_SESSION");
        Cookie[] cookies=request.getCookies();

        for (Cookie c : cookies){
            if (c.getName().equals("rememberUser")){
                c.setMaxAge(0);
                response.addCookie(c);
                break;
            }
        }
        response.sendRedirect("/");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
