package com.shop.servlets;

import com.shop.db.DBManager;
import com.shop.entities.Baskets;
import com.shop.entities.Items;
import com.shop.entities.Users;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "basket", value = "/basket")
public class BasketServlet extends HttpServlet {

    private DBManager connection;
    public void init(){
        connection=new DBManager();
        connection.connect();
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Users userData= (Users) request.getAttribute("USER_DATA");

        if (userData!=null){
            ArrayList<Baskets> baskets=connection.getBasketByUser(userData);
            request.setAttribute("baskets",baskets);
            request.getRequestDispatcher("basket.jsp").forward(request,response);
        }else {
            response.sendRedirect("/");
        }


    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String redirect="?error";
        Users user= (Users) request.getSession().getAttribute("USER_SESSION");

        if (user!=null){
            String operation=request.getParameter("operation");

            if (operation!=null && operation.equals("add")){
                String itemIdString=request.getParameter("item_id");

                Long itemId=null;

                try {
                    itemId=Long.parseLong(itemIdString);
                }catch (Exception e){
                    e.printStackTrace();
                }

                if (itemId!=null){
                    Items item=connection.getItem(itemId);

                    if (item!=null){
                        connection.addBasket(new Baskets(null,user,item));
                        redirect="readitem?id="+itemId;

                    }else {
                        redirect="/";
                    }

                }else {
                    redirect="/";
                }

            }else if (operation!=null && operation.equals("delete")){
                String idString=request.getParameter("id");
                    Long id=Long.parseLong(idString);
                    connection.deletBasket(id);
                    redirect="basket";
            }
        }
        response.sendRedirect(redirect);
    }



}
