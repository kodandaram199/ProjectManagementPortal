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
<form role="form" method="post" action="TaskEditController">
<%@ page import="java.sql.*" %> 
			<% 
			int id=Integer.parseInt(request.getParameter("id"));
			Class.forName("com.mysql.jdbc.Driver");
			Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3309/internship", "root", "pdr16418@@@###");
			PreparedStatement st1 = con1.prepareStatement("select * from tbl_tasks where taskid="+id);
			ResultSet rs1=st1.executeQuery();
			while(rs1.next())
			{
%>
		
	<div class="form-group col-md-6">
		<label>Task Name</label>
		<input type="text" class="form-control" name="taskname" placeholder="Enter Taskname" value="<%out.println(rs1.getString("taskname")); %>" >
	</div>
	<div class="form-group col-md-6">
		<label>Start Date</label>
		<input type="text" class="form-control" name="startdate" placeholder="yyyy-mm-dd" value="<%out.println(rs1.getDate("startdate"));%>">
	</div>
	<div class="form-group col-md-6">
		<label>End Date</label>
		<input type="text" class="form-control" name="enddate" placeholder="yyyy-mm-dd" value="<%out.println(rs1.getDate("enddate")); %>">
	</div>
	<div class="form-group col-md-6">
		<label>Task Status</label>
		<select class="form-control" name="taskstatus">
			
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
		<label>Priority</label>
		<select class="form-control" name="priority">
			<%
		st = con.prepareStatement("select * from tbl_priority where priorityid="+rs1.getInt("priority"));
		rs=st.executeQuery(); 
		while (rs.next())
		{
		%>
		<option value="<%out.println(rs.getInt("priorityid"));%>"><%out.println(rs.getString("priority"));} %></option>
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
		<label>Project Name</label>
		<select class="form-control" name="projectid">
		<%
		st = con.prepareStatement("select * from tbl_projectdetails where projectid="+rs1.getInt("projectid"));
		rs=st.executeQuery(); 
		while (rs.next())
		{
		%>
		<option value="<%out.println(rs.getInt("projectid"));%>"><%out.println(rs.getString("projectname"));} %></option>
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
		<label>Employee</label>
		<select class="form-control" name="employeeid">
		<%
		st = con.prepareStatement("select * from tbl_employees where userid="+rs1.getInt("employeeid"));
		rs=st.executeQuery(); 
		while (rs.next())
		{
		%>
		<option value="<%out.println(rs.getInt("userid"));%>"><%out.println(rs.getString("username"));} %></option>
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
	<label>Status</label>
		<select class="form-control" name="status">
		<%
		st = con.prepareStatement("select * from tbl_status where statusid="+rs1.getInt("status"));
		rs=st.executeQuery(); 
		while (rs.next())
		{
		%>
		<option value="<%out.println(rs.getInt("statusid"));%>"><%out.println(rs.getString("status"));} %></option>
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
		<label>Descripton</label>
		<textarea class="form-control" name="taskdescription" placeholder="Enter Task Description" ><%out.println(rs1.getString("description")); %></textarea>
	</div>
	<input type="hidden" value="<%out.println(rs1.getInt("taskid")); %>" name="taskid">
	<button type="submit" class="btn btn-md btn-primary" name="tasksubmit">Submit</button>
	<%} %>
</form>
</div>
<%} %>
</body>
</html>