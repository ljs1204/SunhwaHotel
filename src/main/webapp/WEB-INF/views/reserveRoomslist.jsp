<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
  </head>
  <body>
  
  
    <header class="site-header">
		<jsp:include page="header.jsp" flush="true" />
	</header>
	
   

    <section class="site-hero inner-page overlay" style="background-image: url(resources/images/hero_4.jpg)" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center">
          <div class="col-md-10 text-center" data-aos="fade">
            <h1 class="heading mb-3">Rooms</h1>
            <ul class="custom-breadcrumbs mb-4">
              <li><a href="index.html">Home</a></li>
              <li>&bullet;</li>
              <li>Rooms</li>
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

    <section class="section pb-4">
      <div class="container">
       
        <div class="row check-availabilty" id="next">
          <div class="block-32" data-aos="fade-up" data-aos-offset="-200">

            <form action="#">
            
           	
              <div class="row">
                <div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
                  <label for="checkin_date" class="font-weight-bold text-black">Check In</label>
                  <div class="field-icon-wrap">
                    <div class="icon"><span class="icon-calendar"></span></div>
                    <input type="text" id="checkin_date" class="form-control" value="${checkin_date}"/>
                  </div>
                </div>
                <div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
                  <label for="checkout_date" class="font-weight-bold text-black">Check Out</label>
                  <div class="field-icon-wrap">
                    <div class="icon"><span class="icon-calendar"></span></div>
                    <input type="text" id="checkout_date" class="form-control" value="${checkout_date}"/>
                  </div>
                </div>
                <div class="col-md-6 mb-3 mb-md-0 col-lg-3">
                  <div class="row">
                    
                    <div class="col-md-6 mb-3 mb-md-0">
                      <label for="children" class="font-weight-bold text-black">Children</label>
                      <div class="field-icon-wrap">
                        <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                        <select name="cnt" id="children" class="form-control"  >
                          <option value="1" <c:if test="${cnt eq '1'}">selected</c:if>>1</option>
                          <option value="2" <c:if test="${cnt eq '2'}">selected</c:if>>2</option>
                          <option value="3" <c:if test="${cnt eq '3'}">selected</c:if>>3</option>
                        </select>
                      </div>
                    </div>
                    
                    
                  </div>
                </div>
                <div class="col-md-6 col-lg-3 align-self-end">
                  <button class="btn btn-primary btn-block text-white">Check Availabilty</button>
                </div>
              </div>
              
              
              
            </form>
          </div>


        </div>
      </div>
    </section>

    
    <section class="section">
    <button id="pButton">+</button> <button id="mButton" >-</button>
        <div id="roomContainer" class="container">
        
         <div class="row" id="rowDiv" name="rowDiv">
          
        <c:forEach items="${roomReservelist}" var="list" varStatus="i">
          <div class="col-md-6 col-lg-4 mb-5" id='roomList' data-aos="fade-up">
            <a href="roomdetail?room_num=${list.room_num}" class="room">
              <figure class="img-wrap">
                <img src="resources/images/${list.room_img}" alt="Free website template" class="img-fluid mb-3">
              </figure>
              <div class="p-3 text-center room-info">
                <h2>${list.room_type_name} </h2>
                <span class="text-uppercase letter-spacing-1">${list.room_price} / per night</span>
              </div>
            </a>
            <input type="radio" name="check" data-type="${list.room_type}" data-price='${list.room_price}' value = "1"<c:if test="${i.index eq 0}">checked</c:if>/> 더블
            <input type="radio" name="check" data-type="${list.room_type}" data-price='${list.room_price}' value = "2"/> 트윈
          </div>
        
        </c:forEach>
  		 	<div class="button" style="margin-top: 10px; ">
				<img class="minus" name="minus" src="resources/images/minusbtn.png"  alt="마이너스버튼">
	            <div class="number" name ="number" style="display: inline">1</div>
	            <img class="plus" name="plus" src="resources/images/plusbtn.png"  alt="플러스버튼">
            </div>
        


        </div>
      </div>
    </section>
     <button type="button" id="reserveBtn">예약하기</button>
      <a href="reservation_option">이동하기</a>
    <section class="section bg-light">

      <div class="container">
        <div class="row justify-content-center text-center mb-5">
          <div class="col-md-7">
            <h2 class="heading" data-aos="fade">Great Offers</h2>
            <p data-aos="fade">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
          </div>
        </div>
      
        <div class="site-block-half d-block d-lg-flex bg-white" data-aos="fade" data-aos-delay="100">
          <a href="#" class="image d-block bg-image-2" style="background-image: url('resources/images/img_1.jpg');"></a>
          <div class="text">
            <span class="d-block mb-4"><span class="display-4 text-primary">$199</span> <span class="text-uppercase letter-spacing-2">/ per night</span> </span>
            <h2 class="mb-4">Family Room</h2>
            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
            <p><a href="#" class="btn btn-primary text-white">Book Now</a></p>
          </div>
        </div>
        <div class="site-block-half d-block d-lg-flex bg-white" data-aos="fade" data-aos-delay="200">
          <a href="#" class="image d-block bg-image-2 order-2" style="background-image: url('resources/images/img_2.jpg');"></a>
          <div class="text order-1">
            <span class="d-block mb-4"><span class="display-4 text-primary">$299</span> <span class="text-uppercase letter-spacing-2">/ per night</span> </span>
            <h2 class="mb-4">Presidential Room</h2>
            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
            <p><a href="#" class="btn btn-primary text-white">Book Now</a></p>
          </div>
        </div>

      </div>
    </section>

    <section class="section bg-image overlay" style="background-image: url('resources/images/hero_4.jpg');">
      <div class="container" >
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
    
    
	<footer class="footer-section">
		<jsp:include page="footer.jsp" flush="true" />
		<form id="moveForm" action="reservation_option" method="post">
      <input type="text" name="params" id="params">
      </form>
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

	var index = 0;
	var msg = "${msg}";
	
	if(msg != ""){
		alert(msg);
	}
	
	$("#pButton").click(function(){
		if($("[name=rowDiv]").length == 3){
			alert("더 이상 추가할 수 없습니다.");
			return;
		}else{
			var clone = $("#rowDiv").clone(); //.appendTo('#roomContainer')
			index ++;
			clone.find("[name=check]").attr("name","check"+index);
			clone.find("[name=check"+index+"]:eq(0)").prop("checked","checked");
			clone.find("[name=number]").html("1");
			clone.appendTo('#roomContainer');
		}
		
		
	});
	
	$("#mButton").click(function(){
		if($("[name=rowDiv]").length < 2){
			alert("더 이상 삭제할 수 없습니다.");
			return;
		}else{
			$("[name=rowDiv]:last").remove();
			index --;
		}
		
		
	});
	
	$("[name=check]").click(function(){
		var val = $(this).val();
		var type = $(this).data("type");
		var price = $(this).data("price");
		alert("침대 : "+val+" 룸 : "+type+" 가격 : "+price);
		
	});
	
	// 수량 +
	$(document).on('click','[name=plus]',function(){	
	   var one = $(this).prev().html();
	   if(one == 3){
		   return;
	   } 
	   var num = parseInt(one); 
	    num++;
	    
	    $(this).prev().html(num);
	});
	
	// 수량 -
	$(document).on('click','[name=minus]',function(){
	    var one = $(this).next().html();
	    if(one == 1){
		    return;
		} 
	    var num = parseInt(one);
	    num--;
	    
	    $(this).next().html(num);
	    
	    
	    
	});
	
	$("#reserveBtn").click(function(){
		var rowDivCnt = $("[name=rowDiv]").length;
		var div1Price = $("[name=rowDiv]:eq(0)").find("input[name='check']:checked").data("price");
		var div1Room = $("[name=rowDiv]:eq(0)").find("input[name='check']:checked").data("type")+"";
		var div1BedType = $("[name=rowDiv]:eq(0)").find("input[name='check']:checked").val();
		var number =  $("[name=rowDiv]:eq(0)").find("[name='number']").html();
		var params = [{"price": div1Price, "room": div1Room, "bedType": div1BedType,"number":number}];
		
		if(rowDivCnt > 1){
			var div1Price2 = $("[name=rowDiv]:eq(1)").find("input[name='check1']:checked").data("price");
			var div1Room2 = $("[name=rowDiv]:eq(1)").find("input[name='check1']:checked").data("type")+"";
			var div1BedType2 = $("[name=rowDiv]:eq(1)").find("input[name='check1']:checked").val();
			var number2 =  $("[name=rowDiv]:eq(1)").find("[name='number']").html();
			var param2 = {"price": div1Price2, "room": div1Room2, "bedType": div1BedType2,"number":number2};
			params.push(param2);
		}
		
		if(rowDivCnt > 2){
			var div1Price3 = $("[name=rowDiv]:eq(2)").find("input[name='check2']:checked").data("price");
			var div1Room3 = $("[name=rowDiv]:eq(2)").find("input[name='check2']:checked").data("type")+"";
			var div1BedType3 = $("[name=rowDiv]:eq(2)").find("input[name='check2']:checked").val();
			var number3 =  $("[name=rowDiv]:eq(2)").find("[name='number']").html();
			var param3 = {"price": div1Price3, "room": div1Room3, "bedType": div1BedType3,"number":number3};
			params.push(param3);
		}
		jsonParam = JSON.stringify(params);
		
		$("#params").val(jsonParam);
		$("#moveForm").submit();
	});
  
  </script>
  
  
  
  
  
</html>