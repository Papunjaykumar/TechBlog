package com.tech.blog.entities;

import java.sql.Timestamp;

public class Post {
	
	private int pId;
	private String pTitle;
	private String pContent;
	private String pCode;
	private String ppic;
	private Timestamp pDate;
	private int userId;
	private int cId;
	public Post() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Post(int pId, String pTitle, String pContent, String pCode, String ppic, Timestamp pDate, int userId,
			int cId) {
		super();
		this.pId = pId;
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pCode = pCode;
		this.ppic = ppic;
		this.pDate = pDate;
		this.userId = userId;
		this.cId = cId;
	}
	

	public Post(String pTitle, String pContent, String pCode, String ppic, Timestamp pDate, int userId, int cId) {
		super();
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pCode = pCode;
		this.ppic = ppic;
		this.pDate = pDate;
		this.userId = userId;
		this.cId = cId;
	}

	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
	public String getpTitle() {
		return pTitle;
	}
	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}
	public String getpContent() {
		return pContent;
	}
	public void setpContent(String pContent) {
		this.pContent = pContent;
	}
	public String getpCode() {
		return pCode;
	}
	public void setpCode(String pCode) {
		this.pCode = pCode;
	}
	public String getPpic() {
		return ppic;
	}
	public void setPpic(String ppic) {
		this.ppic = ppic;
	}
	public Timestamp getpDate() {
		return pDate;
	}
	public void setpDate(Timestamp pDate) {
		this.pDate = pDate;
	}
	public int getcId() {
		return cId;
	}
	public void setcId(int cId) {
		this.cId = cId;
	}
	
	
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "Post [pId=" + pId + ", pTitle=" + pTitle + ", pContent=" + pContent + ", pCode=" + pCode + ", ppic="
				+ ppic + ", pDate=" + pDate + ", userId=" + userId + ", cId=" + cId + "]";
	}

	
	
	
}
