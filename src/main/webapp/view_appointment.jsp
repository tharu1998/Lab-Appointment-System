<%@page import="com.hms.entity.Doctor"%>
<%@page import="com.hms.dao.DoctorDAO"%>
<%@page import="com.hms.entity.User"%>
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
<!-- for responsive -->
<!-- <meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<!-- for responsive -->
<title>View Appointment Page</title>

<!-- all css include -->
<%@include file="../component/allcss.jsp"%>

<!-- customs css for this page -->
<style type="text/css">
body{
	background-color: #dadada;;
    background-size: cover; /* Adjust as needed */
    background-position: center;
    margin: 0;
    height: 100vh;
}
/* backgournd image css */
.my-card {
    background-color: rgba(255, 255, 255, 0.7); /* Adjust the last value (alpha) to control transparency */
    box-shadow: 0px 0px 20px 5px rgba(0, 0, 0, 0.7);
}

/* backgournd image css */
</style>
<!-- end of customs css for this page -->


</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<!-- if not login then log in first -->
	<c:if test="${empty userObj }">

		<c:redirect url="/user_login.jsp"></c:redirect>

	</c:if>

	<!-- start 1st Div -->

	<div class="container-fluid my-bg-img p-5">
		<!-- css background image -->
		<p class="text-center fs-2 text-white"></p>

	</div>

	<!-- end of 1st Div -->

	<!-- 2nd Div -->

	<div class="container-fluid p-3">
		<p class="fs-2"></p>

		<div class="row">



			<!-- col-2 -->
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
            <th scope="col">Action</th> <!-- Added Print column header -->
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
            <!-- Print Button Column -->
            <td>
                <button onclick="printAppointment(this)" class="btn btn-sm btn-success">Print</button>
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

			<!-- col-1 -->
			<div class="col-md-3 p-3">
				<!-- for Background image -->
				<!-- <img alt="" src="img/picDoc.jpg" width="500px" height="400px"> -->
			</div>



		</div>


	</div>

	<!-- 2nd Div -->
	

<script>
function printAppointment(element) {
    // Get the closest table row (<tr>) of the clicked button
    const appointmentRow = element.closest('tr').innerHTML;

    // Open a new window for printing
    const printWindow = window.open('', '_blank');

    // Start writing the document for the new window
    printWindow.document.open();
    printWindow.document.write('<html><head><title>Appointment Report</title>');

    // Include any styles here. You can also link to an external stylesheet
    printWindow.document.write('<style>');
    printWindow.document.write('body { font-family: Arial, sans-serif; }');
    printWindow.document.write('table { width: 100%; border-collapse: collapse; }');
    printWindow.document.write('th, td { border: 1px solid black; padding: 8px; text-align: left; }');
    printWindow.document.write('@media print { .no-print { display: none; } }'); // Hide the column when printing
    printWindow.document.write('</style>');

    // Close the head and start the body
    printWindow.document.write('</head><body>');

    // Create a table or any other container for the appointmentRow content
    printWindow.document.write('<table>');
    printWindow.document.write('<tr><th>Full Name</th><th>Gender</th><th>Age</th><th>Appointment Date</th><th>Phone</th><th>Diseases</th><th>Doctor Name</th><th>Status</th></tr><th class="no-print">Action</th>');
    printWindow.document.write('<tr>' + appointmentRow + '</tr>'); // Insert the appointment row
    printWindow.document.write('</table>');

    // Close the body and html tags
    printWindow.document.write('</body></html>');

    // Finish writing to the new window
    printWindow.document.close();

    // Trigger the print dialog
    printWindow.print();

    // Optionally, close the print window after printing
    // printWindow.close();
}
</script>




</body>
</html>