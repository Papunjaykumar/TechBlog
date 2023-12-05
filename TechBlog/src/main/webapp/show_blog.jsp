<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.userDao"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error.jsp"%>
<%
User user = (User) session.getAttribute("user");

if (user == null) {
	response.sendRedirect("login.jsp");
}
%>

<%
	int postId=Integer.parseInt(request.getParameter("post_id"));
	PostDao dao=new PostDao(ConnectionProvider.getConnection());
	Post post=dao.getPostById(postId);
	
%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=post.getpTitle() %> || TechBlog by Learn Code with
	Papunjay</title>
<!--boottrap css  -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<link href="css/myStyle.css" rel="stylesheet" type="text/css" />

<!-- font awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href = "https://fonts.googleapis.com/css?family=Roboto+Mono|Roboto+Slab|Roboto:300,400,500,700" rel = "stylesheet" />
<style>
.banner-background {
	clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 95%, 69% 100%, 25% 96%, 0 100%, 0 0
		);
}
.post-title{
	font-weight:100;
	font-size:30px;
	
}
.post-content{
	font-weight:100;
	font-size:25px;
}
.post-code{

}
.post-date{
	font-style:italic;
	font-weight:bold;
}
.post-user-info{
	font-size:20px;
	font-weight:200;
}
.row-user{
	border:1px solid #e2e2e2;
	padding-top:15px;
}
body{
	background: url(img/web_background.jpg);
	background-size: cover;
	background-attachment: fixed;
}


