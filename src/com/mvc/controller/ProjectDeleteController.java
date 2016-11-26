package com.mvc.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dao.ProjectDeleteDao;
import com.mvc.model.ProjectModel;

/**
 * Servlet implementation class ProjectDeleteController
 */
@WebServlet("/ProjectDeleteController")
public class ProjectDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		boolean deleted=false;
		int projectid=Integer.parseInt(request.getParameter("id"));
		
		 ProjectModel projectModel=new ProjectModel();
		 
		 projectModel.setProjectid(projectid);
		 
		 String sql="delete from tbl_projectdetails where projectid=?";
		 
		 try {
			deleted=ProjectDeleteDao.deleteProject(projectModel,sql);
			if(deleted)
			{
			    response.sendRedirect("projectdelete.jsp");
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
