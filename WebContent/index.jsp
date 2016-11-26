<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/custom.css">
<link rel="icon" href="favicon.ico" type="image/x-icon">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<title>ProjectManagement</title>
</head>
<body class="black">
<div class="container-fluid">
<%
	if(request.getAttribute("errMsg")!=null)
		
	{
		out.println("<div class='alert alert-danger'>"+request.getAttribute("errMsg")+"</div>");
	}

%>
<div class="center updown"><h1>Welcome To
<br>Project Management Portal</h1>
</div>
<div>
<img src="img/pmp.jpg" alt="project managemnt" class="customimgwidth mainheight"/>
</div>
<button type="button" class="btn btn-info btn-lg centered ltr  " data-toggle="modal" data-target="#myModal" >Login Here</button>
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" style="color:black">Login</h4>
        </div>
        <div class="modal-body">
        <form role="form" action="LoginController" method="post">
    <div class="form-group">
      <label for="email">Email:</label>
      <input type="email" class="form-control" name="username" placeholder="Enter email">
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" name="password" placeholder="Enter password">
    </div>
    <div>
    <button type="submit" class="btn btn-primary" name="submit">Submit</button>
    </div>
  </form>
</div>
</div>
 </div>
</div>
</body>
</html>