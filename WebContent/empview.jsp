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
%>
<div class="jumbotron">
        		<%
        				Class.forName("com.mysql.jdbc.Driver");
			Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3309/internship", "root", "pdr16418@@@###");
			PreparedStatement st1 = con1.prepareStatement("SELECT roleid from tbl_users where userid=?");
			st1.setInt(1,a);
			ResultSet rs1=st1.executeQuery();
			if(rs1.next())
			{
			    if(rs1.getInt("roleid")==2)
			    {
				
					PreparedStatement st2 = con1.prepareStatement("SELECT u.fullname from tbl_users u,tbl_projectdetails p where p.mgrid=u.userid and p.mgrid=?");
					st2.setInt(1,a);
					ResultSet rs2=st2.executeQuery();
					if(rs2.next())
					{
						out.println("<h1 style='text-align:center'>Project Details Of ProjectManager "+rs2.getString("fullname"));
					}
					else
					{
						    PreparedStatement st3 = con1.prepareStatement("SELECT fullname from tbl_users where userid="+a);			
							ResultSet rs3=st3.executeQuery();
							while(rs3.next())
							{
						    out.println("<h1 style='text-align:center'>No Projects were under ProjectManager "+rs3.getString("fullname"));
							}
					}
			    	
			%>
        	</div>
        	<div>
        		<table class="table table-striped">
        		<thead>
        		<tr>
        			<th>Fullname</th>
        			<th>Username</th>
        			<th>Project Name</th>
        			<th>Start Date</th>
        			<th>End Date</th>
        			<th>Actual Complete</th>
        			<th>Project Work Status</th>
        			<th>Priority</th>
        			<th>Client Name</th>
        			<th>Description</th>
        			<th>Amount</th>
        			<th>Status</th>
        		</tr>
        		</thead>
        		
        <%@ page import="java.sql.*" %> 
			<% 
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3309/internship", "root", "pdr16418@@@###");
			PreparedStatement st = con.prepareStatement("SELECT p.projectname,p.startdate,p.enddate,p.actualcomplete,u.fullname,u.username,pr.priority,w.status AS projectworkstatus,c.clientname,p.projectdesc,p.amount,s.status FROM tbl_projectdetails p,tbl_status s,tbl_workstatus w,tbl_clients c,tbl_priority pr,tbl_users u WHERE p.status=s.statusid  AND p.projectworkstatus=w.statusid AND p.clientid=c.clientid AND p.priority=pr.priorityid AND p.mgrid=u.userid and p.mgrid="+a);			
			ResultSet rs=st.executeQuery();
			while(rs.next())
			{
				out.println("<tr>");

				
				out.println("<td>"+rs.getString("fullname")+"</td>");
				out.println("<td>"+rs.getString("username")+"</td>");
				out.println("<td>"+rs.getString("projectname")+"</td>");
				out.println("<td>"+rs.getDate("startdate")+"</td>");
				out.println("<td>"+rs.getDate("enddate")+"</td>");
				out.println("<td>"+rs.getDate("actualcomplete")+"</td>");
				out.println("<td>"+rs.getString("projectworkstatus")+"</td>");
				out.println("<td>"+rs.getString("priority")+"</td>");
				out.println("<td>"+rs.getString("clientname")+"</td>");
				out.println("<td>"+rs.getString("projectdesc")+"</td>");
				out.println("<td>"+rs.getString("amount")+"</td>");
				out.println("<td>"+rs.getString("status")+"</td>");
			}
			%>
        </table>
        	</div>
        	<%
        	}
			    else if(rs1.getInt("roleid")==3)
			    {
				
					PreparedStatement st2 = con1.prepareStatement("SELECT fullname from tbl_users where userid=?");
					st2.setInt(1,a);
					ResultSet rs2=st2.executeQuery();
					if(rs2.next())
					{
					    out.println("<h1>Details of task of Developer "+rs2.getString("fullname"));
					}
					else
					{
					    out.println("<h1>No tasks were assigned to Developer "+rs2.getString("fullname"));
					}
			    	
			%>
        	</div>
        	<div>
        		<table class="table table-striped">
        		<thead>
        		<tr>
        			<th>Fullname</th>
        			<th>Username</th>
        			<th>Taskname</th>
        			<th>Project Name</th>
        			<th>Start Date</th>
        			<th>End Date</th>
        			<th>Actual Complete</th>
        			<th>Task Work Status</th>
        			<th>Priority</th>
        			<th>Description</th>
        			<th>Status</th>
        		</tr>
        		</thead>
        <%@ page import="java.sql.*" %> 
			<% 
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3309/internship", "root", "pdr16418@@@###");
			PreparedStatement st = con.prepareStatement("SELECT t.taskname,p.projectname,pr.priority,w.status AS taskstatus,t.startdate,t.enddate,t.actualcomplete,t.description,u.username,u.fullname,s.status FROM tbl_tasks t,tbl_projectdetails p,tbl_status s,tbl_workstatus w,tbl_priority pr,tbl_users u WHERE t.projectid=p.projectid AND t.status=s.statusid  AND t.taskstatus=w.statusid  AND t.priority=pr.priorityid AND t.employeeid=u.userid AND t.employeeid=?");			
			st.setInt(1,a);
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
			 <%
			 }
			    } %> 
</body>
</html>