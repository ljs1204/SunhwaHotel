<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	
	
	
	
	
	
	<form name="frm" action="toReserveOrder" method="POST" onSubmit="return Checkform()">
	
		<div style="margin-top:200px"></div>
		
		<!-- 공통 DB - 로그인/체크인/체크아웃 -->
		<input type="hidden" value="${loginId}" id="loginId" name="loginId"/>
		<input type="hidden" value="${checkindate}" name="checkindate"/>
		<input type="hidden" value="${checkoutdate}" name="checkoutdate"/>
		<input type="hidden" value="${rowDivCnt}" name="rowDivCnt"/>	

	
	
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
							  	<div style="float:left">${op.option_name} /  <fmt:formatNumber value="${op.option_price}" pattern="#,###"/> 원 </div>
			
					    		<input type="hidden" value="${op.option_price}" name="optionPrice${op.option_num}_${RDS.count}"/>
					    		
						    	<div style="float:right">
						  			<img class="minus" src="resources/images/minusbtn.png"  alt="마이너스버튼">
						  			<input type="text" class="number" name="option${op.option_num}_cnt_${RDS.count}" value="0" readonly/>
						            <img class="plus_${op.option_num}" src="resources/images/plusbtn.png"  alt="플러스버튼">
						            <input type="hidden" value="${rD.number}"/>
						    	</div>
				    	</div>
				    	<br/>
				    	</c:forEach>
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
			  		<p>	<fmt:formatNumber value="${p.product_price}" pattern="#,###"/>마일리지</p>
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
                <input type="text" id="credit_num" value="${memInfo.credit_num}" onkeyup='removeChar(event)' name="credit_num" placeholder="16자 카드번호를 입력해주세요."class="form-control ">
              </div>
              <div class="col-md-6 form-group">
                <label class="text-black font-weight-bold" for="credit_validity">유효기간</label>
                <input type="text" id="credit_validity" value="${memInfo.credit_validity}" onkeyup='removeChar(event)' name="credit_valid" placeholder="YYMM" class="form-control ">
              </div>
            </div>
        
            <div class="row">
              <div class="col-md-12 form-group">
                <label class="text-black font-weight-bold">카드종류</label><br/>
                <select id="cardSelect">
                	<option disabled selected>카드사를 선택하세요.</option>
                	<option value="1">국민</option>
                	<option value="2">카카오</option>
                	<option value="3">신한</option>
                	<option value="4">우리</option>
                	<option value="5">농협</option>
                	<option value="6">하나</option>
                	<option value="7">기업</option>
                </select>
               <input type="text" id="credit_type" value="${memInfo.credit_type}" name="creditType" class="form-control " readonly />
               <input type="hidden" id="credit_type_val" value="${mem_card}" name="credit_type" class="form-control "/>
              
              </div>
            </div>


            <div class="row">
              <div class="col-md-6 form-group">
                <input type="button" id="cardSave" value="카드정보 저장하기" class="btn btn-primary text-white py-3 px-5 font-weight-bold"/>
              </div>
            </div>

        </div>
		
		<div class="box">
			<textarea style="width:100%; height:100px;">
개인정보수집 이용에 대한 규정

