package com.mvc.controller;

import java.io.IOException;

import java.sql.SQLException;
import java.io.*;

import com.mvc.dao.LoginDao;

import com.mvc.model.UsersModel;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.*;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final RequestDispatcher RequestDispatcher = null;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");  
        String password=request.getParameter("password"); 
        boolean valid = false ;
        PrintWriter out=response.getWriter();
		UsersModel loginmodel=new UsersModel();
		loginmodel.setUsername(username);
		loginmodel.setPassword(password);
		String sql="select userid,roleid,username,password from tbl_users where username=? and password=?";
		try {
			valid=LoginDao.validateUser(loginmodel,sql);
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		if(valid)
		{
			
			HttpSession session=request.getSession();
			session.setAttribute("usr_name",loginmodel.getUsername());
			session.setAttribute("roleid",loginmodel.getRoleid());
			session.setAttribute("userid",loginmodel.getUserid());
			RequestDispatcher rd=request.getRequestDispatcher("success.jsp"); 
			rd.forward(request, response);
		}
		else
		{
			request.setAttribute("errMsg","Invalid username or password");
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp"); 
			rd.forward(request, response);
		}
		
		
	}	

}
