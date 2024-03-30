<%@page import="com.hms.entity.Doctor"%>
<%@page import="java.util.List"%>
<%@page import="com.hms.db.DBConnection"%>
<%@page import="com.hms.dao.DoctorDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Appointment Page</title>
<%@include file="../component/allcss.jsp"%>

<style type="text/css">
.my-card {
	box-shadow: 0px 0px 20px 5px rgba(0, 0, 0, 0.7);
	background-color: rgba(255, 255, 255, 0.6);
}


body{
	background-image: url("img/hospital3.jpg");
    background-size: cover;
    background-position: center;
    margin: 0;
}
</style>


</head>
<body>
	<%@include file="component/navbar.jsp"%>


	<div class="container-fluid my-bg-img p-5">

		<p class="text-center fs-2 text-white"></p>

	</div>


	<div class="container p-3">
		<p class="fs-2"></p>

		<div class="row">
			
			<div class="col-md-6 p-5">

			</div>
			
			<div class="col-md-6">
				<div class="card my-card">
					<div class="card-body">
						<p class="text-center fs-2" style="color: #1C4E80;">User Appointment</p>

						<!-- message print -->
						<!-- for success msg -->
						<c:if test="${not empty successMsg }">
							<p class="text-center text-success fs-5">${successMsg}</p>
							<c:remove var="successMsg" scope="session" />
						</c:if>

						<!-- for error msg -->
						<c:if test="${not empty errorMsg }">
							<p class="text-center text-danger fs-5">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<!-- End of message print -->


						<form class="row g-3" action="addAppointment" method="post">
							
							<!-- take user Id in hidden field -->
							<input type="hidden" name="userId" value="${ userObj.id }">
							
							<div class="col-md-6">
								<label class="form-label">Full Name</label> <input required="required"
									name="fullName" type="text" placeholder="Enter full name"
									class="form-control">

							</div>

							<div class="col-md-6">
								<label class="form-label">Gender</label> <select
									class="form-control" name="gender" required="required">
									<option selected="selected" disabled="disabled">---Select
										Gender---</option>
									<option value="male">Male</option>
									<option value="female">Female</option>
								</select>
							</div>

							<div class="col-md-6">
								<label class="form-label">Age</label> <input name="age"
								required="required"	type="number" placeholder="Enter your Age" class="form-control">
							</div>
							<div class="col-md-6">
								<label class="form-label">Appointment Date</label> <input
								required="required"	name="appointmentDate" type="date" class="form-control">
							</div>

							<div class="col-md-6">
								<label class="form-label">Email</label> <input name="email"
								required="required"	type="email" placeholder="Enter email" class="form-control">
							</div>

							<div class="col-md-6">
								<label class="form-label">Phone</label> <input name="phone"
								required="required"	type="number" maxlength="11" placeholder="Enter Mobile no."
									class="form-control">
							</div>

							<div class="col-md-6">
								<label class="form-label">Diseases</label> <input
								required="required"	name="diseases" type="text" placeholder="Enter diseases"
									class="form-control">
							</div>

							<div class="col-md-6">
								<label class="form-label">Doctor</label> <select
								 required="required" class="form-control" name="doctorNameSelect">
									<option selected="selected" disabled="disabled">---Select---</option>
									
									<%
									DoctorDAO doctorDAO = new DoctorDAO(DBConnection.getConn());
									List<Doctor> listOfDoctor = doctorDAO.getAllDoctor();
									for(Doctor d : listOfDoctor)
									
									{%>
									<!-- actually we take id of doctor from doctor table -->
									<option value="<%= d.getId() %>"> <%= d.getFullName()%> (<%= d.getSpecialist() %>) </option>
									
									<%
									}
									%>
									
								</select>
							</div>


							<div class="col-md-12">
								<label class="form-label">Full Address</label>
								<textarea name="address" required="required" class="form-control" rows="3" cols=""></textarea>
							</div>


							<c:if test="${empty userObj}">
								<div class="col-md-12">
									<a href="user_login.jsp" class="btn my-bg-color text-white col-md-12">Submit</a>
								</div>
							</c:if>


							<c:if test="${not empty userObj}">

								<div class="col-md-12">
									<button type="submit" class="btn btn-success text-white col-md-12">Submit</button>
								</div>

							</c:if>

						</form>


					</div>
				</div>

			</div>



		</div>


	</div>

<!-- footer -->
<%@include file="component/footer.jsp" %>
<!-- end footer -->

</body>
</html>