<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.text.*" %> 
<%@ page import="java.util.*" %> 
<% 

java.util.Date dt = null;
java.sql.Date a=null;
String b=request.getParameter("id");
SimpleDateFormat sdt=new SimpleDateFormat("yyyy-MM-dd");
try {
	dt=sdt.parse(b);
	String st=sdt.format(dt);
	a=new java.sql.Date(dt.getTime());
} catch (ParseException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
%>
<div class="jumbotron">
        		<%
        				Class.forName("com.mysql.jdbc.Driver");
			Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3309/internship", "root", "pdr16418@@@###");
			PreparedStatement st1 = con1.prepareStatement("SELECT startdate FROM tbl_tasks WHERE  startdate=?");
			st1.setDate(1,a);
			ResultSet rs1=st1.executeQuery();
			if(rs1.next())
			{
			out.println("<h1 style='text-align:center'>Task Details Of project with startdate "+rs1.getString("startdate"));
			}
			else
			{
				
			    out.println("<h1 style='text-align:center'>No Tasks with startdate "+a);
				
			}
			%>
        	</div>
        	<div>
        		<table class="table table-striped">
        		<thead>
        		<tr>
        		
        			<th>Start Date</th>
        			<th>Employee Name</th>
        			<th>Username</th>
        			<th>Task Name</th>
        			<th>Project Name</th>
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
			PreparedStatement st = con.prepareStatement("SELECT t.taskname,p.projectname,pr.priority,w.status AS taskstatus,t.startdate,t.enddate,t.actualcomplete,t.description,u.username,u.fullname,s.status FROM tbl_tasks t,tbl_projectdetails p,tbl_status s,tbl_workstatus w,tbl_priority pr,tbl_users u WHERE t.projectid=p.projectid AND t.status=s.statusid  AND t.taskstatus=w.statusid  AND t.priority=pr.priorityid AND t.employeeid=u.userid AND t.startdate=?");	
			st.setDate(1,a);
			ResultSet rs=st.executeQuery();
		
			while(rs.next())
			{
				out.println("<tr>");



				out.println("<td>"+rs.getDate("startdate")+"</td>");
				out.println("<td>"+rs.getString("fullname")+"</td>");
				out.println("<td>"+rs.getString("username")+"</td>");
				out.println("<td>"+rs.getString("taskname")+"</td>");
				out.println("<td>"+rs.getString("projectname")+"</td>");
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