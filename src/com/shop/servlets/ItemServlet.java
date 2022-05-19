package com.shop.servlets;

import com.shop.db.DBManager;
import com.shop.entities.Categories;
import com.shop.entities.Items;
import com.shop.entities.Users;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "items", value = "/items")
public class ItemServlet extends HttpServlet {

    private DBManager connection;
    public void init(){
        connection=new DBManager();
        connection.connect();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Users userData= (Users) request.getAttribute("USER_DATA");

        if (userData!=null){
            if (userData.getRoleId()==1){
                ArrayList<Categories> categories=connection.getAllCategories();
                request.setAttribute("categories",categories);
                ArrayList<Items> allItems=connection.getAllItems();
                request.setAttribute("items",allItems);

                request.getRequestDispatcher("items.jsp").forward(request,response);
            }else {
                request.getRequestDispatcher("403.jsp").forward(request,response);
            }

        }else {
            response.sendRedirect("/");
        }



    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String redirect="?error";
        Users user= (Users) request.getSession().getAttribute("USER_SESSION");

        if (user!=null && user.getRoleId()==1){
            String operation=request.getParameter("operation");

            if (operation!=null && operation.equals("add")){
                String name=request.getParameter("name");
                String price=request.getParameter("price");
                String amount=request.getParameter("amount");
                String category=request.getParameter("category_id");

                int priceInt=0;
                int amountInt=0;
                Long categoryId=0l;

                try {
                    priceInt=Integer.parseInt(price);
                    amountInt=Integer.parseInt(amount);
                    categoryId=Long.parseLong(category);
                }catch (Exception e){
                    e.printStackTrace();
                }

                if (name!=null && !name.equals("")){
                    connection.addItem(new Items(null,name,priceInt,amountInt,new Categories(categoryId,null),null));
                    redirect="items?success";
                }else {
                    redirect="items?error";
                }
            }else if (operation!=null && operation.equals("delete")){
                String categoryIdString=request.getParameter("id");
                Long categoryId=Long.parseLong(categoryIdString);

                connection.deleteCategory(categoryId);
                redirect="items?delete";

            }
        }
            response.sendRedirect(redirect);
    }
}
