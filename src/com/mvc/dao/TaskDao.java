package com.mvc.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.mvc.model.ProjectModel;
import com.mvc.model.TaskModel;

public class TaskDao {
	private static Connection con;
	private static PreparedStatement ps;

	private static Connection connect() throws ClassNotFoundException, SQLException {
			
			Connection con=null;
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3309/internship", "root", "pdr16418@@@###");
			return con;

}
	public static boolean insertTaskDetails(TaskModel taskmodel,String sql) throws ClassNotFoundException, SQLException
	{
		con = connect();
		ps = con.prepareStatement(sql);
		
		ps.setString(1,taskmodel.getTaskname());
		ps.setInt(2,taskmodel.getProjectid());
		ps.setInt(3,taskmodel.getPriority());
		ps.setInt(4,taskmodel.getTaskstatus());
		ps.setDate(5,taskmodel.getStartdate());
		ps.setDate(6,taskmodel.getEnddate());
		ps.setString(7,taskmodel.getTaskdescription());
		ps.setInt(8,taskmodel.getEmployeeid());
		ps.setInt(9,taskmodel.getStatus());
		
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
