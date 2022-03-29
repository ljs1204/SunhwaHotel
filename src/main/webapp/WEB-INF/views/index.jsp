<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE HTML>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>SUNHWA</title>
<title>Sogo Hotel by Colorlib.com</title>

<!-- jquery 추가 -->
<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>


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


	<!-- END head -->

	<section class="site-hero overlay" style="background-image: url(resources/images/hero_4.jpg)" data-stellar-background-ratio="0.5">
		<div class="container">
			<div class="row site-hero-inner justify-content-center align-items-center">
				<div class="col-md-10 text-center" data-aos="fade-up">
					<span class="custom-caption text-uppercase text-white d-block  mb-3">Welcome To 5 <span class="fa fa-star text-primary"></span> Hotel
					</span>
					<h1 class="heading">선화호텔</h1>
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

	<section class="section bg-light pb-0">
		<div class="container">

			<div class="row check-availabilty" id="next">
				<div class="block-32" data-aos="fade-up" data-aos-offset="-200">

					<form action="toReserve" method="post">
						<div class="row">
							<div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
								<label for="checkin_date" class="font-weight-bold text-black">Check In</label>
								<div class="field-icon-wrap">
									<div class="icon">
										<span class="icon-calendar"></span>
									</div>
									<input type="text" id="checkin_date" class="form-control" autocomplete="off" name="checkin_date" value="" />
								</div>
							</div>

							<div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
								<label for="checkout_date" class="font-weight-bold text-black">Check Out</label>
								<div class="field-icon-wrap">
									<div class="icon">
										<span class="icon-calendar"></span>
									</div>
									<input type="text" id="checkout_date" class="form-control" autocomplete="off" name="checkout_date" />
								</div>
							</div><!-- 
							<div class="col-md-6 mb-3 mb-md-0 col-lg-3">
								<div class="row">

									<div class="col-md-6 mb-3 mb-md-0">
										<label for="children" class="font-weight-bold text-black">인원 수</label>
										<div class="field-icon-wrap">
											<div class="icon">
												<span class="ion-ios-arrow-down"></span>
											</div>
											<select name="cnt" id="children" class="form-control">
												<option value="1">1</option>
												<option selected value="2">2</option>
												<option value="3">3</option>
											</select>
										</div>
									</div>

								</div>

							</div> -->

							<div class="col-md-6 col-lg-3 align-self-end">
								<button class="btn btn-primary btn-block text-white" id="mainCheckBtn" onclick="checkdate()">Check Availabilty</button>
							</div>

						</div>
					</form>
				</div>


			</div>
		</div>
	</section>

	<section class="py-5 bg-light">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-md-12 col-lg-7 ml-auto order-lg-2 position-relative mb-5" data-aos="fade-up">
					<figure class="img-absolute">
						<img src="resources/images/food-1.jpg" alt="Image" class="img-fluid">
					</figure>
					<img src="resources/images/img_1.jpg" alt="Image" class="img-fluid rounded">
				</div>
				<div class="col-md-12 col-lg-4 order-lg-1" data-aos="fade-up">
					<h2 class="heading">
						Welcome!<br />선화 호텔!
					</h2>
					<p class="mb-4">세계 럭셔리 호텔들과 어깨를 나란히 하고 있는 선화 호텔은 고객 한 분 한 분을 배려하는 기품있는 서비스로 
					세계 각국의 수반들과 외교, 경제, 문화 등의 분야의 명사로부터 찬사를 받고 있으며, Conde Nast Traveler, Travel & Leisure, 
					Zagat, Euromoney등 권위 있는 해외 매체로부터 매년 한국 최고의 호텔로 선정되고 있습니다.</p>

				</div>

			</div>
		</div>
	</section>

	<section class="section">
		<div class="container">
			<div class="row justify-content-center text-center mb-5">
				<div class="col-md-7">
					<h2 class="heading" data-aos="fade-up">디럭스 &amp; 스위트</h2>
					<p data-aos="fade-up" data-aos-delay="100">설명/소개</p>
				</div>
			</div>



		<!-- 객실 상세보기 이동 - 선화 20220311 -->
			<div class="row">
				<c:forEach items="${roomlist}" var="list">
					<div class="col-md-6 col-lg-5" data-aos="fade-up">
						<a href="roomdetail?room_num=${list.room_num}" class="room">
							<!-- 여기를 클릭하면 디럭스룸의 객실 상세보기로 이동한다. -->
							<figure class="img-wrap">
								<img src="resources/images/${list.room_img}" alt="Free website template" class="img-fluid mb-3">
							</figure>
							<div class="p-3 text-center room-info">
								<h2>${list.room_type_name}</h2>
								<span class="text-uppercase letter-spacing-1"><fmt:formatNumber value="${list.room_price}" pattern="#,### 원" />/ per night</span>
							</div>
						</a>

					</div>
		<!-- 객실 상세보기 이동 - 선화 20220311 -->


				</c:forEach>
			</div>
		</div>
	</section>


	<section class="section slider-section bg-light">
		<div class="container">
			<div class="row justify-content-center text-center mb-5">
				<div class="col-md-7">
					<h2 class="heading" data-aos="fade-up">Photos</h2>
					<p data-aos="fade-up" data-aos-delay="100">최고의 호텔</p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="home-slider major-caousel owl-carousel mb-5" data-aos="fade-up" data-aos-delay="200">
						<div class="slider-item">
							<a href="resources/images/slider-1.jpg" data-fancybox="resources/images" data-caption="Caption for this image">
								<img src="resources/images/slider-1.jpg" alt="Image placeholder" class="img-fluid">
							</a>
						</div>
						<div class="slider-item">
							<a href="resources/images/slider-2.jpg" data-fancybox="resources/images" data-caption="Caption for this image">
								<img src="resources/images/slider-2.jpg" alt="Image placeholder" class="img-fluid">
							</a>
						</div>
						<div class="slider-item">
							<a href="resources/images/slider-3.jpg" data-fancybox="resources/images" data-caption="Caption for this image">
								<img src="resources/images/slider-3.jpg" alt="Image placeholder" class="img-fluid">
							</a>
						</div>
						<div class="slider-item">
							<a href="resources/images/slider-4.jpg" data-fancybox="resources/images" data-caption="Caption for this image">
								<img src="resources/images/slider-4.jpg" alt="Image placeholder" class="img-fluid">
							</a>
						</div>
						<div class="slider-item">
							<a href="resources/images/slider-5.jpg" data-fancybox="resources/images" data-caption="Caption for this image">
								<img src="resources/images/slider-5.jpg" alt="Image placeholder" class="img-fluid">
							</a>
						</div>
						<div class="slider-item">
							<a href="resources/images/slider-6.jpg" data-fancybox="resources/images" data-caption="Caption for this image">
								<img src="resources/images/slider-6.jpg" alt="Image placeholder" class="img-fluid">
							</a>
						</div>
						<div class="slider-item">
							<a href="resources/images/slider-7.jpg" data-fancybox="resources/images" data-caption="Caption for this image">
								<img src="resources/images/slider-7.jpg" alt="Image placeholder" class="img-fluid">
							</a>
						</div>
					</div>
					<!-- END slider -->
				</div>

			</div>
		</div>
	</section>
	<!-- END section -->

	<section class="section bg-image overlay" style="background-image: url('resources/images/hero_3.jpg');">
		<div class="container">
			<div class="row justify-content-center text-center mb-5">
				<div class="col-md-7">
					<h2 class="heading text-white" data-aos="fade">조식메뉴</h2>
					<p class="text-white" data-aos="fade" data-aos-delay="100">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
				</div>
			</div>
			<div class="food-menu-tabs" data-aos="fade">
				<ul class="nav nav-tabs mb-5" id="myTab" role="tablist">
					<li class="nav-item"><a class="nav-link active letter-spacing-2" id="mains-tab" data-toggle="tab" href="#mains" role="tab" aria-controls="mains" aria-selected="true">Mains</a></li>
					<li class="nav-item"><a class="nav-link letter-spacing-2" id="desserts-tab" data-toggle="tab" href="#desserts" role="tab" aria-controls="desserts" aria-selected="false">Desserts</a></li>
					<li class="nav-item"><a class="nav-link letter-spacing-2" id="drinks-tab" data-toggle="tab" href="#drinks" role="tab" aria-controls="drinks" aria-selected="false">Drinks</a></li>
				</ul>
				<div class="tab-content py-5" id="myTabContent">


					<div class="tab-pane fade show active text-left" id="mains" role="tabpanel" aria-labelledby="mains-tab">
						<div class="row">
							<div class="col-md-6">
								<div class="food-menu mb-5">
									<span class="d-block text-primary h4 mb-3">$20.00</span>
									<h3 class="text-white">
										<a href="#" class="text-white">Murgh Tikka Masala</a>
									</h3>
									<p class="text-white text-opacity-7">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
								</div>
								<div class="food-menu mb-5">
									<span class="d-block text-primary h4 mb-3">$35.00</span>
									<h3 class="text-white">
										<a href="#" class="text-white">Fish Moilee</a>
									</h3>
									<p class="text-white text-opacity-7">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
								</div>
								<div class="food-menu mb-5">
									<span class="d-block text-primary h4 mb-3">$15.00</span>
									<h3 class="text-white">
										<a href="#" class="text-white">Safed Gosht</a>
									</h3>
									<p class="text-white text-opacity-7">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
								</div>
							</div>
							<div class="col-md-6">
								<div class="food-menu mb-5">
									<span class="d-block text-primary h4 mb-3">$10.00</span>
									<h3 class="text-white">
										<a href="#" class="text-white">French Toast Combo</a>
									</h3>
									<p class="text-white text-opacity-7">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
								</div>
								<div class="food-menu mb-5">
									<span class="d-block text-primary h4 mb-3">$8.35</span>
									<h3 class="text-white">
										<a href="#" class="text-white">Vegie Omelet</a>
									</h3>
									<p class="text-white text-opacity-7">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
								</div>
								<div class="food-menu mb-5">
									<span class="d-block text-primary h4 mb-3">$22.00</span>
									<h3 class="text-white">
										<a href="#" class="text-white">Chorizo &amp; Egg Omelet</a>
									</h3>
									<p class="text-white text-opacity-7">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
								</div>
							</div>
						</div>


					</div>
					<!-- .tab-pane -->

					<div class="tab-pane fade text-left" id="desserts" role="tabpanel" aria-labelledby="desserts-tab">
						<div class="row">
							<div class="col-md-6">
								<div class="food-menu mb-5">
									<span class="d-block text-primary h4 mb-3">$11.00</span>
									<h3 class="text-white">
										<a href="#" class="text-white">Banana Split</a>
									</h3>
									<p class="text-white text-opacity-7">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
								</div>
								<div class="food-menu mb-5">
									<span class="d-block text-primary h4 mb-3">$72.00</span>
									<h3 class="text-white">
										<a href="#" class="text-white">Sticky Toffee Pudding</a>
									</h3>
									<p class="text-white text-opacity-7">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
								</div>
								<div class="food-menu mb-5">
									<span class="d-block text-primary h4 mb-3">$26.00</span>
									<h3 class="text-white">
										<a href="#" class="text-white">Pecan</a>
									</h3>
									<p class="text-white text-opacity-7">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
								</div>
							</div>
							<div class="col-md-6">
								<div class="food-menu mb-5">
									<span class="d-block text-primary h4 mb-3">$42.00</span>
									<h3 class="text-white">
										<a href="#" class="text-white">Apple Strudel</a>
									</h3>
									<p class="text-white text-opacity-7">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
								</div>
								<div class="food-menu mb-5">
									<span class="d-block text-primary h4 mb-3">$7.35</span>
									<h3 class="text-white">
										<a href="#" class="text-white">Pancakes</a>
									</h3>
									<p class="text-white text-opacity-7">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
								</div>
								<div class="food-menu mb-5">
									<span class="d-block text-primary h4 mb-3">$22.00</span>
									<h3 class="text-white">
										<a href="#" class="text-white">Ice Cream Sundae</a>
									</h3>
									<p class="text-white text-opacity-7">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
								</div>
							</div>
						</div>
					</div>
					<!-- .tab-pane -->
					<div class="tab-pane fade text-left" id="drinks" role="tabpanel" aria-labelledby="drinks-tab">
						<div class="row">
							<div class="col-md-6">
								<div class="food-menu mb-5">
									<span class="d-block text-primary h4 mb-3">$32.00</span>
									<h3 class="text-white">
										<a href="#" class="text-white">Spring Water</a>
									</h3>
									<p class="text-white text-opacity-7">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
								</div>
								<div class="food-menu mb-5">
									<span class="d-block text-primary h4 mb-3">$14.00</span>
									<h3 class="text-white">
										<a href="#" class="text-white">Coke, Diet Coke, Coke Zero</a>
									</h3>
									<p class="text-white text-opacity-7">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
								</div>
								<div class="food-menu mb-5">
									<span class="d-block text-primary h4 mb-3">$93.00</span>
									<h3 class="text-white">
										<a href="#" class="text-white">Orange Fanta</a>
									</h3>
									<p class="text-white text-opacity-7">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
								</div>
							</div>
							<div class="col-md-6">
								<div class="food-menu mb-5">
									<span class="d-block text-primary h4 mb-3">$18.00</span>
									<h3 class="text-white">
										<a href="#" class="text-white">Lemonade, Lemon Squash</a>
									</h3>
									<p class="text-white text-opacity-7">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
								</div>
								<div class="food-menu mb-5">
									<span class="d-block text-primary h4 mb-3">$38.35</span>
									<h3 class="text-white">
										<a href="#" class="text-white">Sparkling Mineral Water</a>
									</h3>
									<p class="text-white text-opacity-7">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
								</div>
								<div class="food-menu mb-5">
									<span class="d-block text-primary h4 mb-3">$69.00</span>
									<h3 class="text-white">
										<a href="#" class="text-white">Lemon, Lime &amp; Bitters</a>
									</h3>
									<p class="text-white text-opacity-7">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
								</div>
							</div>
						</div>
					</div>
					<!-- .tab-pane -->
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
					<a href="reserveRoomslist" class="btn btn-outline-white-primary py-3 text-white px-5">Reserve Now</a>
				</div>
			</div>
		</div>
	</section>

	<!-- footer 20220314 SI -->
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

  
  	var msg = "${msg2}";
	
	if(msg != ""){
		alert(msg);
	}
	
	
  $("div.field-icon-wrap").each(function(){
	    var $inputs = $(this).find('input');
	    $inputs.datepicker();
	    if ($inputs.length >= 2) {
	        var $from = $inputs.eq(0);
	        var $to   = $inputs.eq(1);
	        $from.on('changeDate', function (e) {
	            var d = new Date(e.date.valueOf());
	            $to.datepicker('setStartDate', d); // 종료일은 시작일보다 빠를 수 없다.
	        });
	        $to.on('changeDate', function (e) {
	            var d = new Date(e.date.valueOf());
	            $from.datepicker('setEndDate', d); // 시작일은 종료일보다 늦을 수 없다.
	        });
	    }
	});
  
  	var msg = "${msg}";
	
	if(msg != ""){
		alert(msg);
	}
	

	
	
	
  
  </script>







</html>