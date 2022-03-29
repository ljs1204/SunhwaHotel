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

/* 컨텐츠 - 프로필 영역 css START - SI 20220314 */
	
    #list-home .table{
       width: 100%;
       height: auto;
       text-align: center;
       color: #333333;
    }
    #list-home th, #list-home td{
       width: 10%;
    }
/* 컨텐츠 - 프로필 영역 css END - SI 20220314 */

/* 컨텐츠 - 예약 조회 영역 css START - SI 20220314 => 페이지 분리 */
	/* 
	#list-reserve .table th{
		background-color: #f1ebd6;
		border-top: 1px solid #cdcbbe;
		border-bottom: 1px solid #cdcbbe;
		color: #633e12 !important;
	}
	#list-reserve .table tr{
		border-top: 1px solid #cdcbbe;
		border-bottom: 1px solid #cdcbbe;
	}
	 */
/* 컨텐츠 - 예약 조회 영역 css END - SI 20220314 */	


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
 						
 						<c:choose>
							<c:when test="${memgrade eq 'admin' }">
								<a class="list-group-item list-group-item-action active" id="list-home-list" href="./memlist?currpage=1">회원 정보 리스트</a>
								<a class="list-group-item list-group-item-action" id="list-profile-list" href="./AdminReserveList">객실 예약 정보 리스트</a>
								<a class="list-group-item list-group-item-action" id="list-mescsages-list" href="./AdminQnalist?orderNum=1">회원 문의 관리</a>
								<a class="list-group-item list-group-item-action" id="list-settings-list" href="./adminOrderList">마일리지 상품 관리</a>
							</c:when>							
							<c:otherwise>
							<a class="list-group-item list-group-item-action" id="list-home-list" href="./myPage">프로필</a>
							<a class="list-group-item list-group-item-action" id="list-profile-list" href="./myReserve?num=1">예약 조회</a>
							<a class="list-group-item list-group-item-action" id="list-messages-list" href="./tomemberboardlist?currpage=1">문의 글 & 답 글</a>
							<a class="list-group-item list-group-item-action  active" id="list-settings-list" href="./myPagemilelist?orderNum=1">마일리지 내역 조회</a>
							<a class="list-group-item list-group-item-action" id="list-settings-list" href="./myPagemyProfile">내 정보 조회</a>
							<a class="list-group-item list-group-item-action" id="list-settings-list" href="./myProfile">회원정보 수정</a>							
							</c:otherwise>
						</c:choose>
<!-- 페이지 이동 없이 사용할 땐 이걸로 
						<a class="list-group-item list-group-item-action active" id="list-home-list" data-toggle="list" 
						href="#list-home" role="tab" aria-controls="home">프로필</a>

						<a class="list-group-item list-group-item-action" id="list-profile-list" 
						href="./myReserve">예약 조회</a>

						<a class="list-group-item list-group-item-action" id="list-messages-list" data-toggle="list" 
						href="#list-messages" role="tab" aria-controls="messages">문의 글 & 답 글</a>

						<a class="list-group-item list-group-item-action" id="list-settings-list" data-toggle="list" 
						href="#list-miliage" role="tab" aria-controls="settings">마일리지 내역 조회</a>

						<a class="list-group-item list-group-item-action" id="list-settings-list" data-toggle="list" 
						href="#list-myInfo" role="tab" aria-controls="noticeWrite">내 정보 조회</a>

						<a class="list-group-item list-group-item-action" id="list-settings-list" data-toggle="list" 
						href="#list-myInfoEdit" role="tab" aria-controls="boardWrite">회원정보 수정</a>
 -->	


					</div>
				</div>
<!-- 마이페이지 세로 네비게이션 추가 END - SI 20220314 -->

