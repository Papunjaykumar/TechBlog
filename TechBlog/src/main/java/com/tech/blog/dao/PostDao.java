package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.tech.blog.entities.Category;

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
	
}