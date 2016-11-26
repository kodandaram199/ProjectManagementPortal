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
<style type="text/css">
th{text-align:center}
</style>
<title>Insert title here</title>
</head>
<body>
<%
if(session.getAttribute("usr_name")==null){
	  response.sendRedirect("index.jsp");
	}else{
	  
	
 %>
<jsp:include page="navigation.jsp"></jsp:include>
        <table class="table table-striped">
        <thead>
        <tr>
        	<th><strong>Client Name</strong></th>
        	<th><strong>Phone Number</strong></th>
        	<th><strong>Username</strong></th>
        	<th><strong>Password</strong></th>
        	<th><strong>Pic</strong></th>
        	<th><strong>Gender</strong></th>
        	<th><strong>Address</strong></th>
        	<th><strong>Country</strong></th>
        	<th><strong>State</strong></th>
        	<th><strong>City</strong></th>
        	<th><strong>Pin</strong></th>
        	<th><strong>Status</strong></th>
        	<th><strong>Delete</strong></th>
        </tr>
        </thead>
        <tbody>
        <%@ page import="java.sql.*" %> 
			<% 
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3309/internship", "root", "pdr16418@@@###");
			PreparedStatement st = con.prepareStatement("select * from tbl_clients");
			ResultSet rs=st.executeQuery();
			while(rs.next())
			{
				out.println("<tr>");
				out.println("<td>"+rs.getString("clientname")+"</td>");
				out.println("<td>"+rs.getString("clientphonenumber")+"</td>");
				out.println("<td>"+rs.getString("username")+"</td>");
				out.println("<td>"+rs.getString("password")+"</td>");
				out.println("<td>"+rs.getString("pic")+"</td>");
				out.println("<td>"+rs.getInt("gender")+"</td>");
				out.println("<td>"+rs.getString("address")+"</td>");
				out.println("<td>"+rs.getInt("country")+"</td>");
				out.println("<td>"+rs.getInt("state")+"</td>");
				out.println("<td>"+rs.getInt("city")+"</td>");
				out.println("<td>"+rs.getInt("pin")+"</td>");
				out.println("<td>"+rs.getInt("status")+"</td>");
				out.println("<td><a href='ClientDeleteController?id="+rs.getInt("clientid")+"'>Delete</a></td>");
				out.println("</tr>");
			}
			%>
			</tbody>
        </table>
        <%} %>
</body>
</html>