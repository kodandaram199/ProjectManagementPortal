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
<style>th{text-align:center}</style>
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
        		<th>Task Name</th>
        		<th>Description</th>
        		<th>Project Name</th>
        		<th>Priority</th>
        		<th>Task Status</th>
        		<th>Start Date</th>
        		<th>End Date</th>
        		<th>Actual Complete</th>
        		<th>Delete</th>
        	</tr>
        	</thead>
        <%@ page import="java.sql.*" %> 
			<% 
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3309/internship", "root", "pdr16418@@@###");
			PreparedStatement st = con.prepareStatement("select * from tbl_tasks");
			ResultSet rs=st.executeQuery();
			while(rs.next())
			{
				out.println("<tr>");
				out.println("<td>"+rs.getString("taskname")+"</td>");
				out.println("<td>"+rs.getString("description")+"</td>");
				out.println("<td>"+rs.getInt("projectid")+"</td>");
				out.println("<td>"+rs.getInt("priority")+"</td>");
				out.println("<td>"+rs.getInt("taskstatus")+"</td>");
				out.println("<td>"+rs.getDate("startdate")+"</td>");
				out.println("<td>"+rs.getDate("enddate")+"</td>");
				out.println("<td>"+rs.getDate("actualcomplete")+"</td>");
				out.println("<td><a href='TaskDeleteController?id="+rs.getInt("taskid")+"'>Delete</a></td>");
			}
			%>
        </table>
        <%} %>
</body>
</html>