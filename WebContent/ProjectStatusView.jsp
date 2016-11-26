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
<style type="text/css">th{text-align:center}</style>
<title>Insert title here</title>
<script>
function pro(){
		var proid= document.getElementById('status').value;
		var xmlhttp = new XMLHttpRequest(); 
		
		xmlhttp.onreadystatechange = function(){ 
			if(xmlhttp.readyState==4&&xmlhttp.status==200){
				document.getElementById('display').innerHTML = xmlhttp.responseText; 
			}
		}
		xmlhttp.open('GET', 'prostatus.jsp?id='+proid, true); 
		xmlhttp.send();
	}
</script>
</head>
<body>
<%
if(session.getAttribute("usr_name")==null){
	  response.sendRedirect("index.jsp");
	}else{
	  
	
 %>
 <jsp:include page="navigation.jsp"></jsp:include>
        <div class="container">
        <form name="prot">
        	<div class="form-group">
		<select class="form-control" name="client" id="status" onchange="pro()">
		<option>Select Status</option>
			<%
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3309/internship", "root", "pdr16418@@@###");
			PreparedStatement st = con.prepareStatement("select statusid,status from tbl_status");
			ResultSet rs=st.executeQuery();
			while(rs.next())
			{
				out.println("<option value="+rs.getString("statusid")+">"+rs.getString("status")+"</option>");
			}
			%>
		</select>
	</div>
        	</form>
        	<div id="display">
        	<div class="jumbotron">
        		<h1 style="text-align:center">Recent Added Project</h1>
        	</div>
        	<div>
        		<table class="table table-striped">
        		<thead>
        		<tr>
        			
        			<th>Project Manager</th>
        			<th>Username</th>
        			<th>Project Name</th>
        			<th>Start Date</th>
        			<th>End Date</th>
        			<th>Actual Complete</th>
        			<th>Project Work Status</th>
        			<th>Priority</th>
        			<th>Description</th>
        			<th>Client Name</th>
        			<th>Amount</th>
        			<th>Status</th>
        		</tr>
        		</thead>
        <%@ page import="java.sql.*" %>
			<% 
			
			st = con.prepareStatement("SELECT p.projectname,p.startdate,p.enddate,p.actualcomplete,u.fullname,u.username,pr.priority,w.status AS projectworkstatus,c.clientname,p.projectdesc,p.amount,s.status FROM tbl_projectdetails p,tbl_status s,tbl_workstatus w,tbl_clients c,tbl_priority pr,tbl_users u WHERE p.status=s.statusid  AND p.projectworkstatus=w.statusid AND p.clientid=c.clientid AND p.priority=pr.priorityid AND p.mgrid=u.userid AND p.projectid=(SELECT MAX(projectid) FROM tbl_projectdetails)");			
			rs=st.executeQuery();
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
				out.println("<td>"+rs.getString("projectdesc")+"</td>");
				out.println("<td>"+rs.getString("clientname")+"</td>");
				out.println("<td>"+rs.getString("amount")+"</td>");
				out.println("<td>"+rs.getString("status")+"</td>");
			}
			%>
        </table>
        	</div>
        </div>
        
 <%} %>
</body>
</html>