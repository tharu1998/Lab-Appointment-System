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
<title>User Login</title>
<%@include file="component/allcss.jsp"%>

<style type="text/css">
.my-card {
	box-shadow: 0px 0px 20px 5px rgba(0, 0, 0, 0.7);
	margin-top: 40px;
}
body {
        background-image: url('https://www.windsorcardiacclinic.co.uk/images/ambulatory-blood-pressure-monitor.webp');
        background-size: cover; 
        background-position: center; 
        background-repeat: no-repeat; 
        height: 100vh;
        margin: 0;
    }
    .btn.my-bg-color:hover {
        background: linear-gradient(90deg, #006AD5, #003A74); 
        cursor: pointer; 
    }
</style>

</head>
<body>
	<!-- navbar -->
	<%@include file="component/navbar.jsp"%>
	<!-- end navbar -->


	<!-- User Login -->
	<div class="container p-5 mt-4">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card my-card" style="background-color: rgba(255, 255, 255, 0.6);">
					<div class="card-header text-center text-white my-bg-color" style="font-weight: bold;">
						<p class="fs-4 text-center text-white mt-2">
							<i class="fa fa-group"></i> User Login
						</p>
					</div>
					
					<div class="card-body">

						<!-- for message -->
						<!-- success message -->
						<c:if test="${not empty successMsg }">
							<p class="text-center text-success fs-5">${successMsg}</p>
							<c:remove var="successMsg" scope="session" />
						</c:if>

						<!-- error message -->
						<c:if test="${not empty errorMsg }">
							<p class="text-center text-danger fs-5">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<!-- end of message -->



						<form action="userLogin" method="post">
							<div class="mb-3">
								<label class="form-label" style="font-weight: bold;">Email address</label> <input
									name="email" type="email" placeholder="Enter Email"
									class="form-control">
								<div id="emailHelp" class="form-text-dark">We'll never share
									your email with anyone else.</div>
							</div>
							<div class="mb-3">
								<label class="form-label" style="font-weight: bold;">Password</label> <input
									name="password" type="password" placeholder="Enter password"
									class="form-control">
							</div>

							<button type="submit"
								class="btn col-md-12 text-white my-bg-color" style="font-weight: bold;">Submit</button>
						</form>
						<br>Don't have an account? <a href="signup.jsp"
							class="text-decoration-none">create one</a>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>