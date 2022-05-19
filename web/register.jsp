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
            <div class="col-6 offset-3">
                <%
                    String success = request.getParameter("success");
                    if(success!=null){
                %>
                <div class="alert alert-success" role="alert">
                    Registration completed successfully!
                </div>
                <%
                    }
                %>
                <%
                    String mismatch = request.getParameter("mismatch");
                    if(mismatch!=null){
                %>
                <div class="alert alert-danger" role="alert">
                    Password Mismatch!
                </div>
                <%
                    }
                %>
                <%
                    String exists = request.getParameter("exists");
                    if(exists!=null){
                %>
                <div class="alert alert-danger" role="alert">
                    User exists!
                </div>
                <%
                    }
                %>
                <%
                    String uncomplete = request.getParameter("uncomplete");
                    if(uncomplete!=null){
                %>
                <div class="alert alert-danger" role="alert">
                    Complete form!
                </div>
                <%
                    }
                %>
                <form action="/signup" method="post">
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Email</label>
                        <div class="col-sm-8">
                            <input type="email" class="form-control" placeholder="Email" name="email">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Password</label>
                        <div class="col-sm-8">
                            <input type="password" class="form-control" placeholder="Password" name="password">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Confirm Password</label>
                        <div class="col-sm-8">
                            <input type="password" class="form-control" placeholder="Confirm Password" name="re-password">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Email</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" placeholder="Full Name" name="full_name">
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col-sm-12">
                            <button type="submit" class="btn btn-primary">Sing Up</button>
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

