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
 <div class="container">
 <div class="jumbotron">
        		<h1 style="text-align:center">Employee with no tasks</h1>
        	</div>
        	<div>
        		<table class="table table-striped">
        <%@ page import="java.sql.*" %>
			<% 
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3309/internship", "root", "pdr16418@@@###");
			PreparedStatement st = con.prepareStatement("SELECT username FROM tbl_users WHERE userid NOT IN (SELECT DISTINCT(employeeid) FROM tbl_tasks) AND roleid=3");			
			ResultSet rs=st.executeQuery();
			while(rs.next())
			{
				out.println("<tr>");

				out.println("<td>"+rs.getString("username")+"</td>");
			}
			%>
        </table>
        	</div>
        	</div>
 <% }%>
</body>
</html>