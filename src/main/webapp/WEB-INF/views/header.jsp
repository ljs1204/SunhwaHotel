<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Quicksand:400,600,700&amp;display=swap" rel="stylesheet">

    <link rel="stylesheet" href="resources/fonts/icomoon/style.css">
    <link rel="stylesheet" href="resources/css/owl.carousel2.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="resources/css/bootstrap3.min.css">

    <!-- Style -->
    <link rel="stylesheet" href="resources/css/style3.css">
    <title>Website Menu #10</title>

    <!-- 20220311 덧붙인 css -->
    <style>
        .site-navbar .site-logo {
            margin: 0;
            margin-top: 5px;
            margin-bottom: 30px;
            padding: 0;
            font-size: 2rem;
            font-family: trajan pro !important;
        }

        .site-navbar .site-logo a {
            color: black;
            /* text-transform: lowercase;  */
        }

        .site-logo-sub a {
            font-family: Helvetica;
            font-size: 0.8rem;
            text-decoration: none;
            color: black;
        }

        .nav-link {
            font-family: Helvetica;
        }

        .site-navbar .site-navigation .site-menu>li>a {
            padding: 0px;
            padding-top: 5px;
        }

        .site-navbar {
            padding: 0px;
            height: 105px;
            background-color: #f1e3c4 !important;
        }

        @media screen and (max-width:980px) {
            .non-display {
                display: none;
                visibility: hidden;
                width: 0px;
            }
        }
    </style>
