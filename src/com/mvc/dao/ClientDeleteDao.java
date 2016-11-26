package com.mvc.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.mvc.model.ClientModel;
import com.mvc.model.UsersModel;

public class ClientDeleteDao {
	
		
		private static Connection con;
		private static PreparedStatement ps;

		private static Connection connect() throws ClassNotFoundException, SQLException {
				
				Connection con=null;
				Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost:3309/internship", "root", "pdr16418@@@###");
				return con;

	}
		
		public static boolean deleteClient(ClientModel clientmodel,String sql) throws ClassNotFoundException, SQLException
		{
			con = connect();
			ps = con.prepareStatement(sql);
			
			ps.setInt(1,clientmodel.getClientid());
			
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
