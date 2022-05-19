<%@ page import="com.shop.entities.Users" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.shop.entities.Categories" %>
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
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/" style="text-decoration: none;">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Categories</li>
                    </ol>
                </nav>
                <form action="/categories" method="post">
                    <input type="hidden" value="add" name="operation">
                    <div class="form-row align-items-center">
                        <div class="col-sm-3 my-1">
                            <label class="sr-only">Category Name</label>
                            <input type="text" class="form-control" placeholder="Category Name" name="name">
                        </div>
                        <div class="col-auto my-1">
                            <button type="submit" class="btn btn-primary">ADD CATEGORY</button>
                        </div>
                    </div>
                </form>
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Name</th>
                        <th scope="col">Delete</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        ArrayList<Categories> categories = (ArrayList<Categories>)request.getAttribute("categories");

                        if(categories!=null){

                            for(Categories c : categories){

                    %>
                    <tr>
                        <th scope="row"><%=c.getId()%></th>
                        <td><%=c.getName()%></td>
                        <td>
                            <button class="btn btn-danger btn-sm" onclick="toDeleteCategory(<%=c.getId()%>)">DELETE</button>
                        </td>
                    </tr>
                    <%
                            }
                        }
                    %>
                    </tbody>
                </table>
                <form action="/categories" method="post" id="delete_form">
                    <input type="hidden" value="delete" name="operation">
                    <input type="hidden" name="id" id = "delete_id">
                </form>
                <script type="text/javascript">
                    function toDeleteCategory(id) {

                        var conf = confirm("Are you sure?");
                        if(conf){

                            document.getElementById("delete_id").value = id;
                            document.getElementById("delete_form").submit();

                        }
                    }
                </script>
            </div>
        </div>
    </div>
</section>
<%@include file="templates/footer.jsp"%>
</body>
</html>