</style>
</head>
<body>
	<!--navbar  -->


	<nav class="navbar navbar-expand-lg navbar-dark primary-background">
		<a class="navbar-brand" href="index.jsp"><span
			class="fa fa-asterisk"></span> Tech Blog</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="profile.jsp"><i
						class="fa fa-bell-o"></i> Learn code with Papunjay<span
						class="sr-only">(current)</span></a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i class="fa fa-check-square-o"></i>
						Categories
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Programming Langugage</a> <a
							class="dropdown-item" href="#">Project Implementation</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Data Structure</a>
					</div></li>
				<li class="nav-item"><a class="nav-link " href="#"><i
						class="fa fa-address-card-o"></i> Contact</a></li>
				<li class="nav-item"><a class="nav-link " href="#"
					data-toggle="modal" data-target="#add-post-modal"><i
						class="fa fa-"></i> Do Post</a></li>
			</ul>
			<ul class="navbar-nav mr-right">
				<li class="nav-item"><a class="nav-link " href="#!"
					data-toggle="modal" data-target="#profile-modal"><i
						class="fa fa-user-circle "></i> <%=user.getName()%></a></li>
				<li class="nav-item"><a class="nav-link " href="LogoutServlet"><i
						class="fa fa-user-plus "></i> Logout</a></li>
			</ul>
		</div>
	</nav>

	<!-- end of navbar  -->
	<!-- main content of body -->

	<div class="container">
		<div class="row my-4">
			<div class="col-md-8 offset-md-2">
				<div class="card">
					<div class="card-header primary-background text-white">
						<h4 class="post-title "><%=post.getpTitle() %></h4>
					</div>
					<div class="card-body">
						<img class="card-img-top my-2" src="blog_pics/<%=post.getPpic() %>" alt="Card Img Cap">
						<div class="row my-3 row-user">
							<div class="col-md-8">
								<%
								userDao uDao=new userDao(ConnectionProvider.getConnection());
								User u=uDao.getUserById(post.getUserId());
								%>
								<p class="post-user-info"><a href="#!" data-toggle="modal" data-target="#profile-modal"><%=u.getName() %></a> has Posted</p>
							</div>
							<div class="col-md-4">
								<p class="post-date"><%=DateFormat.getDateTimeInstance().format(post.getpDate()) %></p>
							</div>
						</div>
						<p class="post-content display-3"><%=post.getpContent() %>
							
						<div class="post-code">
							<pre><%=post.getpCode() %></pre>
						</div>
					</div>
					<div class="card-footer  primary-background">
						<a href="#" class="btn btn-outline-light btn-sm"><i
							class="fa fa-thumbs-o-up"><span>10</span></i></a><a
							href="#" class="btn btn-outline-light btn-sm"><i
							class="fa fa-commenting-o"><span>20</span></i></a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- end of main content of the body -->
	<!-- profile modal -->

	<!-- Button trigger modal -->


	<!-- Modal -->

	<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background text-white text-center">
					<h5 class="modal-title" id="exampleModalLabel">Tech Blog</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img src="pics/<%=user.getProfile()%>" class="img-fluid "
							style="border-radius: 50%; max-width: 150px;">
						<h5 class="modal-title" id="exampleModalLabel"><%=user.getName()%></h5>
						<!-- details -->

						<div id="profile-detail">
							<table class="table">

								<tbody>
									<tr>
										<th scope="row">ID :</th>
										<td><%=user.getId()%></td>

									</tr>
									<tr>
										<th scope="row">Email :</th>
										<td><%=user.getEmail()%></td>

									</tr>
									<tr>
										<th scope="row">Gender :</th>
										<td><%=user.getGender()%></td>

									</tr>
									<tr>
										<th scope="row">Status :</th>
										<td><%=user.getAbout()%></td>

									</tr>
									<tr>
										<th scope="row">Registered on :</th>
										<td><%=user.getDateTime().toString()%></td>

									</tr>
								</tbody>
							</table>
						</div>
						<!-- profile edit -->
						<div id="profile-edit" style="display: none;">
							<h3 class="mt-3">Please Edit Carefully</h3>
							<form action="EditServlet" method="post"
								enctype="multipart/form-data">
								<table class="table">

									<tr>
										<td>ID :</td>
										<td><%=user.getId()%></td>
									</tr>

									<tr>
										<td>Email :</td>
										<td><input type="email" class="form-control"
											name="user_email" value=<%=user.getEmail()%>></td>
									</tr>

									<tr>
										<td>Name :</td>
										<td><input type="text" class="form-control"
											name="user_name" value=<%=user.getName()%>></td>
									</tr>

									<tr>
										<td>Password :</td>
										<td><input type="password" class="form-control"
											name="user_password" value=<%=user.getPassword()%>></td>
									</tr>

									<tr>
										<td>Gender :</td>
										<td><%=user.getGender().toUpperCase()%></td>
									</tr>

									<tr>
										<td>About :</td>
										<td><textarea class="form-control" name="user_about"
												rows="3" cols=""><%=user.getAbout()%></textarea></td>
									</tr>

									<tr>
										<td>New Profile Pic :</td>
										<td>
											<div class="btn light-blue">
												<input type="file" name="image">
											</div>
										</td>
									</tr>



								</table>

								<div class="container">
									<button type="submit" class="btn btn-outline-primary">Save</button>
								</div>

							</form>
						</div>

					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button id="edit-profile-button" type="button"
						class="btn primary-background text-white">Edit</button>
				</div>
			</div>
		</div>
	</div>

	<!-- end of profile modal -->
	<!-- start post modal -->

	<!-- Modal -->
	<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background  text-white">
					<h5 class="modal-title " id="exampleModalLabel">Provide the
						post Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="add-post-form" action="AddPostServlet" method="post">
						<div class="form-group">
							<select class="form-control" name="cid">
								<option selected disabled>---Select Category---</option>
								<%
								/* PostDao dao = new PostDao(ConnectionProvider.getConnection()); */
								 List<Category> list = dao.getAllCategories(); 
								for (Category c : list) {
								%>
								<option value="<%=c.getId()%>"><%=c.getName()%></option>
								<%
								}
								%>
							</select>
						</div>
						<div class="form-group">
							<input name="pTitle" type="text" placeholder="Enter Post Title"
								class="form-control">
						</div>
						<div class="form-group">
							<textarea name="pContent" class="form-control"
								placeholder="Enter Your Content" style="height: 200px;" rows="5"
								cols=""></textarea>
						</div>

						<div class="form-group">
							<textarea name="pCode" class="form-control"
								placeholder="Enter Your Code(if any)" style="height: 200px;"
								rows="5" cols=""></textarea>
						</div>

						<div class="form-group">
							<label>Enter your pics :</label> <input name="pPic" type="file"
								placeholder="Enter your pics" class="form-control">
						</div>
						<div class="container text-center ">
							<button type="submit" class="btn btn-outline-primary ">Post</button>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>
	<!--end of post modal  -->




	<!-- Jquery -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>

	<!-- javascipt -->
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<!-- Sweet alert -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"
		integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="js/myJs.js" type="text/javascript"></script>

	<script>
		$().ready(function() {
			let editStatus = false;
			$('#edit-profile-button').click(function() {

				if (editStatus == false) {

					$('#profile-detail').hide();
					$('#profile-edit').show();
					editStatus = true;
					$(this).text("Back");
				} else {
					$('#profile-detail').show();
					$('#profile-edit').hide();
					editStatus = false;
					$(this).text("Edit");
				}

			})
		})
	</script>
	<!-- now add post js -->
	<script>
		$()
				.ready(
						function(e) {

							$('#add-post-form')
									.on(
											"submit",
											function(event) {
												/*  This code call when post form is submitted
													This is asynchromous behaviour
												 */
												event.preventDefault();

												let form = new FormData(this);

												/* now requesting to server */
												$
														.ajax({
															url : "AddPostServlet",
															type : "POST",
															data : form,
															success : function(
																	data,
																	textStatus,
																	jqXHR) {
																/* Success */
																if (data.trim() === "done") {
																	swal(
																			"Good job!",
																			"Saved Successfully",
																			"success");
																} else {
																	swal(
																			"Error!!",
																			"Something went wrong try again...",
																			"error");
																}

															},
															error : function(
																	jqXHR,
																	textStatus,
																	errorThrown) {
																/* error */
																swal(
																		"Error!!",
																		"Something went wrong try again...",
																		"error");
															},
															processData : false,
															contentType : false
														})
											})
						})
	</script>


</body>
</html>