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
import javax.servlet.http.HttpSession;

import com.mvc.dao.ClientRequestDao;
import com.mvc.dao.TaskDao;
import com.mvc.model.ClientRequestModel;

/**
 * Servlet implementation class ClientRequestController
 */
@WebServlet("/ClientRequestController")
public class ClientRequestController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    
	    boolean inserted=false;
	    	String st;
		Date dt = null;
		java.sql.Date enddate=null;
		String taskname=request.getParameter("taskname");
		String  date=request.getParameter("enddate");
		SimpleDateFormat sdt=new SimpleDateFormat("yyyy-MM-dd");
		try {
			dt=sdt.parse(date);
			st=sdt.format(dt);
			enddate=new java.sql.Date(dt.getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String description=request.getParameter("description");
		HttpSession session=request.getSession();
		int clientid=(Integer)session.getAttribute("userid");
		
		ClientRequestModel clientrequestmodel=new ClientRequestModel();
		
		clientrequestmodel.setTaskname(taskname);
		clientrequestmodel.setEnddate(enddate);
		clientrequestmodel.setDescription(description);
		clientrequestmodel.setClientid(clientid);
		String sql="insert into tbl_clientrequests values(null,?,?,?,?,now())";
		try {
			inserted=ClientRequestDao.insertRequestedTaskDetails(clientrequestmodel,sql);
			if(inserted)
			{
			    response.sendRedirect("RequestNewClient.jsp");
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
