<%@ page import="com.tech.blog.entities.User" %>
<%@ page errorPage="error.jsp" %>
<%

	User user=(User)session.getAttribute("user");
	
	if(user==null){
		response.sendRedirect("login.jsp");
	}
	
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%=user.getName() %>
	<%=user.getEmail()%>
	<%=user.getGender() %>
	<%=user.getProfile() %>
	<%=user.getAbout() %>
	
	

</body>
</html>