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

import com.mvc.dao.ProjectDao;
import com.mvc.dao.ProjectEditDao;
import com.mvc.model.ProjectModel;

/**
 * Servlet implementation class ProjectEditController
 */
@WebServlet("/ProjectEditController")
public class ProjectEditController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		boolean updated=false;
		Date dt1 = null;
		String st1=null;
		Date dt2 = null;
		String st2=null;
		Date dt3= null;
		String st3=null;
		java.sql.Date startdate=null;
		java.sql.Date enddate=null;
		java.sql.Date actualcompletedate=null;
		String projectname=request.getParameter("projectname");
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
		int projectworkstatus = Integer.parseInt(request.getParameter("projectworkstatus").trim());
		int priority = Integer.parseInt(request.getParameter("priority").trim());
		int clientid = Integer.parseInt(request.getParameter("clientid").trim());
		int amount = Integer.parseInt(request.getParameter("amount"));
		int mgrid = Integer.parseInt(request.getParameter("mgrid"));
		int status = Integer.parseInt(request.getParameter("status").trim());
		String  projectdescription=request.getParameter("projectdescription");
		int projectid=Integer.parseInt(request.getParameter("projectid").trim());
		
		ProjectModel projectmodel=new ProjectModel();
		projectmodel.setProjectname(projectname);
		projectmodel.setStartdate(startdate);
		projectmodel.setEnddate(enddate);
		projectmodel.setActualcompletedate(actualcompletedate);
		projectmodel.setClientid(clientid);
		projectmodel.setAmount(amount);
		projectmodel.setProjectworkstatus(projectworkstatus);
		projectmodel.setMgrid(mgrid);
		projectmodel.setPriority(priority);
		projectmodel.setStatus(status);
		projectmodel.setProjectdescription(projectdescription);
		projectmodel.setProjectid(projectid);
		String sql="update tbl_projectdetails set projectname=?,startdate=?,enddate=?,actualcomplete=?,projectworkstatus=?,priority=?,clientid=?,projectdesc=?,amount=?,mgrid=?,status=? where projectid=?";
		try {
			updated=ProjectEditDao.editProjectDetails(projectmodel,sql);
			if(updated)
			{
			    response.sendRedirect("projectedit.jsp");
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	}


