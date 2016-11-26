package com.mvc.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dao.ClientDeleteDao;
import com.mvc.dao.UserDeleteDao;
import com.mvc.model.ClientModel;

/**
 * Servlet implementation class ClientDeleteController
 */
@WebServlet("/ClientDeleteController")
public class ClientDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		boolean deleted=false;
		int clientid=Integer.parseInt(request.getParameter("id"));
		
		 ClientModel clientmodel=new ClientModel();
		 
		 clientmodel.setClientid(clientid);
		 
		 String sql="delete from tbl_clients where clientid=?";
		 
		 try {
			deleted=ClientDeleteDao.deleteClient(clientmodel,sql);
			if(deleted)
			{
			    response.sendRedirect("clientdelete.jsp");
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
