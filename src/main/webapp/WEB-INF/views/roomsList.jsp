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

<link rel="stylesheet" href="resources/fonts/ionicons/resources/css/ionicons.min.css">
<link rel="stylesheet" href="resources/fonts/fontawesome/resources/css/font-awesome.min.css">

<!-- Theme Style -->
<link rel="stylesheet" href="resources/css/style.css">

<style>
.subjects {
	/* background-color: #f1ebd6 !important; */
	/* border: 1px solid #f1ebd6 !important; */
	color: #633e12 !important;
	font-weight: bold;
	font-size: 25px;
}

.contents {
	font-size: 14px;
	font-family: Helvetica;
	/* border: 1px solid #f1ebd6 !important; */
	padding-right: 10px !important;
}
</style>

</head>
<body>


	<header class="site-header">
		<jsp:include page="header.jsp" flush="true" />
	</header>



	<section class="site-hero inner-page overlay" style="background-image: url(resources/images/hero_4.jpg)" data-stellar-background-ratio="0.5">
		<div class="container">
			<div class="row site-hero-inner justify-content-center align-items-center">
				<div class="col-md-10 text-center" data-aos="fade">
					<h1 class="heading mb-3">Rooms</h1>
					<ul class="custom-breadcrumbs mb-4">
						<li><a href="index.html">Home</a></li>
						<li>&bullet;</li>
						<li>객실</li>
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
	<%-- 
    <section class="section pb-4">
      <div class="container">
       
        <div class="row check-availabilty" id="next">
          <div class="block-32" data-aos="fade-up" data-aos-offset="-200">

            <form action="#">
            
           	
              <div class="row">
                <div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
                  <label for="checkin_date" class="font-weight-bold text-black">Check In</label>
                  <div class="field-icon-wrap">
                    <div class="icon"><span class="icon-calendar"></span></div>
                    <input type="text" id="checkin_date" class="form-control" value="${checkin_date}"/>
                  </div>
                </div>
                <div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
                  <label for="checkout_date" class="font-weight-bold text-black">Check Out</label>
                  <div class="field-icon-wrap">
                    <div class="icon"><span class="icon-calendar"></span></div>
                    <input type="text" id="checkout_date" class="form-control" value="${checkout_date}"/>
                  </div>
                </div>
                <div class="col-md-6 mb-3 mb-md-0 col-lg-3">
                  <div class="row">
                    
                    <div class="col-md-6 mb-3 mb-md-0">
                      <label for="children" class="font-weight-bold text-black">Children</label>
                      <div class="field-icon-wrap">
                        <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                        <select name="cnt" id="children" class="form-control"  >
                          <option value="1" <c:if test="${cnt eq '1'}">selected</c:if>>1</option>
                          <option value="2" <c:if test="${cnt eq '2'}">selected</c:if>>2</option>
                          <option value="3" <c:if test="${cnt eq '3'}">selected</c:if>>3</option>
                        </select>
                      </div>
                    </div>
                    
                    
                  </div>
                </div>
                <div class="col-md-6 col-lg-3 align-self-end">
                  <button class="btn btn-primary btn-block text-white">Check Availabilty</button>
                </div>
              </div>
              
              
              
            </form>
          </div>


        </div>
      </div>
    </section>

     --%>
	<section class="section">

		<div class="container">
			<div class="row justify-content-center text-center subjects">객실</div>
			<div class="row justify-content-center text-center contents">'시대를 아우르는 모던함(Timeless Modern)'을 모토로, 시간이 흐를수록 더욱 빛나는 절제된 디자인을 선보입니다.</div>
			<hr />


			<div class="row">
				
				
				<c:forEach items="${roomsList}" var="list">
					<div class="col-md-8 col-lg-6 mb-5" data-aos="fade-up">
						<a href="roomdetail?room_num=${list.room_num}" class="room">

							<!-- 20220321 이미지 카우셀(슬라이드) SI -->
							<c:set var="room_num" value="${list.room_num }" />
							<c:set var="cnt" value="1"/>
							
							<div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
								<%-- <ol class="carousel-indicators">
									<c:forEach items="${roomPhotos }" var="photos" varStatus="stat">
										<c:if test="${photos.room_num eq room_num}">
											<c:if test="${stat.count eq 1 || stat.count eq 8 || stat.count eq 15 || stat.count eq 22}">
												<li data-target="#carouselExampleIndicators" class="active"></li>
											</c:if>
											<c:if test="${stat.count ne 1 && stat.count ne 8 && stat.count ne 15 && stat.count ne 22}">
												<li data-target="#carouselExampleIndicators"></li>
												<c:set var="cnt" value="${cnt + 1 }"/>
											</c:if>
										</c:if>
									</c:forEach>
								</ol> --%>
								<div class="carousel-inner">
									<c:forEach items="${roomPhotos }" var="photos" varStatus="stat">
										<c:if test="${photos.room_num eq room_num}">
											<c:if test="${stat.count eq 1 || stat.count eq 8 || stat.count eq 15 || stat.count eq 22}">
												<div class="carousel-item active">
													<img src="resources/images/${photos.room_img}" class="d-block w-100" alt="...">
												</div>
											</c:if>
											<c:if test="${stat.count ne 1 && stat.count ne 8 && stat.count ne 15 && stat.count ne 22}">
												<div class="carousel-item">
													<img src="resources/images/${photos.room_img}" class="d-block w-100" alt="...">
												</div>
											</c:if>
										</c:if>
									</c:forEach>
								</div>
								<!-- 
								<button class="carousel-control-prev" type="button" data-target="#carouselExampleIndicators" data-slide="prev">
									<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="sr-only">Previous</span>
								</button>
								<button class="carousel-control-next" type="button" data-target="#carouselExampleIndicators" data-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="sr-only">Next</span>
								</button>
								 -->
							</div>


