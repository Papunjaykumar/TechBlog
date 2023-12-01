package com.tech.blog.servlet;

import java.io.File;
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
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.ImageUploadHelper;

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
		String oldFile=user.getProfile();
		user.setProfile(imageName);
		
		//update the data in database 
		userDao dao=new userDao(ConnectionProvider.getConnection());
		boolean ans=dao.updateUser(user);
		if(ans) {
			
			String path=request.getRealPath("/")+"pics"+File.separator+user.getProfile();
			String oldPath=request.getRealPath("/")+"pics"+File.separator+oldFile;
			System.out.println(path);
				
			if(!oldFile.equals("default.png")) {
				boolean delete=ImageUploadHelper.deleteFile(oldPath);
			}
				
				
				boolean upload=ImageUploadHelper.saveFile(part.getInputStream(), path);
				if(upload) {
					out.println("Profile Updated ...");
					Message msg=new Message("Profile Details Updated...", "success", "alert-success");
					session.setAttribute("msg", msg);
					
					out.println("Updated to db");
				}else {
					out.println("File Not save...");
					Message msg=new Message("Something went wrong...", "error", "alert-danger");
					session.setAttribute("msg", msg);
				}
			
		}else {
			out.println("Not updated..");
			Message msg=new Message("Something went wrong...", "error", "alert-danger");
			session.setAttribute("msg", msg);
		}
		
		response.sendRedirect("profile.jsp");
		
		
		
	}

}
