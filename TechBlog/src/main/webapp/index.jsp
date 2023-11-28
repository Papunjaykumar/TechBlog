<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*,com.tech.blog.helper.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--boottrap css  -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<link href="css/myStyle.css" rel="stylesheet" type="text/css" />

<!-- font awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style >
	 .banner-background{
	 	clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 95%, 69% 100%, 25% 96%, 0 100%, 0 0);
	 }
	 
</style>
</head>
<body>

	<!-- navbar -->
	<%@ include file="normal_navbar.jsp"%>

	<!-- banner -->
	<div class="container-fluid p-0 m-0 banner-background">
		<div class="jumbotron primary-background text-white">
			<div class="container">
				<h3 class="display-3">Welcome to Tech Blog</h3>
				<p></p>
				<p>Welcome to technical blog, world of technology The term
					computer language is sometimes used interchangeably with
					programming language.[2] However, the usage of both terms varies
					among authors, including the exact scope of each. One usage
					describes programming languages as a subset of computer
					languages.[3] Similarly, languages used in computing that have a
					different goal than expressing computer programs are generically
					designated computer languages. For instance, markup languages are
					sometimes referred to as computer languages to emphasize that they
					are not meant to be used for programming.[4] One way of classifying
					computer languages is by the computations they are capable of
					expressing, as described by the theory of computation.</p>
				<button class="btn btn-lg btn-outline-light">
					<i class="fa fa-user-plus"></i> Start ! Its Free
				</button>
				<a href="login.jsp"class="btn btn-lg btn-outline-light">
					<i class="fa fa-user-circle fa-spin"></i> Login
				</a>
			</div>
		</div>

	</div>

	<!-- cards -->

	<div class="container">

		<div class="row mb-2">
			<div class="col-md-4">
				<div class="card" >
					<div class="card-body">
						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">read more</a>
					</div>
				</div>
			</div>
			
			<div class="col-md-4">
				<div class="card" >
					<div class="card-body">
						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">read more</a>
					</div>
				</div>
			</div>
			
			<div class="col-md-4">
				<div class="card" >
					<div class="card-body">
						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">read more</a>
					</div>
				</div>
			</div>
			
		</div>
		
		<div class="row">
			<div class="col-md-4">
				<div class="card" >
					<div class="card-body">
						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">read more</a>
					</div>
				</div>
			</div>
			
			<div class="col-md-4">
				<div class="card" >
					<div class="card-body">
						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">read more</a>
					</div>
				</div>
			</div>
			
			<div class="col-md-4">
				<div class="card" >
					<div class="card-body">
						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">read more</a>
					</div>
				</div>
			</div>
			
		</div>

	</div>



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
	<script src="js/myJs.js" type="text/javascript"></script>


</body>
</html>