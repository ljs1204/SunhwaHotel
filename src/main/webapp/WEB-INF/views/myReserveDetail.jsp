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

.focu:hover {
	background-color: #633e12 !important;
	color: white !important;
}

</style>





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
					
						<a class="list-group-item list-group-item-action" id="list-home-list" href="./myPage">프로필</a>
						<a class="list-group-item list-group-item-action active" id="list-profile-list" href="./myReserve?num=1">예약 조회</a>
						<a class="list-group-item list-group-item-action" id="list-messages-list" href="./tomemberboardlist">문의 글 & 답 글</a>
						<a class="list-group-item list-group-item-action" id="list-settings-list" href="./myPagemilelist?orderNum=1">마일리지 내역 조회</a>
						<a class="list-group-item list-group-item-action" id="list-settings-list" href="./myPagemyProfile">내 정보 조회</a>
						<a class="list-group-item list-group-item-action" id="list-settings-list" href="./myProfile">회원정보 수정</a>

					</div>
				</div>
<!-- 마이페이지 세로 네비게이션 추가 END - SI 20220314 -->

<!-- 예약 상세보기 START - SI 20220317 -->
			<!-- tabContent 있어야 발동함 -->
			<div class="col-md-10 tab-content" id="nav-tabContent" data-aos="fade-up" data-aos-duration="1000">
				<div class="tab-pane fade show active" id="list-reserve" role="tabpanel" aria-labelledby="list-reserve-list"
						style="max-width:100% !important">
					<form action="" method="">
						<h4 style="color: #633e12;">예약 상세보기 - ${result.reserve_num }</h4>
						<hr style="border-color: #633e12;" />
					
					<table class="table table-bordered">
							<tbody>
								<tr>
									<th scope="row">예약번호</th>
									<td colspan="3">${result.reserve_num }</td>
								</tr>
								<tr>
									<th scope="row">기간</th>
									<td colspan="3">${result.checkindate } &nbsp;&nbsp;~&nbsp;&nbsp;  ${result.checkoutdate }</td>
								</tr>
								<tr>
									<th scope="row">타입</th>
									<td colspan="3">
										<c:forEach var="ro" items="${room }" varStatus="status">
										<!-- 베드 타입 저장( 1-트윈 / 2-더블 )할 변수 생성 -->
										<c:if test="${ro.bed_type eq 1 }">
											<c:set var="bed_type" value="트윈"/>
										</c:if>
										<c:if test="${ro.bed_type eq 2 }">
											<c:set var="bed_type" value="더블"/>
										</c:if>
											
										<!-- 만약 예약상태가 2이면 회색 처리 -->
										<c:if test="${ro.reserve_state eq 2 }">											
											<!-- 룸 타입별로 이름 주기 -->
											<c:if test="${status.last eq false }">
												<span style="color:gray; text-decoration:line-through">${ro.room_type_name }룸(${bed_type }),</span>
											</c:if>
											<c:if test="${status.last eq true }">
												<span style="color:gray; text-decoration:line-through">${ro.room_type_name }룸(${bed_type })</span>
											</c:if>
										</c:if>
										<c:if test="${ro.reserve_state eq 1 }">											
											<!-- 룸 타입별로 이름 주기 -->
											<c:if test="${status.last eq false }">
												<span>${ro.room_type_name }룸(${bed_type }) ,</span>
											</c:if>
											<c:if test="${status.last eq true }">
												<span>${ro.room_type_name }룸(${bed_type })</span>
											</c:if>
										</c:if>
										
										</c:forEach>
									</td>
								</tr>
								<tr>
									<th scope="row">총 인원</th>
									<td colspan="3">${result.adult_cnt }</td>
								</tr>
								<tr>
									<th scope="row">예약자이름</th>
									<td colspan="3">${result.reserve_name }</td>
								</tr>
								<tr>
									<th scope="row">전화번호</th>
									<td colspan="3">${result.reserve_phone }</td>
								</tr>
								<tr>
									<th scope="row">이메일</th>
									<td colspan="3">${result.reserve_email }</td>
								</tr>
								<tr>
									<th scope="row">옵션</th>
									<td colspan="3">엑스트라베드 ${result.extrabed_cnt}, 조식 ${result.breakfast_cnt }</td>
								</tr>
								<tr>
									<th scope="row">마일리지 상품</th>
									<td>
										<!-- 구매한 마일리지 상품 있을 때 -->
										<c:if test="${productSize ne 0 }">
											<!-- 20220320 마일리지 상품 리스트 -->
											<a href="./myReserveProduct?reserve_num=${result.reserve_num }">
												<span style="text-decoration:underline;">
													<c:forEach var="pro" items="${product }" varStatus="status">
														<c:if test="${status.last eq false }">
														${pro.product_name } ${pro.cnt_by_product },
														</c:if>
														<c:if test="${status.last eq true}">
															${pro.product_name } ${pro.cnt_by_product }
														</c:if>
													</c:forEach>											
												</span>
											</a>
										</c:if>
										<!-- 구매한 마일리지 상품 없을 때 -->
										<c:if test="${productSize eq 0 }">
											구매한 마일리지 상품이 없어요.
										</c:if>
									</td>
									<th scope="row">마일리지 사용 금액</th>
									<td style="width:25%;">${result.pay_mileage }</td>
								</tr>
								<tr>
									<th scope="row">현금 결제 금액</th>
									<td colspan="3">${result.pay_price }</td>
								</tr>
								<tr>
									<th scope="row">총 금액</th>
									<td colspan="3">${result.reserve_amount }</td>
								</tr>
							</tbody>
						</table>
					<div style="text-align:right;">
						<input type="button" class="btn btn-outline-warning focu" style="color:#633e12; border-color:#633e12;"
								onclick="location.href='./myReserveRefund?reserve_num=${result.reserve_num}'" value="환불신청">
<!-- 20220319 예약 리스트의 페이징 번호를 가져와서 저장하고, '목록으로' 버튼 클릭시 해당 인덱스로 SI -->
						<input type="button" class="btn btn-outline-warning focu" style="color:#633e12; border-color:#633e12;"
								onclick="reserveList()" value="목록으로">
					</div>
					</form>

				</div>
			</div>
<!-- 예약 상세보기 END - SI 20220317 -->	





					
					
				

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



	<section class="section bg-image overlay" style="background-image: url(' resources/ images/ hero_4.jpg ');">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-12 col-md-6 text-center mb-4 mb-md-0 text-md-left" data-aos="fade-up">
					<h2 class="text-white font-weight-bold">A Best Place To Stay. Reserve Now!</h2>
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
/* 20220319 목록으로 버튼 구현 SI */
	var pagingNum = ${pagingNum};

	console.log("돌아갈 페이지 번호 : ", pagingNum)
	
	function reserveList(){
		location.href = "./myReserve?num="+pagingNum;
	}	
/* 20220319 목록으로 버튼 구현 SI */


</script>

</html>