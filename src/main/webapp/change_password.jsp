<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Password</title>
<%@include file="component/allcss.jsp"%>

<style type="text/css">
.my-card {
	box-shadow: 0px 0px 20px 5px rgba(0, 0, 0, 0.7);
	margin-top: 40px;
}
body {
        background-image: url('https://professional-scientists.de/wp-content/uploads/2023/01/Datenschutztag-1200x799.png');
        background-size: cover; 
        background-position: center; 
        background-repeat: no-repeat; 
        height: 90vh;
        margin: 0;
    }
    .btn.my-bg-color:hover {
        background: linear-gradient(90deg, #006AD5, #003A74); 
        cursor: pointer; 
    }
</style>


</head>
<body>
	<%@include file="component/navbar.jsp"%>
	
	
	<!-- if not login then log in first -->
	<c:if test="${empty userObj }">

		<c:redirect url="/user_login.jsp"></c:redirect>

	</c:if>

	<div class="container p-5 mt-4">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card my-card" style="background-color: rgba(255, 255, 255, 0.6);">
					<div class="card-header text-center text-white my-bg-color">
						<p class="fs-4 text-center text-white mt-2">
							<i class="fa fa-universal-access"></i><b>Change Password</b>
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


						<form action="userChangePassword" method="post">
							<div class="mb-3">
								<label class="form-label">Enter New Password</label> <input
									name="newPassword" type="password" placeholder="Enter new password"
									class="form-control" required="required">

							</div>
							<div class="mb-3">
								<label class="form-label">Enter Old Password</label> <input
									name="oldPassword" type="password" placeholder="Enter old password"
									class="form-control" required>
							</div>
							<input type="hidden" value="${userObj.id}" name="userId">

							<button type="submit" class="btn my-bg-color text-white col-md-12">Change
								Password</button>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>


</body>
</html>