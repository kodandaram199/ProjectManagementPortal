package com.mvc.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mvc.model.ProjectModel;
import com.mvc.model.UsersModel;

public class ProjectDao {
	private static Connection con;
	private static PreparedStatement st;

	private static Connection connect() throws ClassNotFoundException, SQLException {
			
			Connection con=null;
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3309/internship", "root", "pdr16418@@@###");
			return con;
	}
	public static boolean insertProjectDetails(ProjectModel projectmodel,String sql) throws ClassNotFoundException, SQLException
	{
		con = connect();
		st = con.prepareStatement(sql);
		st.setString(1, projectmodel.getProjectname());
		st.setDate(2, projectmodel.getStartdate());
		st.setDate(3, projectmodel.getEnddate());
		st.setInt(4, projectmodel.getProjectworkstatus());
		st.setInt(5, projectmodel.getPriority());
		st.setInt(6, projectmodel.getClientid());
		st.setString(7, projectmodel.getProjectdescription());
		st.setInt(8, projectmodel.getAmount());
		st.setInt(9, projectmodel.getMgrid());
		st.setInt(10, projectmodel.getStatus());
		int i=st.executeUpdate();
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

