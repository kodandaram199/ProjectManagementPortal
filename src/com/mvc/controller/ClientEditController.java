package com.mvc.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dao.ClientDao;
import com.mvc.dao.ClientEditDao;
import com.mvc.model.ClientModel;

/**
 * Servlet implementation class ClientEditController
 */
@WebServlet("/ClientEditController")
public class ClientEditController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		boolean inserted1=false;
		
	
		String clientname=request.getParameter("clientname");
		long clientphonenumber=Long.parseLong(request.getParameter("clientphonenumber"));
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String pic=request.getParameter("pic");
		int gender=Integer.parseInt(request.getParameter("gender").trim());
		String address=request.getParameter("address");
		int country=Integer.parseInt(request.getParameter("country").trim());
		int state=Integer.parseInt(request.getParameter("state").trim());
		int city=Integer.parseInt(request.getParameter("city").trim());
		int pin=Integer.parseInt(request.getParameter("pin").trim());
		int status=Integer.parseInt(request.getParameter("status").trim());
		int clientid=Integer.parseInt(request.getParameter("clientid").trim());
		
		
		ClientModel clientmodel= new ClientModel();
		
		clientmodel.setClientid(clientid);
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
		
		String sql="update tbl_clients set clientname=?,clientphonenumber=?,username=?,password=?,pic=?,gender=?,address=?,country=?,state=?,city=?,pin=?,status=? where clientid=?";
		
			try {
				inserted1=ClientEditDao.editClientDetails(clientmodel,sql);
				if(inserted1)
				{
				    response.sendRedirect("clientedit.jsp");
				}
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		}
	}


