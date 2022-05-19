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

@WebServlet(name = "readitem", value = "/readitem")
public class ReadItemServlet extends HttpServlet {

    private DBManager connection;
    public void init(){
        connection=new DBManager();
        connection.connect();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Users userData= (Users) request.getAttribute("USER_DATA");
        String jspPage="404.jsp";

        String itemId=request.getParameter("id");
        Long id=null;

        try {
            id=Long.parseLong(itemId);
        }catch (Exception e){
            e.printStackTrace();
        }

        Items item=null;

        if (id!=null){
            item=connection.getItem(id);
        }

        if (item!=null){

            if (userData!=null){

                if (userData!=null){

                    if (userData.getRoleId()==1){

                        ArrayList<Categories> categories=connection.getAllCategories();
                        request.setAttribute("categories",categories);
                        request.setAttribute("item",item);
                        request.getRequestDispatcher("edititem.jsp").forward(request,response);

                    }else {

                        request.setAttribute("item",item);
                        request.getRequestDispatcher("readitem.jsp").forward(request,response);

                    }

                }else {

                    request.setAttribute("item",item);
                    request.getRequestDispatcher("readitem.jsp").forward(request,response);

                }
            }
        }else {
            request.getRequestDispatcher("404.jsp").forward(request,response);
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String itemId=request.getParameter("id");
        Long id=null;
        try {
            id=Long.parseLong(itemId);
        }catch (Exception e){
            e.printStackTrace();
        }

        String name=request.getParameter("name");
        int amount=Integer.parseInt(request.getParameter("amount"));
        int price=Integer.parseInt(request.getParameter("price"));
        Long categoryId=Long.parseLong(request.getParameter("category_id"));

        connection.saveItem(new Items(id,name,price,amount,new Categories(categoryId,null),null));
        response.sendRedirect("readitem?id="+id);
    }
}
