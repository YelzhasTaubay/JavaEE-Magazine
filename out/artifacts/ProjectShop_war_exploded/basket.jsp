<%@ page import="java.util.ArrayList" %>
<%@ page import="com.shop.entities.*" %>
<%@ page import="com.shop.entities.Baskets" %>
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
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/" style="text-decoration: none;">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">My Basket</li>
          </ol>
        </nav>
        <table class="table table-hover">
          <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">Name</th>
            <th scope="col">Price</th>
            <th scope="col">Remove</th>
          </tr>
          </thead>
          <tbody>
          <%

            ArrayList<Baskets> baskets = (ArrayList<Baskets>)request.getAttribute("baskets");

            int total = 0;

            if(baskets!=null){

              for(Baskets b : baskets){

          %>
          <tr>
            <th scope="row"><%=b.getId()%></th>
            <td><%=b.getItem().getName()%></td>
            <td><%=b.getItem().getPrice()%> KZT</td>
            <td><button class="btn btn-danger btn-sm" onclick="toDeleteItem(<%=b.getId()%>)">DELETE</button></td>
          </tr>
          <%
                total = total+b.getItem().getPrice();
              }
            }
          %>
          </tbody>
          <tfoot>
          <tr>
            <td colspan="4">
              <b>
                TOTAL : <%=total%> KZT
              </b>
            </td>
          </tr>
          </tfoot>
        </table>

        <form action="/basket" method="post" id="delete_form">
          <input type="hidden" value="delete" name="operation">
          <input type="hidden" name="id" id = "delete_id">
        </form>
        <script type="text/javascript">
          function toDeleteItem(id) {

            document.getElementById("delete_id").value = id;
            document.getElementById("delete_form").submit();

          }
        </script>
      </div>
    </div>
  </div>
</section>
<%@include file="templates/footer.jsp"%>
</body>
</html>
