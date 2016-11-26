package com.mvc.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.mvc.model.ProjectModel;

public class ProjectEditDao {

	private static Connection con;
	private static PreparedStatement st;

	private static Connection connect() throws ClassNotFoundException, SQLException {
			
			Connection con=null;
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3309/internship", "root", "pdr16418@@@###");
			return con;
	}
	public static boolean editProjectDetails(ProjectModel projectmodel,String sql) throws ClassNotFoundException, SQLException
	{
		con = connect();
		st = con.prepareStatement(sql);
		st.setString(1, projectmodel.getProjectname());
		st.setDate(2, projectmodel.getStartdate());
		st.setDate(3, projectmodel.getEnddate());
		st.setDate(4, projectmodel.getActualcompletedate());
		st.setInt(5, projectmodel.getProjectworkstatus());
		st.setInt(6, projectmodel.getPriority());
		st.setInt(7, projectmodel.getClientid());
		st.setString(8, projectmodel.getProjectdescription());
		st.setInt(9, projectmodel.getAmount());
		st.setInt(10, projectmodel.getMgrid());
		st.setInt(11, projectmodel.getStatus());
		st.setInt(12, projectmodel.getProjectid());
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