<!-- 컨텐츠 영역 START - SI 20220314 -->
			<!-- tabContent 있어야 발동함 -->
			<div class="col-md-10 tab-content" id="nav-tabContent" data-aos="fade-up" data-aos-duration="1000">

				<!-- 프로필 START - SI 20220314 -->
				<div class="tab-pane fade show active" id="list-home" role="tabpanel" aria-labelledby="list-home-list">

					<form action="" method="">
						<h4 style="color: #633e12;">기본정보</h4>
						<hr style="border-color: #633e12;" />


						<!-- 기본정보 - SI 20220314 -->
					<table class="table table-hover">
						<thead>
							<tr>
								<th>회원아이디</th>
								<th>마일리지 금액</th>
								<th>마일리지<br/>내역</th>
								<th>처리날짜</th>
							</tr>
						</thead>
						<tbody>
							<!-- 예약 조회 리스트 뿌리기 --> 
							<c:forEach var="milelist" items="${milelist}">
								<tr>
									<td><a href="">${milelist.mem_id}</a></td>
									<td>${milelist.mileage_price}</td>
									<td>${milelist.mileage_useable}</td>
									<td style="width: 20%">${milelist.mileage_date}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
					</form>
					<table class="table table-hover">
					<thead>
					<tr><th> 현재 사용가능한 마일리지 입니다</th></tr>
					</thead>
					<tbody>
					<tr><td>${mypageInfo.mileage_useable}</td></tr>
					</tbody>
					</table>
					
					
					<!-- 페이징 유선화 start 20220316 -->
					<div class="row" data-aos="fade">
			          <div class="col-12">
			            <div class="custom-pagination">
			              <ul class="list-unstyled">
			              
			              <c:if test="${milelistPage.prev}">
			                <li class="active"><a href="myPagemilelist?orderNum=${milelistPage.startPageNum - 1}">&lt;</a></li>
			              </c:if>
		                  <c:forEach begin="${milelistPage.startPageNum}" end="${milelistPage.endPageNum}" var="num">
						      <c:if test="${milelistNum == num}"> 
							      <li class="active">
							      	<span>${num}</span>
							      </li>
						      </c:if>
						      <c:if test="${milelistNum != num}">
							      <li>
							      	<a href="myPagemilelist?orderNum=${num}">${num}</a>
							      </li>			     
						      </c:if>    		
					      </c:forEach>
			              <c:if test="${milelistPage.next}">
					      	<li>
					      		<a href="myPagemilelist?orderNum=${milelistPage.endPageNum + 1}">&gt;</a>
					      	</li>
					      </c:if>
			               
			              </ul>
			            </div>
			          </div>
			        </div>
						<!-- 페이징 유선화 end 20220316 -->
					
				</div>
				<!-- 프로필 END - SI 20220314 -->
					
			</div>		
					
<!-- '프로필' 컨텐츠 영역 END - SI 20220314 -->


<!-- 예약조회 START - SI 20220314 => mypage3로 분리 -->
				<%-- <div class="col-md-10 tab-pane fade" id="list-reserve" role="tabpanel" aria-labelledby="list-profile-list"
						style="max-width:100% !important">
					<form action="" method="">
						<h4 style="color: #633e12;">XXX 님의 예약 리스트</h4>
						<hr style="border-color: #633e12;" />
					<table class="table table-hover">
						<thead>
							<tr>
								<th>예약번호</th>
								<th>객실타입</th>
								<th>체크인</th>
								<th>체크아웃</th>
								<th>가격</th>
								<th>예약상태</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><a href="" onclick="">SVW8432Q</a></td>
								<td>디럭스(더블) 외 2개</td>
								<td>2022-03-06</td>
								<td>2022-03-08</td>
								<td>1,992,000원</td>
								<c:choose>
									<c:when test="">
										<td>예약완료</td>
									</c:when>
									<c:when test="true">
										<td><a href="">부분취소</a>
									</c:when>
									<c:when test="">
										<td>예약취소</td>
									</c:when>
								</c:choose>
							</tr>
							<tr>
								<td><a href="">QWASD145</a></td>
								<td>디럭스(트윈)</td>
								<td>2022-01-17</td>
								<td>2022-01-18</td>
								<td>679,000원</td>
								<td>예약취소</td>
							</tr>
							
							<c:forEach var="" items="">
								<tr>
									<td>${mychk.cafe_modtime }</td>
									<td>${mychk.cafe_idx}</td>
									<td>
										<a href="./detail?idx=${mychk.cafe_idx}">${mychk.cafe_title}</a>
									</td>
									<td>${mychk.cafe_hit}</td>
									<td>${mychk.cafe_likecnt }</td>
									<td></td>
								</tr>
							</c:forEach>
							
						</tbody>
					</table>

					페이징 영역!
					<hr style="border-color: #633e12;" />
					</form>

				</div>
				 --%>
<!-- 예약조회 END - SI 20220314 -->	
				

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
				<div class="col-12 col-md-6 text-center text-md-right" data-aos="fade-up" data-aos-delay="200">
					<a href="reservation.html" class="btn btn-outline-white-primary py-3 text-white px-5">Reserve Now</a>
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
/* 올해 년도 계산해서 이용실적 앞에 적어주기 START - SI 20220314 */
	var d = new Date();

	var year = d.getFullYear();
	
	$(document).ready(function(){
		$('#useFrequency').html(year+"년 이용실적");
		$('#useFrequency').css({'color':'#633e12'});
	});
/* 올해 년도 계산해서 이용실적 앞에 적어주기 END - SI 20220314 */



</script>

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
  </head>
  <body>
 
</html>