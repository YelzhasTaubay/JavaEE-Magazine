package com.shop.servlets;

import com.shop.db.DBManager;
import com.shop.entities.Users;
import org.apache.commons.codec.digest.DigestUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "signin", value = "/signin")
public class SignInServlet extends HttpServlet {

    private DBManager connection;
    public void init(){
        connection=new DBManager();
        connection.connect();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String message="";

        String email=request.getParameter("email");
        String password=request.getParameter("password");

        if (email!=null&&!email.trim().equals("")&&password!=null&&!password.trim().equals("")){
            Users user=connection.getUser(new Users(null,email,null,null,0));

            if (user!=null){
                if (user.getPassword().equals(password)){

                    request.getSession().setAttribute("USER_SESSION",user);
                    String remember=request.getParameter("remember");

                    if (remember!=null && remember.equals("remember")){
                        String rememberUserToken= DigestUtils.sha1Hex(user.getEmail()+user.getPassword()+"bitlab");
                        Cookie cookie=new Cookie("remember",rememberUserToken);
                        cookie.setMaxAge(3600000);
                        response.addCookie(cookie);
                    }

                }else {
                    message="password";
                }
            }else {
                message="user";
            }
        }else {
            message="uncomplete";
        }

        response.sendRedirect("/?"+message);

    }
}
