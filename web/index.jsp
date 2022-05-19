<%@ page import="java.util.ArrayList" %>
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
        <div class="row">

          <%
            ArrayList<Items> items = (ArrayList<Items>)request.getAttribute("items");
            if(items!=null){
              for(Items item : items){

          %>

          <div class="card ml-2 mb-2" style="width: 18rem;">
            <img class="card-img-top" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%22286%22%20height%3D%22180%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20286%20180%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_165d80be8d9%20text%20%7B%20fill%3Argba(255%2C255%2C255%2C.75)%3Bfont-weight%3Anormal%3Bfont-family%3AHelvetica%2C%20monospace%3Bfont-size%3A14pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_165d80be8d9%22%3E%3Crect%20width%3D%22286%22%20height%3D%22180%22%20fill%3D%22%23777%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%22107.1875%22%20y%3D%2296.2390625%22%3E286x180%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" alt="Card image cap">
            <div class="card-body">
              <h5 class="card-title"><%=item.getName()%></h5>
              <p class="card-text">
                For <b><%=item.getPrice()%> KZT</b> <br>
                Amount : <%=item.getAmount()%> <br>
                Category : <%=item.getCategory().getName()%><br>
                Added at : <%=item.getAddedDate()%>
              </p>
              <a href="/readitem?id=<%=item.getId()%>" class="btn btn-primary">Details</a>
            </div>
          </div>


          <%
              }
            }

          %>

        </div>
      </div>
    </div>
  </div>
</section>

</body>
<%@include file="templates/footer.jsp"%>
</html>
