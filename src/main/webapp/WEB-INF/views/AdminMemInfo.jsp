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

<!-- 부트스트랩, 제이쿼리 라이브러리 추가 SI - 20220314 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>



</head>
<style>
/* 세로 네비게이션(리스트그룹) 관련 css START - SI 20220314 */
	.list-group-item.active {
		background-color: #f1ebd6 !important;
		/* border: 1px solid #f1ebd6 !important; */
		color: #633e12 !important;
		font-weight: bold;
	}
	.list-group-item {
		font-size: 14px;
		font-family: Helvetica;
		border: 1px solid #f1ebd6 !important;
		padding-right: 10px !important;
	}
/* 세로 네비게이션(리스트그룹) 관련 css END - SI 20220314 */

/* 컨텐츠 - 예약 상세보기 영역 css START - SI 20220314 */
	#list-reserve .table th{
		background-color: #f1ebd6;
		border-top: 1px solid #cdcbbe;
		border-bottom: 1px solid #cdcbbe;
		color: #633e12 !important;
		width: 20%;
	}
	#list-reserve .table tr{
		border-top: 1px solid #cdcbbe;
		border-bottom: 1px solid #cdcbbe;
	}
	.focu:hover{
		background-color:#633e12 !important;
		color:white !important;
	}
/* 컨텐츠 - 예약 상세보기 영역 css END - SI 20220314 */	
</style>

<body>

	<!-- 헤더 추가 -->
	<header class="site-header">
		<jsp:include page="header.jsp" flush="true" />
	</header>
	<!-- END head -->


<!-- 마이페이지 세로 네비게이션 추가 START - SI 20220314 -->
	<section class="section contact-section" id="next">
		<!-- 칸 띄우기 용 div -->
		<div style="height: 75px; display: block;"></div>

		<!-- 전부를 묶는 컨테이너 -->
		<div class="container">
			<div class="row">

		<!-- 세로 네비게이션 바 -->
				<div data-aos="fade-right" data-aos-duration="500" class="col-2" style="height: 800px; border-right: 1px solid rightgray;">
					<div class="list-group" id="list-tab" role="tablist" style="border: 1px solid #f1ebd6">
					
						<a class="list-group-item list-group-item-action active" id="list-home-list" href="">회원 정보 리스트</a>
						<a class="list-group-item list-group-item-action" id="list-profile-list" href="">객실 예약 정보 리스트</a>
						<a class="list-group-item list-group-item-action" id="list-messages-list" href="">회원 문의 관리</a>
						<a class="list-group-item list-group-item-action" id="list-settings-list" href="">마일리지 상품 관리</a>

					</div>
				</div>
<!-- 마이페이지 세로 네비게이션 추가 END - SI 20220314 -->

<!-- 회원 정보 보기 START - SI 20220322 -->
			<!-- tabContent 있어야 발동함 -->
			<div class="col-md-10 tab-content" id="nav-tabContent" data-aos="fade-up" data-aos-duration="1000">
				<div class="tab-pane fade show active" id="list-reserve" role="tabpanel" aria-labelledby="list-reserve-list"
						style="max-width:100% !important">
					<form action="" method="">
						<h4 style="color: #633e12;">회원 정보 - ${result.mem_id }</h4>
						<hr style="border-color: #633e12;" />
					
					<table class="table table-bordered">
							<tbody>
								<tr>
									<th scope="row">아이디</th>
									<td colspan="3">${result.mem_id }</td>
								</tr>
								<tr>
									<th scope="row">이름(영문)</th>
									<td colspan="3">${result.mem_name_en}</td>
								</tr>
								<tr>
									<th scope="row">이름(한글)</th>
									<td colspan="3">${result.mem_name_kr }</td>
								</tr>
								<tr>
									<th scope="row">연락처</th>
									<td colspan="3">${result.mem_phone }</td>
								</tr>
								<tr>
									<th scope="row">이메일</th>
									<td colspan="3">${result.mem_email }</td>
								</tr>
								<tr>
									<th scope="row">사용가능 마일리지</th>
									<td colspan="3">${result.mileage_useable }</td>
								</tr>
							</tbody>
						</table>
					<div style="text-align:right;">
						<!-- 20220319 취소는 뒤로가기와 같음 SI -->
						<input type="button" class="btn btn-outline-warning focu" style="color: #633e12; border-color: #633e12;" onclick="window.history.back()" value="목록으로">
					</div>
					</form>

				</div>
			</div>
<!-- 회원 정보보기 END - SI 20220317 -->	





					
					
				

				<!-- 20220314 폐기
				<div class="col-md-5" data-aos="fade-up" data-aos-delay="200">
					<div class="row">
						<div class="col-md-10 ml-auto contact-info">
							<p>
								<span class="d-block">Address:</span> <span class="text-black"> 98 West 21th Street, Suite 721 New York NY 10016</span>
							</p>
							<p>
								<span class="d-block">Phone:</span> <span class="text-black"> (+1) 435 3533</span>
							</p>
							<p>
								<span class="d-block">Email:</span> <span class="text-black"> info@yourdomain.com</span>
							</p>
						</div>
					</div>
				</div>
				 -->
			</div>
		</div>
	</section>

	<section class="section testimonial-section bg-light">
		<div class="container">
			<div class="row justify-content-center text-center mb-5">
				<div class="col-md-7">
					<h2 class="heading" data-aos="fade-up">People Says</h2>
				</div>
			</div>
			<div class="row">
				<div class="js-carousel-2 owl-carousel mb-5" data-aos="fade-up" data-aos-delay="200">

					<div class="testimonial text-center slider-item">
						<div class="author-image mb-3">
							<img src="resources/images/person_1.jpg" alt="Image placeholder" class="rounded-circle mx-auto">
						</div>
						<blockquote>

							<p>&ldquo;A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.&rdquo;</p>
						</blockquote>
						<p>
							<em>&mdash; Jean Smith</em>
						</p>
					</div>

					<div class="testimonial text-center slider-item">
						<div class="author-image mb-3">
							<img src="resources/images/person_2.jpg" alt="Image placeholder" class="rounded-circle mx-auto">
						</div>
						<blockquote>
							<p>&ldquo;Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.&rdquo;</p>
						</blockquote>
						<p>
							<em>&mdash; John Doe</em>
						</p>
					</div>

					<div class="testimonial text-center slider-item">
						<div class="author-image mb-3">
							<img src="resources/images/person_3.jpg" alt="Image placeholder" class="rounded-circle mx-auto">
						</div>
						<blockquote>

							<p>&ldquo;When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane.&rdquo;</p>
						</blockquote>
						<p>
							<em>&mdash; John Doe</em>
						</p>
					</div>


					<div class="testimonial text-center slider-item">
						<div class="author-image mb-3">
							<img src="resources/images/
