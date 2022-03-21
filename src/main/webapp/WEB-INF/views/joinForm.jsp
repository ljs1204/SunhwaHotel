<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>SunhwaHotel Join</title>
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
		th{
			width: 20%;
		}
		
		td{
			width: 20%;
		}
		#joindiv{
			padding: 5px;
			width: 30%;
		    height: auto;
		    margin: 0 auto;
		    text-align: center;
		    color: #333333;
		    min-width: 500px;
		    
		}	
		.noresize {
		  resize: none;
		  width:300px;
		}
	     body{
	    	height: auto !important;
	    }
	    
	    input[type="button"]{
	    	color: #fff;
		    background-color: black !important;
		    border-color: black !important;
		    text-align: center;
	    }
	    #member_join{
	    	margin-left: 170px;
	    }
	</style>
</head>
<body>
	<header class="site-header">
		<jsp:include page="header.jsp" flush="true" />
	</header>
	
	<!-- 영역 주는용 div -->
	<div style="margin-top:200px"></div>
		
	<div id="joindiv">
	<!-- 회원가입 START -->
	<h2>Sunhwa Hotel JoinForm</h2>
	<table class="table table-bordered">
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" name="mem_id" placeholder="아이디를 입력해주세요."/>
				<input id="overlay" type="button" value="중복체크"/>
				<p id="overlay_msg"></p>
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input id="pass" type="password" name="mem_pw" placeholder="비밀번호를 입력해주세요."/>
				<p id="pass_msg"></p>
			</td>
		</tr>
		<tr>
			<th>비밀번호 재확인</th>
			<td>
				<input id="pass_confirm" type="password" placeholder="비밀번호를 재입력해주세요."/>
				<p id="pw_confirm"></p>
			</td>
		</tr>
		<tr>
			<th>이름(국문)</th>
			<td><input type="text" name="mem_name_kr" placeholder="ex)홍길동"/></td>
		</tr>
		<tr>
			<th>이름(영문)</th>
			<td><input type="text" name="mem_name_en" placeholder="ex)Honggildong"/></td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>
				<input type="text" id="birth" name ="mem_birth" placeholder="ex)19990101"/>
				<p id="birthmsg"></p>
			</td>
		</tr>
		<tr>
			<th>휴대폰 번호</th>
			<td>
				<input type="text" name="mem_phone" placeholder="ex)010-1234-1234"/>
			</td>
		</tr>
		<tr>
			<th>이메일 주소</th>
			<td>
				<input type="email" name="mem_email" placeholder="ex)email@naver.com"/>
				<input type="button" id="certify" value="인증"/><br/>
				<input type="hidden" id="emailCode" placeholder="인증코드를 입력해주세요."/>
				<input type="hidden" id="emailBtn" value="확인"/>
			</td>
			<!-- 이메일 인증 기능 필요 -->
		</tr>
		<tr>
			<th>개인정보이용 동의(필수)</th>
		    <td>
		    <input type="checkbox" id="agree">동의합니다.<br/>
		    <textarea class="noresize">
1. 수집 이용 항목
성명(국문·영문), 생년월일, 이메일주소, 휴대폰번호, 구매 및 예약내역, 투숙기간, 아이디, 비밀번호, IPIN(DI)

2. 수집 이용 목적
본인 식별, 서비스 제공 및 민원처리

3. 보유 이용 기간
회원 탈퇴 시 까지

