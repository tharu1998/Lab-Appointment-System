<%@page import="com.hms.entity.Doctor"%>
<%@page import="com.hms.db.DBConnection"%>
<%@page import="com.hms.dao.DoctorDAO"%>
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
<title>Index Page | Doctor</title>
<%@include file="../component/allcss.jsp"%>


<!-- customs css for this page -->
<style type="text/css">
.my-card {
	box-shadow: 0px 0px 20px 5px rgba(0, 0, 0, 0.7);
	background-color: rgba(255, 255, 255, 0.7);
	/*box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.3);*/
}
body {
        /* Set background image for the whole body */
        /*background-image: url('https://inspirage.com/wp-content/uploads/2016/09/iStock-1023224308.jpg');*/
        /* Optional: Adjust background properties */
        background-size: cover; /* Cover the entire viewport */
        background-position: center; /* Center the background image */
        background-repeat: no-repeat; /* Do not repeat the background image */
        height: 95vh;
        margin: 0;
    }
</style>
<!-- end of customs css for this page -->



</head>
<body>
	<%@include file="navbar.jsp"%>


	<!-- check is doctor is login or not if login then only he can access doctors dashboard -->
	<!-- otherwise redirect him to doctor login page for log in -->
	<!-- if "doctorObj" is empty means no one is login. -->

	<c:if test="${empty doctorObj }">

		<c:redirect url="../doctor_login.jsp"></c:redirect>

	</c:if>

	<!-- check is doctor is login or not -->


	<div class="container p-5 mt-5">
		<p class="text-center fs-3" style="color: #1C4E80;">Doctor Dashboard</p>

		<%
		
		
		DoctorDAO docDAO = new DoctorDAO(DBConnection.getConn());
		int totalNumberOfDoctor = docDAO.countTotalDoctor();
		
		//get current login doctor object from session
		Doctor currentLoginDoctor = (Doctor)session.getAttribute("doctorObj");
		
		
		%>

		<div class="row">
			<div class="col-md-4 offset-md-2">
				<div class="card my-card">
					<div class="card-body text-center" style="color: #1C4E80;">
						<i class="fa-solid fa-user-doctor fa-3x"></i><br>
						<p class="fs-4 text-center">
							Doctor <br><%= totalNumberOfDoctor %>
						</p>
					</div>
				</div>

			</div>

			<div class="col-md-4">
				<div class="card my-card">
					<div class="card-body text-center" style="color: #1C4E80;">
						<i class="fa-solid fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">
							Total Appointment <br> <%= docDAO.countTotalAppointmentByDoctorId(currentLoginDoctor.getId()) %>
						</p>
					</div>
				</div>

			</div>
		</div>


	</div>




</body>
</html>