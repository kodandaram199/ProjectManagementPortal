package com.mvc.controller;

import java.io.IOException;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.io.*;

import com.mvc.dao.ProjectDao;
import com.mvc.dao.TaskDao;
import com.mvc.model.TaskModel;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TaskController
 */
@WebServlet("/TaskController")
public class TaskController extends HttpServlet {
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
		java.sql.Date startdate=null;
		java.sql.Date enddate=null;
		String taskname=request.getParameter("taskname");
		String taskdescription=request.getParameter("taskdescription");
		int projectid=Integer.parseInt(request.getParameter("projectid"));
		int priority=Integer.parseInt(request.getParameter("priority").trim());
		int taskstatus=Integer.parseInt(request.getParameter("taskstatus"));
		int employeeid=Integer.parseInt(request.getParameter("employeeid").trim());
		int status=Integer.parseInt(request.getParameter("status").trim());
		String  date1=request.getParameter("startdate");
		String  date2=request.getParameter("enddate");
		SimpleDateFormat sdt1=new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdt2=new SimpleDateFormat("yyyy-MM-dd");
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
		TaskModel taskmodel=new TaskModel();
		
		taskmodel.setTaskname(taskname);
		taskmodel.setProjectid(projectid);
		taskmodel.setPriority(priority);
		taskmodel.setTaskstatus(taskstatus);
		taskmodel.setStartdate(startdate);
		taskmodel.setEnddate(enddate);
		taskmodel.setTaskdescription(taskdescription);
		taskmodel.setEmployeeid(employeeid);
		taskmodel.setStatus(status);
		String sql="insert into tbl_tasks values(null,?,?,?,?,?,?,null,?,?,?)";
		try {
			inserted=TaskDao.insertTaskDetails(taskmodel,sql);
			if(inserted)
			{
			    response.sendRedirect("addtask.jsp");
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
