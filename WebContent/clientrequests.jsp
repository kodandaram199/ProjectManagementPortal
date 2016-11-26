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
			PreparedStatement st1 = con1.prepareStatement("SELECT c.clientname from tbl_clientrequests cr,tbl_clients c where cr.clientid=c.clientid and cr.clientid="+a);			
			ResultSet rs1=st1.executeQuery();
			if(rs1.next())
			{
			out.println("<h1 style='text-align:center'>New Requests Of Client "+rs1.getString("clientname"));
			}
			else
			{
			    PreparedStatement st2 = con1.prepareStatement("SELECT clientname from tbl_clients where clientid="+a);			
				ResultSet rs2=st2.executeQuery();
				while(rs2.next())
				{
			    out.println("<h1 style='text-align:center'>No New Requests were found for client "+rs2.getString("clientname"));
				}
			}
			%>
        	</div>
        	<div>
        		<table class="table table-striped">
        		<thead>
        		<tr>
        		<th>Client Name</th>
        		<th>Task Name</th>
        		<th>Description</th>
        		<th>End Date</th>
        		<th>Task Request Date</th>
        		</tr>
        		</thead>
        <%@ page import="java.sql.*" %> 
			<% 
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3309/internship", "root", "pdr16418@@@###");
			PreparedStatement st = con.prepareStatement("SELECT taskname,description,enddate,taskrequestdate FROM tbl_clientrequests WHERE clientid=? ORDER BY clientid DESC");	
			st.setInt(1,a);
			ResultSet rs=st.executeQuery();
			while(rs.next())
			{
				out.println("<tr>");
				out.println("<td>"+rs1.getString("clientname")+"</td>");
				out.println("<td>"+rs.getString("taskname")+"</td>");
				out.println("<td>"+rs.getString("description")+"</td>");
				out.println("<td>"+rs.getDate("enddate")+"</td>");
				out.println("<td>"+rs.getString("taskrequestdate")+"</td>");
			}
			%>
        </table>
        	</div>
</body>
</html>