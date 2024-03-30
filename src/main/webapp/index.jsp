<%@page import="com.hms.db.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0 ">

<title>Home Page | Lab Appointment System</title>
<%@include file="component/allcss.jsp"%>


<style type="text/css">
.my-card {
	box-shadow: 0px 0px 20px 5px rgba(0, 0, 0, 0.5);
}

.carousel-item img {
  width: 100%;
  height: 500px; 
  object-fit: cover; 
}


@media (max-width: 768px) {
  .carousel-item img {
    height: 300px; 
  }
}

</style>


</head>
<body>
	<%@include file="component/navbar.jsp"%>


	<!-- carousel code -->

	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="3" aria-label="Slide 4"></button>
		</div>
		<div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
    	<div class="carousel-inner">
        	<div class="carousel-item active">
            	<video class="d-block" autoplay muted loop style="object-fit: cover; width: 100%; height: 500px;">
                	<source src="img/video.mp4" type="video/mp4">
            	</video>
        	</div>
        <div class="carousel-item">
            <video class="d-block" autoplay muted loop style="object-fit: cover; width: 100%; height: 500px;">
                <source src="img/video5.mp4" type="video/mp4">
            </video>
        </div>
        <div class="carousel-item">
            <video class="d-block" autoplay muted loop style="object-fit: cover; width: 100%; height: 500px;">
                <source src="img/video7.mp4" type="video/mp4">
            </video>
        </div>
        <div class="carousel-item">
            <video class="d-block" autoplay muted loop style="object-fit: cover; width: 100%; height: 500px;">
                <source src="img/video6.mp4" type="video/mp4">
            </video>
        </div>
    </div>
</div>


		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>

	<!-- end of carousel code -->



	<div class="container p-3">
		<p class="text-center mt-2 mb-5 fs-2 myP-color">Some key Features of our
			Lab Appointment Portal</p>
		<div class="row">
			<div class="col-md-12 p-3">

				<div class="row">
					<div class="col-md-6">
						<div class="card my-card">
							<div class="card-body">
								<p class="fs-5 myP-color">11000+ Healing Hands</p>
								<p>Largest network of the world’s finest and brightest
									medical experts who provide compassionate care using
									outstanding expertise.</p>
							</div>
						</div>
					</div>

					<div class="col-md-6">
						<div class="card my-card">
							<div class="card-body">
								<p class="fs-5 myP-color">Most Advance Healthcare Technology</p>
								<p>E-Hospitals has been the pioneer in bringing
									ground-breaking health care technologies to Bangladesh.</p>
							</div>
						</div>
					</div>

					<div class="col-md-6 mt-4">
						<div class="card my-card">
							<div class="card-body">
								<p class="fs-5 myP-color">Best Clinical Outcomes</p>
								<p>Leveraging its vast medical expertise & technological
									advantage, E-Hospitals has consistently delivered best in class
									clinical outcomes.</p>
							</div>
						</div>
					</div>

					<div class="col-md-6 mt-4">
						<div class="card my-card">
							<div class="card-body">
								<p class="fs-5 myP-color">10+ Laboraties</p>
								<p>Largest and most
									trusted branded pharmacy network, with over 50s0 plus outlets
									covering the entire nation</p>
							</div>
						</div>
					</div>
				</div>


			</div>

		</div>
	</div>

	<hr>





	<!-- footer -->
	<%@include file="component/footer.jsp"%>
	<!-- end footer -->
</body>
</html>