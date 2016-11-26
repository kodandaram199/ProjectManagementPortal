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
<title>ProjectManagement</title>
</head>
<body>
<%
if(session.getAttribute("usr_name")==null){
	  response.sendRedirect("index.jsp");
	}else{
	  
	
 %>
<jsp:include page="navigation.jsp"></jsp:include>
                <div style="margin-top:5%">
<form role="form" method="post" action="ProjectEditController">
<%
int projectid=Integer.parseInt(request.getParameter("id"));
Class.forName("com.mysql.jdbc.Driver");
Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3309/internship", "root", "pdr16418@@@###");
PreparedStatement st1 = con1.prepareStatement("select * from tbl_projectdetails where projectid="+projectid);
ResultSet rs1=st1.executeQuery();

while(rs1.next())
{
%>
	<div class="form-group col-md-6">
		<label>Project Name</label>
		<input type="text" class="form-control" name="projectname" placeholder="Enter Projectname" value="<%out.println(rs1.getString("projectname")); %>">
	</div>
	<div class="form-group col-md-6">
		<label>Start Date</label>
		<input type="text" class="form-control" name="startdate" value="<%out.println(rs1.getDate("startdate")); %>">
	</div>
	<div class="form-group col-md-6">
		<label>End Date</label>
		<input type="text" class="form-control" name="enddate" value="<%out.println(rs1.getDate("enddate")); %>">
	</div>
	<div class="form-group col-md-6">
		<label>Actual Complete Date</label>
		<input type="text" class="form-control" name="actualcompletedate" value="<%out.println(rs1.getDate("actualcomplete")); %>">
	</div>
	<div class="form-group col-md-6">
		<label>Work Status</label>
		<select class="form-control" name="projectworkstatus">
		<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3309/internship", "root", "pdr16418@@@###");
		PreparedStatement st = con.prepareStatement("select * from tbl_workstatus where statusid="+rs1.getInt("projectworkstatus"));
		ResultSet rs=st.executeQuery(); 
		while (rs.next())
		{
		%>
		<option value="<%out.println(rs.getInt("statusid"));%>"><%out.println(rs.getString("status"));} %></option>
			<%@ page import="java.sql.*" %> 
			<% 
			
			 st = con.prepareStatement("select statusid,status from tbl_workstatus");
			 rs=st.executeQuery();
			while(rs.next())
			{
				out.println("<option value="+rs.getInt("statusid")+">"+rs.getString("status")+"</option>");
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
		<label>Client</label>
		<select class="form-control" name="clientid">
		<%
		st = con.prepareStatement("select * from tbl_clients where clientid="+rs1.getInt("clientid"));
		rs=st.executeQuery(); 
		while (rs.next())
		{
		%>
		<option value="<%out.println(rs.getInt("clientid"));%>"><%out.println(rs.getString("clientname"));} %></option>
			<%
			st = con.prepareStatement("select clientid,clientname from tbl_clients");
			rs=st.executeQuery();
			while(rs.next())
			{
				out.println("<option value="+rs.getString("clientid")+">"+rs.getString("clientname")+"</option>");
			}
			%>
		</select>
	</div>
	<div class="form-group col-md-6">
		<label>Amount</label>
		<input type="text" class="form-control" name="amount" placeholder="Enter Amount" value="<%out.println(rs1.getString("amount")); %>">
	</div>
	<div class="form-group col-md-6">
		<label>Project Manager</label>
		<input type="text" class="form-control" name="mgrid" placeholder="Enter Manager Id" value="<%out.println(rs1.getString("mgrid")); %>">
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
		<label>Description</label>
		<textarea rows="5" cols="50" class="form-control" name="projectdescription" placeholder="Enter Project Description" cols="30"><%out.println(rs1.getString("projectdesc")); %></textarea>
	</div>
	<input type="hidden" value="<%out.println(rs1.getInt("projectid")); %>" name="projectid">
	<button type="submit" class="btn btn-md btn-primary" name="projectsubmit">Submit</button>
	<%} %>
</form>
</div>
<%} %>
</body>
</html>