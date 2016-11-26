<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"><meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/custom.css">
<link rel="icon" href="favicon.ico" type="image/x-icon">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<%
if(session.getAttribute("usr_name")==null){
	  response.sendRedirect("index.jsp");
	}else{
	  
	
 %>
<jsp:include page="navigation.jsp"></jsp:include>
      <div style="margin-top:5%">
<form role="form" method="post" action="ClientRequestController">
	<div class="form-group col-md-6">
		<input type="text" class="form-control" name="taskname" placeholder="Enter Taskname" style="margin-top:3%">
	</div>
	<div class="form-group col-md-6">
		<label>Select Project End Date</label>
		<input type="text" class="form-control" name="enddate" placeholder="yyyy-mm-dd">
	</div>
	<div class="form-group col-md-6">
		<textarea class="form-control" name="description" placeholder="Enter Task Description" cols="30"></textarea>
	</div>
	<button type="submit" class="btn btn-md btn-primary" name="tasksubmit">Submit</button>
</form>
</div>
<%} %>
</body>
</html>