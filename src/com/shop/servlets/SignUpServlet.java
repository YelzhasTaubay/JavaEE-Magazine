package com.shop.servlets;

import com.shop.db.DBManager;
import com.shop.entities.Users;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "signup", value = "/signup")
public class SignUpServlet extends HttpServlet {

    private DBManager connection;
    public void init(){
        connection=new DBManager();
        connection.connect();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String message="";

        String email=request.getParameter("email");
        String password=request.getParameter("password");
        String rePassword=request.getParameter("re-password");
        String fullName=request.getParameter("full_name");

        if (email!=null&&!email.trim().equals("")&&password!=null&&!password.trim().equals("")&&rePassword!=null&&!rePassword.trim().equals("")){

            if (password.equals(rePassword)){
                Users exixts=connection.getUser(new Users(null,email,null,null,0));

                if (exixts==null){
                    connection.addUser(new Users(null,email,password,fullName,2));
                    message="success";
                }else {
                    message="exists";
                }
            }else {
                message="mismatch";
            }
        }else {
            message="uncomplete";
        }
        response.sendRedirect("signup?"+message);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
