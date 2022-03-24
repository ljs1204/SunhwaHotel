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
            <h1 class="heading mb-3">선화호텔<br/> 환영합니다</h1>
            <ul class="custom-breadcrumbs mb-4">
              <li><a href="./">Home</a></li>
              <li>&bullet;</li>
              <li>ReserveResult</li>
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
	<section class="section contact-section" id="next">
      <div class="container">
        <div class="row">
          <div class="col-md-7" data-aos="fade-up" data-aos-delay="100">
            
            <form action="#" method="post" class="bg-white p-md-5 p-4 mb-5 border">
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="name">예약이 완료되었습니다</label>
                </div>
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="phone">${loginId}님의 예약번호입니다</label>
                  <input type="text" id="phone" value="${reserveNum}" class="form-control" readonly />
                </div>
                <c:if test="${loginId eq '비회원'}">
                <div class="col-md-12 form-group">
                
                  <label class="text-black font-weight-bold" for="phone">예약번호를 다시 확인하고 싶으시면 비회원 예약 조회를 하셔야 합니다</label>
                  
                  
                </div>
                
                </c:if>
               
                
              </div>
          		<a href="./">Home</a>
            </form>

          </div>
          
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