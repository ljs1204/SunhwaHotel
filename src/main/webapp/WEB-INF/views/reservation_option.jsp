<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<head>
 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>SunhwaHotel reservation_option</title>
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
		textarea{
			width:400px;
			resize: none !important;
		}
		.box{
			padding: 30 30 30 30px;
			border: 2px solid #f1e3c4;
			margin: 0 auto;
			width: 1000px;
            min-width:1000px;
            max-width: 50%;
            margin-bottom: 10px;
		}
		.top{
			width: 100%;
			height: 190px;
		}
		.optionplus{
			float:left;
			width: 500px;
		}
		#addmemo{
			float:right;
			margin-right: 10px;
		}
		.list{
			padding-top: 30px;
			border: 1px solid darkgray;
			text-align : center;
			width: 23%;
			height: 300px;
			display:inline-table;
			margin-right: 8px;
    		margin-left: 5px;
		}
		.rooms{
			background: #f1e3c4; 
			width:1000px;
			height:30px;
			margin: 0 auto;
			min-width: 1000px;
			padding-left: 20px;
		}
		.box2{
			width: 30%;
			display: inline-table;
    		margin-left: 5px;
    		margin-bottom: 10px;
		}
        .btn2{
		    display: flex;
		    margin: 0 auto;
		    text-align: center;
		    width: 30%;
        }
        body{
        	height: auto !important;
        }
        
        .btn-primary {
		    color: #fff;
		    background-color: black !important;
		    border-color: black !important;
		}
		
		.btn-primary:hover {
		    color: #fff;
		    background-color: #0069d9;
		    
		}
		p {
		    color: black !important;
		}
		
		.number, .number2 {
			border-style:none !important;
			width:22px !important;
			outline:none !important;
			text-align:center !important;
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
            <h1 class="heading mb-3">Reservation Form</h1>
            <ul class="custom-breadcrumbs mb-4">
              <li><a href="./">Home</a></li>
              <li>&bullet;</li>
              <li>Reservation</li>
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
	
	
	
	
	
	
	<form action="toReserveOrder" method="POST">
	
		<div style="margin-top:200px"></div>
		
		<!-- 공통 DB - 로그인/체크인/체크아웃 -->
		<input type="hidden" value="${loginId}" name="loginId"/>
		<input type="hidden" value="${checkindate}" name="checkindate"/>
		<input type="hidden" value="${checkoutdate}" name="checkoutdate"/>
			

	
	
		<c:forEach var="rD" items="${reserveData}" varStatus="RDS"> 
			<!-- 객실별(객실타입,침대타입,객실가격,인원 수) -->
			<input type="hidden" value="${rD.room}" name="room_type_${RDS.count}"/>
			<input type="hidden" value="${rD.price}" name="room_price_${RDS.count}"/>
			<input type="hidden" value="${rD.bedType}" name="room_bed_${RDS.count}"/>
			<input type="hidden" value="${rD.number}" name="people_${RDS.count}"/>
			
			<!-- 객실box -->
			<div class="rooms"><h5>객실${RDS.count}</h5></div>
			<div class="box">
				<div class="top">
					<div class="optionplus">					
						<p>옵션 사항</p>
						
						<!-- 엑베/조식/추가요청 옵션 -->
				    	<c:forEach var="op" items="${option}">
				    		
				    		<div style="display:flow-root;">
							  	<div style="float:left">${op.option_name} / ${op.option_price}원 </div>
			
					    		<input type="hidden" value="${op.option_price}" name="optionPrice${op.option_num}_${RDS.count}"/>
					    		
						    	<div style="float:right">
						  			<img class="minus" src="resources/images/minusbtn.png"  alt="마이너스버튼">
						  			<input type="text" class="number" name="option${op.option_num}_cnt_${RDS.count}" value="0" readonly/>
						            <img class="plus_${op.option_num}" src="resources/images/plusbtn.png"  alt="플러스버튼">
						            <input type="hidden" value="${rD.number}" name="room_people_${RDS.count}"/>
						    	</div>
				    	</div>
				    	<br/>
				    	</c:forEach>
<%-- 				    	
				    	<div style="float:left">
				  			<img class="minus" src="resources/images/minusbtn.png"  alt="마이너스버튼">
				  			<input type="text" class="number" name="extra_cnt_${RDS.count}" value="0" readonly/>
				            <img class="extra_plus" src="resources/images/plusbtn.png"  alt="플러스버튼">
				    	</div>
				    	
				    	<div style="float:left">
				  			<img class="minus" src="resources/images/minusbtn.png"  alt="마이너스버튼">
				  			<input type="text" class="number" name="break_cnt_${RDS.count}" value="0" readonly/>
				            <img class="break_plus" src="resources/images/plusbtn.png"  alt="플러스버튼">
				  			<input type="hidden" value="${rD.room_people}" name="room_people_${RDS.count}"/>
					 	</div> --%>
				        <br/>
				    	
					</div>
					
					<div id="addmemo">
						<p>추가요청사항</p>
						<textarea placeholder="문의하실 사항이 있으시면 입력해주십시오." name="ADD_${RDS.count}"> </textarea>
					</div>
				</div>
				<br/><hr/><br/>
				
			  	<c:forEach var="p" items="${product}" varStatus="pnum">	
			  	<div class="list">
			  		<img class="img" src="/photo/${p.product_img}" alt="상품이미지"/>
			  		<p>	${p.product_name}</p>
			  		<p>	${p.product_price}마일리지</p>
			  		<input type="hidden" value="${p.product_num}" name="product${pnum.count}_${RDS.count}"/>
			  		<input type="hidden" value="${p.product_price}"/>
	
					<input type="checkbox" class="checkbox">선택하기
					
					<div class="button2" style="margin-top: 10px; display:none;">
						<img class="minus2" src="resources/images/minusbtn.png"  alt="마이너스버튼">
			            <input type="text" class="number2" value="0" name="p${pnum.count}_cnt_${RDS.count}"  onchange="valueChange()" readonly/>
			            <img class="plus2" src="resources/images/plusbtn.png"  alt="플러스버튼">
		            </div>
		            
		            <br/>
		        </div>
		   		</c:forEach>
			</div>
		
		</c:forEach>	
			
		<!-- 객실옵션선택창 끝 -->
		
		<!-- 회원정보 및 카드 정보 -->
		<div class="box">
			<div class="row">
                <div class="col-md-6 form-group">
                  <label class="text-black font-weight-bold" for="name_en">이름(영문)</label>
                  <input type="text" id="name_en" value="${memInfo.mem_name_en}" class="form-control" readonly>
                </div>
                <div class="col-md-6 form-group">
                  <label class="text-black font-weight-bold" for="name_kr">이름(국문)</label>
                  <input type="text" id="name_kr" value="${memInfo.mem_name_kr}" class="form-control" readonly>
                </div>
                <div class="col-md-6 form-group">
                  <label class="text-black font-weight-bold" for="checkin">체크인 날짜</label>
                  <input type="text" id="checkin" value="${checkindate}" class="form-control" readonly>
                </div>
               <div class="col-md-6 form-group">
                  <label class="text-black font-weight-bold" for="checkout">체크아웃 날짜</label>
                  <input type="text" id="checkout" value="${checkoutdate}" class="form-control" readonly>
                </div>
                <div class="col-md-6 form-group">
                  <label class="text-black font-weight-bold" for="phone">연락처</label>
                  <input type="text" id="phone" value="${memInfo.mem_phone}" class="form-control" readonly>
                </div>
                <div class="col-md-6 form-group">
                  <label class="text-black font-weight-bold" for="email">Email</label>
                  <input type="email" id="email" value="${memInfo.mem_email}" class="form-control" readonly>
                </div>
            </div>
		
		</div>
		
		<div class="box">
            <div class="row">
              <div class="col-md-6 form-group">
                <label class="text-black font-weight-bold" for="credit_num">신용카드번호</label>
                <input type="text" id="credit_num" value="${memInfo.credit_num}" name="credit_num" class="form-control ">
              </div>
              <div class="col-md-6 form-group">
                <label class="text-black font-weight-bold" for="credit_validity">유효기간</label>
                <input type="text" id="credit_validity" value="${memInfo.credit_validity}" name="credit_valid" class="form-control ">
              </div>
            </div>
        
            <div class="row">
              <div class="col-md-12 form-group">
                <label class="text-black font-weight-bold" for="credit_type">카드종류</label>
                <input type="text" id="credit_type" value="${memInfo.credit_type}" name="credit_type"class="form-control ">
              </div>
            </div>


            <div class="row">
              <div class="col-md-6 form-group">
                <input type="button" value="카드정보 저장하기" class="btn btn-primary text-white py-3 px-5 font-weight-bold"/>
              </div>
            </div>

        </div>
		
		<div class="box">
			<textarea style="width:100%; height:100px;">ADDRESS:98 West 21th Street, Suite 721 New York NY 10016
PHONE:(+1) 435 3533
EMAIL:info@yourdomain.com

노쇼(no-show)에 대한 규정 


예약 취소에 대한 규정


개인정보수집 이용에 대한 규정
			</textarea><br/>
			<input type="checkbox">동의하시겠습니까?
			<p>* 비동의시 결제가 불가능합니다.</p>
		</div>
		
		<!-- 결제금액/버튼 시작 -->
		<div class="box">
			<div class="box2">
			<span>회원님의 마일리지 :</span>
			<span id="useable"> ${useable}</span>
			<span>원</span>
			</div>
			
			<div class="box2" id="mPrice"style="float:right">마일리지상품 총 금액 : 0원</div>
		</div>
		<div class="box">
			<%-- <div class="box2">
			<span>사용가능 마일리지 : </span>
			<span id="useablePay"> ${useable}</span>
			<span>원</span>
			</div>
			<div class="box2">사용 할 마일리지 : <input type="text" id="useMileage" style="width:140px;"></div> --%>
			
			
			<!-- 결제금액 -->
			<div style="float:right;">
				<span>결제 금액 : </span>			
				<input type="text" id="cardTotal" name="cardTotal"value="" style="border-style:none; outline:none;" readonly/>
			
			</div>
			
		</div>
		<br/>
		<div class="btn2">
	        <div class="col-md-6 form-group">
	            <input type="button" value="돌아가기" class="btn btn-primary text-white py-3 px-5 font-weight-bold">
	        </div>
	        <div class="col-md-6 form-group">
	            <input type="submit" value="결제하기" class="btn btn-primary text-white py-3 px-5 font-weight-bold">
	        </div>
		</div>
	</form>
	<!-- 결제금액/버튼 끝 -->
	
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
	//체크가 되지 않으면 버튼 비활성화
	$('.checkbox').click(function(){
		if(this.checked){//체크 시 
			$(this).next().css('display', 'block');//버튼 활성화
			$(this).next().find('input[type="text"]').val(1);
		}else{//비 체크 시
			$(this).next().css('display', 'none'); //버튼 비활성화
			$(this).next().find('input[type="text"]').val(0);
			
		}
		
	});
	
	//엑베/조식 옵션 수량 - 버튼
	$('.minus').click(function(){
	    var one =  $(this).next().val();
	    var num = parseInt(one);
	    num--;
	
	    //수량 0인 경우
	    if(num<=0){
	    	num = 0;
	    }
	    
		$(this).next().val(num);
	});
	
	//마일리지 수량 - 버튼
	$('.minus2').click(function(){
	    var one =  $(this).next().val();
	    var num = parseInt(one);
	    num--;
	
	    if(num<=0){
	    num = 0;
	    $(this).parent().css('display', 'none'); 
	    $(this).parent().prev().prop("checked", false); 
	    };
	    
		$(this).next().val(num);
	});
	
	
	
	//엑베/조식 옵션 수량 + 버튼
	$('.plus_1').click(function(){
	    var num = $(this).prev().val();
	    num++;
	    
	    if(num >= 2){
	    	alert('엑스트라베드는 최대 1개만 가능합니다.');
	    	num = 1;
	    }
	    $(this).prev().val(num);
	});
	
	$('.plus_2').click(function(){
	    var people = $(this).next().val();
		var num = $(this).prev().val();
	    
	    num++;
	    if(num > people){
	    	alert('조식은 투숙 인원 수까지만 신청 가능합니다.');	
	    	num = people;
	    }
	    $(this).prev().val(num);
	});
	
	
	
	//마일리지 수량 + 버튼
	$('.plus2').click(function(){
	    var one = $(this).prev().val();
	    var num = parseInt(one);
	    num++;
	    
	    $(this).prev().val(num); 
	});

	
	//마일리지 상품 수량 변경시 함수 START
	//선택한 마일리지상품의 금액X수량 계산하여 마일리지상품 총 금액에 나타내기
	$(document).ready(function(){
	    var $input = $(".number2"); // readonly inputBox  
	        $(".number2").on('input', function() {
	        	
	        	var mTotalPrice = 0;
	        	console.log('수량변경됨');
	        		
	        	$('input:checkbox:checked').each(function(){ 
	        			
	       			var checkPrice = $(this).prev().val();//체크한 상품의 가격
	       			var check_cnt = $(this).next().find('.number2').val();//체크한 상품의 수량
	       			//console.log(checkPrice);
	       			console.log("cnt: "+check_cnt);
	       			
	       			var mTotal = checkPrice*check_cnt;
	       			console.log("개별가: "+mTotal);
	       			mTotalPrice += parseInt(mTotal);
	       			
	       			console.log("총 합계: "+mTotalPrice);
	       			
		       			if($('#useable').html() < mTotalPrice){ //회원의 마일리지보다 마일리지 총 금액이 큰 경우 
		       				alert('회원님의 마일리지를 초과할 수 없습니다.');
		       				$('input:checkbox:checked').prop("checked", false);
		       				$('.button2').css('display', 'none'); //버튼 비활성화
		       				$('.number2').val(0);//수량 초기화
		       				mTotalPrice = 0;
		       			}
	       		});
       	
     			$("#mPrice").html("마일리지상품 총 금액 : "+mTotalPrice+"원");	
			});
       	
	        	
	});
	// 밑에 함수 구현(없으면 안됨)
	(function ($) {
	        var originalVal = $.fn.val;
	        $.fn.val = function (value) {
	            var res = originalVal.apply(this, arguments);
	     
	            if (this.is('input:text') && arguments.length >= 1) {
	                // this is input type=text setter
	                this.trigger("input");
	            }
	     
	            return res;
	        };
	    })(jQuery);
	//마일리지 상품 수량 변경시 함수 END
	
 
	//페이지 들어올때 총 결제금액 기본값
	$(document).ready(function(){
  
			var cardTotal = 0;

			var length = ${fn:length(reserveData)}+1;
			
			for (var i = 1; i < length; i++) { //들어온 reserveData 수만큼 반복
				var room_price = parseInt($("input[name=room_price_"+i+"]").val());
				
				cardTotal += room_price;
			}
			$('#cardTotal').val(cardTotal);
 
	});
		
	
	//옵션 변경에 따른 총 결제금액 계산
	//객실별 - 객실가격+(옵션가격*수량)
	$(document).ready(function(){
    var $input = $(".number"); // readonly inputBox  
        $(".number").on('input', function() {
			
        	
        	var cardTotal = 0;
			
			var length = ${fn:length(reserveData)}+1; 
			console.log("length:"+length);
				for (var i = 1; i < length; i++) { //들어온 reserveData 수만큼 반복
					var room_price = parseInt($("input[name=room_price_"+i+"]").val());
					console.log("룸가격 : "+room_price);
					
					var option1 = parseInt($("input[name=optionPrice1_"+i+"]").val() * $("input[name=option1_cnt_"+i+"]").val());
					console.log("엑베 가격X수량 값: "+option1);
					
					var option2 = parseInt($("input[name=optionPrice2_"+i+"]").val() * $("input[name=option2_cnt_"+i+"]").val());
					console.log("조식 가격X수량 값: "+option2);
					
					
					cardTotal += (room_price+option1+option2);				
					
				}
				
				console.log("총 카드사용금액 : "+cardTotal);
				$('#cardTotal').val(cardTotal);
 
        });
	});
	
	
	//숫자 3자리 콤마찍기
	

	
</script>

</html>