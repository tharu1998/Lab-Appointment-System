<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- for jstl tag -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- end of jstl tag -->

<%@page isELIgnored="false"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup Page</title>
<!-- boostrap css -->
<%@include file="component/allcss.jsp"%>
<!-- end of boostrap css -->

<!-- customs css for this page -->
<style type="text/css">
.my-card {
	box-shadow: 0px 0px 20px 5px rgba(0, 0, 0, 0.7);
	margin-top: 40px;
	/*box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.3);*/
}
body {
        /* Set background image for the whole body */
        background-image: url('https://www.windsorcardiacclinic.co.uk/images/ambulatory-blood-pressure-monitor.webp');
        /* Optional: Adjust background properties */
        background-size: cover; /* Cover the entire viewport */
        background-position: center; /* Center the background image */
        background-repeat: no-repeat; /* Do not repeat the background image */
        height: 100vh;
        margin: 0;
    }
    .btn.my-bg-color:hover {
        background: linear-gradient(90deg, #006AD5, #003A74); /* Hover background */
        cursor: pointer; /* Change cursor to pointer */
    }
</style>
<!-- end of customs css for this page -->

</head>
<body>
	<!-- navbar -->
	<%@include file="component/navbar.jsp"%>
	<!-- end navbar -->

	<!-- User Register -->
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card my-card" style="background-color: rgba(255, 255, 255, 0.6);">
					<div class="card-header text-center text-white my-bg-color">
						<!-- <p class="fs-4 text-center mt-1"><i class="fa-solid fa-users"></i> <br>User Login</p> -->
						<p class="fs-4 text-center text-white mt-2">
							<i class="fa fa-user-plus"></i> User Register
						</p>
					</div>
					<div class="card-body">
						<!-- <p class="fs-4 text-center">User Register</p> -->

						<!-- message print -->
						<!-- for success msg -->
						<c:if test="${not empty successMsg }">
							<p class="text-center text-success fs-3">${successMsg}</p>
							<c:remove var="successMsg" scope="session" />
						</c:if>

						<!-- for error msg -->
						<c:if test="${not empty errorMsg }">
							<p class="text-center text-danger fs-3">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<!-- End of message print -->

						<!-- boostrap form -->
						<form name="registerForm" action="user_register" method="post" onsubmit="return validateForm()">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input
									name="fullName" type="text" placeholder="Enter full name"
									class="form-control">

							</div>
							<div class="mb-3">
								<label class="form-label">Email address</label> <input
									name="email" type="email" placeholder="Enter Email"
									class="form-control">
								<div id="emailHelp" class="form-text">We'll never share
									your email with anyone else.</div>
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label> <input
									name="password" type="password" placeholder="Enter password"
									class="form-control">
							</div>

							<button type="submit" class="btn my-bg-color text-white col-md-12">Register</button>
						</form>
						<!-- <br>Don't have an account? <a href="#!" class="text-decoration-none">create one</a> -->
						<!-- end of boostrap form -->
						
						<script>
  function validateForm() {
    var fullName = document.forms["registerForm"]["fullName"].value;
    var email = document.forms["registerForm"]["email"].value;
    var password = document.forms["registerForm"]["password"].value;

    if (fullName == "") {
      alert("Please enter your full name");
      return false;
    }

    if (email == "") {
      alert("Please enter your email address");
      return false;
    }

    // Regular expression for email validation
    var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailPattern.test(email)) {
      alert("Please enter a valid email address");
      return false;
    }

    if (password == "") {
      alert("Please enter a password");
      return false;
    }

    // Password length validation
    if (password.length < 8) {
      alert("Password must be at least 8 characters long");
      return false;
    }

    return true;
  }
</script>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End of User Register -->

</body>
</html>