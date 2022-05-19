<%@ page import="com.shop.entities.Users" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.shop.entities.Categories" %>
<%@ page import="com.shop.entities.Items" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <%@include file="templates/head.jsp"%>
</head>
<body>
<%@include file="templates/navbar.jsp"%>
<section class="mt-5">
    <div class="container pt-5">
        <div class="row">
            <div class="col-3">

                <%@include file="templates/sidebar.jsp"%>

            </div>
            <div class="col-9">
                <%
                    Items item = (Items) request.getAttribute("item");
                %>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/" style="text-decoration: none;">Home</a></li>
                        <li class="breadcrumb-item"><a href="/" style="text-decoration: none;">Items</a></li>
                        <li class="breadcrumb-item active" aria-current="page"><%=item.getName()%></li>
                    </ol>
                </nav>
                <form action="basket" method="post">
                    <input type="hidden" name="operation" value="add">
                    <input type="hidden" name="item_id" value="<%=item.getId()%>">
                    <div class="row">
                        <div class="col-3">NAME : </div>
                        <div class="col-9"><%=item.getName()%></div>
                    </div>
                    <div class="row">
                        <div class="col-3">PRICE : </div>
                        <div class="col-9"><%=item.getPrice()%> KZT</div>
                    </div>
                    <div class="row">
                        <div class="col-3">CATEGORY : </div>
                        <div class="col-9"><%=item.getCategory().getName()%></div>
                    </div>
                    <div class="row">
                        <div class="col-3">AMOUNT : </div>
                        <div class="col-9"><%=item.getAmount()%></div>
                    </div>
                    <div class="row">
                        <div class="col-3">ADDED DATE : </div>
                        <div class="col-9"><%=item.getAddedDate()%></div>
                    </div>
                    <%
                        if(userData!=null){
                    %>
                    <div class="row mt-5">
                        <div class="col-12">
                            <button type="submit" class="btn btn-primary">ADD TO BASKET</button>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </form>
            </div>
        </div>
    </div>
</section>
<%@include file="templates/footer.jsp"%>
</body>
</html>
