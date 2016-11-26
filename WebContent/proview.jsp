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
int a=Integer.parseInt(request.getParameter("id").trim());
if(a==1)
{
 %>  
 <div class="jumbotron">
        		<h1 style="text-align:center">Project Details Ordered By Name in Ascending order</h1>
        	</div>
        	<div>
        		<table class="table table-striped">
        		<thead>
        		<tr>
        			
        			<th>Project Name</th>
        			<th>Start Date</th>
        			<th>End Date</th>
        			<th>Actual Complete</th>
        			<th>Project Work Status</th>
        			<th>Priority</th>
        			<th>Client Name</th>
        			<th>Description</th>
        			<th>Amount</th>
        			<th>Project Manager</th>
        			<th>Status</th>
        		</tr>
        		</thead>
        <%@ page import="java.sql.*" %> 
			<% 
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3309/internship", "root", "pdr16418@@@###");
			PreparedStatement st = con.prepareStatement("SELECT p.projectname,p.startdate,p.enddate,p.actualcomplete,u.username,pr.priority,w.status AS projectworkstatus,c.clientname,p.projectdesc,p.amount,s.status FROM tbl_projectdetails p,tbl_status s,tbl_workstatus w,tbl_clients c,tbl_priority pr,tbl_users u WHERE p.status=s.statusid  AND p.projectworkstatus=w.statusid AND p.clientid=c.clientid AND p.priority=pr.priorityid AND p.mgrid=u.userid order by projectname");			
			ResultSet rs=st.executeQuery();
			while(rs.next())
			{
				out.println("<tr>");
				out.println("<td>"+rs.getString("projectname")+"</td>");
				out.println("<td>"+rs.getDate("startdate")+"</td>");
				out.println("<td>"+rs.getDate("enddate")+"</td>");
				out.println("<td>"+rs.getDate("actualcomplete")+"</td>");
				out.println("<td>"+rs.getString("projectworkstatus")+"</td>");
				out.println("<td>"+rs.getString("priority")+"</td>");
				out.println("<td>"+rs.getString("clientname")+"</td>");
				out.println("<td>"+rs.getString("projectdesc")+"</td>");
				out.println("<td>"+rs.getString("amount")+"</td>");
				out.println("<td>"+rs.getString("username")+"</td>");
				out.println("<td>"+rs.getString("status")+"</td>");
			}
			%>
        </table>
        	</div>
 <%
}
else if(a==2)
{
 %>  
 <div class="jumbotron">
        		<h1 style="text-align:center">Project Details Ordered By Name in Descending order</h1>
        	</div>
        	<div>
        		<table class="table table-striped">
        		<thead>
        		<tr>
        			
        			<th>Project Name</th>
        			<th>Start Date</th>
        			<th>End Date</th>
        			<th>Actual Complete</th>
        			<th>Project Work Status</th>
        			<th>Priority</th>
        			<th>Client Name</th>
        			<th>Description</th>
        			<th>Amount</th>
        			<th>Project Manager</th>
        			<th>Status</th>
        		</tr>
        		</thead>
        <%@ page import="java.sql.*" %> 
			<% 
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3309/internship", "root", "pdr16418@@@###");
			PreparedStatement st = con.prepareStatement("SELECT p.projectname,p.startdate,p.enddate,p.actualcomplete,u.username,pr.priority,w.status AS projectworkstatus,c.clientname,p.projectdesc,p.amount,s.status FROM tbl_projectdetails p,tbl_status s,tbl_workstatus w,tbl_clients c,tbl_priority pr,tbl_users u WHERE p.status=s.statusid  AND p.projectworkstatus=w.statusid AND p.clientid=c.clientid AND p.priority=pr.priorityid AND p.mgrid=u.userid order by projectname desc");			
			ResultSet rs=st.executeQuery();
			while(rs.next())
			{
				out.println("<tr>");
				out.println("<td>"+rs.getString("projectname")+"</td>");
				out.println("<td>"+rs.getDate("startdate")+"</td>");
				out.println("<td>"+rs.getDate("enddate")+"</td>");
				out.println("<td>"+rs.getDate("actualcomplete")+"</td>");
				out.println("<td>"+rs.getString("projectworkstatus")+"</td>");
				out.println("<td>"+rs.getString("priority")+"</td>");
				out.println("<td>"+rs.getString("clientname")+"</td>");
				out.println("<td>"+rs.getString("projectdesc")+"</td>");
				out.println("<td>"+rs.getString("amount")+"</td>");
				out.println("<td>"+rs.getString("username")+"</td>");
				out.println("<td>"+rs.getString("status")+"</td>");
			}
			%>
        </table>
        	</div>
 <%
}
else if(a==3)
{
%>
<div class="jumbotron">
        		<h1 style="text-align:center">Project Details by ProjectAdded Date in Ascending order</h1>
        	</div>
        	<div>
        		<table class="table table-striped">
        		<thead>
        		<tr>
        			
        			<th>Project Name</th>
        			<th>Start Date</th>
        			<th>End Date</th>
        			<th>Actual Complete</th>
        			<th>Project Work Status</th>
        			<th>Priority</th>
        			<th>Client Name</th>
        			<th>Description</th>
        			<th>Amount</th>
        			<th>Project Manager</th>
        			<th>Status</th>
        		</tr>
        		</thead>
        <%@ page import="java.sql.*" %> 
			<% 
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3309/internship", "root", "pdr16418@@@###");
			PreparedStatement st = con.prepareStatement("SELECT p.projectname,p.startdate,p.enddate,p.actualcomplete,u.username,pr.priority,w.status AS projectworkstatus,c.clientname,p.projectdesc,p.amount,s.status FROM tbl_projectdetails p,tbl_status s,tbl_workstatus w,tbl_clients c,tbl_priority pr,tbl_users u WHERE p.status=s.statusid  AND p.projectworkstatus=w.statusid AND p.clientid=c.clientid AND p.priority=pr.priorityid AND p.mgrid=u.userid order by projectid");			
			ResultSet rs=st.executeQuery();
			while(rs.next())
			{
				out.println("<tr>");
				out.println("<td>"+rs.getString("projectname")+"</td>");
				out.println("<td>"+rs.getDate("startdate")+"</td>");
				out.println("<td>"+rs.getDate("enddate")+"</td>");
				out.println("<td>"+rs.getDate("actualcomplete")+"</td>");
				out.println("<td>"+rs.getString("projectworkstatus")+"</td>");
				out.println("<td>"+rs.getString("priority")+"</td>");
				out.println("<td>"+rs.getString("clientname")+"</td>");
				out.println("<td>"+rs.getString("projectdesc")+"</td>");
				out.println("<td>"+rs.getString("amount")+"</td>");
				out.println("<td>"+rs.getString("username")+"</td>");
				out.println("<td>"+rs.getString("status")+"</td>");
			}
			%>
        </table>
        	</div>
        	
<%
}
else if(a==4)
{
%>
<div class="jumbotron">
        		<h1 style="text-align:center">Project Details by ProjectAdded Date in Descending order</h1>
        	</div>
        	<div>
        		<table class="table table-striped">
        		<thead>
        		<tr>
        			
        			<th>Project Name</th>
        			<th>Start Date</th>
        			<th>End Date</th>
        			<th>Actual Complete</th>
        			<th>Project Work Status</th>
        			<th>Priority</th>
        			<th>Client Name</th>
        			<th>Description</th>
        			<th>Amount</th>
        			<th>Project Manager</th>
        			<th>Status</th>
        		</tr>
        		</thead>
			<% 
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3309/internship", "root", "pdr16418@@@###");
			PreparedStatement st = con.prepareStatement("SELECT p.projectname,p.startdate,p.enddate,p.actualcomplete,u.username,pr.priority,w.status AS projectworkstatus,c.clientname,p.projectdesc,p.amount,s.status FROM tbl_projectdetails p,tbl_status s,tbl_workstatus w,tbl_clients c,tbl_priority pr,tbl_users u WHERE p.status=s.statusid  AND p.projectworkstatus=w.statusid AND p.clientid=c.clientid AND p.priority=pr.priorityid AND p.mgrid=u.userid order by projectid desc");			
			ResultSet rs=st.executeQuery();
			while(rs.next())
			{
				out.println("<tr>");
				out.println("<td>"+rs.getString("projectname")+"</td>");
				out.println("<td>"+rs.getDate("startdate")+"</td>");
				out.println("<td>"+rs.getDate("enddate")+"</td>");
				out.println("<td>"+rs.getDate("actualcomplete")+"</td>");
				out.println("<td>"+rs.getString("projectworkstatus")+"</td>");
				out.println("<td>"+rs.getString("priority")+"</td>");
				out.println("<td>"+rs.getString("clientname")+"</td>");
				out.println("<td>"+rs.getString("projectdesc")+"</td>");
				out.println("<td>"+rs.getString("amount")+"</td>");
				out.println("<td>"+rs.getString("username")+"</td>");
				out.println("<td>"+rs.getString("status")+"</td>");
			}
			%>
        </table>
        	</div>
        	
        	<%} %>
        	
</body>
</html>