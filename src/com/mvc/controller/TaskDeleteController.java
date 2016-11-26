package com.mvc.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dao.TaskDeleteDao;
import com.mvc.model.TaskModel;

/**
 * Servlet implementation class TaskDeleteController
 */
@WebServlet("/TaskDeleteController")
public class TaskDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		boolean deleted=false;
		int taskid=Integer.parseInt(request.getParameter("id"));
		
		 TaskModel taskmodel=new TaskModel();
		 
		 taskmodel.setTaskid(taskid);
		 
		 String sql="delete from tbl_tasks where taskid=?";
		 
		 try {
			deleted=TaskDeleteDao.deleteTask(taskmodel,sql);
			if(deleted)
			{
			    response.sendRedirect("taskdelete.jsp");
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
