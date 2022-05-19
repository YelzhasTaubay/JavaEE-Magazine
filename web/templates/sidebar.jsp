<%@ page import="com.shop.entities.Users" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Users userData= (Users) request.getAttribute("USER_DATA");
    if (userData!=null){
    %>
    <div class="list-group">
     <a href="home" class="list-group-item list-group-item-action">
<%
    out.print(userData.getFullNAme());
%>
     </a>
        <a href="home" class="list-group-item list-group-item-action">
            My Profile
        </a>
        <a href="basket" class="list-group-item list-group-item-action">My Basket</a>
        <a href="logout" class="list-group-item list-group-item-action alert">Logout</a>
    </div>
<%
    }else {
        String password=request.getParameter("password");
        if (password!=null){
%>
    <div class="alert alert-danger" role="alert">
        Incorrect password
    </div>
<%
    }
%>
<%
    String user=request.getParameter("user");
    if (user!=null){

%>
    <div class="alert alert-danger" role="alert">
        User doesn't exist!
    </div>
<%
    }
%>
<%
    String uncomplete=request.getParameter("uncomplete");
    if (uncomplete!=null){
%>
    <div class="alert alert-danger" role="alert">
        Complete form!
    </div>
<%
    }
%>
    <form action="/signin" method="post">
        <div class="form-group">
            <input type="email" class="form-control" placeholder="Email" name="email">
        </div>
        <div class="form-group">
            <input type="password" class="form-control" placeholder="Password" name="password">
        </div>
        <div class="form-group form-check">
            <input type="checkbox" class="form-check-input" value="remember" name="remember">
            <label class="form-check-label">Remember</label>
        </div>
        <button type="submit" class="btn btn-primary">Sign In</button>
        <a href="signup" class="btn btn-light float-right">Sign Up</a>
    </form>
<%
    }
%>