<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
			width: 300px;
		}
		.addmemo{
			float:right;
			margin-right: 20px;
		}
		.list{
			padding-top: 30px;
			border: 1px solid darkgray;
			text-align : center;
			width: 23% !important;
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
	
	<form action="toReserveOrder" method="get">
	
	

	<div style="margin-top:200px"></div>
	
	
	<!-- 객실옵션선택창 시작-->

	<div class="rooms"><h5>객실1</h5></div>
	<div class="box">
		<div class="top">
			<div class="optionplus">
				<p>옵션 사항</p>
				<!--  -->
		    	<c:forEach var="op" items="${option}">
		    		<div>
				  		<input type="hidden" value="${op.option_num}"/>
				  		<input type="hidden" value="seon119" name="userId1"/>
				  		<p>	${op.option_name} / ${op.option_price}원 </p>
			    	
				  		<div style="float: right">
				  			<img class="minus" src="resources/images/minusbtn.png"  alt="마이너스버튼">
				            <div class="number" style="display: inline">0</div>
				            <img class="plus" src="resources/images/plusbtn.png"  alt="플러스버튼">
			    		</div>
		    		</div>
			        <br/>
		    	</c:forEach>
			</div>
			
			<div id="addmemo">
				<p>추가옵션사항</p>
				<textarea placeholder="문의하실 사항이 있으시면 입력해주십시오." name="ADD1">추가요청사항</textarea>
			</div>
		</div>
		<br/><hr/><br/>
		
	  	<c:forEach var="p" items="${product}">
	  	<div id="list">
	  		<img class="img" src="/photo/${p.product_img}" alt="상품이미지"/>
	  		<p>	${p.product_name}</p>
	  		<p>	${p.product_price}마일리지</p>
	  		<input type="hidden" value="${p.product_num}"/>
			<input type="checkbox" class="checkbox" value="checkitem">선택하기
			
			<div class="button2" style="margin-top: 10px; display:none;">
				<img class="minus2" src="resources/images/minusbtn.png"  alt="마이너스버튼">
	            <div class="number2" style="display: inline">0</div>
	            <img class="plus2" src="resources/images/plusbtn.png"  alt="플러스버튼">
            </div>
            
            <br/>
        </div>
   		</c:forEach>
	</div>
		
		
	</form>

	<!-- 결제금액/버튼 시작 -->

	<div class="box">
		<div class="box2">
		<span>회원님의 마일리지 :</span>
		<span id="useable"> ${useable}</span>
		<span>원</span>
		</div>
		
		<span class="box2" id="mPrice"style="float:right"></span>
	</div>
	<div class="box">
		<div class="box2">
		<span>사용가능 마일리지 : </span>
		<span id="useablePay"> ${useable}</span>
		<span>원</span>
		</div>
		<div class="box2">사용 할 마일리지 : <input type="text" id="useMileage" style="width:140px;"></div>
		<div class="box2" style="float:right">결제 금액 : 0원</div>
	</div>
	<br/>
	<div class="btn2">
        <div class="col-md-6 form-group">
            <input type="button" value="돌아가기" class="btn btn-primary text-white py-3 px-5 font-weight-bold">
        </div>
        <div class="col-md-6 form-group">
            <input type="button" value="결제하기" class="btn btn-primary text-white py-3 px-5 font-weight-bold">
        </div>
	</div>
	
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
			$(this).next().find('.number2').html(1);
		}else{//비 체크 시
			$(this).next().css('display', 'none'); //버튼 비활성화
			$(this).next().find('.number2').html(0);
			
		}
		
	});
	
	// 수량 - 
	$('.minus').click(function(){
	    var one =  $(this).next().html();
	    var num = parseInt(one);
	    num--;
	
	    //수량 0인 경우 체크 해제
	    if(num<=0){
	    num = 0;
	    };
	    
		$(this).next().html(num);
	});
	
	//마일리지 수량 -
	$('.minus2').click(function(){
	    var one =  $(this).next().html();
	    var num = parseInt(one);
	    num--;
	
	    if(num<=0){
	    num = 0;
	    $(this).parent().css('display', 'none'); 
	    $(this).parent().prev().prop("checked", false); 
	    };
	    
		$(this).next().html(num);
	});
	
	
	
	// 수량 +
	$('.plus').click(function(){
	    var one = $(this).prev().html();
	    var num = parseInt(one);
	    num++;
	    
	    $(this).prev().html(num);
	});
	
	// 수량 +
	$('.plus2').click(function(){
	    var one = $(this).prev().html();
	    var num = parseInt(one);
	    num++;
	    
	    $(this).prev().html(num);
	    
	    
	    
	});
	
	
	//선택한 마일리지상품의 금액X수량 계산하여 마일리지상품 총 금액에 나타내기
	var mTotalPrice = 0;
	
	$('.number2').on('DOMSubtreeModified', function() { //div.html 수량 변동시 
		mTotalPrice = 0;
		
		$('input:checkbox:checked').each(function(){ 
			
			var checkPrice = $(this).prev().val();//체크된 값의 가격 가져오기			
			var check_cnt = $(this).next().find('.number2').html();
			console.log(checkPrice);
			console.log(check_cnt);
			
			var mTotal = checkPrice*check_cnt;
			mTotalPrice += parseInt(mTotal);
			
			
				
			if($('#useable').html() <= mTotalPrice){				
				$("#mPrice").html("마일리지상품 총 금액 : "+mTotalPrice+"원");
				$('.plus2').css('pointer-events','none'); // +버튼 비활성화
				$('.checkbox').not('input:checkbox:checked').css('pointer-events','none'); //체크 안된 박스 select 클릭 불가
				
			}else{
				$("#mPrice").html("마일리지상품 총 금액 : "+mTotalPrice+"원");	
				$('.plus2').css('pointer-events','auto');
				$('.checkbox').css('pointer-events','auto');
			}
		});
		
	//$('.입력하려는 클래스 또는 ID').text( $('.입력 값이 있는 클래스 또는 ID').text() );
	});
	
	//사용가능 마일리지 계산
	var subtract = 0;
	 $('#mPrice').on('DOMSubtreeModified', function() {
		subtract = ($('#useable').html() - mTotalPrice);
		$('#useablePay').html(subtract);
	 });
	
	//사용가능 마일리지 over시 alert
	$('#useMileage').focusout(function() {
		subtract = ($('#useable').html() - mTotalPrice);
		//console.log(subtract, "원");
 		//console.log($('#useMileage').val());
 		
 		if( subtract < $('#useMileage').val()){
 			alert('사용가능한 마일리지를 초과하였습니다.');
 			$('#useMileage').val('');
 		}
	});
	
	//사용할 마일리지만큼 결제금액 빼기
 
 
	//옵션 변경에 따른 총 결제금액 계산
	
	
	//숫자 3자리 콤마찍기



</script>
</html>