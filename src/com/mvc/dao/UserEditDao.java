package com.mvc.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.mvc.model.UsersModel;

public class UserEditDao {
	
	private static Connection con;
	private static PreparedStatement ps1;
	private static PreparedStatement ps2;
	private static Connection connect() throws ClassNotFoundException, SQLException {
			
			Connection con=null;
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3309/internship", "root", "pdr16418@@@###");
			return con;

}
	public static boolean editUserDetails(UsersModel usersmodel,String sql1) throws ClassNotFoundException, SQLException
	{
		
		boolean insert=false;
		try{
		con = connect();
		con.setAutoCommit(false);
		ps1 = con.prepareStatement(sql1);
		
		
		ps1.setString(1,usersmodel.getFullname());
		ps1.setString(2,usersmodel.getEmail());
		ps1.setInt(3,usersmodel.getDepid());
		ps1.setString(4,usersmodel.getUsername());
		ps1.setString(5, usersmodel.getPassword());
		ps1.setString(6, usersmodel.getPic());
		ps1.setInt(7,usersmodel.getGender());
		ps1.setInt(8,usersmodel.getRoleid());
		ps1.setLong(9,usersmodel.getPhonenumber());
		ps1.setString(10,usersmodel.getAddress());
		ps1.setInt(11,usersmodel.getCountry());
		ps1.setInt(12,usersmodel.getState());
		ps1.setInt(13,usersmodel.getCity());
		ps1.setInt(14,usersmodel.getPin());
		ps1.setInt(15,usersmodel.getStatus());
		ps1.setInt(16,usersmodel.getUserid());
		
		ps1.execute();
		
		
		con.commit();
		
		
		
		}catch (Exception e)
	    {
			e.printStackTrace();
			try{
				con.rollback();
				System.out.println("rollbcked");
				return false;
			}catch(SQLException e1)
			{
				 System.out.println("SQLException in rollback"+e.getMessage());
			}
	   
	    }
		return true;
	}

}
