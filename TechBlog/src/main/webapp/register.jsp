<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Page</title>

<!--boottrap css  -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<link href="css/myStyle.css" rel="stylesheet" type="text/css" />

<!-- font awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.banner-background {
	clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 95%, 69% 100%, 25% 96%, 0 100%, 0 0
		);
}
</style>

</head>
<body>

	<%@include file="normal_navbar.jsp"%>
	<main class="primary-background pb-5 banner-background"
		style="padding-bottom: 50px;">
		<div class="container mt-0">
			<div class="row">

				<div class="col-md-6 offset-md-3">

					<div class="card">
						<div class="card-header text-center primary-background text-white">
							<i class="fa fa-user-circle fa-3x"></i> <br>
							<p>Register Here
						</div>
						<div class="card-body">

							<form id="reg-form" action="RegisterServlet" method="post">

								<div class="form-group">
									<label for="user_name">User Name</label> <input
										name="user_name" type="text" class="form-control"
										id="user_name" aria-describedby="emailHelp"
										placeholder="Enter name">

								</div>

								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> <input
										name="user_email" type="email" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										placeholder="Enter email"> <small id="emailHelp"
										class="form-text text-muted">We'll never share your
										email with anyone else.</small>
								</div>

								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										name="user_password" type="password" class="form-control"
										id="exampleInputPassword1" placeholder="Password">
								</div>

								<div class="form-group">
									<label>Select Gender</label> <br> <input type="radio"
										name="gender" value="Male">Male <input type="radio"
										name="gender" value="Female">Female
								</div>

								<div class="form-grup">
									<textarea class="form-control" id="" name="about" rows="5"
										cols="" placeholder="Enter somethings about yourself"></textarea>
								</div>

								<div class="form-check">
									<input name="user_check" type="checkbox"
										class="form-check-input" id="exampleCheck1"> <label
										class="form-check-label" for="exampleCheck1">agree
										terms and conditions</label>
								</div>

								<br>
								<div class="container text-center" id="loader"
									style="display: none;">
									<i class="fa fa-refresh fa-spin fa-4x"></i>
									<h1>Please wait ...</h1>
								</div>
								<br>
								<button id="submit-button" type="submit"
									class="btn primary-background">Submit</button>
							</form>
						</div>
					</div>

				</div>
			</div>
		</div>
	</main>
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
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"
		integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>

	<script>
		$().ready(function(){
			console.log("loaded ...");
			$('#reg-form').on('submit',function(event){
				event.preventDefault();
				let form=new FormData(this);
				$('#submit-button').hide();
				$('#loader').show();
				//send to the register servlet
				$.ajax({
					url:"RegisterServlet",
					type:"POST",
					data:form,
					success:function(data,textStatus,jqXHR){
						console.log(data);
						
						$('#submit-button').show();
						$('#loader').hide();
						if(data.trim()==='done'){
							swal("Registered Successfully we are going to redirect to login page")
							.then((value) => {
							  window.location="login.jsp";
							});
						}else{
							swal(data);
						}
						
						
						
					},
					error:function(jqXHR,textStatus,errorThrown){
						console.log(jqXHR);
						
						$('#submit-button').show();
						$('#loader').hide();
						swal("Something went wrong ... try again")
						
					},
					processData:false,
					contentType:false
					
				})
			})
		})
		
	</script>
</body>
</html>