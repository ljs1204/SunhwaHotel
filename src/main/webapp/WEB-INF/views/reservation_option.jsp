<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>SunhwaHotel option</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<style>
		textarea{
			width:400px;
			resize: none;
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
		#top{
			width: 100%;
			height: 190px;
		}
		#optionplus{
			float:left;
			width: 300px;
		}
		#addmemo{
			float:right;
			margin-right: 20px;
		}
		#list{
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
		
        .btn{
            margin-top: 10px;
            color: #ffffff;
            background: #3e2b2c;
            font-size: 14px;
            font-weight: 700;
            text-transform: uppercase;
            padding: 13px 45px 11px;
            cursor: pointer;
            width: 210px;
            margin-left: 10px;
            margin-right: 10px;
        }
        .btn2{
			display: inline-table;
    		margin: 0 auto;
    		text-align: center;
    		width: 100%;
        }
        body{
        	height: auto !important;
        }
            
	</style>
</head>
<body>
	<header class="site-header">
		<jsp:include page="header.jsp" flush="true" />
	</header>
	
	<div style="margin-top:200px;"></div> 
	
	<div class="rooms"><h5>객실1</h5></div>
	<div class="box">
		<div id="top">
			<div id="optionplus">
				<p>옵션 사항</p>
				
		    	<c:forEach var="op" items="${option}">
		    		<div>
				  		<input type="hidden" value="${op.option_num}"/>
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
				<textarea placeholder="문의하실 사항이 있으시면 입력해주십시오."></textarea>
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
		
			
	<div class="box">
		<div class="box2">회원님의 마일리지 : ${useable}원</div>
		
		<div class="box2" style="float:right">상품 마일리지 금액 : 0원</div>
	</div>
	<div class="box">
		<div class="box2">사용가능 마일리지 : 0원</div>
		<div class="box2">사용 할 마일리지 : <input style="width:140px;"></div>
		<div class="box2" style="float:right">결제 금액 : 0원</div>
	</div>
	<br/>
	<div class="btn2">
		<button class="btn">돌아가기</button>
		<input type = "button" class="btn" value = "결제하기"/>
	</div>
	
	<footer class="footer-section">
		<jsp:include page="footer.jsp" flush="true" />
	</footer>
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
	    console.log($('.number2').html());
	    $(this).prev().html(num);
	});
	
	
	//선택한 마일리지상품의 금액X수량 계산
	//마일리지 수량 변동 시 체크되어있는 마일리지 상품 넘버의 금액 * 페이지에서 선택한 수량

		


	
	//옵션 변경에 따른 총 결제금액 계산
	
	//사용한 마일리지만큼 결제금액 빼기
	
	//숫자 3자리 콤마찍기



</script>
</html>