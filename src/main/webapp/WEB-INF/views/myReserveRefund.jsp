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
#list-reserve .table th {
	background-color: #f1ebd6;
	border-top: 1px solid #cdcbbe;
	border-bottom: 1px solid #cdcbbe;
	color: #633e12 !important;
	width: 20%;
}

#list-reserve .table tr {
	border-top: 1px solid #cdcbbe;
	border-bottom: 1px solid #cdcbbe;
}

/* 컨텐츠 - 예약 상세보기 영역 css END - SI 20220314 */

/* 안내문 CSS START */
.infom {
	font-size: 14px;
	font-family: Helvetica;
	padding-right: 10px !important;
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

						<a class="list-group-item list-group-item-action" id="list-home-list" href="./myPage">프로필</a>
						<a class="list-group-item list-group-item-action  active" id="list-profile-list" href="./myReserve?num=1">예약 조회</a>
						<a class="list-group-item list-group-item-action" id="list-messages-list" href="./tomemberboardlist?currpage=1">문의 글 & 답 글</a>
						<a class="list-group-item list-group-item-action" id="list-settings-list" href="./myPagemilelist?orderNum=1">마일리지 내역 조회</a>
						<a class="list-group-item list-group-item-action" id="list-settings-list" href="./myPagemyProfile">내 정보 조회</a>
						<a class="list-group-item list-group-item-action" id="list-settings-list" href="./myProfile">회원정보 수정</a>

					</div>
				</div>
				<!-- 마이페이지 세로 네비게이션 추가 END - SI 20220314 -->

				<!-- 환불 신청 START - SI 20220319 -->
				<!-- tabContent 있어야 발동함 -->
				<div class="col-md-10 tab-content" id="nav-tabContent" data-aos="fade-up" data-aos-duration="1000">
					<div class="tab-pane fade show active" id="list-reserve" role="tabpanel" aria-labelledby="list-reserve-list" style="max-width: 100% !important">
						<h4 style="color: #633e12;">환불 신청 하기 - ${reserve_num }</h4>
						<hr style="border-color: #633e12;" />

						<div class="col-md-12 infom" style="padding-left: 0px;">ⓘ 환불 신청할 객실을 마우스로 클릭하고 아래 '환불' 버튼을 누르세요.</div>
						<br>
	
						<!-- 첫 번째 객실 -->
						<c:if test="${firstSize ne 0 }">
							<!-- 만약 예약상태가 2(취소) 면 프론트 처리 -->
							<c:choose>
								<c:when test="${first[0].reserve_state eq 2 }">
									<!-- 체크박스 비활성 -->
									<div class="form-check icheck-sunflower" style="padding-left: 0px;">
										<span style="font-size: 20px; font-weight: 550; font-family: Helvetica; padding: 4px; color: #633e12; border-radius: 0.5rem;">객실 3</span>
										<input class="form-check-input" name = "test_check" type="checkbox" value=" ${first[0].reserve_idx }" id="defaultCheck1" style="margin-left: 0.5rem; zoom: 1.4; margin-bottom: 0.5rem;" disabled>
										<!-- <label class="form-check-label" for="defaultCheck1">
									Default checkbox
								  </label> -->
									</div>
									<span style="visible: none;">${first[0].reserve_idx }</span>
									<table class="table table-bordered" id="firstOff">
										<tbody>
											<tr>
												<th scope="row" style="background-color: lightgray; color: gray !important;">타입</th>
												<td style="text-decoration: line-through; color: gray !important;" colspan="3">

													<!-- 베드 타입 저장( 1-트윈 / 2-더블 )할 변수 생성 -->
													<c:if test="${first[0].bed_type eq 1 }">
														<c:set var="bed_type" value="트윈" />
													</c:if>
													<c:if test="${first[0].bed_type eq 2 }">
														<c:set var="bed_type" value="더블" />
													</c:if>
													<span>${first[0].room_type_name }룸(${bed_type })</span>

												</td>
											</tr>
											<tr>
												<th scope="row" style="background-color: lightgray; color: gray !important;">인원</th>
												<td style="text-decoration: line-through; color: gray !important;" colspan="3">${first[0].adult_cnt }</td>
											</tr>
											<tr>
												<th scope="row" style="background-color: lightgray; color: gray !important;">옵션</th>
												<td style="text-decoration: line-through; color: gray !important;" colspan="3">엑스트라베드 ${first[0].extrabed_cnt}, 조식 ${first.breakfast_cnt }</td>
											</tr>
											<tr>
												<th scope="row" style="background-color: lightgray; color: gray !important;">마일리지 상품</th>
												<td style="text-decoration: line-through; color: gray !important;" colspan="3">
													<c:forEach var="first" items="${first }" varStatus="stat">
														<c:if test="${stat.last eq true }">
															${first.product_name } ${first.product_cnt }
														</c:if>
														<c:if test="${stat.last eq false }">
															${first.product_name } ${first.product_cnt },
														</c:if>
													</c:forEach>
												</td>
											</tr>
											<tr>
												<th scope="row" style="background-color: lightgray; color: gray !important;">금액</th>
												<td class="amount1" id="negativeFirst" style="text-decoration: line-through; color: gray !important;" colspan="3">${first[0].amount }</td>
											</tr>
										</tbody>
									</table>
								</c:when>
								<c:when test="${first[0].reserve_state eq 1 }">
									<!-- 정상 예약 상태 // choose 문의 </when> <when> 사이엔 주석 넣으면 오류 -->
									<!-- 글자 + 체크박스 -->
									<div class="form-check icheck-sunflower" style="padding-left: 0px;">
										<span style="font-size: 20px; font-weight: 550; font-family: Helvetica; padding: 4px; color: #633e12; border-radius: 0.5rem;">객실 1</span>
										<input class="form-check-input firstOn" type="checkbox" value="" id="defaultCheck1" style="margin-left: 0.5rem; zoom: 1.4; margin-bottom: 0.5rem;">
										<!-- <label class="form-check-label" for="defaultCheck1">
										Default checkbox
									  </label> -->
									</div>
									<span style="display: none;" id="firstIdx">${first[0].reserve_idx }</span>
									<table id="firstTable" class="table table-bordered" style="border: 2px solid #f1ebd6;">
										<tbody>
											<tr>
												<th scope="row">타입</th>
												<td colspan="3">
													<!-- 베드 타입 저장( 1-트윈 / 2-더블 )할 변수 생성 -->
													<c:if test="${first[0].bed_type eq 1 }">
														<c:set var="bed_type" value="트윈" />
													</c:if>
													<c:if test="${first[0].bed_type eq 2 }">
														<c:set var="bed_type" value="더블" />
													</c:if>
													<span>${first[0].room_type_name }룸(${bed_type })</span>
												</td>
											</tr>
											<tr>
												<th scope="row">인원</th>
												<td colspan="3">${first[0].adult_cnt }</td>
											</tr>
											<tr>
												<th scope="row">옵션</th>
												<td colspan="3">엑스트라베드 ${first[0].extrabed_cnt}, 조식 ${first[0].breakfast_cnt }</td>
											</tr>
											<tr>
												<th scope="row">마일리지 상품</th>
												<td colspan="3">
													<c:forEach var="first" items="${first }" varStatus="stat">
														<c:if test="${stat.last eq true }">
															${first.product_name } ${first.product_cnt }
														</c:if>
														<c:if test="${stat.last eq false }">
															${first.product_name } ${first.product_cnt },
														</c:if>
													</c:forEach>
												</td>
											</tr>
											<tr>
												<th scope="row">금액</th>
												<td class="amount2" colspan="3"><fmt:formatNumber value="${first[0].amount }" pattern="#,### 원" /></td>
											</tr>
										</tbody>
									</table>
								</c:when>
							</c:choose>
						</c:if>

						<br />
						<!-- 두 번째 객실 -->
						<c:if test="${secondSize ne 0 }">
							<!-- 만약 예약상태가 2(취소) 면 프론트 처리 -->
							<c:choose>
								<c:when test="${second[0].reserve_state eq 2 }">
									<!-- 체크박스 비활성 -->
									<div class="form-check icheck-sunflower" style="padding-left: 0px;">
										<span style="font-size: 20px; font-weight: 550; font-family: Helvetica; padding: 4px; color: #633e12; border-radius: 0.5rem;">객실 3</span>
										<input class="form-check-input" type="checkbox" value="" id="defaultCheck1" style="margin-left: 0.5rem; zoom: 1.4; margin-bottom: 0.5rem;" disabled>
										<!-- <label class="form-check-label" for="defaultCheck1">
									Default checkbox
								  </label> -->
									</div>
									<span style="display: none;">${second[0].reserve_idx }</span>
									<table class="table table-bordered" id="secondOff">
										<tbody>
											<tr>
												<th scope="row" style="background-color: lightgray; color: gray !important;">타입</th>
												<td style="text-decoration: line-through; color: gray !important;" colspan="3">
													<!-- 베드 타입 저장( 1-트윈 / 2-더블 )할 변수 생성 -->
													<c:if test="${second[0].bed_type eq 1 }">
														<c:set var="bed_type" value="트윈" />
													</c:if>
													<c:if test="${second[0].bed_type eq 2 }">
														<c:set var="bed_type" value="더블" />
													</c:if>
													<span>${second[0].room_type_name }룸(${bed_type })</span>
												</td>
											</tr>
											<tr>
												<th scope="row" style="background-color: lightgray; color: gray !important;">인원</th>
												<td style="text-decoration: line-through; color: gray !important;" colspan="3">${second[0].adult_cnt }</td>
											</tr>
											<tr>
												<th scope="row" style="background-color: lightgray; color: gray !important;">옵션</th>
												<td style="text-decoration: line-through; color: gray !important;" colspan="3">엑스트라베드 ${second[0].extrabed_cnt}, 조식 ${second[0].breakfast_cnt }</td>
											</tr>
											<tr>
												<th scope="row" style="background-color: lightgray; color: gray !important;">마일리지 상품</th>
												<td style="text-decoration: line-through; color: gray !important;" colspan="3">
													<c:forEach var="second" items="${second }" varStatus="stat">
														<c:if test="${stat.last eq true }">
															${second.product_name } ${second.product_cnt }
														</c:if>
														<c:if test="${stat.last eq false }">
															${second.product_name } ${second.product_cnt },
														</c:if>
													</c:forEach>

												</td>
											</tr>
											<tr>
												<th scope="row" style="background-color: lightgray; color: gray !important;">금액</th>
												<td class="amount3" style="text-decoration: line-through; color: gray !important;" colspan="3" id="negativeSecond">${second[0].amount }</td>
											</tr>
										</tbody>
									</table>
								</c:when>
								<c:when test="${second[0].reserve_state eq 1 }">
									<!-- 정상 예약 상태 -->
									<!-- 글자 + 체크박스 -->
									<div class="form-check icheck-sunflower" style="padding-left: 0px;">
										<span style="font-size: 20px; font-weight: 550; font-family: Helvetica; padding: 4px; color: #633e12; border-radius: 0.5rem;">객실 2</span>
										<input class="form-check-input secondOn" type="checkbox" value="" id="defaultCheck1" style="margin-left: 0.5rem; zoom: 1.4; margin-bottom: 0.5rem;">
										<!-- <label class="form-check-label" for="defaultCheck1">
										Default checkbox
									  </label> -->
									</div>
									<span style="display: none;" id="secondIdx">${second[0].reserve_idx }</span>
									<table id="secondTable" class="table table-bordered" style="border: 2px solid #f1ebd6;">
										<tbody>
											<tr>
												<th scope="row">타입</th>
												<td colspan="3">
													<!-- 베드 타입 저장( 1-트윈 / 2-더블 )할 변수 생성 -->
													<c:if test="${second[0].bed_type eq 1 }">
														<c:set var="bed_type" value="트윈" />
													</c:if>
													<c:if test="${second[0].bed_type eq 2 }">
														<c:set var="bed_type" value="더블" />
													</c:if>
													<span>${second[0].room_type_name }룸(${bed_type })</span>
												</td>
											</tr>
											<tr>
												<th scope="row">인원</th>
												<td colspan="3">${second[0].adult_cnt }</td>
											</tr>
											<tr>
												<th scope="row">옵션</th>
												<td colspan="3">엑스트라베드 ${second[0].extrabed_cnt}, 조식 ${second[0].breakfast_cnt }</td>
											</tr>
											<tr>
												<th scope="row">마일리지 상품</th>
												<td colspan="3">
													<c:forEach var="second" items="${second }" varStatus="stat">
														<c:if test="${stat.last eq true }">
															${second.product_name } ${second.product_cnt }
														</c:if>
														<c:if test="${stat.last eq false }">
															${second.product_name } ${second.product_cnt },
														</c:if>
													</c:forEach>
												</td>
											</tr>
											<tr>
												<th scope="row">금액</th>
												<td class="amount4" colspan="3"><fmt:formatNumber value="${second[0].amount }" pattern="#,### 원" /></td>
											</tr>
										</tbody>
									</table>
								</c:when>
							</c:choose>
						</c:if>

						<br />
						<!-- 세 번째 객실 -->
						<c:if test="${thirdSize ne 0 }">
							<!-- 만약 예약상태가 2(취소) 면 프론트 처리 => 밑 한줄 더 내려가면 오류 -->
							<c:choose>
								<c:when test="${third[0].reserve_state eq 2 }">
									<!-- 체크박스 비활성 -->
									<div class="form-check icheck-sunflower" style="padding-left: 0px;">
										<span style="font-size: 20px; font-weight: 550; font-family: Helvetica; padding: 4px; color: #633e12; border-radius: 0.5rem;">객실 3</span>
										<input class="form-check-input" type="checkbox" value="" id="defaultCheck1" style="margin-left: 0.5rem; zoom: 1.4; margin-bottom: 0.5rem;" disabled>
										<!-- <label class="form-check-label" for="defaultCheck1">
									Default checkbox
								  </label> -->
									</div>
									<span style="display: none;">${third[0].reserve_idx }</span>
									<table class="table table-bordered" id="thirdOff">
										<tbody>
											<tr>
												<th scope="row" style="background-color: lightgray; color: gray !important;">타입</th>
												<td style="text-decoration: line-through; color: gray !important;" colspan="3">
													<!-- 베드 타입 저장( 1-트윈 / 2-더블 )할 변수 생성 -->
													<c:if test="${third[0].bed_type eq 1 }">
														<c:set var="bed_type" value="트윈" />
													</c:if>
													<c:if test="${third[0].bed_type eq 2 }">
														<c:set var="bed_type" value="더블" />
													</c:if>
													<span>${third[0].room_type_name }룸(${bed_type })</span>
												</td>
											</tr>
											<tr>
												<th scope="row" style="background-color: lightgray; color: gray !important;">인원</th>
												<td style="text-decoration: line-through; color: gray !important;" colspan="3">${third[0].adult_cnt }</td>
											</tr>
											<tr>
												<th scope="row" style="background-color: lightgray; color: gray !important;">옵션</th>
												<td style="text-decoration: line-through; color: gray !important;" colspan="3">엑스트라베드 ${third[0].extrabed_cnt}, 조식 ${third[0].breakfast_cnt }</td>
											</tr>
											<tr>
												<th scope="row" style="background-color: lightgray; color: gray !important;">마일리지 상품</th>
												<td style="text-decoration: line-through; color: gray !important;" colspan="3">
													<c:forEach var="third" items="${third }" varStatus="stat">
														<c:if test="${stat.last eq true }">
															${third.product_name } ${third.product_cnt }
														</c:if>
														<c:if test="${stat.last eq false }">
															${third.product_name } ${third.product_cnt },
														</c:if>
													</c:forEach>
												</td>
											</tr>
											<tr>
												<th scope="row" style="background-color: lightgray; color: gray !important;">금액</th>
												<td class="amount5" style="text-decoration: line-through; color: gray !important;" colspan="3" id="negativeThird">${third[0].amount }</td>
											</tr>
										</tbody>
									</table>
								</c:when>
								<c:when test="${third[0].reserve_state eq 1 }">
									<!-- 정상 예약 상태 -->
									<!-- 글자 + 체크박스 -->
									<div class="form-check icheck-sunflower" style="padding-left: 0px;">
										<span style="font-size: 20px; font-weight: 550; font-family: Helvetica; padding: 4px; color: #633e12; border-radius: 0.5rem;">객실 3</span>
										<input class="form-check-input thirdOn" type="checkbox" value="" id="defaultCheck1" style="margin-left: 0.5rem; zoom: 1.4; margin-bottom: 0.5rem;">
										<!-- <label class="form-check-label" for="defaultCheck1">
										Default checkbox
									  </label> -->
									</div>
									<span style="display: none;" id="thirdIdx">${third[0].reserve_idx }</span>
									<table id="thirdTable" class="table table-bordered" style="border: 2px solid #f1ebd6;">
										<tbody>
											<tr>
												<th scope="row">타입</th>
												<td colspan="3">
													<!-- 베드 타입 저장( 1-트윈 / 2-더블 )할 변수 생성 -->
													<c:if test="${third[0].bed_type eq 1 }">
														<c:set var="bed_type" value="트윈" />
													</c:if>
													<c:if test="${third[0].bed_type eq 2 }">
														<c:set var="bed_type" value="더블" />
													</c:if>
													<span>${third[0].room_type_name }룸(${bed_type })</span>
												</td>
											</tr>
											<tr>
												<th scope="row">인원</th>
												<td colspan="3">${third[0].adult_cnt }</td>
											</tr>
											<tr>
												<th scope="row">옵션</th>
												<td colspan="3">엑스트라베드 ${third[0].extrabed_cnt}, 조식 ${third[0].breakfast_cnt }</td>
											</tr>
											<tr>
												<th scope="row">마일리지 상품</th>
												<td colspan="3">
													<c:forEach var="third" items="${third }" varStatus="stat">
														<c:if test="${stat.last eq true }">
															${third.product_name } ${third.product_cnt }
														</c:if>
														<c:if test="${stat.last eq false }">
															${third.product_name } ${third.product_cnt },
														</c:if>
													</c:forEach>
												</td>
											</tr>
											<tr>
												<th scope="row">금액</th>
												<td class="amount6" colspan="3"><fmt:formatNumber value="${third[0].amount }" pattern="#,### 원" /></td>
											</tr>
										</tbody>
									</table>
								</c:when>
							</c:choose>
						</c:if>



					</div>
					
					<!-- 환불 안내 -->
					<div style="text-align: left; font-size:12px; color:gray;">
					ⓘ 환불규정 <br/>
						예약일 7일 전 취소시 100% 환불 / 7일 이내 50% 환불 / 당일(00시 기준) 취소 시 환불 불가( 현금 선 차감 ) <br/>
						* 사용한 마일리지는 전액 회수 불가능합니다
					</div>
					
					<!-- 환불 보내기 -->
					<div style="text-align: right;">
						<input type="button" class="btn btn-outline-warning focu" style="color: #633e12; border-color: #633e12;" onclick="refund()" value="환불">
						<!-- 20220319 취소는 뒤로가기와 같음 SI -->
						<input type="button" class="btn btn-outline-warning focu" style="color: #633e12; border-color: #633e12;" onclick="window.history.back()" value="취소">
					</div>
				</div>
				<!-- 예약조회 END - SI 20220314 -->



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
	// 방 상태 가져오기
	var firstRoom = "${first[0].reserve_state}"
	var secondRoom = "${second[0].reserve_state}"
	var thirdRoom = "${third[0].reserve_state}";

	console.log(firstRoom, secondRoom, thirdRoom);

	// 방 예약 상태가 1인 것들의 개수를 세서 저장해놓고
	var rooms = [firstRoom, secondRoom, thirdRoom];
	let roomsCount = rooms.reduce((cnt, element) => cnt + ('1' === element), 0);
	console.log(roomsCount);
	
	// 환불 신청할 때 해당 개수와 비교해준다( 개수가 같으면 예약완전취소고, 다르면 부분취소다 )
		
	
	
	
// 20220319 환불할 때 사용할 배열 초기화( 환불할 idx 들어감 )
	var refundIdx = [];		// idx


/* 20220319 환불 신청할 수 있게 체크박스 클릭 이벤트 => Off 클래스는 클릭 안됨 SI */
	$('.firstOn').on('mouseover', function(){	// 첫 번째 테이블
		$(this).css({'cursor':'pointer'});
	});
	
	$('.firstOn').on('click', function(){
		var flag = $(this).css('opacity');	// 현재 선택 상태인지 아닌지 확인하는 변수
		
		if(flag == 1){						// 선택이 아니라면( opacity가 1인 상태 )
			$(this).css({'background-color':'#f7f3e7','opacity':'0.9','border':'2px solid #633e12'});
			$('#firstTable').css({'background-color':'#f7f3e7','opacity':'0.9','border':'2px solid #633e12'});	
		
			// 환불 배열에 idx번호 push
			refundIdx.push($('#firstIdx').text());
			console.log(refundIdx);
			
		}else{								// 선택이 됐다면( opacity가 0.6인 상태 )
			$(this).css({'background-color':'white','opacity':'1','border':'2px solid #f1ebd6'});
			$('#firstTable').css({'background-color':'white','opacity':'1','border':'2px solid #f1ebd6'});
		
			// 환불 배열에서 idx 제거
			refundIdx = refundIdx.filter((element) => element !== $('#firstIdx').text());
			console.log(refundIdx);
		}
		
	});
	
	$('.secondOn').on('mouseover', function(){	// 두 번째 테이블
		$(this).css({'cursor':'pointer'});
	});
	
	$('.secondOn').on('click', function(){
		var flag = $(this).css('opacity');
		//console.log(flag);
		if(flag == 1){
			$(this).css({'background-color':'#f7f3e7','opacity':'0.9','border':'2px solid #633e12'});
			$('#secondTable').css({'background-color':'#f7f3e7','opacity':'0.9','border':'2px solid #633e12'});	
			
			// 환불 배열에 idx번호 push
			refundIdx.push($('#secondIdx').text());
			console.log(refundIdx);
			
		}else{
			$(this).css({'background-color':'white','opacity':'1','border':'2px solid #f1ebd6'});
			$('#secondTable').css({'background-color':'white','opacity':'1','border':'2px solid #f1ebd6'});
			
			// 환불 배열에서 idx 제거
			refundIdx = refundIdx.filter((element) => element !== $('#secondIdx').text());
			console.log(refundIdx);
		}
		
	});
	
	$('.thirdOn').on('mouseover', function(){	// 세 번째 테이블
		$(this).css({'cursor':'pointer'});
	});
	
	$('.thirdOn').on('click', function(){
		var flag = $(this).css('opacity');
		//console.log(flag);
		if(flag == 1){
			$(this).css({'background-color':'#f7f3e7','opacity':'0.9','border':'2px solid #633e12'});
			$('#thirdTable').css({'background-color':'#f7f3e7','opacity':'0.9','border':'2px solid #633e12'});	
			
			// 환불 배열에 idx번호 push
			refundIdx.push($('#thirdIdx').text());
			console.log(refundIdx);
			
		}else{
			$(this).css({'background-color':'white','opacity':'1','border':'2px solid #f1ebd6'});
			$('#thirdTable').css({'background-color':'white','opacity':'1','border':'2px solid #f1ebd6'});
			
			// 환불 배열에서 idx 제거
			refundIdx = refundIdx.filter((element) => element !== $('#thirdIdx').text());
			console.log(refundIdx);
		}
		
	});
/* 20220319 환불 신청할 수 있게 체크박스 클릭 이벤트 SI */
	
	
	
	
	
	
/* 20220319 환불  */
	function refund(){
		console.log(refundIdx);	// 환불할 예약idx가 담긴 배열
		
	// 1. ( 체크인날짜 - 오늘날짜 ) 계산( 9시 기준 )
		// 체크인 날짜 구하기
		var checkInDate = new Date("${first[0].checkindate}");
		console.log(checkInDate);
		// 오늘 날짜 구하기
		//var toDate = new Date();				// 실제로는 이걸로 해야함!!!!
		var toDate = new Date("2022-03-13");	// 테스트 데이터를 위한 날짜
		console.log(toDate);
		// 차이 구하기
		var dateGap = Math.ceil((checkInDate-toDate)/(1000*3600*24));
		console.log(dateGap);
		
		
		// 2. 환불 여부 판단 & 환불 금액 계산
		var refundPrice = 0;	// 최종 환불액
		
		// 가격정보가 있는것만 저장하려고 했는데 3번째 방이 없다면 정보 자체가 뜨지 않아서 실패
		/* 
		// n번째 예약 정보가 있다면 price 저장
		if(${first[0].pay_price} != null){
			var firstPrice = ${first[0].pay_price};
		}
		if(${second[0].pay_price} != null){
			var secondPrice = ${second[0].pay_price};
		}
		if(${third}){
			var thirdPrice = 0;
		}
		
		// price가 있다면 마일리지와 더해주기
		if(firstPrice > 0){
			firstPrice = 0 + ${first[0].pay_price} + ${first[0].pay_mileage};		// 첫 번째 방의 총 가격( 마일리지 선차감 같은 문제는 service에서 처리)
		}else if(secondPrice > 0){
			secondPrice = 0 + ${second[0].pay_price} + ${second[0].pay_mileage};	// 두 번째
		}else if(thirdPrice > 0){
			thirdPrice = 0 + ${third[0].pay_price} + ${third[0].pay_mileage};		// 세 번째		
		}	
		 */
		
		var firstPrice = ${first[0].pay_price}+0;
		var firstAmount = ${first[0].pay_mileage}+firstPrice;
		
		var secondPrice = ${second[0].pay_price}+0;
		var secondAmount = ${second[0].pay_mileage}+secondPrice;
		
		var thirdPrice = ${third[0].pay_price}+0;
		var thirdAmount = ${third[0].pay_mileage}+thirdPrice;
		 
		// 체크박스 선택한 객실정보를 찾아서 날짜에 따라 환불가격을 책정
		if(dateGap >= 7){							// 7일보다 전
			for(var i=0; i<refundIdx.length; i++){		// 100% 환불
				if(refundIdx[i] == "${first[0].reserve_idx}"){
					//console.log("환불할 예약순번 : ", refundIdx[i]);
					refundPrice = firstAmount + refundPrice;
					console.log(refundPrice);
				}else if(refundIdx[i] == "${second[0].reserve_idx}"){
					refundPrice = secondAmount + refundPrice;
					console.log(refundPrice);
				}else if(refundIdx[i] == "${third[0].reserve_idx}"){
					refundPrice = thirdAmount + refundPrice;
					console.log(refundPrice);
				}
			}
		}else if(dateGap >= 1 && dateGap < 7){		// 1일 ~ 7일 전
			for(var i=0; i<refundIdx.length; i++) {		//50%환불
				if(refundIdx[i] == "${first[0].reserve_idx}"){
					//console.log("환불할 예약순번 : ", refundIdx[i]);
					refundPrice = (firstAmount * 0.5) + refundPrice;
					console.log(refundPrice);
				}else if(refundIdx[i] == "${second[0].reserve_idx}"){
					refundPrice = (secondAmount * 0.5) + refundPrice;
					console.log(refundPrice);
				}else if(refundIdx[i] == "${third[0].reserve_idx}"){
					refundPrice = (thirdAmount * 0.5) + refundPrice;
					console.log(refundPrice);
				}
			}
		}else{										// 당일이거나 지난 예약
			//환불금액 0
		}
		
	// 3. 환불 금액 확인 & 환불 진행( 환불가 : refundPrice / 환불순번 : refundIdx(배열) )
	if(refundPrice > 0){
		if(refundIdx.length > 0){
			confirm(amountComma(refundPrice) + '원 환불이 가능합니다. 정말 환불하시겠습니까?');
			// 배열 쪼개기 => 예약순번
			var param1 = refundIdx[0];
			var param2 = refundIdx[1];
			var param3 = refundIdx[2];
			console.log(param1, param2, param3);
						
			if(roomsCount == refundIdx.length){
				// 완전 취소
				location.href="./reFund?reserve_idx1="+param1+"&reserve_idx2="+param2+"&reserve_idx3="+param3+"&refundCategory="+3;
			}else{
				// 부분취소
				location.href="./reFund?reserve_idx1="+param1+"&reserve_idx2="+param2+"&reserve_idx3="+param3+"&refundCategory="+2;
			}
		}else{
			// 환불 실패
			alert('객실을 선택해주셔야 환불진행이 가능합니다.');
		}
	}else{
		// 환불 실패
		alert('이미 환불 가능 기간이 지난 예약입니다.');
	}
}
/* 20220319 환불  */
		
	
/* 20220319 총액 음수 값 양수로 변환 SI */
	changePositive();
	
	function changePositive(){
		//console.log($('#negativeFirst').text());
		var nega1 = $('#negativeFirst').text();
		var nega2 = $('#negativeSecond').text();
		var nega3 = $('#negativeThird').text();
		
		// 음수를 양수로 변환
		nega1 = Math.abs(nega1);
		nega2 = Math.abs(nega2);
		nega3 = Math.abs(nega3);
		
		$('#negativeFirst').text(nega1);
		$('#negativeSecond').text(nega2);
		$('#negativeThird').text(nega3);
	}
/* 20220319 총액 음수 값 양수로 변환 SI */	

/* 20220319 금액 콤마 찍기 => front에서만, 실제 환불 금액 계산은 DB 데이터로 한다. SI */
	$('.amount1').text(amountComma($('.amount1').text()));
	$('.amount2').text(amountComma($('.amount2').text()));
	$('.amount3').text(amountComma($('.amount3').text()));
	$('.amount4').text(amountComma($('.amount4').text()));
	$('.amount5').text(amountComma($('.amount5').text()));
	$('.amount6').text(amountComma($('.amount6').text()));

	// 변환 함수
	function amountComma(price){
		var comma = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		
		return comma;
	}
/* 20220319 금액 콤마 찍기 SI */
/*  
function checkboxArr() {
    var checkArr = [];     //  배열 초기화
    $("input[name='test_check']:checked").each(function(i)) {
        checkArr.push($(this).val());     // 체크된 것만 값을 뽑아서 배열에 push
    }
 
    $.ajax({
        url: 'test_check'
        , type: 'post'
        , dataType: 'text'
        , data: {
            valueArrTest: checkArr
        }
    });
} */
</script>

</html>












