<%@page import="com.hms.entity.Doctor"%>
<%@page import="com.hms.dao.DoctorDAO"%>
<%@page import="com.hms.entity.User"%>
<%@page import="com.hms.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.hms.db.DBConnection"%>
<%@page import="com.hms.dao.AppointmentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@page isELIgnored="false"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>View Appointment Page</title>

<%@include file="../component/allcss.jsp"%>

<style type="text/css">
body{
    background-size: cover; 
    background-position: center;
    margin: 0;
    height: 100vh;
}

.my-card {
    background-color: rgba(255, 255, 255, 0.7);
    box-shadow: 0px 0px 20px 5px rgba(0, 0, 0, 0.7);
}

</style>


</head>
<body>
	<%@include file="component/navbar.jsp"%>


	<c:if test="${empty userObj }">

		<c:redirect url="/user_login.jsp"></c:redirect>

	</c:if>



	<div class="container-fluid my-bg-img p-5">
		<p class="text-center fs-2 text-white"></p>

	</div>


	<div class="container-fluid p-3">
		<p class="fs-2"></p>

		<div class="row">

			<div class="col-md-12 d-flex justify-content-center">
				<div class="card my-card">
					<div class="card-body">
						<p class="fs-2 text-center myP-color" style="color: #1C4E80;">Appointment
							List</p>

						<table class="table table-striped">
						    <thead>
						        <tr class="my-bg-color text-white">
						            <th scope="col">Full Name</th>
						            <th scope="col">Gender</th>
						            <th scope="col">Age</th>
						            <th scope="col">Appointment Date</th>
						            <th scope="col">Phone</th>
						            <th scope="col">Diseases</th>
						            <th scope="col">Doctor Name</th>
						            <th scope="col">Status</th>
						        </tr>
						    </thead>
							    <tbody>
							        <%
							        User user = (User) session.getAttribute("userObj");
							        DoctorDAO dDAO = new DoctorDAO(DBConnection.getConn());
							        AppointmentDAO appDAO = new AppointmentDAO(DBConnection.getConn());
							        List<Appointment> list = appDAO.getAllAppointmentByLoginUser(user.getId());
							        for (Appointment apptList : list) {
							            Doctor doctor = dDAO.getDoctorById(apptList.getDoctorId());
							        %>
							
							        <tr>
							            <td><%= apptList.getFullName() %></td>
							            <td><%= apptList.getGender() %></td>
							            <td><%= apptList.getAge() %></td>
							            <td><%= apptList.getAppointmentDate() %></td>
							            <td><%= apptList.getPhone() %></td>
							            <td><%= apptList.getDiseases() %></td>
							            <td><%= doctor.getFullName() %></td>
							            <td>
							                <%
							                if ("Pending".equals(apptList.getStatus())) {
							                %>
							                <a href="" class="btn btn-sm btn-warning">Pending</a>
							                <%
							                } else {
							                %>
							                <%= apptList.getStatus() %>
							                <%
							                }
							                %>
							            </td>
							        </tr>
							
							        <%
							        }
							        %>
							    </tbody>
							</table>

					</div>
				</div>

			</div>

			<div class="col-md-3 p-3">

			</div>



		</div>


	</div>




</body>
</html>