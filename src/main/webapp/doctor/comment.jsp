<%@page import="com.hms.entity.Appointment"%>
<%@page import="com.hms.db.DBConnection"%>
<%@page import="com.hms.dao.AppointmentDAO"%>
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
<title>Comment/Prescription Doctor</title>
<%@include file="../component/allcss.jsp"%>


<style type="text/css">
.my-card {
	box-shadow: 0px 0px 20px 5px rgba(0, 0, 0, 0.7);
	margin-top: 30px;
</style>


</head>
<body>

	<%@include file="navbar.jsp"%>

	<c:if test="${empty doctorObj }">

		<c:redirect url="../doctor_login.jsp"></c:redirect>

	</c:if>


	<div class="container-fluid my-bg-img p-5">
		<p class="text-center fs-2 text-white"></p>

	</div>



	<div class="container p-3">
		<p class="fs-2"></p>

		<div class="row">


			<div class="col-md-6 offset-md-3">
				<div class="card my-card">
					<div class="card-body">
						<p class="text-center fs-3">Leave a Treatment Comment</p>

						

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


						<%
						int id = Integer.parseInt(request.getParameter("id"));
						AppointmentDAO appDAO = new AppointmentDAO(DBConnection.getConn());
						Appointment appointment = appDAO.getAppointmentById(id);
						
						%>
						
						
						<form class="row g-3" action="../updateStatus" method="post">


							<div class="col-md-6">
								<label class="form-label">Full Name</label> <input
									name="fullName" type="text" placeholder="Enter full name"
									class="form-control" readonly value="<%= appointment.getFullName()%>">

							</div>

							<div class="col-md-6">
								<label class="form-label">Age</label> <input name="age"
									type="number" placeholder="Enter your Age" class="form-control"
									readonly value="<%= appointment.getAge()%>">
							</div>

							<div class="col-md-6">
								<label class="form-label">Phone</label> <input name="phone"
									type="number" maxlength="11" placeholder="Enter Mobile no."
									class="form-control" readonly value="<%= appointment.getPhone()%>">
							</div>

							<div class="col-md-6">
								<label class="form-label">Diseases</label> <input
									name="diseases" type="text" placeholder="Enter diseases"
									class="form-control" readonly value="<%= appointment.getDiseases()%>">
							</div>



							<div class="col-md-12">
								<label class="form-label">Payment / Prescription</label>
								<textarea name="comment" placeholder="Payment"
									class="form-control" rows="" cols=""></textarea>
							</div>
							

							<input type="hidden" name="id" value="<%= appointment.getId()%>" class="form-control">

							<input type="hidden" name="doctorId" value="<%= appointment.getDoctorId()%>" class="form-control">


							<div class="col-md-12">
								<button type="submit" class="btn btn-success col-md-12">Submit</button>
							</div>


						</form>


					</div>
				</div>

			</div>

		</div>


	</div>


</body>
</html>