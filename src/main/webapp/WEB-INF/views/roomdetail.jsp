<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Sogo Hotel by Colorlib.com</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="author" content="" />
<link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=|Roboto+Sans:400,700|Playfair+Display:400,700">

<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/animate.css">
<link rel="stylesheet" href="resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/css/aos.css">
<link rel="stylesheet" href="resources/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="resources/css/jquery.timepicker.css">
<link rel="stylesheet" href="resources/css/fancybox.min.css">

<link rel="stylesheet" href="resources/fonts/ionicons/css/ionicons.min.css">
<link rel="stylesheet" href="resources/fonts/fontawesome/css/font-awesome.min.css">

<!-- Theme Style -->
<link rel="stylesheet" href="resources/css/style.css">
</head>
<body>

	<header class="site-header">
		<jsp:include page="header.jsp" flush="true" />
	</header>
	

	<section class="site-hero inner-page overlay" style="background-image: url(resources/images/hero_4.jpg)" data-stellar-background-ratio="0.5">
		<div class="container">
			<div class="row site-hero-inner justify-content-center align-items-center">
				<div class="col-md-10 text-center" data-aos="fade">
					<h1 class="heading mb-3">선화 호텔의 ${roomdetaillist.room_type_name} ROOM</h1>
					<ul class="custom-breadcrumbs mb-4">
						<li><a href="index.html">Home</a></li>
						<li>&bullet;</li>
						<li>About</li>
					</ul>
				</div>
			</div>
		</div>

		<a class="mouse smoothscroll" href="#next">
			<div class="mouse-icon">
				<span class="mouse-wheel"></span>
			</div>
		</a>
	</section>
	<!-- END section -->

	<section class="py-5 bg-light" id="next">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-md-12 col-lg-7 ml-auto order-lg-2 position-relative mb-5" data-aos="fade-up">
					<figure class="img-absolute">
						<img src="resources/images/food-1.jpg" alt="Free Website Template by Templateux" class="img-fluid">
					</figure>
					<img src="resources/images/${roomdetaillist.room_img}" alt="Image" class="img-fluid rounded">
				</div>
				<div class="col-md-12 col-lg-4 order-lg-1" data-aos="fade-up">
					<h2 class="heading">
						Welcome!<br />${roomdetaillist.room_type_name}룸</h2>
					<p class="mb-4">설명</p>

				</div>

			</div>
		</div>
	</section>



	<section class="section slider-section bg-light">
		<div class="container">
			<div class="row justify-content-center text-center mb-5">
				<div class="col-md-7">
					<h2 class="heading" data-aos="fade-up">Photos</h2>
					<p data-aos="fade-up" data-aos-delay="100">${roomdetaillist.room_type_name}</p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="home-slider major-caousel owl-carousel mb-5" data-aos="fade-up" data-aos-delay="200">
						<c:forEach items="${roomPhotodto}" var="photolist">

							<div class="slider-item">
								<a href="resources/images/${photolist.room_img}" data-fancybox="images" data-caption="Caption for this image">
									<img src="resources/images/${photolist.room_img}" alt="Image placeholder" class="img-fluid">
								</a>
							</div>

						</c:forEach>
					</div>
					<!-- END slider -->
				</div>
			</div>
		</div>
	</section>
	<!-- END section -->

	<div class="section">
		<div class="container">

			<div class="row justify-content-center text-center mb-5">
				<div class="col-md-7 mb-5">
					<h2 class="heading" data-aos="fade">객실정보</h2>
				</div>
			</div>

			<div class="row justify-content-center">
				<div class="col-md-8">
					<div class="timeline-item" date-is='1' data-aos="fade">
						<h3>객실의 가격</h3>
						<p>
							<fmt:formatNumber value="${roomdetaillist.room_price}" pattern="#,### 원" />
							부터 시작합니다. 옵션과 각종 혜택을 선택하시면 추가 요금이 발생합니다.
						</p>

					</div>

					<div class="timeline-item" date-is='2' data-aos="fade">
						<h3>객실의 평수</h3>
						<p>${roomdetaillist.room_size} 충분히 호화로운 여가를 보내실수 있도록 준비했습니다.</p>
					</div>

					<div class="timeline-item" date-is='3' data-aos="fade">
						<h3>객실 수용 인원 수</h3>
						<p>${roomdetaillist.room_capacity} 명으로 제한됩니다. 추가적인 객실 이용을 원하시면 객실이용을 늘려주시면 감사하겠습니다.</p>
					</div>
				</div>
			</div>


		</div>
	</div>



	<section class="section bg-image overlay" style="background-image: url('resources/images/hero_4.jpg');">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-12 col-md-6 text-center mb-4 mb-md-0 text-md-left" data-aos="fade-up">
					<h2 class="text-white font-weight-bold">A Best Place To Stay. Reserve Now!</h2>
				</div>
				<div class="col-12 col-md-6 text-center text-md-right" data-aos="fade-up" data-aos-delay="200">
					<a href="reserveRoomslist" class="btn btn-outline-white-primary py-3 text-white px-5">Reserve Now</a>
				</div>
			</div>
		</div>
	</section>
	
	<footer class="footer-section">
		<jsp:include page="footer.jsp" flush="true" />
	</footer>
	
	<script src="resources/js/jquery-3.3.1.min.js"></script>
	<script src="resources/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="resources/js/popper.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/owl.carousel.min.js"></script>
	<script src="resources/js/jquery.stellar.min.js"></script>
	<script src="resources/js/jquery.fancybox.min.js"></script>


	<script src="resources/js/aos.js"></script>

	<script src="resources/js/bootstrap-datepicker.js"></script>
	<script src="resources/js/jquery.timepicker.min.js"></script>



	<script src="resources/js/main.js"></script>
</body>
</html>