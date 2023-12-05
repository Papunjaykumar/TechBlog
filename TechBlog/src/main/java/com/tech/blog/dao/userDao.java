package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
//	get user by user email and password
	public User getUserByEmailAndPassword(String email,String password) {
		User user=null;
		try {
			String query="Select * from userTable where email=? and password=?";
			PreparedStatement pstmt=this.con.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2,password);
			//fetching the data from the database
			ResultSet rstmt=pstmt.executeQuery();
			if(rstmt.next()) {
				user=new User();
//				data from tb
				String name=rstmt.getString("name");
//				set the data to the user
				user.setName(name);
				user.setId(rstmt.getInt("userid"));
				user.setEmail(rstmt.getString("email"));
				user.setPassword(rstmt.getString("password"));
				user.setGender(rstmt.getString("gender"));
				user.setAbout(rstmt.getString("about"));
				user.setDateTime(rstmt.getTimestamp("rdate"));
				user.setProfile(rstmt.getString("profile"));
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}
	
	public boolean updateUser(User user) {
		boolean f=false;
		try {
			
			String query="update userTable set name=?,email=?,password=?,gender=?,about=?,profile=? where userId=?";
			PreparedStatement pstmt=con.prepareStatement(query);
			pstmt.setString(1,user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3,  user.getPassword());
			pstmt.setString(4, user.getGender());
			pstmt.setString(5, user.getAbout());
			pstmt.setString(6, user.getProfile());
			pstmt.setInt(7, user.getId());
			
			pstmt.executeUpdate();
			f=true;
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public User getUserById(int uid) {
		User user=null;
		
		try {
			String query="select * from userTable where userId=?";
			PreparedStatement pstmt=con.prepareStatement(query);
			pstmt.setInt(1, uid);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				user=new User();
				String name=rs.getString("name");
				user.setName(name);
				user.setId(rs.getInt("userid"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setGender(rs.getString("gender"));
				user.setAbout(rs.getString("about"));
				user.setDateTime(rs.getTimestamp("rdate"));
				user.setProfile(rs.getString("profile"));
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return user;
	}
}
