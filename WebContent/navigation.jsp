<nav class="navbar navbar-fixed customnav">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-1">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            
            <div class="collapse navbar-collapse" id="navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="index.jsp">Home</a></li>
					<%
					if((Integer)session.getAttribute("roleid")==1)
					{
					%>
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">Project Management<span class="caret"></span></a>
						<ul class="dropdown-menu">
						  <li><a href="addproject.jsp">Add</a></li>
						  <li><a href="projectedit.jsp">Edit</a></li>
						  <li><a href="projectdelete.jsp">Delete</a></li> 
						</ul>
					</li>
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">Task Management<span class="caret"></span></a>
						<ul class="dropdown-menu">
						  <li><a href="addtask.jsp">Add</a></li>
						  <li><a href="taskedit.jsp">Edit</a></li>
						  <li><a href="taskdelete.jsp">Delete</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">Employee Management<span class="caret"></span></a>
						<ul class="dropdown-menu">
						  <li><a href="adduser.jsp">Add</a></li>
						  <li><a href="useredit.jsp">Edit</a></li>
						  <li><a href="userdelete.jsp">Delete</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">Reports<span class="caret"></span></a>
						<ul class="dropdown-menu">
                            <li class="dropdown dropdown-submenu"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Project Reports</a>
								<ul class="dropdown-menu">
								
									<li><a href="ProjectNameView.jsp">View By Project Name</a></li>
									<li><a href="ClientNameView.jsp">View By Client Name</a></li>
									<li><a href="ProjectManagerView.jsp">View By Manager Name</a></li>
									<li><a href="ProjectWorkStatusView.jsp">View By Project Status</a></li>
									<li><a href="ProjectStatusView.jsp">View By Project Status</a></li>
									<li><a href="ProjectPriorityView.jsp">View By Project Priority</a></li>
									<li><a href="ProjectStartDate.jsp">View By StartDate</a></li>
									<li><a href="ProjectEndDate.jsp">View By EndDate</a></li>
									
								</ul>
							</li>
							<li class="dropdown dropdown-submenu"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Task Reports</a>
								<ul class="dropdown-menu">
									<li><a href="TaskNameView.jsp">View By TaskName</a></li>
									<li><a href="TaskEmployeeView.jsp">View By EmployeeName</a></li>
									<li><a href="TaskStartDate.jsp">View By StartDate</a></li>
									<li><a href="TaskEndDate.jsp">View By EndDate</a></li>
									<li><a href="TaskPriorityView.jsp">View By Task Priority</a></li>
									<li><a href="TaskStatusView.jsp">View By Task Status</a></li>
									
								</ul>
							</li>
							<li class="dropdown dropdown-submenu"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Employee Reports</a>
								<ul class="dropdown-menu">
									<li><a href="NoTaskEmployees.jsp">View Members with No Tasks Assigned</a></li>
									<li><a href="EmployeeView.jsp">View Tasks Of Employee</a></li>
								</ul>
							</li>
							<li class="dropdown dropdown-submenu"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Client reports</a>
								<ul class="dropdown-menu">
									<li><a href="ClientNameView.jsp">View Client Details</a></li>
									<li><a href="ClientRequestsView.jsp">View New Requests Details</a></li>
								</ul>
							</li>                                  
                        </ul>
					</li>
					<li><a href="LogOut.jsp">Logout</a></li>
					<%
					} 
					else if((Integer)session.getAttribute("roleid")==2)
					{
					%>
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">Task Management<span class="caret"></span></a>
						<ul class="dropdown-menu">
						  <li><a href="addtask.jsp">Add</a></li>
						  <li><a href="taskedit.jsp">Edit</a></li>
						  <li><a href="taskdelete.jsp">Delete</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">Employee Management<span class="caret"></span></a>
						<ul class="dropdown-menu">
						  <li><a href="adduser.jsp">Add</a></li>
						  <li><a href="useredit.jsp">Edit</a></li>
						  <li><a href="userdelete.jsp">Delete</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">Reports<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li class="dropdown dropdown-submenu"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Project Reports</a>
								<ul class="dropdown-menu">
								
									<li><a href="ProjectNameView.jsp">View By Project Name</a></li>
									<li><a href="ClientNameView.jsp">View By Client Name</a></li>
									<li><a href="ProjectManagerView.jsp">View By Manager Name</a></li>
									<li><a href="ProjectWorkStatusView.jsp">View By Project Status</a></li>
									<li><a href="ProjectStatusView.jsp">View By Project Status</a></li>
									<li><a href="ProjectPriorityView.jsp">View By Project Priority</a></li>
									<li><a href="ProjectStartDate.jsp">View By StartDate</a></li>
									<li><a href="ProjectEndDate.jsp">View By EndDate</a></li>
									
								</ul>
							</li>
							<li class="dropdown dropdown-submenu"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Employee Reports</a>
								<ul class="dropdown-menu">
									<li><a href="NoTaskEmployees.jsp">View Members with No Tasks Assigned</a></li>
									<li><a href="EmployeeView.jsp">View Tasks Of Employee</a></li>
								</ul>
							</li>                             
                        </ul>
					</li>
					<%
					} 
					else if((Integer)session.getAttribute("roleid")==3)
					{
					%>
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">Task Management<span class="caret"></span></a>
						<ul class="dropdown-menu">
						  <li><a href="UpdateTaskStatus.jsp">Update Status</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">Reports<span class="caret"></span></a>
						<ul class="dropdown-menu">
						  <li><a href="TaskReports.jsp">Task Reports</a></li>
						</ul>
					</li>
					<%
					}
					else
					{
					%>
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">Reports<span class="caret"></span></a>
						<ul class="dropdown-menu">
						  <li class="dropdown dropdown-submenu"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Task Reports</a>
								<ul class="dropdown-menu">
									<li><a href="TaskNameView.jsp">View By TaskName</a></li>
									<li><a href="TaskEmployeeView.jsp">View By EmployeeName</a></li>
									<li><a href="TaskStartDate.jsp">View By StartDate</a></li>
									<li><a href="TaskEndDate.jsp">View By EndDate</a></li>
									<li><a href="TaskPriorityView.jsp">View By Task Priority</a></li>
									<li><a href="TaskStatusView.jsp">View By Task Status</a></li>
									
								</ul>
							</li>
							<li class="dropdown dropdown-submenu"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Employee Reports</a>
								<ul class="dropdown-menu">
									<li><a href="EmployeeView.jsp">View Tasks Of Employee</a></li>
								</ul>
							</li>
						</ul>
					</li>
					<li><a href="RequestNewTask.jsp">Add New Tasks</a></li>
					<%
					}
					%>
                </ul>
            </div>
        </nav>