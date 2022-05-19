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
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/" style="text-decoration: none;">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Items</li>
                    </ol>
                </nav>
                <form action="/items" method="post">
                    <input type="hidden" value="add" name="operation">
                    <div class="form-row align-items-center">
                        <div class="col-sm-3 my-1">
                            <input type="text" class="form-control" placeholder="Name" name="name">
                        </div>
                        <div class="col-sm-2 my-1">
                            <input type="number" class="form-control" placeholder="Price" name="price">
                        </div>

                        <div class="col-sm-3 my-1">
                            <select class="form-control" name="category_id">
                                <%
                                    ArrayList<Categories> categories = (ArrayList<Categories>)request.getAttribute("categories");
                                    if(categories!=null){
                                        for(Categories c : categories){

                                %>
                                <option value="<%=c.getId()%>">
                                    <%=c.getName()%>
                                </option>
                                <%
                                        }
                                    }
                                %>
                            </select>
                        </div>
                        <div class="col-sm-2 my-1">
                            <input type="number" class="form-control" placeholder="Amount" name="amount">
                        </div>
                        <div class="col-auto my-1">
                            <button type="submit" class="btn btn-primary">ADD ITEM</button>
                        </div>
                    </div>
                </form>
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Name</th>
                        <th scope="col">Price</th>
                        <th scope="col">Amount</th>
                        <th scope="col">Category</th>
                        <th scope="col">Added Date</th>
                        <th scope="col">Edit</th>
                        <th scope="col">Delete</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        ArrayList<Items> items = (ArrayList<Items>)request.getAttribute("items");

                        if(items!=null){

                            for(Items item : items){

                    %>
                    <tr>
                        <th scope="row"><%=item.getId()%></th>
                        <td><%=item.getName()%></td>
                        <td><%=item.getPrice()%></td>
                        <td><%=item.getAmount()%></td>
                        <td><%=item.getCategory().getName()%></td>
                        <td><%=item.getAddedDate()%></td>
                        <td><a href="/readitem?id=<%=item.getId()%>" class="btn btn-primary btn-sm">EDIT</a></td>
                        <td><button class="btn btn-danger btn-sm" onclick="toDeleteItem(<%=item.getId()%>)">DELETE</button></td>
                    </tr>
                    <%
                            }
                        }
                    %>
                    </tbody>
                </table>
                <form action="/items" method="post" id="delete_form">
                    <input type="hidden" value="delete" name="operation">
                    <input type="hidden" name="id" id = "delete_id">
                </form>
                <script type="text/javascript">
                    function toDeleteItem(id) {

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
