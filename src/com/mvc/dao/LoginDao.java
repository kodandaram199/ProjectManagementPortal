package com.mvc.dao;

import java.sql.*;
import com.mvc.model.UsersModel;

public class LoginDao {
	
private static Connection con;
private static PreparedStatement st;

private static Connection connect() throws ClassNotFoundException, SQLException {
		
		Connection con=null;
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3309/internship", "root", "pdr16418@@@###");
		return con;
}

	public static boolean validateUser(UsersModel loginmodel,String sql) throws ClassNotFoundException, SQLException
	{
		con = connect();
		st = con.prepareStatement(sql);
		st.setString(1, loginmodel.getUsername());
		st.setString(2, loginmodel.getPassword());
		ResultSet rs=st.executeQuery();
		boolean a=rs.next();
		loginmodel.setRoleid(rs.getInt("roleid"));
		loginmodel.setUserid(rs.getInt("userid"));
		if(a)
		{
			return true;
		}
		else
		{
			return false;
		}
		
	}

	

}
