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
        <table class="table table-striped">
        <thead>
        <tr>
        <th>Fullname</th>
        <th>Email</th>
        <th>Department</th>
        <th>Username</th>
        <th>Password</th>
        <th>Pic</th>
        <th>Gender</th>
        <th>Roleid</th>
        <th>Address</th>
        
        <th>Country</th>
        <th>State</th>
        <th>City</th>
        <th>Pin</th>
        <th>status</th>
        <th>Delete</th>
        </tr>
        </thead>
        <%@ page import="java.sql.*" %> 
			<% 
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3309/internship", "root", "pdr16418@@@###");
			PreparedStatement st = con.prepareStatement("select * from tbl_users");
			ResultSet rs=st.executeQuery();
			while(rs.next())
			{
				out.println("<tr>");
				out.println("<td>"+rs.getString("fullname")+"</td>");
				out.println("<td>"+rs.getString("email")+"</td>");
				out.println("<td>"+rs.getInt("depid")+"</td>");
				out.println("<td>"+rs.getString("username")+"</td>");
				out.println("<td>"+rs.getString("password")+"</td>");
				out.println("<td>"+rs.getString("pic")+"</td>");
				out.println("<td>"+rs.getInt("gender")+"</td>");
				out.println("<td>"+rs.getInt("roleid")+"</td>");
				out.println("<td>"+rs.getString("address")+"</td>");
				out.println("<td>"+rs.getInt("country")+"</td>");
				out.println("<td>"+rs.getInt("state")+"</td>");
				out.println("<td>"+rs.getInt("city")+"</td>");
				out.println("<td>"+rs.getInt("pin")+"</td>");
				out.println("<td>"+rs.getInt("status")+"</td>");
				out.println("<td><a href='UserDeleteController?id="+rs.getInt("userid")+"'>Delete</a></td>");
			}
			%>
        </table>
        <%} %>
</body>
</html>