</head>
<body>
	<!-- 반응형 코드 -->
    <div class="site-mobile-menu site-navbar-target">
        <div class="site-mobile-menu-header">
            <div class="site-mobile-menu-close mt-3">
                <span class="icon-close2 js-menu-toggle"></span>
            </div>
        </div>
        <!-- 화면이 작아졌을 때 element가 자동으로 추가되는 div -->
        <div class="site-mobile-menu-body"></div>
    </div>


    <!-- 헤더 -->
    <header class="site-navbar site-navbar-target" role="banner" style="position: fixed; display:block; border-top-width:0px; border-bottom-width:0px">
        <!-- 20220311 새로운 navbar 로그인 / 회원가입 / 예약 확인 부분 추가, z-index=3 으로 기존 navbar 보다 위로 올라오게 -->
        <div class="container">
            <div class="row align-items-center position-relative"
                style="height:20px; position:absolute; top: 5px; z-index:3;">
                <div class="col-lg-4"></div>
                <div class="col-lg-4"></div>
                <div class="col-lg-4">
                <!-- 20220314 로그인 상태에 따라 회원/비대면, ID에 따라 관리자 구분 START -->
                <c:if test="${loginId eq null}">
                    <div>
                        <nav class="site-navigation text-right ml-auto " role="navigation">
                            <ul class="site-menu main-menu js-clone-nav ml-auto d-none d-lg-block"
                                style="font-size:0.8rem; color:gray;">
                                <li><a href="./login" class="nav-link">로그인</a></li>
                                <!-- 20220311 반응형으로 작아졌을땐 안보이게 하는 class -->
                                <li class="non-display">|</li>
                                <li><a href="./joinForm" class="nav-link">회원가입</a></li>
                                <li class="non-display">|</li>
                                <li><a href="./myReserve" class="nav-link">예약확인</a></li>
                            </ul>
                        </nav>
                    </div>
                </c:if>
                
                <c:if test="${loginId ne null}">
                	<c:if test="${mem_grade ne 'admin' }">
	                	<div>
	                        <nav class="site-navigation text-right ml-auto " role="navigation">
	                            <ul class="site-menu main-menu js-clone-nav ml-auto d-none d-lg-block"
	                                style="font-size:0.8rem; color:gray;">
	                                <li><a href="./logout" class="nav-link">로그아웃</a></li>
	                                <!-- 20220311 반응형으로 작아졌을땐 안보이게 하는 class -->
	                                <li class="non-display">|</li>
	                                <li><a href="./myPage" class="nav-link">마이페이지</a></li>
	                                <li class="non-display">|</li>
	                                <li><a href="./myReserve" class="nav-link">예약확인</a></li>
	                            </ul>
	                        </nav>
	                    </div>
                    </c:if>
                    
                    <c:if test="${mem_grade eq 'admin' }">
                    	<div>
	                        <nav class="site-navigation text-right ml-auto " role="navigation">
	                            <ul class="site-menu main-menu js-clone-nav ml-auto d-none d-lg-block"
	                                style="font-size:0.8rem; color:gray;">
	                                <li><a href="./logout" class="nav-link">로그아웃</a></li>
	                                <!-- 20220311 반응형으로 작아졌을땐 안보이게 하는 class -->
	                                <li class="non-display">|</li>
	                                <li><a href="index.html" class="nav-link">관리자 메뉴</a></li>
	                            </ul>
	                        </nav>
	                    </div>
                    </c:if>
                </c:if>
                
                
                <!-- 20220314 로그인 상태에 따라 회원/비대면, ID에 따라 관리자 구분 END -->
                </div>
            </div>
        </div>

        <!-- 기존 navbar -->
        <div class="container">
            <div class="row align-items-center position-relative">

                <!-- 로고 왼쪽 메뉴 -->
                <div class="col-lg-4">
                    <nav class="site-navigation text-center ml-auto " role="navigation">
                        <ul class="site-menu main-menu js-clone-nav ml-auto d-none d-lg-block">
                            <!-- 20220311 반응형으로 작아졌을땐 안보이게 하는 class non-display 추가 -->
                            <!-- 20220314 로그인 상태에 따라 회원/비대면, ID에 따라 관리자 구분 START -->
                            <c:if test="${loginId eq null}">
                            	<li><a href="index.html" class="nav-link"><img class="non-display"
                                    	    src="resources/images/icon/search.png" style="width:25px;">&nbsp;선화호텔 소개</a></li>
                           		<li><a href="index.html" class="nav-link"><img class="non-display"
                                        	src="resources//images/icon/booking.png" style="width:25px">&nbsp;선화호텔 예약</a></li>
                            </c:if>
                            <c:if test="${loginId ne null}">
                				<c:if test="${mem_grade ne 'admin' }">
                					<li><a href="index.html" class="nav-link"><img class="non-display"
                                    	    src="resources/images/icon/search.png" style="width:25px;">&nbsp;선화호텔 소개</a></li>
                           			<li><a href="index.html" class="nav-link"><img class="non-display"
                                        	src="resources//images/icon/booking.png" style="width:25px">&nbsp;선화호텔 예약</a></li>
                				</c:if>
                			</c:if>
                            
                            
                            <c:if test="${loginId ne null}">
                				<c:if test="${mem_grade eq 'admin' }">
                            		<li><a href="index.html" class="nav-link">&nbsp;회원 정보</a></li>
                            		<li><a href="./AdminReserveList" class="nav-link">&nbsp;객실 예약 정보</a></li>
                                </c:if>
                            </c:if>	
                            <!-- 20220314 로그인 상태에 따라 회원/비대면, ID에 따라 관리자 구분 END -->
                        </ul>
                    </nav>
                </div>

                <!-- 로고 -->
                <div class="col-lg-4 text-center">
                    <div class="site-logo" onclick="location.href='index.html'">
                        <a href="./">
                            THE SUNHWA
                            <!-- 20220311 - 로고 밑 글자 -->
                            <!-- 20220314 로그인 상태에 따라 회원/비대면, ID에 따라 관리자 구분 -->
                            <span style="display:block; font-size:1rem; font-family:trajan pro;">
                                <c:if test="${mem_grade ne 'admin' }">
                                	HOTELS &amp; RESORTS
                                </c:if>
                                <c:if test="${mem_grade eq 'admin' }">
                                	ADMIN PAGE
                                </c:if>
                                
                            </span>
                        </a>
                    </div>

                    <!-- 반응형 -->
                    <div class="ml-auto toggle-button d-inline-block d-lg-none"><a href="#"
                            class="site-menu-toggle py-5 js-menu-toggle text-black active"><span
                                class="icon-menu h3 text-black"></span></a>
                    </div>
                </div>

                <!-- 로고 오른쪽 메뉴 -->
                <div class="col-lg-4">
                    <nav class="site-navigation text-right mr-auto " role="navigation">
                        <ul class="site-menu main-menu js-clone-nav ml-auto d-none d-lg-block">
                        <!-- 20220314 로그인 상태에 따라 회원/비대면, ID에 따라 관리자 구분 START -->
                        <c:if test="${loginId eq null}">
                            <li><a href="./roomsList" class="nav-link" style="font-weight: bold;">객실 소개</a></li>
                            <li><a href="blog.html" class="nav-link" style="font-weight: bold;">고객문의</a></li>
                            <li><a href="./myPagemilelist?orderNum=1" class="nav-link" style="font-weight: bold;">마일리지</a></li>
                        </c:if>
                        
                        <c:if test="${loginId ne null}">
                			<c:if test="${mem_grade ne 'admin' }">
                        	<li><a href="./roomsList" class="nav-link" style="font-weight: bold;">객실 소개</a></li>
                            <li><a href="blog.html" class="nav-link" style="font-weight: bold;">고객문의</a></li>
                            <li><a href="./myPagemilelist?orderNum=1" class="nav-link" style="font-weight: bold; font-size:15px;">${loginId}님의 마일리지</a></li>
                           	</c:if>
                        </c:if>
                        
                        <c:if test="${loginId ne null}">
                			<c:if test="${mem_grade eq 'admin' }">
                           	<li><a href="./AdminQnalist" class="nav-link" style="font-weight: bold;">문의 리스트</a></li>
                            <li><a href="./AdminMileageRegist" class="nav-link" style="font-weight: bold;">마일리지 상품 리스트</a></li>
                        	</c:if>
                       	</c:if>
                        
                        <!-- 20220314 로그인 상태에 따라 회원/비대면, ID에 따라 관리자 구분 START -->
                        </ul>
                    </nav>
                </div>


            </div>
        </div>

    </header>




    <script src="resources/js/jquery-3.3.1.min.js"></script>
    <script src="resources/js/popper.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    <script src="resources/js/jquery.sticky.js"></script>
    <script src="resources/js/main.js"></script>
