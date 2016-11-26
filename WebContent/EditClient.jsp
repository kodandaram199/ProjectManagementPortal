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
<form role="form" method="post" action="ClientEditController">
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3309/internship", "root", "pdr16418@@@###");
PreparedStatement st1 = con1.prepareStatement("select * from tbl_clients where clientid="+request.getParameter("id"));
ResultSet rs1=st1.executeQuery();
while(rs1.next())
{
%>
	<div class="form-group col-md-6">
		<label>Client Name</label>
		<input type="text" class="form-control" name="clientname" placeholder="Enter Client Name" value="<%out.println(rs1.getString("clientname"));%>">
	</div>
	<div class="form-group col-md-6">
		<label>Client Address</label>
		<input type="text" class="form-control" name="address" placeholder="Enter Client Address" value="<%out.println(rs1.getString("address"));%>">
	</div>
	<div class="form-group col-md-6">
		<label>Phone Number</label>
		<input type="text" class="form-control" name="clientphonenumber" placeholder="Enter Phone Number" value="<%out.println(rs1.getString("clientphonenumber"));%>">
	</div>
	<div class="form-group col-md-6">
		<label>Username</label>
		<input type="text" class="form-control" name="username" placeholder="Enter Username" value="<%out.println(rs1.getString("username"));%>">
	</div>
	<div class="form-group col-md-6">
		<label>Password</label>
		<input type="text" class="form-control" name="password" placeholder="Enter Password" value="<%out.println(rs1.getString("password"));%>">
	</div>
	<div class="form-group col-md-6">
		<label>Pic url</label>
		<input type="text" class="form-control" name="pic" placeholder="Enter pic" value="<%out.println(rs1.getString("pic"));%>">
	</div>
	<div class="form-group col-md-6">
		<label>Gender</label>
		<select class="form-control" name="gender">
		<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3309/internship", "root", "pdr16418@@@###");
		PreparedStatement st = con.prepareStatement("select * from tbl_gender where genderid="+rs1.getInt("gender"));
		ResultSet rs=st.executeQuery(); 
		while (rs.next())
		{
		%>
		<option value="<%out.println(rs.getInt("genderid"));%>"><%out.println(rs.getString("gender"));} %></option>
			<%
			Class.forName("com.mysql.jdbc.Driver");
			Connection con2=DriverManager.getConnection("jdbc:mysql://localhost:3309/internship", "root", "pdr16418@@@###");
			PreparedStatement st2 = con2.prepareStatement("select genderid,gender from tbl_gender");
			ResultSet rs2=st2.executeQuery();
			while(rs.next())
			{
				out.println("<option value="+rs2.getString("genderid")+">"+rs2.getString("gender")+"</option>");
			}
			%>
		</select>
	</div>
	<div class="form-group col-md-6">
		<label>Country</label>
		<select class="form-control" name="country">
			<%
		st = con.prepareStatement("select * from tbl_countries where countryid="+rs1.getInt("country"));
		rs=st.executeQuery(); 
		while (rs.next())
		{
		%>
		<option value="<%out.println(rs.getInt("countryid"));%>"><%out.println(rs.getString("countryname"));} %></option>
			<%@ page import="java.sql.*" %> 
			<% 
			
			st = con.prepareStatement("select countryid,countryname from tbl_countries");
			 rs=st.executeQuery();
			 while(rs.next())
			{
				out.println("<option value="+rs.getString("countryid")+">"+rs.getString("countryname")+"</option>");
			}
			%>
		</select>
	</div>
	<div class="form-group col-md-6">
		<label>State</label>
		<select class="form-control" name="state">
			<%
		st = con.prepareStatement("select * from tbl_states where stateid="+rs1.getInt("state"));
		rs=st.executeQuery(); 
		while (rs.next())
		{
		%>
		<option value="<%out.println(rs.getInt("stateid"));%>"><%out.println(rs.getString("statename"));} %></option>
			<%
			st = con.prepareStatement("select stateid,statename from tbl_states");
			rs=st.executeQuery();
			while(rs.next())
			{
				out.println("<option value="+rs.getString("stateid")+">"+rs.getString("statename")+"</option>");
		
			}
			%>
		</select>
	</div>
	<div class="form-group col-md-6">
		<label>City</label>
		<select class="form-control" name="city">
			<%
		st = con.prepareStatement("select * from tbl_cities where cityid="+rs1.getInt("city"));
		rs=st.executeQuery(); 
		while (rs.next())
		{
		%>
		<option value="<%out.println(rs.getInt("cityid"));%>"><%out.println(rs.getString("cityname"));} %></option>
			<%
			st = con.prepareStatement("select cityid,cityname from tbl_cities");
			rs=st.executeQuery();
			while(rs.next())
			{
				out.println("<option value="+rs.getString("cityid")+">"+rs.getString("cityname")+"</option>");
		
			}
			%>
		</select>
	</div>
	<div class="form-group col-md-6">
		<label>Pin Code</label>
		<input type="text" class="form-control" name="pin" placeholder="Enter Pincode" value="<%out.println(rs1.getInt("pin"));%>">
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
				out.println("<option value="+rs.getString("statusid")+">"+rs.getString("status")+"</option>");
			}
			%>
		</select>
	</div>
	<%out.println("<input type='hidden' name='clientid' value='"+rs1.getInt("clientid")+"'>"); %>
	<button type="submit" class="btn btn-md btn-primary" name="clientsubmit">Submit</button>
	<%
	}%>
</form>
</div>
<%} %>
</body>
</html>