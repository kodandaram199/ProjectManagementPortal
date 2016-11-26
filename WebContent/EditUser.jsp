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
		<form role="form" method="post" action="UserEditController">
        <%@ page import="java.sql.*" %> 
			<% 
			int id=Integer.parseInt(request.getParameter("id"));
			Class.forName("com.mysql.jdbc.Driver");
			Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3309/internship", "root", "pdr16418@@@###");
			PreparedStatement st1 = con1.prepareStatement("select * from tbl_users where userid="+id);
			ResultSet rs1=st1.executeQuery();
			while(rs1.next())
			{
				out.println("<div class='form-group col-md-6'><label>Fullname</label><input type='text' name='fullname' class='form-control' value='"+rs1.getString("fullname")+"' placeholder='Enter Full Name'></div>");
				out.println("<div class='form-group col-md-6'><label>Email</label><input type='text' name='email' class='form-control' value='"+rs1.getString("email")+"' placeholder='Enter Email'></div>");
			%>
			<div class="form-group col-md-6">
			<label>Department</label>
		<select class="form-control" name="depid">
			<%
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3309/internship", "root", "pdr16418@@@###");
			PreparedStatement st = con.prepareStatement("select * from tbl_departments where deptid="+rs1.getInt("depid"));
			ResultSet  rs=st.executeQuery(); 
			
		while (rs.next())
		{
		%>
		<option value="<%out.println(rs.getInt("deptid"));%>"><%out.println(rs.getString("deptname"));} %></option>
			<%@ page import="java.sql.*" %> 
			<% 
			
			st = con.prepareStatement("select deptid,deptname from tbl_departments");
			rs=st.executeQuery();
			while(rs.next())
			{
				out.println("<option value="+rs.getString("deptid")+">"+rs.getString("deptname")+"</option>");
			}
			%>
		</select>
	</div>
	<%
				out.println("<div class='form-group col-md-6'><label>Username</label><input type='text' name='username' class='form-control' value='"+rs1.getString("username")+"' placeholder='Enter Username'></div>");
				out.println("<div class='form-group col-md-6'><label>Password</label><input type='password' name='password' class='form-control' value='"+rs1.getString("password")+"' placeholder='Enter Password'></div>");
				out.println("<div class='form-group col-md-6'><label>Pic</label><input type='text' name='pic' class='form-control' value='"+rs1.getString("pic")+"' placeholder='Enter pic'></div>");
				
		%>		
				
<div class="form-group col-md-6">
	<label>Gender</label>
		<select class="form-control" name="gender">
		<%
		st = con.prepareStatement("select * from tbl_gender where genderid="+rs1.getInt("gender"));
		rs=st.executeQuery(); 
		while (rs.next())
		{
		%>
		<option value="<%out.println(rs.getInt("genderid"));%>"><%out.println(rs.getString("gender"));} %></option>
			<%
			st = con.prepareStatement("select genderid,gender from tbl_gender");
			rs=st.executeQuery();
			while(rs.next())
			{
				out.println("<option value="+rs.getString("genderid")+">"+rs.getString("gender")+"</option>");
			}
			%>
		</select>
	</div>
	<div class="form-group col-md-6">
	<label>Approle</label>
		<select class="form-control" name="approle">
		<%
		st = con.prepareStatement("select * from tbl_approles where appid="+rs1.getInt("roleid"));
		rs=st.executeQuery(); 
		while (rs.next())
		{
		%>
		<option value="<%out.println(rs.getInt("appid"));%>"><%out.println(rs.getString("role"));} %></option>
			<%
			st = con.prepareStatement("select appid,role from tbl_approles");
			rs=st.executeQuery();
			while(rs.next())
			{
				out.println("<option value="+rs.getString("appid")+">"+rs.getString("role")+"</option>");
			}
			%>
		</select>
	</div>
	<% 
				out.println("<div class='form-group col-md-6'><label>Address</label><input type='text' name='address' class='form-control' value='"+rs1.getString("address")+"' placeholder='Enter Address'></div>");
				out.println("<div class='form-group col-md-6'><label>Phone Number</label><input type='text' name='phonenumber' class='form-control' value='"+rs1.getString("phonenumber")+"' placeholder='Enter Phonenumber'></div>");
				
	%>
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
		<select class="form-control" name="cityname">
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
	
	
	<% 

	out.println("<div class='form-group col-md-6'><label>Pin</label><input type='text' name='pin' class='form-control' value='"+rs1.getInt("pin")+"' placeholder='Enter Pin'></div>");
	%>
	<div class="form-group col-md-6">
		<label>Status</label>
		<select class="form-control" name="status" >
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
	<% 
				out.println("<input type='hidden' name='userid' value='"+rs1.getInt("userid")+"'>");
	
			}
			%>
			<div style="clear:both">
	<button type="submit" class="btn btn-md btn-primary" name="usersubmit">Submit</button>
	</div>
        </form>
        </div>
     <%} %>   
</body>
</html>