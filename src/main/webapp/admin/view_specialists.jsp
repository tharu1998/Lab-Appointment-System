<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.hms.entity.Specialist"%>
<%@ page import="com.hms.dao.SpecialistDAO"%>
<%@ page import="java.util.List"%>
<%@ page import="com.hms.db.DBConnection"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Specialist Page</title>
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
    <div class="container-fluid p-5 mt-4">
        <div class="row">
         <div class="row justify-content-center">
            <div class="col-md-4">
                <div class="card my-card">
                    <div class="card-body">
                        <p class="fs-3 text-center" style="color: #1C4E80;">List of Specialists</p>
                        <c:if test="${not empty successMsg}">
                            <p class="text-center text-success fs-3">${successMsg}</p>
                            <c:remove var="successMsg" scope="session"/>
                        </c:if>
                        <c:if test="${not empty errorMsg}">
                            <p class="text-center text-danger fs-3">${errorMsg}</p>
                            <c:remove var="errorMsg" scope="session"/>
                        </c:if>
                        <table class="table table-striped">
                            <thead>
                                <tr class="table-primary text-center">
                                    <th scope="col">Specialist Name</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                SpecialistDAO specialistDAO = new SpecialistDAO(DBConnection.getConn());
                                List<Specialist> listOfSpecialists = specialistDAO.getAllSpecialist();
                                for (Specialist specialist : listOfSpecialists) {
                                %>
                                <tr>
                                    <td><%= specialist.getSpecialistName()%></td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
           </div>
        </div>
    </div>
</body>
</html>
