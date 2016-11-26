package com.mvc.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.mvc.model.ClientRequestModel;
import com.mvc.model.TaskModel;

public class ClientRequestDao {
    
    private static Connection con;
	private static PreparedStatement ps;

	private static Connection connect() throws ClassNotFoundException, SQLException {
			
			Connection con=null;
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3309/internship", "root", "pdr16418@@@###");
			return con;

}
	public static boolean insertRequestedTaskDetails(ClientRequestModel clientrequestmodel,String sql) throws ClassNotFoundException, SQLException
	{
		con = connect();
		ps = con.prepareStatement(sql);
		
		ps.setInt(1,clientrequestmodel.getClientid());
		ps.setString(2,clientrequestmodel.getTaskname());
		ps.setDate(3,clientrequestmodel.getEnddate());
		ps.setString(4,clientrequestmodel.getDescription());
		
		
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