</body>
<script>
	//스크롤에 따라 헤더 날리기
	// 추가사항 1 : 스크롤바를 직접 찍어서 이동시켰을 때( 완 - scrollTop())
	// 추가사항 2 : 새로고침하고 그 자리부터 스크롤 시작할 때 대응해야함( 완 - scrollTop() 사용 )
	// 추가사항 3 : css대신 animate() 사용시 몇 번 이후 드럽게 느려짐
	
	// 현재 스크롤
	var x = 0;
	//console.log('현재 스크롤 위치 : ',x);
	
	$('body').on("wheel", function(event){
	// deltaY obviously records vertical scroll
	// console.log(event.originalEvent.deltaY);
	
	// 네비 메뉴가 떠있지 않은 상태에서만 스크롤 동작
	var x = $('body').css('overflow');
	//console.log(x);
	        
	    if(x!='hidden'){ 
	        // 스크롤을 위로 올렸을 때
	        if (event.originalEvent.deltaY < 0) {
	                $('.site-navbar').css({'display':'block'});
	
	                x = $('body').scrollTop();
	                //console.log('현재 스크롤 위치 : ',x);
	
	                if(x > 0){
	                }
	            }
	        // 스크롤을 밑으로 내렸을 때
	        else {
	                $('.site-navbar').css({'display':'none'});
	                x = $('body').scrollTop();
	                //console.log('현재 스크롤 위치 : ',x);
	
	                // 얼마정도 내려갔을 때는 완전 보이지 않음 => 현재는 막음
	                // if(x>=4400){
	                //     $('.site-navbar').css({'display':'none'});
	                // }
	        }
	    }else{
	
	    }
	});

</script>
</html>