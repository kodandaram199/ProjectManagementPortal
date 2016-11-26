package com.mvc.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dao.UserDao;
import com.mvc.dao.UserEditDao;
import com.mvc.model.UsersModel;

/**
 * Servlet implementation class UserEditController
 */
@WebServlet("/UserEditController")
public class UserEditController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		boolean inserted=false;
		int userid=Integer.parseInt(request.getParameter("userid"));
		String fullname=request.getParameter("fullname");
		String email=request.getParameter("email");
		int depid= Integer.parseInt(request.getParameter("depid").trim());
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String pic=request.getParameter("pic");
		int gender=Integer.parseInt(request.getParameter("gender").trim());
		int roleid=Integer.parseInt(request.getParameter("approle").trim());
		long phonenumber=Long.parseLong(request.getParameter("phonenumber").trim());
		String address=request.getParameter("address");
		int country=Integer.parseInt(request.getParameter("country").trim());
		int state=Integer.parseInt(request.getParameter("state").trim());
		int city=Integer.parseInt(request.getParameter("cityname").trim());
		int pin=Integer.parseInt(request.getParameter("pin").trim());
		int status=Integer.parseInt(request.getParameter("status").trim());
		
		UsersModel usersmodel=new UsersModel();
		usersmodel.setUserid(userid);
		usersmodel.setFullname(fullname);
		usersmodel.setEmail(email);
		usersmodel.setDepid(depid);
		usersmodel.setUsername(username);
		usersmodel.setPassword(password);
		usersmodel.setPic(pic);
		usersmodel.setGender(gender);
		usersmodel.setRoleid(roleid);
		usersmodel.setPhonenumber(phonenumber);
		usersmodel.setAddress(address);
		usersmodel.setCountry(country);
		usersmodel.setCity(city);
		usersmodel.setState(state);
		usersmodel.setPin(pin);
		usersmodel.setStatus(status);
		
		String sql1="update tbl_users set fullname=?,email=?,depid=?,username=?,password=?,pic=?,gender=?,roleid=?,phonenumber=?,address=?,country=?,city=?,state=?,pin=?,status=? where userid=?";
		
		
		try {
			inserted=UserEditDao.editUserDetails(usersmodel,sql1);
			if(inserted)
			{
			    response.sendRedirect("useredit.jsp");
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
