package com.shop.filters;


import com.shop.db.DBManager;
import com.shop.entities.Users;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*")
public class UserFilters implements Filter {

    private DBManager connection;
    public void init(FilterConfig config) throws ServletException{
        connection=new DBManager();
        connection.connect();
    }


    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request=(HttpServletRequest)req;
        HttpSession session=request.getSession();

        Users sessionTokenUser= (Users) session.getAttribute("USER_SESSION");
        if (sessionTokenUser==null){
            Cookie[] cookies=((HttpServletRequest)req).getCookies();
            for (Cookie c :cookies){
                if (c.getName().equals("remember")){
                    String token=c.getValue();
                    Users tokenUser=connection.getUser(token);
                    if (tokenUser!=null){
                        session.setAttribute("USER_SESSION",tokenUser);
                    }
                    break;
                }
            }
        }


    Users user= (Users) session.getAttribute("USER_SESSION");
    Users userData=null;

    if (user!=null){
        userData=connection.getUser(new Users(null, user.getEmail(), null,null,0));

        if (userData!=null){
            if (userData.getPassword().equals(user.getPassword())){
                req.setAttribute("USER_DATA",userData);
            }else {
                session.removeAttribute("USER_SESSION");
            }
        }else {
            session.removeAttribute("USER_SESSION");
        }
    }

    filterChain.doFilter(request,resp);
    }

    @Override
    public void destroy() {

    }
}
