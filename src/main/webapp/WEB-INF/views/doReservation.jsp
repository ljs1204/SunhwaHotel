<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>SunhwaHotel doReservation</title>
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
    		resize: none !important;
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
    
  

    <section class="site-hero inner-page overlay" style="background-image: url(resources/images/
hero_4.jpg)" data-stellar-background-ratio="0.5">
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


	<!-- input Form -->

    <section class="section contact-section" id="next">
      <div class="container">
        <div class="row">
          <div class="col-md-7" data-aos="fade-up" data-aos-delay="100">
            
            <form action="#" method="post" class="bg-white p-md-5 p-4 mb-5 border">
              <div class="row">
                <div class="col-md-6 form-group">
                  <label class="text-black font-weight-bold" for="name_en">이름(영문)</label>
                  <input type="text" id="name_en" class="form-control ">
                </div>
                <div class="col-md-6 form-group">
                  <label class="text-black font-weight-bold" for="name_kr">이름(국문)</label>
                  <input type="text" id="name_kr" class="form-control ">
                </div>
                <div class="col-md-6 form-group">
                  <label class="text-black font-weight-bold" for="phone">연락처</label>
                  <input type="text" id="phone" class="form-control ">
                </div>
                <div class="col-md-6 form-group">
                  <label class="text-black font-weight-bold" for="adult_cnt">인원 수</label>
                  <input type="text" id="adult_cnt" class="form-control" readonly>
                </div>
                <div class="col-md-6 form-group">
                  <label class="text-black font-weight-bold" for="checkin">체크인 날짜</label>
                  <input type="text" id="checkin" class="form-control " readonly>
                </div>
               <div class="col-md-6 form-group">
                  <label class="text-black font-weight-bold" for="checkout">체크아웃 날짜</label>
                  <input type="text" id="checkout" class="form-control " readonly>
                </div>
                
              </div>
          
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="email">Email</label>
                  <input type="email" id="email" class="form-control ">
                </div>
              </div>
              

              <div class="row mb-4">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="addmessage">추가요청사항</label>
                  <textarea name="message" id="addmessage" class="form-control " cols="30" rows="8"></textarea>
                </div>
              </div>
              
            </form>

          </div>
         
          <div class="col-md-7" data-aos="fade-up" data-aos-delay="100">
            
            
         <!-- input Form2 --> 
          
          <form action="#" method="post" class="bg-white p-md-5 p-4 mb-5 border">
            <div class="row">
              <div class="col-md-6 form-group">
                <label class="text-black font-weight-bold" for="credit_num">신용카드번호</label>
                <input type="text" id="credit_num" class="form-control ">
              </div>
              <div class="col-md-6 form-group">
                <label class="text-black font-weight-bold" for="credit_validity">유효기간</label>
                <input type="text" id="credit_validity" class="form-control ">
              </div>
            </div>
        
            <div class="row">
              <div class="col-md-12 form-group">
                <label class="text-black font-weight-bold" for="credit_type">카드종류</label>
                <input type="email" id="credit_type" class="form-control ">
              </div>
            </div>


            <div class="row">
              <div class="col-md-6 form-group">
                <input type="button" value="카드정보 저장" class="btn btn-primary text-white py-3 px-5 font-weight-bold">
              </div>
            </div>
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
</html>