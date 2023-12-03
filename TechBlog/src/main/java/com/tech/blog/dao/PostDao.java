package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;

public class PostDao {
	
	//fetching the categories from the database
	
	private Connection con;

	public PostDao(Connection con) {
		super();
		this.con = con;
	}
	
	public ArrayList<Category> getAllCategories(){
		
		ArrayList<Category> list=new ArrayList<>();
		
		try {
			String query="select * from Categories";
			PreparedStatement pstmt=con.prepareStatement(query);
			
			ResultSet stmt=pstmt.executeQuery();
			while(stmt.next()) {
				int cid=stmt.getInt("CID");
				String name=stmt.getString("NAME");
				String desccription=stmt.getString("DESC");
				
				Category c=new Category(cid,name,desccription);
				list.add(c);
			
			}
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	public boolean savePost(Post post) {
		boolean f=false;
		
		try {
			
			String query="Insert into posts(pTitle,pContent,pCode,pPic,pCid,userId) values(?,?,?,?,?,?)";
			PreparedStatement pstmt=con.prepareStatement(query);
			pstmt.setString(1,post.getpTitle());
			pstmt.setString(2, post.getpContent());
			pstmt.setString(3, post.getpCode());
			pstmt.setString(4, post.getPpic());
			pstmt.setInt(5, post.getcId());
			pstmt.setInt(6,post.getUserId());
			
			pstmt.executeUpdate();
			f=true;
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
//	get all posts
	public List<Post>getAllPosts() {
		
		List<Post>list=new ArrayList<>();
//		fetch all the post
		try {
			PreparedStatement pstmt=con.prepareStatement("select * from posts order by pid desc");
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				int pid=rs.getInt("pid");
				String pTitle=rs.getString("ptitle");
				String pContent=rs.getString("pcontent");
				String pCode=rs.getString("pcode");
				String pPic=rs.getString("pPic");
				Timestamp pdate=rs.getTimestamp("pdate");
				int pcid=rs.getInt("pcid");
				int uId=rs.getInt("userId");
				
				Post post=new Post(pTitle, pContent, pCode, pPic, pdate, uId, pcid);
				list.add(post);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		return list;
		
	}
	public List<Post>getPostByCatId(int cid){
		List<Post>list=new ArrayList<>();
//		fetch all the post by cid
		try {
			PreparedStatement pstmt=con.prepareStatement("select * from posts where pcid=?");
			pstmt.setInt(1, cid);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				int pid=rs.getInt("pid");
				String pTitle=rs.getString("ptitle");
				String pContent=rs.getString("pcontent");
				String pCode=rs.getString("pcode");
				String pPic=rs.getString("pPic");
				Timestamp pdate=rs.getTimestamp("pdate");
				int uId=rs.getInt("userId");
				
				Post post=new Post(pTitle, pContent, pCode, pPic, pdate, uId, cid);
				list.add(post);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
	
}
