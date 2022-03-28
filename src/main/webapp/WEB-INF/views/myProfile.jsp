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
       width: 40%;
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
 
						<a class="list-group-item list-group-item-action" id="list-home-list" href="./myPage">프로필</a>
						<a class="list-group-item list-group-item-action" id="list-profile-list" href="./myReserve?num=1">예약 조회</a>
						<a class="list-group-item list-group-item-action" id="list-messages-list" href="./tomemberboardlist?currpage=1">문의 글 & 답 글</a>
						<a class="list-group-item list-group-item-action" id="list-settings-list" href="./myPagemilelist?orderNum=1">마일리지 내역 조회</a>
						<a class="list-group-item list-group-item-action" id="list-settings-list" href="./myPagemyProfile">내 정보 조회</a>
						<a class="list-group-item list-group-item-action active" id="list-settings-list" href="./myProfile">회원정보 수정</a>

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


						<!-- 프로필 - 유선화 20220316 -->
						<table class="table table-bordered">
							<tbody>
								<tr>
									<th>아이디</th>
									<td>
									${myProfile.mem_id}
									<input type="hidden" name="id" value="${myProfile.mem_id}"/>
									</td>
								</tr>
								<tr>
									<th>비밀번호 변경</th>
									<td><input class="pwconfirmSet"  id="inputPassword" type="password" name="pw" value="${myProfile.mem_pw}"/></td>
								</tr>
								<tr>
									<th rowspan="2">비밀번호 확인</th>
									<td><input class="pwconfirmSet" id="inputPasswordCheck" type="password" name="pwConfirm"  value="${myProfile.mem_pw}"/>
									<input type="button" id="ps_submit" value="확인"/>
									</td>
								</tr>
								<tr>
									<td id="confirm">				
									</td>				
								</tr>	
								<tr>
									<th>이름(한글)</th>
									<td> 
									${myProfile.mem_name_kr}
									<input type="hidden" name="mem_name_kr" value="${myProfile.mem_name_kr}"/>
									</td>
								</tr>
								<tr>
									<th>이름(영문)</th>
									<td>
									${myProfile.mem_name_en}
									<input type="hidden" name="mem_name_en" value="${myProfile.mem_name_en}"/>
									</td>
								</tr>
								<tr>
									<th>생년월일</th>
									<td>
									${myProfile.mem_birth}
									<input type="hidden" name="mem_birth" value="${myProfile.mem_birth}"/>
									</td>
								</tr>			
								<tr>
									<th>휴대폰번호</th>
									<td><input type="text" name="phone" value="${myProfile.mem_phone}"/></td>
								</tr>
								<tr>
									<th>이메일주소</th>
									<td>
										<input type="text" name="email" value="${myProfile.mem_email}"/>
										<input type="button" id="indetify" value="인증"/>
									</td>
								</tr>	
								<tr>
									<th>
									</th>
									<td>
										<input type="hidden" id="emailIdnum" value=""/>
										<input type="hidden" id="emailIdbtn" value="확인"/>				
									</td>		
								</tr>
								<tr>
									<th colspan="2">
										<input type="button" id="submit" value="저장"/>
									</th>	
									<th colspan="2">
										<input type="button" onclick="location.href='./myPage'" value ="돌아가기"/>
									</th>	
								</tr>
							</tbody>
						</table>
						
					</form>
				</div>
				
					
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
		$('#useFrequency').html(year+"년 카드정보");
		$('#useFrequency').css({'color':'#633e12'});
	});
/* 올해 년도 계산해서 이용실적 앞에 적어주기 END - SI 20220314 */
var msg = "${msg}";

if(msg != ""){
	alert(msg);
}

// 2022-03-11 백유나 비밀번호 조건 START   
	$(function(){

		$('#ps_submit').on('click',function(){
			
			var pw = $('#inputPassword').val();
		    var num = pw.search(/[0-9]/g);
		    var eng = pw.search(/[a-z]/ig);
		    var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
			
			pw = $('input[name="pw"]').val();
			pwConfirm = $('input[name="pwConfirm"]').val();	
	 		
	 		if(pw.length<8){
	 			alert('비밀번호는 8자 이상으로 작성바랍니다.');
	 		}else if(num < 0 || eng < 0 || spe < 0 ){
	 			alert('비밀번호는 영문,숫자,특수문자 조합으로 입력바랍니다.');
	 		}else if(pw!=pwConfirm){
	 			alert('비밀번호가 일치 하지 않습니다.');
		   	}else {
			   alert('이 비밀번호는 사용가능합니다.');
		   }
		});
	});
// 2022-03-11 백유나 비밀번호 조건 END
	var pw = '';
	var pwConfirm = '';
	var pw_check = 'T';
    var certifinum = null;
    var certifinum_check = false;
    
    random();
    
    function random(){
        // clearInterval(time);
        //var cnt = 11;
        
        console.log('난수번호');
        randomNum = Math.floor(Math.random()*1000000);
        certifinum = randomNum;
    };

	$('#indetify').click(function(){
		console.log('중복 체크시작');
		var email = $('input[name="email"]').val();
		console.log('check email : ',email);
		
		$.ajax({
			type:'get',
			url :'overlayemail',
			data:{'email':email},
			dataType:'json',
			success:function(data){
				console.log(data);
							
				
				if(data.emailTF){
					alert('이미 사용중인 이메일주소 입니다.');

				} else{
					alert('메일로 인증번호를 전송했습니다.');
					$('#emailIdnum').attr('type','text');
					$('#emailIdbtn').attr('type','button');
					random();
					
					
					win = window.open('emailPage','최신식 구글 메일','width=800,height=600');
				}

			},
			error:function(e){
				console.log('에러...');
				console.log(e);	
			}
		});		
	});
	
	
	$('#emailIdbtn').click(function(){
		$('#emailIdnum').val();
		if($('#emailIdnum').val() == certifinum){
			certifinum_check = true;
			alert('이메일 인증을 성공하였습니다.');
			$('#emailIdnum').attr('type','hidden');
			$('#emailIdbtn').attr('type','hidden');

		} else {
			certifinum_check = false;
			alert('인증번호 확인 후 재 입력 바랍니다.');
		}		
	});
	
	//이메일 값이 한번이라도 바뀌면, 체크를 false로
	$('input[name="email"]').keyup(function(e){
		certifinum_check = false;
	});	
	

	$('#submit').click(function(){
		//var pw = '';
		//var pwConfirm = '';		
		var $id = $('input[name="id"]');
		var $pw = $('input[name="pw"]');
		var $phone = $('input[name="phone"]');
		var $email = $('input[name="email"]');
		
		if(pw_check == 'F'){
			alert('비밀번호 확인을 해주세요');
			$pw.focus();						
		} else if($phone.val() == ''){
			alert('휴대폰 번호를 입력 해주세요');
			$name.focus();			
		} else if($email.val() == ''){
			alert('이메일 주소를 입력 해주세요');
			$name.focus();			
		} else if(!certifinum_check){
			alert('메일 인증을 진행해주세요 ');
		} else{
			var userupdate = {};
			userupdate.mem_id = $id.val();
			userupdate.mem_pw = $pw.val();
			userupdate.mem_phone = $phone.val();
			userupdate.mem_email = $email.val();
			console.log(userupdate);
			
	 	
			$.ajax({
				type:'get',
				url :'profileupdate',
				data : userupdate,
				dataType:'json',
				success:function(data){
					console.log(data);
					if(data.success >0 ){
						alert('회원 정보 수정이 완료되었습니다.');						
					}
				},
				error:function(e){
					
				}
			});
		 
		}
		
	
	});
	
	
	
	




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