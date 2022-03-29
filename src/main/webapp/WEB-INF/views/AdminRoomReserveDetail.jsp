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
	background-color: #98cade !important;
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

/* 컨텐츠 - 예약 조회 영역 css START - SI 20220314 */
#list-reserve .table th {
	background-color: #98cade;
	border-top: 1px solid #cdcbbe;
	border-bottom: 1px solid #cdcbbe;
	color: #633e12 !important;
}

#list-reserve .table tr {
	border-top: 1px solid #cdcbbe;
	border-bottom: 1px solid #cdcbbe;
}
/* 컨텐츠 - 예약 조회 영역 css END - SI 20220314 */

/* 20220317 페이징 영역 SI */
.custom-pagination ul li.active span {
	background: #633e12 !important;
	color: #fff !important;
	border-radius: 50% !important;
}

.focu:hover {
	background-color: #633e12 !important;
	color: white !important;
}
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

						<a class="list-group-item list-group-item-action" id="list-home-list" href="#">회원 정보 리스트</a>
						<a class="list-group-item list-group-item-action" id="list-profile-list" href="./myReserveAdmin?num=1&mem_id=seon119">객실 예약 정보 리스트</a>
						<a class="list-group-item list-group-item-action active" id="list-profile-list" href="./AdminRoomReserveDetail">객실 상세 임시 ~ </a>
						<a class="list-group-item list-group-item-action" id="list-messages-list" href="./AdminQnalist">회원 문의 관리</a>
						<a class="list-group-item list-group-item-action" id="list-settings-list" href="./adminOrderList">마일리지 상품 관리</a>

					</div>
				</div>
				<!-- 마이페이지 세로 네비게이션 추가 END - SI 20220314 -->



				<!-- 예약 상세보기(관리자) START - SI 20220325 -->
				<!-- 예약 상세보기 페이지 가로 네비게이션 START -->
				<div class="col-md-10 tab-content" id="nav-tabContent" data-aos="fade-up" data-aos-duration="1000">
					<div class="tab-pane fade show active" id="list-reserve" role="tabpanel" aria-labelledby="list-reserve-list" style="max-width: 100% !important">

						<h4 style="color: #633e12;">예약 상세보기 - ${result.reserve_num }</h4>
						<hr style="border-color: #633e12;" />

						<nav>
							<div class="nav nav-tabs" id="nav-tab" role="tablist" style="text-align: center;">
								<!-- 해당 예약번호의 room수에 따라 상단 네비게이션 메뉴 분기 -->
								<c:if test="${roomCnt eq 1 }">
									<a class="col-md-12 nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">${room[0].room_num } 호실</a>
								</c:if>
								<c:if test="${roomCnt eq 2}">
									<a class="col-md-6 nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">${room[0].room_num } 호실</a>
									<a class="col-md-6 nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">${room[1].room_num } 호실</a>
								</c:if>
								<c:if test="${roomCnt eq 3 }">
									<a class="col-md-4 nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">${room[0].room_num } 호실</a>
									<a class="col-md-4 nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">${room[1].room_num } 호실</a>
									<a class="col-md-4 nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">${room[2].room_num } 호실</a>
								</c:if>
							</div>
						</nav>
						<!-- 예약 상세보기 페이지 가로 네비게이션 END -->

						<!-- 예약 상세보기 컨텐츠 START : 첫 번째, 두 번째, 세 번째 방 모두 만들어 놓고 네비게이션의 방 개수에 따라 다르게 출력 -->
						<div class="tab-content" id="nav-tabContent">
							
							
							
							
							<!-- 첫 번째 방 -->
							<div class="tab-pane fade show active border-bottom border-left border-right" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab" style="padding: 0 5% 0 5%;">
								<br /> <br />

								<!-- row 1 - 예약 상태 / 체크인 / 체크아웃 -->
								<div class="row">
									<div class="col-md-4 form-group">
										<label class="text-black font-weight-bold" for="phone">예약 상태</label>
										<c:if test="${first[0].reserve_state eq 1 }">
											<input type="text" id="phone" class="form-control" value="예약완료" readonly>
										</c:if>
										<c:if test="${first[0].reserve_state eq 2 }">
											<input style="background-color: pink" type="text" id="phone" class="form-control" value="예약취소" readonly>
										</c:if>
									</div>
									<div class="col-md-4 form-group">
										<label class="text-black font-weight-bold" for="checkin_date">체크인</label>
										<input type="text" id="name" class="form-control" value="${result.checkindate }" readonly>
									</div>
									<div class="col-md-4 form-group">
										<label class="text-black font-weight-bold" for="checkout_date">체크아웃</label>
										<input type="text" id="name" class="form-control" value="${result.checkoutdate }" readonly>
									</div>
								</div>


								<!-- row 2 - 인원수 / 고객이름 / 이메일 -->
								<div class="row">
									<div class="col-md-4 form-group">
										<label class="text-black font-weight-bold" for="name">인원 수</label>
										<input type="text" id="name" class="form-control " value="${first[0].adult_cnt }" readonly>
									</div>
									<div class="col-md-4 form-group">
										<label class="text-black font-weight-bold" for="phone">예약자 이름</label>
										<a href="#">
											<input type="text" id="phone" class="form-control" value="${result.reserve_name }" readonly>
										</a>
									</div>
									<div class="col-md-4 form-group">
										<label class="text-black font-weight-bold" for="phone">고객 이메일</label>
										<input type="text" id="phone" class="form-control" value="${result.reserve_email }" readonly>
									</div>
								</div>


								<!-- row 3 - 엑스트라베드 / 조식 / 객실,침대 타입 -->
								<div class="row">

									<div class="col-md-4 form-group">
										<label class="text-black font-weight-bold" for="name">엑스트라 베드 수량</label>
										<input type="text" id="name" class="form-control" value="${first[0].extrabed_cnt }" readonly>
									</div>
									<div class="col-md-4 form-group">
										<label class="text-black font-weight-bold" for="phone">조식 수량</label>
										<input type="text" id="phone" class="form-control" value="${first[0].breakfast_cnt }" readonly>
									</div>
									<div class="col-md-4 form-group">
										<label class="text-black font-weight-bold" for="phone">객실(침대) 타입</label>

										<!-- 베드 타입 저장( 1-트윈 / 2-더블 )할 변수 생성 -->
										<c:if test="${first[0].bed_type eq 1 }">
											<c:set var="bed_type" value="트윈" />
										</c:if>
										<c:if test="${first[0].bed_type eq 2 }">
											<c:set var="bed_type" value="더블" />
										</c:if>
										<input type="text" id="phone" class="form-control" value="${first[0].room_type_name }(${bed_type })" readonly>
									</div>
								</div>

								<!-- row 4 - 예약상태(첫 줄로) / 마일리지 상품 총액(폐기) -->
								<!-- <div class="row">
								</div> -->

								<!-- row 5 - 카드 사용 금액 / 마일리지 사용 금액 / 총 금액 -->
								<div class="row">
									<div class="col-md-4 form-group">
										<label class="text-black font-weight-bold" for="name">카드 사용 금액</label>
										
										<span id="name" class="form-control"><fmt:formatNumber value="${first[0].pay_price }" pattern="#,### 원" /></span>
									</div>
									<div class="col-md-4 form-group">
										<label class="text-black font-weight-bold" for="phone">마일리지 사용 금액</label>
										
										<span id="name" class="form-control"><fmt:formatNumber value="${first[0].pay_mileage }" pattern="#,###" /></span>
									</div>
									<div class="col-md-4 form-group">
										<label class="text-black font-weight-bold" for="phone">총 가격</label>
										
										<span id="name" class="form-control"><fmt:formatNumber value="${first[0].amount }" pattern="#,### 원" /></span>
										
									</div>
								</div>

								<!-- row 6 - 추가 요청 사항 -->
								<div class="row mb-4">
									<div class="col-md-12 form-group">
										<label class="text-black font-weight-bold" for="message">추가 요청 사항</label>
										<textarea name="message" id="message" class="form-control " readonly cols="30" rows="8"></textarea>
									</div>
								</div>

								<hr />
								<br />

								<!-- row 7 - 마일리지 상품 -->
								<div class="row">
									<c:if test="${first[0].product_num ne null }">
										<c:forEach var="first" items="${first}" varStatus="stat">
											<div class="col-md-3 col-lg-3 aos-init aos-animate" style="text-align: center;">
												<img class="img" src="resources/mileage/${first.product_img}.png" alt="상품이미지" style="width: 150px; height: 120px; text-align: center;" />
												<p style="color: black; text-align: center;">${first.product_name}</p>
												<p style="color: black; text-align: center;">${first.product_cnt } 개</p>
												<p style="color: black; text-align: center;">${first.product_price}마일리지</p>
												<input type="hidden" value="${first.product_num}" name="product${stat.count}" />
												<input type="hidden" value="${first.product_price}" />

												<br />
											</div>
											
										</c:forEach>
									</c:if>
									<c:if test="${first[0].product_num eq null }">
										<span style="margin-bottom: 10px;">구매한 마일리지 상품이 없습니다.</span>
									</c:if>
								</div>
							</div>
							<!-- 첫 번째 방 END -->






							<!-- 두 번째 방 -->
							<div class="tab-pane fade border-bottom border-left border-right" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab" style="padding: 0 5% 0 5%;">
								<br /> <br />

								<!-- row 1 - 예약 상태 / 체크인 / 체크아웃 -->
								<div class="row">
									<div class="col-md-4 form-group">
										<label class="text-black font-weight-bold" for="phone">예약 상태</label>
										<c:if test="${second[0].reserve_state eq 1 }">
											<input type="text" id="phone" class="form-control" value="예약완료" readonly>
										</c:if>
										<c:if test="${second[0].reserve_state eq 2 }">
											<input style="background-color: pink" type="text" id="phone" class="form-control" value="예약취소" readonly>
										</c:if>
									</div>
									<div class="col-md-4 form-group">
										<label class="text-black font-weight-bold" for="checkin_date">체크인</label>
										<input type="text" id="name" class="form-control" value="${result.checkindate }" readonly>
									</div>
									<div class="col-md-4 form-group">
										<label class="text-black font-weight-bold" for="checkout_date">체크아웃</label>
										<input type="text" id="name" class="form-control" value="${result.checkoutdate }" readonly>
									</div>
								</div>


								<!-- row 2 - 인원수 / 고객이름 / 이메일 -->
								<div class="row">
									<div class="col-md-4 form-group">
										<label class="text-black font-weight-bold" for="name">인원 수</label>
										<input type="text" id="name" class="form-control " value="${second[0].adult_cnt }" readonly>
									</div>
									<div class="col-md-4 form-group">
										<label class="text-black font-weight-bold" for="phone">예약자 이름</label>
										<a href="#">
											<input type="text" id="phone" class="form-control" value="${result.reserve_name }" readonly>
										</a>
									</div>
									<div class="col-md-4 form-group">
										<label class="text-black font-weight-bold" for="phone">고객 이메일</label>
										<input type="text" id="phone" class="form-control" value="${result.reserve_email }" readonly>
									</div>
								</div>


								<!-- row 3 - 엑스트라베드 / 조식 / 객실,침대 타입 -->
								<div class="row">

									<div class="col-md-4 form-group">
										<label class="text-black font-weight-bold" for="name">엑스트라 베드 수량</label>
										<input type="text" id="name" class="form-control" value="${second[0].extrabed_cnt }" readonly>
									</div>
									<div class="col-md-4 form-group">
										<label class="text-black font-weight-bold" for="phone">조식 수량</label>
										<input type="text" id="phone" class="form-control" value="${second[0].breakfast_cnt }" readonly>
									</div>
									<div class="col-md-4 form-group">
										<label class="text-black font-weight-bold" for="phone">객실(침대) 타입</label>

										<!-- 베드 타입 저장( 1-트윈 / 2-더블 )할 변수 생성 -->
										<c:if test="${second[0].bed_type eq 1 }">
											<c:set var="bed_type" value="트윈" />
										</c:if>
										<c:if test="${second[0].bed_type eq 2 }">
											<c:set var="bed_type" value="더블" />
										</c:if>
										<input type="text" id="phone" class="form-control" value="${second[0].room_type_name }(${bed_type })" readonly>
									</div>
								</div>

								<!-- row 4 - 예약상태(첫 줄로) / 마일리지 상품 총액(폐기) -->
								<!-- <div class="row">
								</div> -->

								<!-- row 5 - 카드 사용 금액 / 마일리지 사용 금액 / 총 금액 -->
								<div class="row">
									<div class="col-md-4 form-group">
										<label class="text-black font-weight-bold" for="name">카드 사용 금액</label>
										
										<span id="name" class="form-control"><fmt:formatNumber value="${second[0].pay_price }" pattern="#,### 원" /></span>
									</div>
									<div class="col-md-4 form-group">
										<label class="text-black font-weight-bold" for="phone">마일리지 사용 금액</label>
										
										<span id="name" class="form-control"><fmt:formatNumber value="${second[0].pay_mileage }" pattern="#,### " /></span>
										
									</div>
									<div class="col-md-4 form-group">
										<label class="text-black font-weight-bold" for="phone">총 가격</label>
									
										<span id="name" class="form-control"><fmt:formatNumber value="${second[0].amount }" pattern="#,### 원" /></span>
									</div>
								</div>

								<!-- row 6 - 추가 요청 사항 -->
								<div class="row mb-4">
									<div class="col-md-12 form-group">
										<label class="text-black font-weight-bold" for="message">추가 요청 사항</label>
										<textarea name="message" id="message" class="form-control " readonly cols="30" rows="8"></textarea>
									</div>
								</div>

								<hr />
								<br />

								<!-- row 7 - 마일리지 상품 -->
								<div class="row">
									<c:if test="${second[0].product_num ne null }">
										<c:forEach var="second" items="${second}" varStatus="stat">
											<div class="col-md-3 col-lg-3 aos-init aos-animate" style="text-align: center;">
												<img class="img" src="resources/mileage/${second.product_img}.png" alt="상품이미지" style="width: 150px; height: 120px;" />
												<p style="color: black;">${second.product_name}</p>
												<p style="color: black;">${second.product_cnt } 개</p>
												<p style="color: black;">${second.product_price}마일리지</p>
												<input type="hidden" value="${second.product_num}" name="product${stat.count}" />
												<input type="hidden" value="${second.product_price}" />

												<br />
											</div>
										</c:forEach>
									</c:if>
									<c:if test="${second[0].product_num eq null }">
										<span style="margin-bottom: 10px;">구매한 마일리지 상품이 없습니다.</span>
									</c:if>
								</div>
							</div>
							<!-- 두 번째 방 END -->





							<!-- 세 번째 방 -->
							<div class="tab-pane fade border-bottom border-left border-right" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab" style="padding: 0 5% 0 5%;">
								<br /> <br />

								<!-- row 1 - 예약 상태 / 체크인 / 체크아웃 -->
								<div class="row">
									<div class="col-md-4 form-group">
										<label class="text-black font-weight-bold" for="phone">예약 상태</label>
										<c:if test="${third[0].reserve_state eq 1 }">
											<input type="text" id="phone" class="form-control" value="예약완료" readonly>
										</c:if>
										<c:if test="${third[0].reserve_state eq 2 }">
											<input style="background-color: pink" type="text" id="phone" class="form-control" value="예약취소" readonly>
										</c:if>
									</div>
									<div class="col-md-4 form-group">
										<label class="text-black font-weight-bold" for="checkin_date">체크인</label>
										<input type="text" id="name" class="form-control" value="${result.checkindate }" readonly>
									</div>
									<div class="col-md-4 form-group">
										<label class="text-black font-weight-bold" for="checkout_date">체크아웃</label>
										<input type="text" id="name" class="form-control" value="${result.checkoutdate }" readonly>
									</div>
								</div>


								<!-- row 2 - 인원수 / 고객이름 / 이메일 -->
								<div class="row">
									<div class="col-md-4 form-group">
										<label class="text-black font-weight-bold" for="name">인원 수</label>
										<input type="text" id="name" class="form-control " value="${third[0].adult_cnt }" readonly>
									</div>
									<div class="col-md-4 form-group">
										<label class="text-black font-weight-bold" for="phone">예약자 이름</label>
										<a href="#">
											<input type="text" id="phone" class="form-control" value="${result.reserve_name }" readonly>
										</a>
									</div>
									<div class="col-md-4 form-group">
										<label class="text-black font-weight-bold" for="phone">고객 이메일</label>
										<input type="text" id="phone" class="form-control" value="${result.reserve_email }" readonly>
									</div>
								</div>


								<!-- row 3 - 엑스트라베드 / 조식 / 객실,침대 타입 -->
								<div class="row">

									<div class="col-md-4 form-group">
										<label class="text-black font-weight-bold" for="name">엑스트라 베드 수량</label>
										<input type="text" id="name" class="form-control" value="${third[0].extrabed_cnt }" readonly>
									</div>
									<div class="col-md-4 form-group">
										<label class="text-black font-weight-bold" for="phone">조식 수량</label>
										<input type="text" id="phone" class="form-control" value="${third[0].breakfast_cnt }" readonly>
									</div>
									<div class="col-md-4 form-group">
										<label class="text-black font-weight-bold" for="phone">객실(침대) 타입</label>

										<!-- 베드 타입 저장( 1-트윈 / 2-더블 )할 변수 생성 -->
										<c:if test="${third[0].bed_type eq 1 }">
											<c:set var="bed_type" value="트윈" />
										</c:if>
										<c:if test="${third[0].bed_type eq 2 }">
											<c:set var="bed_type" value="더블" />
										</c:if>
										<input type="text" id="phone" class="form-control" value="${third[0].room_type_name }(${bed_type })" readonly>
									</div>
								</div>

								<!-- row 4 - 예약상태(첫 줄로) / 마일리지 상품 총액(폐기) -->
								<!-- <div class="row">
								</div> -->

								<!-- row 5 - 카드 사용 금액 / 마일리지 사용 금액 / 총 금액 -->
								<div class="row">
									<div class="col-md-4 form-group">
										<label class="text-black font-weight-bold" for="name">카드 사용 금액</label>
										<%-- <input type="text" id="name" class="form-control" value="${third[0].pay_price }" readonly> --%>
										<span id="name" class="form-control"><fmt:formatNumber value="${third[0].pay_price }" pattern="#,### 원" /></span>
									</div>
									<div class="col-md-4 form-group">
										<label class="text-black font-weight-bold" for="phone">마일리지 사용 금액</label>
										<input type="text" id="phone" class="form-control" value="${third[0].pay_mileage }" readonly>
									</div>
									<div class="col-md-4 form-group">
										<label class="text-black font-weight-bold" for="phone">총 가격</label>
										<input type="text" id="phone" class="form-control" value="${third[0].amount }" readonly>
									</div>
								</div>

								<!-- row 6 - 추가 요청 사항 -->
								<div class="row mb-4">
									<div class="col-md-12 form-group">
										<label class="text-black font-weight-bold" for="message">추가 요청 사항</label>
										<textarea name="message" id="message" class="form-control " readonly cols="30" rows="8"></textarea>
									</div>
								</div>

								<hr />
								<br />

								<!-- row 7 - 마일리지 상품 -->
								<div class="row">
									<c:if test="${third[0].product_num ne null }">
										<c:forEach var="third" items="${third}" varStatus="stat">
											<div class="col-md-3 col-lg-3 aos-init aos-animate" style="text-align: center;">
												<img class="img" src="resources/mileage/${third.product_img}.png" alt="상품이미지" style="width: 150px; height: 120px;" />
												<p style="color: black;">${third.product_name}</p>
												<p style="color: black;">${third.product_cnt } 개</p>
												<p style="color: black;">${third.product_price}마일리지</p>
												<input type="hidden" value="${third.product_num}" name="product${stat.count}" />
												<input type="hidden" value="${third.product_price}" />

												<br />
											</div>
										</c:forEach>
									</c:if>
									<c:if test="${third[0].product_num eq null }">
										<span style="margin-bottom: 10px;">구매한 마일리지 상품이 없습니다.</span>
									</c:if>
								</div>

							</div>
						</div>




						<hr style="border-color: #633e12;" />

						<div style="text-align: right;">
							<input type="button" class="btn btn-outline-warning focu" style="color: #633e12; border-color: #633e12;" onclick="refund()" value="예약취소">
							<!-- 20220319 취소는 뒤로가기와 같음 SI -->
							<input type="button" class="btn btn-outline-warning focu" style="color: #633e12; border-color: #633e12;" onclick="window.history.back()" value="일정으로">
						</div>

					</div>
				</div>
				<!-- 예약 상세보기(관리자) SI - 20220325 -->









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


	/* 올해 년도 계산해서 이용실적 앞에 적어주기 START - SI 20220314 */
	var d = new Date();

	var year = d.getFullYear();

	$(document).ready(function() {
		$('#useFrequency').html(year + "년 이용실적");
		$('#useFrequency').css({
			'color' : '#633e12'
		});
	});
	/* 올해 년도 계산해서 이용실적 앞에 적어주기 END - SI 20220314 */
</script>

</html>