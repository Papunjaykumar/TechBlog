package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikeDao {
	private Connection con;
	
	
//	 default constructor
	public LikeDao() {
		super();
		// TODO Auto-generated constructor stub
	}
// parameterized constructor
	public LikeDao(Connection con) {
		super();
		this.con = con;
	}
	
//	insert like
	public boolean insertLike(int pid,int uid) {
		boolean f=false;
		
		try {
			String query="Insert into likes(pid,userId) values(?,?)";
			PreparedStatement pstmt=con.prepareStatement(query);
			pstmt.setInt(1, pid);
			pstmt.setInt(2, uid);
			
			pstmt.executeUpdate();
			f=true;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
//	get the count of likes in post
	public int countLikeOnPost(int pid) {
		int count=0;
		try {
			String query="select count(*) from likes where pid=?";
			PreparedStatement pstmt=con.prepareStatement(query);
			pstmt.setInt(1, pid);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt(1);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}

//	get whether user like the post or not 
	public boolean isLikedByUser(int pid,int uid) {
		boolean f=false;
		
		try {
			String query="select * from likes where pid=? and userId=?";
			PreparedStatement pstmt=con.prepareStatement(query);
			pstmt.setInt(1, pid);
			pstmt.setInt(2, uid);
			
			f=pstmt.executeQuery().next();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

//	
	public boolean deleteLike(int pid,int uid) {
		boolean f=false;
		
		try {
			
			String query="Delete from likes where pid=? and userId=?";
			PreparedStatement pstmt=con.prepareStatement(query);
			pstmt.setInt(1, pid);
			pstmt.setInt(2, uid);
			
			pstmt.executeUpdate();
			f=true;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

}
