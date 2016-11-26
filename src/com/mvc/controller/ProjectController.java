package com.mvc.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.*;
import java.text.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dao.ProjectDao;
import com.mvc.model.ProjectModel;

/**
 * Servlet implementation class ProjectController
 */
@WebServlet("/ProjectController")
public class ProjectController extends HttpServlet {
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
		String projectname=request.getParameter("projectname");
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
		int projectworkstatus = Integer.parseInt(request.getParameter("projectworkstatus"));
		int priority = Integer.parseInt(request.getParameter("priority"));
		int amount = Integer.parseInt(request.getParameter("amount"));
		int mgrid = Integer.parseInt(request.getParameter("mgrid"));
		int status = Integer.parseInt(request.getParameter("status"));
		String  projectdescription=request.getParameter("projectdescription");
		int clientid = Integer.parseInt(request.getParameter("clientid"));
		
		ProjectModel projectmodel=new ProjectModel();
		projectmodel.setProjectname(projectname);
		projectmodel.setStartdate(startdate);
		projectmodel.setEnddate(enddate);
		projectmodel.setClientid(clientid);
		projectmodel.setAmount(amount);
		projectmodel.setProjectworkstatus(projectworkstatus);
		projectmodel.setMgrid(mgrid);
		projectmodel.setPriority(priority);
		projectmodel.setStatus(status);
		projectmodel.setProjectdescription(projectdescription);
		String sql="insert into tbl_projectdetails values(null,?,?,?,null,?,?,?,?,?,?,?)";
		try {
			inserted=ProjectDao.insertProjectDetails(projectmodel,sql);
			if(inserted)
			{
			    response.sendRedirect("addproject.jsp");
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
