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
<form role="form" method="post" action="ClientController">
	<div class="form-group col-md-6">
		<input type="text" class="form-control" name="clientname" placeholder="Enter Client Name">
	</div>
	<div class="form-group col-md-6">
		<input type="text" class="form-control" name="address" placeholder="Enter Client Address">
	</div>
	<div class="form-group col-md-6">
		<input type="text" class="form-control" name="clientphonenumber" placeholder="Enter Phone Number">
	</div>
	<div class="form-group col-md-6">
		<input type="text" class="form-control" name="username" placeholder="Enter Username">
	</div>
	<div class="form-group col-md-6">
		<input type="password" class="form-control" name="password" placeholder="Enter Password">
	</div>
	<div class="form-group col-md-6">
		<input type="text" class="form-control" name="pic" placeholder="Enter pic">
	</div>
	<div class="form-group col-md-6">
		<select class="form-control" name="gender">
		<option>Select Gender</option>
			<%
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3309/internship", "root", "pdr16418@@@###");
			PreparedStatement st = con.prepareStatement("select genderid,gender from tbl_gender");
			ResultSet rs=st.executeQuery();
			while(rs.next())
			{
				out.println("<option value="+rs.getString("genderid")+">"+rs.getString("gender")+"</option>");
			}
			%>
		</select>
	</div>
	<div class="form-group col-md-6">
		<select class="form-control" name="country">
			<option> Select Country </option>
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
		<select class="form-control" name="state">
			<option>Select State</option>
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
		<select class="form-control" name="city">
			<option>Select City</option>
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
		<input type="text" class="form-control" name="pin" placeholder="Enter Pincode">
	</div>
	<div class="form-group col-md-6">
		<select class="form-control" name="status">
		<option>Select Status</option>
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
	<button type="submit" class="btn btn-md btn-primary" name="clientsubmit">Submit</button>
</form>
</div>
<%} %>
</body>
</html>