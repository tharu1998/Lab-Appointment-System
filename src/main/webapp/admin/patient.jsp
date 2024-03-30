<%@page import="com.hms.entity.Doctor"%>
<%@page import="com.hms.dao.DoctorDAO"%>
<%@page import="com.hms.entity.Appointment"%>
<%@page import="java.util.List"%>
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
<title>Patient Details | Admin</title>

<%@include file="../component/allcss.jsp"%>

<style type="text/css">
.my-card {
	box-shadow: 0px 0px 20px 5px rgba(0, 0, 0, 0.7);
	margin-top: 30px;
}
</style>

</head>
<body>
	<%@include file="navbar.jsp"%>

	<div class="col-md-12 p-5 mt-4">
		<div class="card my-card">
			<div class="card-body">
				<p class="text-center fs-3" style="color: #1C4E80;">Patient Details</p>

				<table class="table table-striped">
					<thead>
						<tr class="table-primary">
							<th scope="col" style="padding-right:70px">Full Name</th>
							<th scope="col">Gender</th>
							<th scope="col">Age</th>
							<th scope="col">Appointment</th>
							<th scope="col">Email</th>
							<th scope="col">Phone</th>
							<th scope="col" style="padding-right:50px">Diseases</th>
							<th scope="col" style="padding-right:70px">Doctor Name</th>
							<th scope="col">Address</th>
							<th scope="col" style="padding-right:100px">Status</th>

						</tr>
					</thead>
					<tbody>

						<%
						AppointmentDAO appDAO = new AppointmentDAO(DBConnection.getConn());
						DoctorDAO docDAO = new DoctorDAO(DBConnection.getConn());
						List<Appointment> list = appDAO.getAllAppointment();
						for(Appointment appList : list)
						{
							Doctor doctor =	docDAO.getDoctorById(appList.getDoctorId());
						%>
						
						<tr>
							<th><%= appList.getFullName() %></th>
							<td><%= appList.getGender() %></td>
							<td><%= appList.getAge() %></td>
							<td><%= appList.getAppointmentDate()%></td>
							<td><%= appList.getEmail()%></td>
							<td><%= appList.getPhone()%></td>
							<td><%= appList.getDiseases()%></td>
							<td><%= doctor.getFullName()%></td>
							<td><%= appList.getAddress()%></td>
							<td><%= appList.getStatus()%></td>

						</tr>
						
						
						<%
						}
						%>

						
					</tbody>

				</table>

			</div>


		</div>

	</div>




</body>
</html>