<%-- 
							<figure class="img-wrap">
								<img src="resources/images/${roomPhotos[0].room_img}" alt="Free website template" class="img-fluid mb-3">
							</figure>
 --%>

							<div class="p-3 text-center room-info">
								<div style="color: black; font-size:13px;" class="row justify-content-left text-left">${list.room_type_name}</div>
								<div style="color: black; font-size:17px; font-weight:bold" class="row justify-content-left text-left">${list.room_type_name} 룸</div>
								<div style="color: black; font-size:12px;" class="row justify-content-left text-left">
									침대타입 : &nbsp;
									<span style="color: black; font-size:12px; font-weight:bold">
										<c:if test="${list.bed_type eq 1}">
											트윈
										</c:if>
										<c:if test="${list.bed_type eq 2}">
											더블
										</c:if>
									</span> &nbsp;&nbsp;&nbsp;&nbsp;
									투숙인원 : &nbsp;
									<span style="color: black; font-size:12px; font-weight:bold">
										${list.room_capacity }
									</span> 
									&nbsp;&nbsp;&nbsp;&nbsp; 
									객실면적 : &nbsp;
									<span style="color: black; font-size:12px; font-weight:bold">
										${list.room_size }
									</span>
									
								</div>
								<hr/>
								<span style="color:black;" class="row justify-content-left text-left">최저 : <fmt:formatNumber type="number" maxFractionDigits="3" value="${list.room_price}" /> KRW</span>
								
							</div>
						</a>
					</div>
				</c:forEach>



			</div>
		</div>
	</section>

	<section class="section bg-light">

		<div class="container">
			<div class="row justify-content-center text-center mb-5">
				<div class="col-md-7">
					<h2 class="heading" data-aos="fade">Great Offers</h2>
					<p data-aos="fade">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
				</div>
			</div>

			<div class="site-block-half d-block d-lg-flex bg-white" data-aos="fade" data-aos-delay="100">
				<a href="#" class="image d-block bg-image-2" style="background-image: url('resources/images/img_1.jpg');"></a>
				<div class="text">
					<span class="d-block mb-4"><span class="display-4 text-primary">$199</span> <span class="text-uppercase letter-spacing-2">/ per night</span> </span>
					<h2 class="mb-4">Family Room</h2>
					<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
					<p>
						<a href="#" class="btn btn-primary text-white">Book Now</a>
					</p>
				</div>
			</div>
			<div class="site-block-half d-block d-lg-flex bg-white" data-aos="fade" data-aos-delay="200">
				<a href="#" class="image d-block bg-image-2 order-2" style="background-image: url('resources/images/img_2.jpg');"></a>
				<div class="text order-1">
					<span class="d-block mb-4"><span class="display-4 text-primary">$299</span> <span class="text-uppercase letter-spacing-2">/ per night</span> </span>
					<h2 class="mb-4">Presidential Room</h2>
					<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
					<p>
						<a href="#" class="btn btn-primary text-white">Book Now</a>
					</p>
				</div>
			</div>

		</div>
	</section>

	<section class="section bg-image overlay" style="background-image: url('resources/images/hero_4.jpg');">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-12 col-md-6 text-center mb-4 mb-md-0 text-md-left" data-aos="fade-up">
					<h2 class="text-white font-weight-bold">A Best Place To Stay. Reserve Now!</h2>
				</div>
				<div class="col-12 col-md-6 text-center text-md-right" data-aos="fade-up" data-aos-delay="200">
					<a href="reservation.html" class="btn btn-outline-white-primary py-3 text-white px-5">Reserve Now</a>
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
<script>
	var msg = "${msg}";

	if (msg != "") {
		alert(msg);
	}
</script>





</html>