person_1.jpg" alt="Image placeholder" class="rounded-circle mx-auto">
						</div>
						<blockquote>

							<p>&ldquo;A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.&rdquo;</p>
						</blockquote>
						<p>
							<em>&mdash; Jean Smith</em>
						</p>
					</div>

					<div class="testimonial text-center slider-item">
						<div class="author-image mb-3">
							<img src="resources/images/
person_2.jpg" alt="Image placeholder" class="rounded-circle mx-auto">
						</div>
						<blockquote>
							<p>&ldquo;Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.&rdquo;</p>
						</blockquote>
						<p>
							<em>&mdash; John Doe</em>
						</p>
					</div>

					<div class="testimonial text-center slider-item">
						<div class="author-image mb-3">
							<img src="resources/images/
person_3.jpg" alt="Image placeholder" class="rounded-circle mx-auto">
						</div>
						<blockquote>

							<p>&ldquo;When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane.&rdquo;</p>
						</blockquote>
						<p>
							<em>&mdash; John Doe</em>
						</p>
					</div>

				</div>
				<!-- END slider -->
			</div>

		</div>
	</section>



	<section class="section bg-image overlay" style="background-image: url(' resources/ images/ hero_4.jpg ');">
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

	<footer class="section footer-section">
		<div class="container">
			<div class="row mb-4">
				<div class="col-md-3 mb-5">
					<ul class="list-unstyled link">
						<li><a href="#">About Us</a></li>
						<li><a href="#">Terms &amp; Conditions</a></li>
						<li><a href="#">Privacy Policy</a></li>
						<li><a href="#">Rooms</a></li>
					</ul>
				</div>
				<div class="col-md-3 mb-5">
					<ul class="list-unstyled link">
						<li><a href="#">The Rooms &amp; Suites</a></li>
						<li><a href="#">About Us</a></li>
						<li><a href="#">Contact Us</a></li>
						<li><a href="#">Restaurant</a></li>
					</ul>
				</div>
				<div class="col-md-3 mb-5 pr-md-5 contact-info">
					<!-- <li>198 West 21th Street, <br> Suite 721 New York NY 10016</li> -->
					<p>
						<span class="d-block"><span class="ion-ios-location h5 mr-3 text-primary"></span>Address:</span> <span> 198 West 21th Street, <br> Suite 721 New York NY 10016
						</span>
					</p>
					<p>
						<span class="d-block"><span class="ion-ios-telephone h5 mr-3 text-primary"></span>Phone:</span> <span> (+1) 435 3533</span>
					</p>
					<p>
						<span class="d-block"><span class="ion-ios-email h5 mr-3 text-primary"></span>Email:</span> <span> info@domain.com</span>
					</p>
				</div>
				<div class="col-md-3 mb-5">
					<p>Sign up for our newsletter</p>
					<form action="#" class="footer-newsletter">
						<div class="form-group">
							<input type="email" class="form-control" placeholder="Email...">
							<button type="submit" class="btn">
								<span class="fa fa-paper-plane"></span>
							</button>
						</div>
					</form>
				</div>
			</div>
			<div class="row pt-5">
				<p class="col-md-6 text-left">
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					Copyright &copy;
					<script>
						document.write(new Date().getFullYear());
					</script>
					All rights reserved | This template is made with <i class="icon-heart-o" aria-hidden="true"></i> by
					<a href="https://colorlib.com" target="_blank">Colorlib</a>
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				</p>

				<p class="col-md-6 text-right social">
					<a href="#">
						<span class="fa fa-tripadvisor"></span>
					</a>
					<a href="#">
						<span class="fa fa-facebook"></span>
					</a>
					<a href="#">
						<span class="fa fa-twitter"></span>
					</a>
					<a href="#">
						<span class="fa fa-linkedin"></span>
					</a>
					<a href="#">
						<span class="fa fa-vimeo"></span>
					</a>
				</p>
			</div>
		</div>
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

var userId = "${sessionScope.loginId}";
console.log(userId);
if (userId == "") {
	console.log(userId);
	location.href="logout";
}


var grade = "${sessionScope.grade}";
console.log(grade);
if (grade != "admin") {
	console.log(grade);
	location.href="logout";
}

/* 20220319 목록으로 버튼 구현 SI */
	var pagingNum = ${pagingNum};

	console.log("돌아갈 페이지 번호 : ", pagingNum)
	
	function reserveList(){
		location.href = "./myReserve?num="+pagingNum;
	}	
/* 20220319 목록으로 버튼 구현 SI */


</script>

</html>