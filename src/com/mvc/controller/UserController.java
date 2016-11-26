package com.mvc.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dao.UserDao;
import com.mvc.model.ClientModel;
import com.mvc.model.UsersModel;

/**
 * Servlet implementation class UserController
 */
@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		boolean inserted=false;
		String fullname=request.getParameter("fullname");
		String email=request.getParameter("email");
		int depid= Integer.parseInt(request.getParameter("depid").trim());
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		int gender=Integer.parseInt(request.getParameter("gender"));
		int roleid=Integer.parseInt(request.getParameter("approle"));
		long phonenumber=Long.parseLong(request.getParameter("phonenumber").trim());
		String address=request.getParameter("address");
		int country=Integer.parseInt(request.getParameter("country"));
		int state=Integer.parseInt(request.getParameter("state"));
		int city=Integer.parseInt(request.getParameter("cityname"));
		int pin=Integer.parseInt(request.getParameter("pin"));
		int status=Integer.parseInt(request.getParameter("status"));
		
		UsersModel usersmodel=new UsersModel();
		usersmodel.setFullname(fullname);
		usersmodel.setEmail(email);
		usersmodel.setDepid(depid);
		usersmodel.setUsername(username);
		usersmodel.setPassword(password);
		usersmodel.setGender(gender);
		usersmodel.setRoleid(roleid);
		usersmodel.setPhonenumber(phonenumber);
		usersmodel.setAddress(address);
		usersmodel.setCountry(country);
		usersmodel.setCity(city);
		usersmodel.setState(state);
		usersmodel.setPin(pin);
		usersmodel.setStatus(status);
		
		
		ClientModel clientmodel=new ClientModel();
		
		clientmodel.setClientname(fullname);
		clientmodel.setClientmail(email);
		clientmodel.setUsername(username);
		clientmodel.setPassword(password);
		clientmodel.setGender(gender);
		clientmodel.setClientphonenumber(phonenumber);
		clientmodel.setAddress(address);
		clientmodel.setCountry(country);
		clientmodel.setState(state);
		clientmodel.setCity(city);
		clientmodel.setPin(pin);
		clientmodel.setStatus(status);
		
		
		String sql1="insert into tbl_users values(null,?,?,?,?,?,null,?,?,?,?,?,?,?,?,?)";
		String sql2="insert into tbl_employees values(null,?,?,?,?,?,null,?,?,?,?,?,?,?,?,?)";
		String sql3="insert into tbl_clients values(null,?,?,?,?,?,null,?,?,?,?,?,?,?)";
		
		try {
			inserted=UserDao.insertUserDetails(usersmodel,clientmodel,sql1,sql2,sql3);
			if(inserted)
			{
			    response.sendRedirect("adduser.jsp");
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(inserted)
		{
			
		}
	
		
	}

}
