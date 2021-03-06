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
		var proid= document.getElementById('task').value;
		var xmlhttp = new XMLHttpRequest(); 
		
		xmlhttp.onreadystatechange = function(){ 
			if(xmlhttp.readyState==4&&xmlhttp.status==200){
				document.getElementById('display').innerHTML = xmlhttp.responseText; 
			}
		}
		xmlhttp.open('GET', 'taskname.jsp?id='+proid, true); 
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
		<select class="form-control" id="task" onchange="pro()">
		<option>Select Task</option>
			<%
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3309/internship", "root", "pdr16418@@@###");
			PreparedStatement st = con.prepareStatement("select taskid,taskname from tbl_tasks");
			ResultSet rs=st.executeQuery();
			while(rs.next())
			{
				out.println("<option>"+rs.getString("taskname")+"</option>");
			}
			%>
		</select>
	</div>
        	</form>
        	<div id="display">
        	<div class="jumbotron">
        		<h1 style="text-align:center">Recent Added Task</h1>
        	</div>
        	<div>
        		<table class="table table-striped">
        		<thead>
        		<tr>
        			<th>Task Name</th>
        			<th>Project Name</th>
        			<th>Start Date</th>
        			<th>End Date</th>
        			<th>Actual Complete</th>
        			<th>Employee Name</th>
        			<th>Username</th>
        			<th>Task Status</th>
        			<th>Priority</th>
        			<th>Description</th>
        			<th>Status</th>
        		</tr>
        		</thead>
        <%@ page import="java.sql.*" %>
			<% 
			
			st = con.prepareStatement("SELECT t.taskname,p.projectname,pr.priority,w.status AS taskstatus,t.startdate,t.enddate,t.actualcomplete,t.description,u.username,u.fullname,s.status FROM tbl_tasks t,tbl_projectdetails p,tbl_status s,tbl_workstatus w,tbl_priority pr,tbl_users u WHERE t.projectid=p.projectid AND t.status=s.statusid  AND t.taskstatus=w.statusid  AND t.priority=pr.priorityid AND t.employeeid=u.userid AND t.taskid=(SELECT MAX(taskid) FROM tbl_tasks)");			
			rs=st.executeQuery();
			while(rs.next())
			{
				out.println("<tr>");

				out.println("<td>"+rs.getString("taskname")+"</td>");
				out.println("<td>"+rs.getString("projectname")+"</td>");
				out.println("<td>"+rs.getDate("startdate")+"</td>");
				out.println("<td>"+rs.getDate("enddate")+"</td>");
				out.println("<td>"+rs.getDate("actualcomplete")+"</td>");
				out.println("<td>"+rs.getString("fullname")+"</td>");
				out.println("<td>"+rs.getString("username")+"</td>");
				out.println("<td>"+rs.getString("taskstatus")+"</td>");
				out.println("<td>"+rs.getString("priority")+"</td>");
				out.println("<td>"+rs.getString("description")+"</td>");
				out.println("<td>"+rs.getString("status")+"</td>");
			}
			%>
        </table>
        	</div>
        </div>
        
 <%} %>
</body>
</html>