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
<title>Sign up Page</title>
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
				<div class="card my-card">
					<div class="card-header text-center text-white my-bg-color">
						<!-- <p class="fs-4 text-center mt-1"><i class="fa-solid fa-users"></i> <br>User Login</p> -->
						<p class="fs-4 text-center text-white mt-2">
							<i class="fa fa-user-plus"></i> User Register
						</p>
					</div>
					<div class="card-body">
						<!-- <p class="fs-4 text-center">User Register</p> -->

						<!-- message print -->
						<!-- message print -->
						<!-- boostrap form -->
						
						<form id="registrationForm" action="user_register" method="post" onsubmit="return validateForm()">
					    <div class="mb-3">
					        <label class="form-label">Full Name</label> 
					        <input name="fullName" id="fullName" type="text" placeholder="Enter full name" class="form-control" required>
					    </div>
					    <div class="mb-3">
					        <label class="form-label">Email address</label> 
					        <input name="email" id="email" type="email" placeholder="Enter Email" class="form-control" required>
					        <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
					        <div id="emailError" class="text-danger"></div> <!-- Error message container -->
					    </div>
					    <div class="mb-3">
					        <label class="form-label">Password</label> 
					        <input name="password" id="password" type="password" placeholder="Enter password" class="form-control" required>
					    </div>
					    <button type="submit" class="btn my-bg-color text-white col-md-12">Register</button>
						</form>
						
						<script>
						    function validateForm() {
						        var fullName = document.getElementById("fullName").value.trim();
						        var email = document.getElementById("email").value.trim();
						        var password = document.getElementById("password").value.trim();
						        
						        // Check if fields are empty
						        if (fullName === "" || email === "" || password === "") {
						            alert("Please fill in all the fields.");
						            return false;
						        }
						
						        // Perform client-side email format validation
						        var emailPattern = /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;
						        if (!emailPattern.test(email)) {
						            alert("Please enter a valid email address.");
						            return false;
						        }
						
						        // Perform server-side email existence validation using AJAX
						        var xhttp = new XMLHttpRequest();
						        xhttp.onreadystatechange = function() {
						            if (this.readyState == 4 && this.status == 200) {
						                var response = this.responseText;
						                if (response === "exists") {
						                    document.getElementById("emailError").innerHTML = "Email already registered. Please use a different email.";
						                    document.getElementById("successMsg").innerHTML = ""; // Clear success message if it's already displayed
						                } else {
						                    document.getElementById("emailError").innerHTML = "";
						                    document.getElementById("successMsg").innerHTML = "Registration successful!";
						                    document.getElementById("registrationForm").submit();
						                }
						            }
						        };
						        xhttp.open("GET", "check_email.jsp?email=" + email, true); // Replace "check_email.jsp" with your servlet/JSP URL
						        xhttp.send();
						
						        return false; // Prevent form submission until email validation completes
						    }
						</script>


						
						<!-- <br>Don't have an account? <a href="#!" class="text-decoration-none">create one</a> -->
						<!-- end of boostrap form -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End of User Register -->

</body>
</html>