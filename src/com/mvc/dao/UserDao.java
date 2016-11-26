package com.mvc.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.mvc.model.ClientModel;
import com.mvc.model.UsersModel;

public class UserDao {
	
	private static Connection con;
	private static PreparedStatement ps1;
	private static PreparedStatement ps2;
	private static PreparedStatement ps3;
	private static Connection connect() throws ClassNotFoundException, SQLException {
			
			Connection con=null;
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3309/internship", "root", "pdr16418@@@###");
			return con;

}
	public static boolean insertUserDetails(UsersModel usersmodel,ClientModel clientmodel,String sql1,String sql2,String sql3) throws ClassNotFoundException, SQLException
	{
		
		boolean insert=false;
		try{
		con = connect();
		con.setAutoCommit(false);
		ps1 = con.prepareStatement(sql1);
		ps2 = con.prepareStatement(sql2);
		ps3 = con.prepareStatement(sql3);
		
		ps1.setString(1,usersmodel.getFullname());
		ps1.setString(2,usersmodel.getEmail());
		ps1.setInt(3,usersmodel.getDepid());
		ps1.setString(4,usersmodel.getUsername());
		ps1.setString(5, usersmodel.getPassword());
		ps1.setInt(6,usersmodel.getGender());
		ps1.setInt(7,usersmodel.getRoleid());
		ps1.setLong(8,usersmodel.getPhonenumber());
		ps1.setString(9,usersmodel.getAddress());
		ps1.setInt(10,usersmodel.getCountry());
		ps1.setInt(11,usersmodel.getState());
		ps1.setInt(12,usersmodel.getCity());
		ps1.setInt(13,usersmodel.getPin());
		ps1.setInt(14,usersmodel.getStatus());
		ps1.execute();
		if(usersmodel.getRoleid()==2 || usersmodel.getRoleid()==3)
		{
		ps2.setString(1,usersmodel.getFullname());
		ps2.setString(2,usersmodel.getEmail());
		ps2.setInt(3,usersmodel.getDepid());
		ps2.setString(4,usersmodel.getUsername());
		ps2.setString(5, usersmodel.getPassword());
		ps2.setInt(6,usersmodel.getGender());
		ps2.setInt(7,usersmodel.getRoleid());
		ps2.setLong(8,usersmodel.getPhonenumber());
		ps2.setString(9,usersmodel.getAddress());
		ps2.setInt(10,usersmodel.getCountry());
		ps2.setInt(11,usersmodel.getState());
		ps2.setInt(12,usersmodel.getCity());
		ps2.setInt(13,usersmodel.getPin());
		ps2.setInt(14,usersmodel.getStatus());
		
		ps2.execute();
		}
		
		else if(usersmodel.getRoleid()==4)
		{
		    ps3.setString(1, clientmodel.getClientname());
		    ps3.setString(2, clientmodel.getClientmail());
		    ps3.setString(3,clientmodel.getUsername());
		    ps3.setString(4, clientmodel.getPassword());
		    ps3.setInt(5, clientmodel.getGender());
		    ps3.setLong(6,clientmodel.getClientphonenumber());
		    ps3.setString(7,clientmodel.getAddress());
		    ps3.setInt(8, clientmodel.getCountry());
		    ps3.setInt(9, clientmodel.getState());
		    ps3.setInt(10, clientmodel.getCity());
		    ps3.setInt(11, clientmodel.getPin());
		    ps3.setInt(12, clientmodel.getStatus());
		    
		    ps3.execute();
		}
		
		con.commit();
		
		
		
		}catch (Exception e)
	    {
			e.printStackTrace();
			try{
				con.rollback();
				System.out.println("rollbacked");
				return false;
			}catch(SQLException e1)
			{
				 System.out.println("SQLException in rollback"+e.getMessage());
			}
	   
	    }
		return true;
	}
}
