package com.mvc.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.mvc.model.ClientModel;

public class ClientDao {
	private static Connection con;
	private static PreparedStatement ps;
	
	private static Connection connect() throws ClassNotFoundException, SQLException {
		
		Connection con=null;
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3309/internship", "root", "pdr16418@@@###");
		return con;

}

	public static boolean insertClientDetails(ClientModel clientmodel, String sql) throws SQLException {
		
		try {
			con = connect();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			ps = con.prepareStatement(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		ps.setString(1,clientmodel.getClientname());
		ps.setLong(2,clientmodel.getClientphonenumber());
		ps.setString(3,clientmodel.getUsername());
		ps.setString(4,clientmodel.getPassword());
		ps.setInt(5,clientmodel.getGender());
		ps.setString(6,clientmodel.getPic());
		ps.setString(7,clientmodel.getAddress());
		ps.setInt(8,clientmodel.getCountry());
		ps.setInt(9,clientmodel.getState());
		ps.setInt(10,clientmodel.getCity());
		ps.setInt(11,clientmodel.getPin());
		ps.setInt(12,clientmodel.getStatus());
		
		int i=ps.executeUpdate();
		if(i>0)
		{
			return true;
		}
		else
		{
			return false;
		}
		
		
	}
	

}