※ 관련 법령에서 정한 별도 보유 기한이 있는 경우는 그에 따름.
※ 위 사항에 대한 동의를 거부할 수 있으나, 이에 대한 동의가 없을 경우 선화호텔 회원 가입 및 서비스 이용이 불가합니다.
		    </textarea>
			</td>
		</tr>	
		<tr>
			<th colspan="2">
				<input id="member_join" type="button" value="회원가입" class="btn btn-primary text-white py-3 px-5 font-weight-bold" disabled/>
			</th>
		</tr>
	</table>
	</div>
	<!-- 회원가입 END -->
	
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
	var overlayChk = false;//아이디 중복확인 시 True
	var passChk2 = false; //비밀번호 조건 만족시 True
	var passChk = false; //입력한 비밀번호 일치 시 True
	var certifinum_check = false; //이메일 인증 완료시 True
	var birthChk = false; //생년월일 확인 되면 True
	
	//아이디 중복 확인
	$('#overlay').on('click',function(){
		var chkId = $('input[name="mem_id"]').val();
		if(chkId == '') {
			alert('아이디를 입력 해주세요');
			chkId.focus();
		}else{		
			$.ajax({
				url:'overlay',
				type:'get',
				data:{
					id:chkId
				},
				dataType:'JSON',
				success:function(data){
					var msg = "";
				 	
					if(data.overlay){
						msg = "사용 중인 아이디 입니다.";
						$('input[name="mem_id"]').val('');
					}else{
						msg = "사용 가능한 아이디 입니다.";
						overlayChk = true;
					}
					
					$("#overlay_msg").html(msg);
					
				},
				error:function(e){
					console.log(e)
				}
			});
			
		}
	});
	
    
    
	//비밀번호 8자 이상 안내메시지
	$('#pass').keyup(function(){
		var pass = $('#pass').val();
	    var num = pass.search(/[0-9]/g);
	    var eng = pass.search(/[a-z]/ig);
	    var spe = pass.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		var msg = "";
		
		if(pass.length < 8){
			msg = "8글자 이상 입력해주세요.";
			passChk2 = false;
		}else if(num < 0 || eng < 0 || spe < 0 ){
            msg = "비밀번호는 영문,숫자,특수문자 조합으로 입력바랍니다.";
            passChk2 = false;
		}else{
			passChk2 = true;
		}
		$('#pass_msg').html(msg);
	});
	
	//비밀번호 입력값 확인
	$('#pass_confirm').keyup(function(){
		var confirm = $('#pass_confirm').val();
		var pass = $('#pass').val();
		var msg = "";
		 
		if(pass === confirm){
			msg = "비밀번호가 일치합니다."
			passChk = true;
		}else{
			msg = "비밀번호가 일치하지 않습니다."
			passChk = false;
		}	
		$('#pw_confirm').html(msg);
	});
	
	
	//이메일 인증버튼 클릭 시 중복 여부 확인
	
	
	//이메일 인증
    random();
    
    function random(){
        // clearInterval(time);
        //var cnt = 11;
        
        console.log('난수번호');
        randomNum = Math.floor(Math.random()*1000000);
        certifinum = randomNum;
    };	
	
	$('#certify').click(function(){
		var chkemail = $('input[name="mem_email"]').val();
		
		if(chkemail == ''){
			alert('이메일을 입력해주세요.');	
		}else{
			
			$.ajax({
				url:'emailcheck',
				type:'get',
				data:{
					email:chkemail
				},
				dataType:'JSON',
				success:function(data){
					var msg = "";
				 	
					if(data.emailChecked){
						alert('이미 사용중인 이메일 입니다.');
						$('input[name="mem_email"]').val('');
					}else{
						alert('이메일로 인증번호를 발송했습니다.');
						$('input[name="mem_email"]').attr('readonly', true);
						$('#emailCode').attr('type','text');
						$('#emailBtn').attr('type','button');
						
						//이메일 인증
						random();				
						win = window.open('emailPage','최신식 구글 메일','width=800,height=600');					
					}
					
				},
				error:function(e){
					console.log('에러');
					console.log(e)
				}
			});
			
		}
		
		
	});
	
	
	
	
	//약관 동의 여부
	$('#agree').click(function(){
		if(this.checked){
			$('#member_join').attr('disabled',false);
		}else{
			$('#member_join').attr('disabled',true); 
		}
		
	});
	
	
	//생년월일
	$('#birth').keyup(function(){
			
			var birth = $('#birth').val();
			var eng = birth.search(/[a-z]/ig);
			var spe = birth.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
			var msg = "";
			
			var year = birth.substring(0,4);
			var month = birth.substring(4,6);
			var day = birth.substring(6,8);
			
			if(birth.length<8 || birth.length>8 || month>12 || day>31){
				birthChk = false;
				msg = "생년월일을 다시 확인바랍니다.";
			}else if(eng != -1 || spe != -1){
				birthChk = false;
				msg = ("생년월일은 숫자만 입력해주세요.");
			}else{
				birthChk = true;
			}		
			$('#birthmsg').html(msg);

	
	
			
	});
	
	
	
	
	//회원가입 클릭 시
	$("#member_join").click(function() {
		
		if (overlayChk) {
			var $id = $('input[name="mem_id"]');
			var $pw = $('input[name="mem_pw"]');
			var $name_kr = $('input[name="mem_name_kr"]');
			var $name_en = $('input[name="mem_name_en"]');
			var $birth = $('input[name="mem_birth"]');
			var $phone = $('input[name="mem_phone"]');
			var $email = $('input[name="mem_email"]');
			
			console.log($name_kr);
			
			if($pw.val() == '') {
				alert('비밀번호를 입력 해주세요');
				$pw.focus();
			}else if(passChk2 == false){
				alert('비밀번호는 공백없이 8자이상, 영문+숫자+특수문자 조합으로 입력바랍니다.');
				$pw.focus();
			}else if(passChk == false){
				alert('비밀번호가 일치하지않습니다.');
				$pw.focus();
			}else if ($name_kr.val() == '') {
				alert('이름(국문)을 입력 해주세요.');
				$name_kr.focus();
			}else if ($name_en.val() == '') {
				alert('이름(영문)을 입력 해주세요.');
				$name_en.focus();	
			}else if ($birth.val() == '') {
				alert('생년월일을 입력하세요');
				$birth.focus();
			}else if(birthChk == false){
				alert('생년월일을 다시 확인바랍니다.');
				$birth.focus();
			}else if ($phone.val() == '') {
				alert('휴대폰 번호를 입력 하세요');
				$phone.focus();
			}else if ($email.val() == '') {
				alert('이메일을 입력하세요');
				$email.focus();	
			}else if (certifinum_check == false){
				alert('이메일 인증을 해주세요.');	
				$email.focus();
			}else{
				console.log('회원가입 입력 시작');
				
				var param = {'id':$id.val()};
				param.pw = $pw.val();
				param.grade = 'silver';
				param.name_kr = $name_kr.val();
				param.name_en = $name_en.val();
				param.user_birth = $birth.val(); 
				param.user_email = $email.val(); 		
				param.user_phone = $phone.val();
				console.log(param);
							
				$.ajax({
					type : 'POST',
					url : 'join',
					data : param,
					dataType : 'JSON',
					success : function (data) {
						console.log(data);
						if (data.success == 1) {
							alert('회원가입을 축하드립니다.');
							location.href = './login';
						}else {
							alert('회원 가입에 실패 했습니다. 다시 시도해주세요');
			
						}
					},
					error : function (e) {
						console.log(e);
						alert('서버에 문제가 발생했습니다. 고객센터에 문의 해주세요');
					}			
				})
			}
		}else{
			alert('아이디 중복 체크를 해주세요!');
			$('input[name="user_id"]').focus();
		}		
	});
	
	
	
	
	$('#emailBtn').click(function(){
		$('#emailCode').val();
		if($('#emailCode').val() == certifinum){
			certifinum_check = true;
			alert('이메일 인증을 성공하였습니다.');
			$('#emailCode').attr('type','hidden');
			$('#emailBtn').attr('type','hidden');
		} else {
			certifinum_check = false;
			alert('인증번호 확인 후 재 입력 바랍니다.');
		}		
	});
	
	
	
	
	$('input[name="email"]').keyup(function(e){
		certifinum_check = false;
	});	

</script>
</html>




