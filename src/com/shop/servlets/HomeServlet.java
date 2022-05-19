package com.shop.servlets;

import com.shop.db.DBManager;
import com.shop.entities.Items;
import com.shop.entities.Users;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "home", value = "/home")
public class HomeServlet extends HttpServlet {

    private DBManager connection;

    public void init() {
        connection = new DBManager();
        connection.connect();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Users user = (Users) request.getAttribute("USER_DATA");
        if (user != null) {
            if (user.getRoleId() == 1) {
                ArrayList<Items> allItems = connection.getAllItems();
                request.setAttribute("items", allItems);

                request.getRequestDispatcher("admin.jsp").forward(request, response);
            } else {
                ArrayList<Items> allItems = connection.getAllItems();
                request.setAttribute("items", allItems);

                request.getRequestDispatcher("profile.jsp").forward(request, response);
            }

        } else {
            ArrayList<Items> allItems = connection.getAllItems();
            request.setAttribute("items", allItems);

            request.getRequestDispatcher("index.jsp").forward(request, response);
        }


    }

}
