package com.mvc.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dao.UserDeleteDao;
import com.mvc.model.UsersModel;

/**
 * Servlet implementation class UserDeleteController
 */
@WebServlet("/UserDeleteController")
public class UserDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		boolean deleted=false;
		int userid=Integer.parseInt(request.getParameter("id"));
		
		 UsersModel usersmodel=new UsersModel();
		 
		 usersmodel.setUserid(userid);
		 
		 String sql="delete from tbl_users where userid=?";
		 
		 try {
			deleted=UserDeleteDao.deleteUser(usersmodel,sql);
			if(deleted)
			{
			    response.sendRedirect("userdelete.jsp");
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
