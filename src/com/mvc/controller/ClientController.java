package com.mvc.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dao.ClientDao;
import com.mvc.dao.TaskDao;
import com.mvc.model.ClientModel;

/**
 * Servlet implementation class ClientController
 */
@WebServlet("/ClientController")
public class ClientController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		boolean inserted1=false;
		boolean inserted2=false;
		String clientname=request.getParameter("clientname");
		long clientphonenumber=Long.parseLong(request.getParameter("clientphonenumber"));
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String pic=request.getParameter("pic");
		int gender=Integer.parseInt(request.getParameter("gender"));
		String address=request.getParameter("address");
		int country=Integer.parseInt(request.getParameter("country"));
		int state=Integer.parseInt(request.getParameter("state"));
		int city=Integer.parseInt(request.getParameter("city"));
		int pin=Integer.parseInt(request.getParameter("pin"));
		int status=Integer.parseInt(request.getParameter("status"));
		
		
		ClientModel clientmodel= new ClientModel();
		
		clientmodel.setClientname(clientname);
		clientmodel.setClientphonenumber(clientphonenumber);
		clientmodel.setUsername(username);
		clientmodel.setPassword(password);
		clientmodel.setPic(pic);
		clientmodel.setGender(gender);
		clientmodel.setAddress(address);
		clientmodel.setCountry(country);
		clientmodel.setState(state);
		clientmodel.setCity(city);
		clientmodel.setPin(pin);
		clientmodel.setStatus(status);
		
		String sql="insert into tbl_clients values(null,?,?,?,?,?,?,?,?,?,?,?,?)";
		
			try {
				inserted1=ClientDao.insertClientDetails(clientmodel,sql);
				if(inserted1)
				{
				    response.sendRedirect("addclient.jsp");
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		}
		
		
}
