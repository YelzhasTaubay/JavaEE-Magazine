<%@ page import="com.shop.entities.Users" %>
<div class="list-group">
    <a href="home" class="list-group-item list-group-item-action">
        <%
            Users userData = (Users)request.getAttribute("USER_DATA");
            out.print(userData.getFullNAme());
        %>
    </a>
    <a href="categories" class="list-group-item list-group-item-action">Categories</a>
    <a href="items" class="list-group-item list-group-item-action">Items</a>
    <a href="accounting" class="list-group-item list-group-item-action">My Accounting</a>
    <a href="logout" class="list-group-item list-group-item-action alert">Logout</a>
</div>
