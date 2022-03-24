<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>SunhwaHotel</title>
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
		background-color: #f1e3c4 !important;
		/* border: 1px solid #f1ebd6 !important; */
		color: #633e12 !important;
		font-weight: bold;
	}
	.list-group-item {
		font-size: 12px;
		font-family: Helvetica;
		border: 1px solid #f1ebd6 !important;
		padding-right: 10px !important;
	}
/* 세로 네비게이션(리스트그룹) 관련 css END - SI 20220314 */

/* 컨텐츠 - 예약 조회 영역 css START - SI 20220314 */
	#list-reserve .table th{
		background-color: #98cade;
		border-top: 1px solid #cdcbbe;
		border-bottom: 1px solid #cdcbbe;
		color: #633e12 !important;
	}
	#list-reserve .table tr{
		border-top: 1px solid #cdcbbe;
		border-bottom: 1px solid #cdcbbe;
	}
/* 컨텐츠 - 예약 조회 영역 css END - SI 20220314 */	

/* 20220317 페이징 영역 SI */
	.custom-pagination ul li.active span{
		background: #633e12 !important;
	    color: #fff !important;
	    border-radius: 50% !important;
	}
	
	body{
		height:100% !important;
	}
<style>





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
						<a class="list-group-item list-group-item-action" id="list-profile-list" href="#">객실 예약 정보 리스트</a>
						<a class="list-group-item list-group-item-action" id="list-messages-list" href="./AdminQnalist">회원 문의 관리</a>
						<a class="list-group-item list-group-item-action active" id="list-settings-list" href="./AdminMileageRegist">마일리지 상품 관리</a>
						
					</div>
				</div>
<!-- 마이페이지 세로 네비게이션 추가 END - SI 20220314 -->

<!-- 예약조회 START - SI 20220314 -->
			<!-- tabContent 있어야 발동함 -->
			<div class="col-md-10 tab-content" id="nav-tabContent" data-aos="fade-up" data-aos-duration="1000">
				<div class="tab-pane fade show active" id="list-reserve" role="tabpanel" aria-labelledby="list-reserve-list"
						style="max-width:100% !important">
					<form action="" method="">
						<h4 style="color: #633e12;">${loginId}님 어서오세요 마일리지 관리 페이지입니다.</h4>
						<hr style="border-color: #633e12;" />
					<h2>마일리지 상품 리스트</h2>
					
					
					<a href="./writingForm" style="float:right;" id="plus">상품등록</a>
					
					<table class="table table-bordered">
					   <tr>
					       <th>상품번호</th>   
					       <th>이름</th>
					    	<th>가격</th>
					    	<th>삭제</th>
					   </tr>
					
					   	<c:if test="${adOrderList eq null || size == 0}">
							<tr>
								<td colspan="9">등록된 상품이 없습니다.</td>
							</tr>
						</c:if>		
							<c:forEach items="${adOrderList}" var="adOrderList">
							<tr>
								<td>${adOrderList.product_num}</td>
								<td>${adOrderList.product_name}</td>
								<td>${adOrderList.product_price}</td>	
								<td><a href="del?product_num=${adOrderList.product_num}" >삭제</a></td>				
							</tr>	
							</c:forEach>
						</table>	
<!-- 20220317 페이징 START - SI -->
					
<!-- 20220317 페이징 END - SI -->					
										
					
					<hr style="border-color: #633e12;" />
					</form>

				</div>
			</div>
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

</html>