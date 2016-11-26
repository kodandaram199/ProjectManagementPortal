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
<form role="form" method="post" action="TaskController">
	<div class="form-group col-md-6">
		<input type="text" class="form-control" name="taskname" placeholder="Enter Taskname" style="margin-top:3%">
	</div>
	<div class="form-group col-md-6">
		<label>Select Project Start Date</label>
		<input type="text" class="form-control" name="startdate" placeholder="yyyy-mm-dd">
	</div>
	<div class="form-group col-md-6">
		<label>Select Project End Date</label>
		<input type="text" class="form-control" name="enddate" placeholder="yyyy-mm-dd">
	</div>
	<div class="form-group col-md-6">
		<select class="form-control" name="taskstatus">
			<option> Select Work Status </option>
			<%@ page import="java.sql.*" %> 
			<% 
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3309/internship", "root", "pdr16418@@@###");
			PreparedStatement st = con.prepareStatement("select statusid,status from tbl_workstatus");
			ResultSet rs=st.executeQuery();
			while(rs.next())
			{
				out.println("<option value="+rs.getString("statusid")+">"+rs.getString("status")+"</option>");
			}
			%>
		</select>
	</div>
	<div class="form-group col-md-6">
		<select class="form-control" name="priority">
			<option>Select Priority</option>
			<%
			st = con.prepareStatement("select priorityid,priority from tbl_priority");
			rs=st.executeQuery();
			while(rs.next())
			{
				out.println("<option value="+rs.getString("priorityid")+">"+rs.getString("priority")+"</option>");
			}
			%>
		</select>
	</div>
	<div class="form-group col-md-6">
		<select class="form-control" name="projectid">
		<option>Select Project</option>
			<%
			st = con.prepareStatement("select projectid,projectname from tbl_projectdetails");
			rs=st.executeQuery();
			while(rs.next())
			{
				out.println("<option value="+rs.getString("projectid")+">"+rs.getString("projectname")+"</option>");
			}
			%>
		</select>
	</div>
	<div class="form-group col-md-6">
		<select class="form-control" name="employeeid">
		<option>Select Employee</option>
			<%
			st = con.prepareStatement("select userid,username from tbl_employees");
			rs=st.executeQuery();
			while(rs.next())
			{
				out.println("<option value="+rs.getString("userid")+">"+rs.getString("username")+"</option>");
			}
			%>
		</select>
	</div>
	<div class="form-group col-md-6">
		<select class="form-control" name="status">
		<option>Select Project Status</option>
			<%
			st = con.prepareStatement("select statusid,status from tbl_status");
			rs=st.executeQuery();
			while(rs.next())
			{
				out.println("<option value="+rs.getInt("statusid")+">"+rs.getString("status")+"</option>");
			}
			%>
		</select>
	</div>
	<div class="form-group col-md-6">
		<textarea class="form-control" name="taskdescription" placeholder="Enter Task Description" cols="30"></textarea>
	</div>
	<button type="submit" class="btn btn-md btn-primary" name="tasksubmit">Submit</button>
</form>
</div>
<%} %>
</body>
</html>