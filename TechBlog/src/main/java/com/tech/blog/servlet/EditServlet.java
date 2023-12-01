package com.tech.blog.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.userDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class EditServlet
 */
@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		//		fetching the data from the form
		String email=request.getParameter("user_email");
		String name=request.getParameter("user_name");
		String password=request.getParameter("user_password");
		String about=request.getParameter("user_about");
		
		Part part=request.getPart("image");
		System.out.println(part);
		String imageName=part.getSubmittedFileName();
		
		//get the user from the session
		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("user");
		user.setEmail(email);
		user.setName(name);
		user.setPassword(password);
		user.setAbout(about);
		user.setProfile(imageName);
		
		//update the data in database 
		userDao dao=new userDao(ConnectionProvider.getConnection());
		boolean ans=dao.updateUser(user);
		if(ans) {
			out.println("Updated to db");
		}else {
			out.println("Not updated..");
		}
		
		
		
	}

}
