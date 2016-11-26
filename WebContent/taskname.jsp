<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
String a=request.getParameter("id");
%>
<div class="jumbotron">
        		<%
        				Class.forName("com.mysql.jdbc.Driver");
			Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3309/internship", "root", "pdr16418@@@###");
			PreparedStatement st1 = con1.prepareStatement("SELECT taskname from tbl_tasks where taskname=?");
			st1.setString(1,a);
			ResultSet rs1=st1.executeQuery();
			if(rs1.next())
			{
			out.println("<h1 style='text-align:center'>Details of task "+rs1.getString("taskname"));
			}
			else
			{
			
				
			    out.println("<h1 style='text-align:center'>No Tasks are present with name "+rs1.getString("taskname"));
				
			}
			%>
        	</div>
        	<div>
        		<table class="table table-striped">
        		<thead>
        		<tr>
        		
        			<th>Employee Name</th>
        			<th>Username</th>
        			<th>Task Name</th>
        			<th>Project Name</th>
        			<th>Start Date</th>
        			<th>End Date</th>
        			<th>Actual Complete</th>
        			<th>Task Status</th>
        			<th>Priority</th>
        			<th>Description</th>
        			<th>Status</th>
        		</tr>
        		</thead>
        <%@ page import="java.sql.*" %> 
			<% 
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3309/internship", "root", "pdr16418@@@###");
			PreparedStatement st = con.prepareStatement("SELECT t.taskname,p.projectname,pr.priority,w.status AS taskstatus,t.startdate,t.enddate,t.actualcomplete,t.description,u.username,u.fullname,s.status FROM tbl_tasks t,tbl_projectdetails p,tbl_status s,tbl_workstatus w,tbl_priority pr,tbl_users u WHERE t.projectid=p.projectid AND t.status=s.statusid  AND t.taskstatus=w.statusid  AND t.priority=pr.priorityid AND t.employeeid=u.userid AND t.taskname=?");			
			st.setString(1,a);
			ResultSet rs=st.executeQuery();
			while(rs.next())
			{
				out.println("<tr>");

				out.println("<td>"+rs.getString("fullname")+"</td>");
				out.println("<td>"+rs.getString("username")+"</td>");
				out.println("<td>"+rs.getString("taskname")+"</td>");
				out.println("<td>"+rs.getString("projectname")+"</td>");
				out.println("<td>"+rs.getDate("startdate")+"</td>");
				out.println("<td>"+rs.getDate("enddate")+"</td>");
				out.println("<td>"+rs.getDate("actualcomplete")+"</td>");
				out.println("<td>"+rs.getString("taskstatus")+"</td>");
				out.println("<td>"+rs.getString("priority")+"</td>");
				out.println("<td>"+rs.getString("description")+"</td>");
				out.println("<td>"+rs.getString("status")+"</td>");
			}
			%>
        </table>
        	</div>
</body>
</html>