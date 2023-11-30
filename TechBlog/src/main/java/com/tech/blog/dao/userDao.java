package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.tech.blog.entities.User;

public class userDao {
	private Connection con;

	public userDao(Connection con) {
		super();
		this.con = con;
	}
	
	//method to inset user to data
	
	public boolean saveUser(User user) {
		
		boolean f=false;
		
		try {
			//user -->Database
			
			String query="Insert into userTable(name,email,password,gender,about) values(?,?,?,?,?)";
			PreparedStatement pstmt=this.con.prepareStatement(query);
			pstmt.setString(1,user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getGender());
			pstmt.setString(5, user.getAbout());
			
			pstmt.executeUpdate();
			f=true;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
		
	}
}
