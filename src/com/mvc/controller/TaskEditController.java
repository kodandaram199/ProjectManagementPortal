package com.mvc.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dao.TaskDao;
import com.mvc.dao.TaskEditDao;
import com.mvc.model.TaskModel;

/**
 * Servlet implementation class TaskEditController
 */
@WebServlet("/TaskEditController")
public class TaskEditController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		boolean inserted=false;
		Date dt1 = null;
		String st1=null;
		Date dt2 = null;
		String st2=null;
		Date dt3= null;
		String st3=null;
		java.sql.Date startdate=null;
		java.sql.Date enddate=null;
		java.sql.Date actualcompletedate=null;
		
		int taskid=Integer.parseInt(request.getParameter("taskid").trim());
		String taskname=request.getParameter("taskname");
		String taskdescription=request.getParameter("taskdescription");
		int projectid=Integer.parseInt(request.getParameter("projectid").trim());
		int priority=Integer.parseInt(request.getParameter("priority").trim());
		int taskstatus=Integer.parseInt(request.getParameter("taskstatus").trim());
		int employeeid=Integer.parseInt(request.getParameter("employeeid").trim());
		int status=Integer.parseInt(request.getParameter("status").trim());
		String  date1=request.getParameter("startdate");
		String  date2=request.getParameter("enddate");
		String  date3=request.getParameter("actualcompletedate");
		SimpleDateFormat sdt1=new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdt2=new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdt3=new SimpleDateFormat("yyyy-MM-dd");
		try {
			dt1=sdt1.parse(date1);
			st1=sdt1.format(dt1);
			startdate=new java.sql.Date(dt1.getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			dt2=sdt2.parse(date2);
			st2=sdt2.format(dt2);
			enddate=new java.sql.Date(dt2.getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			dt3=sdt3.parse(date3);
			st3=sdt3.format(dt3);
			actualcompletedate=new java.sql.Date(dt3.getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		TaskModel taskmodel=new TaskModel();
		
		taskmodel.setTaskid(taskid);
		taskmodel.setTaskname(taskname);
		taskmodel.setProjectid(projectid);
		taskmodel.setPriority(priority);
		taskmodel.setTaskstatus(taskstatus);
		taskmodel.setStartdate(startdate);
		taskmodel.setEnddate(enddate);
		taskmodel.setActualcompletedate(actualcompletedate);
		taskmodel.setTaskdescription(taskdescription);
		taskmodel.setEmployeeid(employeeid);
		taskmodel.setStatus(status);
		
		String sql="update tbl_tasks set taskname=?,projectid=?,priority=?,taskstatus=?,startdate=?,enddate=?,actualcomplete=?,description=?,employeeid=?,status=? where taskid=?";
		try {
			inserted=TaskEditDao.editTaskDetails(taskmodel,sql);
			if(inserted)
			{
			    response.sendRedirect("taskedit.jsp");
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