제1장 총칙
제1조(목적)
이 약관은 (주)선화호텔가 운영하는 호텔사이트(이하 "당사"이라 한다)에서 제공하는 인터넷 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 호텔과 이용자의 권리•의무 및 책임사항을 규정함을 목적으로 합니다.
※「PC통신, 모바일 무선 등을 이용하는 전자거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」
제2조(정의)
① "당사"란 (주)선화호텔가 재화 또는 용역(이하 "재화 등"이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 호텔을 운영하는 사업자의 의미로도 사용합니다.
② "이용자"란 "당사"홈페이지에 접속하여 이 약관에 따라 "당사"가 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
③ "회원"이라 함은 "당사"에 개인정보를 제공하여 회원등록을 한 자로서, "당사"의 정보를 지속적으로 제공받으며, "당사"가 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.
④ "비회원"이라 함은 회원에 가입하지 않고 "당사"가 제공하는 서비스를 이용하는 자를 말합니다.
제3조(약관의 명시와 개정)
① "당사"는 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지, 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호, 모사전송번호, 전자우편주소, 사업자등록번호, 통신판매업신고번호, 개인정보관리책임자 등을 이용자가 쉽게 알 수 있도록 “당사” 홈페이지의 초기 서비스화면(전면)에 게시합니다. 다만 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.
② "당사"는 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회•배송책임•환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.
③ "당사"는 전자상거래등에서의소비자보호에관한법률, 약관의규제에관한법률, 전자거래기본법, 전자서명법, 정보통신망이용촉진등에 관한법률, 방문판매등에관한법률, 소비자보호법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다
④ "당사"가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행 약관과 함께 “당사”홈페이지의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이전의 유예기간을 두고 공지합니다. 이 경우 "당사"는 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.
⑤ "당사"가 약관을 개정할 경우에는 그 개정약관은 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정 약관의 공지기간 내에 "당사"에 송신하여 동의를 받은 경우에는 개정약관 조항이 적용됩니다.
⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래등에서의소비자보호에관한법률, 약관의규제등에관한법률, 정부가 제정한 전자상거래 등에서의 소비자보호지침 및 관계법령 또는 상 관례에 따릅니다.
			</textarea><br/>
			<input type="checkbox" id="agree">동의하시겠습니까?
			<p>* 비동의시 결제가 불가능합니다.</p>
		</div>
		
		<!-- 결제금액/버튼 시작 -->
		<div class="box">
			<div class="box2">
			<span>회원님의 마일리지 :</span>
			<span id="useable"><fmt:formatNumber value="${useable}" pattern="#,###"/></span>
			<input type="hidden" id="useable2" value="${useable}"/>
			<span>원</span>
			</div>
			
			<div class="box2" id="mPrice"style="float:right">마일리지상품 총 금액 : 0원</div>
		</div>
		<div class="box">	
			<!-- 결제금액 -->
			<div style="float:right;">
				<span>결제 금액 : </span>			
				<input type="text" class="cardTotal" value="" style="border-style:none; outline:none;" readonly/>
				<input type="hidden" id="cardTotal" name="cardTotal" value="" style="border-style:none; outline:none;" readonly/>
			</div>
			
		</div>
		<br/>
		<div class="btn2">
	        <div class="col-md-6 form-group">
	            <input type="button" onclick="history.back(-1)" value="돌아가기" class="btn btn-primary text-white py-3 px-5 font-weight-bold">
	        </div>
	        <div class="col-md-6 form-group">
	            <input type="submit" id="goPay" value="결제하기" class="btn btn-primary text-white py-3 px-5 font-weight-bold" disabled/>
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
	       			
		       			if($('#useable2').val() < mTotalPrice){ //회원의 마일리지보다 마일리지 총 금액이 큰 경우 
		       				alert('회원님의 마일리지를 초과할 수 없습니다.');
		       				$('input:checkbox:checked').prop("checked", false);
		       				$('.button2').css('display', 'none'); //버튼 비활성화
		       				$('.number2').val(0);//수량 초기화
		       				mTotalPrice = 0;
		       			}
	       		});
       	
     			$("#mPrice").html("마일리지상품 총 금액 : "+amountComma(mTotalPrice)+"원");	
     			
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

			$('.cardTotal').val(amountComma($('#cardTotal').val())+"원");
 
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
				$('.cardTotal').val(amountComma($('#cardTotal').val())+"원");
 				
        });
	});
	
	
 	//카드사 변경 selectbox
 	$('#cardSelect').change(function() {
 		
 	    console.log($('#cardSelect option:selected').text());
		$('#credit_type').val($('#cardSelect option:selected').text());
 	    $('#credit_type_val').val($('#cardSelect option:selected').val());
 	});
 	
 	//약관 동의
 	$('#agree').click(function(){
		if(this.checked){
			$('#goPay').attr('disabled',false);
		}else{
			$('#goPay').attr('disabled',true); 
		}
		
		
	});
 	
	
 	//input 숫자만 입력받기
 	function removeChar(event) {
        event = event || window.event;
        var keyID = (event.which) ? event.which : event.keyCode;
        if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 )
            return;
        else
            event.target.value = event.target.value.replace(/[^0-9]/g, "");
    }

 
 	//카드번호 회원정보에 저장 cardSave
 	$("#cardSave").click(function(){
 		console.log('카드정보 저장 시작');
		var $c_num = $('#credit_num');
		var $c_valid = $('#credit_validity');
		var $c_type = $('#credit_type_val');
		var $loginId = $('#loginId');
		
		if($c_num.val() == ''){
			alert('카드번호를 입력해주세요.');
			$c_num.focus();
		}else if($c_num.val().length != 16){
			alert('카드번호 16자로 입력바랍니다.');
			$c_num.focus();
		}else if($c_valid.val() == ''){
			alert('카드 유효기간을 입력하세요.');
			$c_valid.focus();
		}else if($c_valid.val().length != 4){
			alert('유효기간은 YYMM으로 입력바랍니다.');
			$c_valid.focus();
		}else if($c_type.val() == ''){
			alert('카드사를 선택하세요.');
			$c_type.focus();
		}else{
			console.log('카드정보 전송 시작');
			
			var param = {'c_num':$c_num.val(),'c_valid':$c_valid.val(),'c_type':$c_type.val(),'loginId':$loginId.val()};
			
			console.log(param);
			
			$.ajax({
				type:'POST',
				url:'cardSave',
				data:param,
				dataType:'JSON',
				success:function(data){
					console.log(data);
					if(data.success == 1){
						alert('카드정보를 회원정보에 저장했습니다.');
					}else{
						alert('카드정보 저장 실패했습니다. 다시 시도해주세요.');
						
					}
				},
				error:function(e){
					console.log(e);
					alert('서버에 문제가 발생했습니다. 고객센터에 문의해주세요.');
				}
			});
			
		}
		
 	});
	
 	//폼 제출시 검사
 	function Checkform() {
 		if( frm.credit_num.value == "" ){
 			frm.credit_num.focus();
 			alert("카드번호를 입력해 주십시오.");
 			return false;
 		}else if(frm.credit_valid.value == ""){
 			frm.credit_valid.focus();
 			alert("카드 유효기간을 입력해 주십시오.");
 			return false;
 		}else if(frm.creditType.value == ""){
 			frm.creditType.focus();
 			alert("카드사를 선택해 주십시오.");
 			return false;
 		}else if(frm.credit_num.value.length != 16){
			alert('카드번호 16자로 입력바랍니다.');
			frm.credit_num.focus();
			return false;
		}else if(frm.credit_valid.value.length != 4){
			alert('유효기간은 YYMM으로 입력바랍니다.');
			frm.credit_valid.focus();
			return false;
		}
 		
 	}

 	
	// 숫자 3자리 콤마찍기
	// 변환 함수
	function amountComma(price){
		var comma = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		
		return comma;
	}


	
</script>

</html>