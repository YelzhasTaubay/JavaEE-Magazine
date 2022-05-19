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

                <%@include file="templates/admin_sidebar.jsp"%>

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
                <form action="readitem" method="post">
                    <input type="hidden" name="id" value="<%=item.getId()%>">
                    <div class="row">
                        <div class="col-3">ID : </div>
                        <div class="col-9">
                            <%=item.getId()%>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-3">NAME : </div>
                        <div class="col-9">
                            <input type="text" class="form-control" value="<%=item.getName()%>" name="name">
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-3">PRICE : </div>
                        <div class="col-9">
                            <input type="number" class="form-control" name="price" value="<%=item.getPrice()%>">
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-3">CATEGORY : </div>
                        <div class="col-9">
                            <select name="category_id" class="form-control">
                                <%

                                    ArrayList<Categories> categories = (ArrayList<Categories>)request.getAttribute("categories");
                                    if(categories!=null){
                                        for(Categories c : categories){
                                %>
                                <option value="<%=c.getId()%>" <%=(c.getId()==item.getCategory().getId())?"selected":""%> ><%=c.getName()%></option>
                                <%
                                        }
                                    }
                                %>
                            </select>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-3">AMOUNT : </div>
                        <div class="col-9">
                            <input type="number" class="form-control" value="<%=item.getAmount()%>" name="amount">
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-3">ADDED DATE : </div>
                        <div class="col-9"><%=item.getAddedDate()%></div>
                    </div>
                    <div class="row mt-5">
                        <div class="col-12">
                            <button type="submit" class="btn btn-primary">SAVE</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>
<%@include file="templates/footer.jsp"%>
</body>
</html>
