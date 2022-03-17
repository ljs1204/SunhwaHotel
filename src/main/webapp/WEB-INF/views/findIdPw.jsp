<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>SeonhwaHotel Finding ID/PW</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<style>
            .id-form{
                float: left;
                box-sizing: border-box;
            }
            .pw-form{
                float: right;
                box-sizing: border-box;
            }
            #idfind,#pwfind{
                margin-top: 10px;
                color: #ffffff;
                background: black;
                font-size: 14px;
                font-weight: 700;
                text-transform: uppercase;
                padding: 13px 45px 11px;
                cursor: pointer;
                width: 228px;
            }
            input{
                width:228px;
                margin-bottom: 10px;
            }
            h2{
                text-align: center;
                margin-bottom: 10px; 
            }
            .register-login-section {
                padding-top: 200px;
                padding-bottom: 80px;
            }
            .container{
            	max-width: 720px;
            	width: 100%;
			    padding-right: 15px;
			    padding-left: 15px;
			    margin-right: auto;
			    margin-left: auto;
            }
            .box{
            	margin: 0 auto;
				position: relative;
			    width: 60%;
			    padding : 30 30 30 30px;
			    border: 1px solid black;
            }

       </style>
</head>
<body>

	<header class="site-header">
		<jsp:include page="header.jsp" flush="true" />
	</header>
	
	
	<div class="register-login-section spad">
	           <div class="container">
	               <div class="row">
	                   <div class="box">
	                       <!-- 아이디 찾기 Form -->
	                       <div class="id-form">
	                           <form action="#">
	                               <h2>아이디 찾기</h2>
	                               <div class="group-input">
	                                   <label for="username">이름(국문)</label><br/>
	                                   <input type="text" id="username" name="name" placeholder="이름을 입력해주세요.">
	                               </div>
	                               <div class="group-input">
	                                   <label for="birth">생년월일</label><br/>
	                                   <input type="text" id="birth" name="birth" placeholder="생년월일을 입력해주세요.">
	                               </div>
	                               <div class="group-input">
	                                   <label for="email">이메일</label><br/>
	                                   <input type="text" id="email" name="email" placeholder="이메일을 입력해주세요.">
	                               </div>
	                               <input type = "button" id = "idfind" class="btn" value = "아이디 찾기"/>
	                           </form>
	                       </div>
	                       <!-- 비밀번호 찾기 Form -->
	                       <div class="pw-form">
	                           <form action="#">
	                               <h2>비밀번호 재발급</h2>
	                               <div class="group-input">
	                                   <label for="username2">아이디</label><br/>
	                                   <input type="text" id="userId" name="userId" placeholder="아이디를 입력해주세요.">
	                               </div>
	                               <div class="group-input">
	                                   <label for="email2">이메일</label><br/>
	                                   <input type="text" id="email2" name="email2" placeholder="이메일을 입력해주세요.">
	                               </div>
	                               <input type = "button" id = "pwfind" class="btn" value = "비밀번호 재발급"/>
	                           </form>
	                       </div>
	
	                   </div>
	               </div>
	           </div>
	       </div>
	       
	<footer class="footer-section">
		<jsp:include page="footer.jsp" flush="true" />
	</footer>
	
	
</body>
<script>
$('#idfind').click(function() {

	var user_name = $('input[name="name"]').val();
	var user_birth = $('input[name="birth"]').val();   
	var user_email = $('input[name="email"]').val();
	
	$.ajax({
		type:'POST',
		url : 'findid',
		data:{'user_name':user_name,
				'user_birth':user_birth, 
				'user_email':user_email},
		dataType : 'JSON',
		success : function (data) {
			if (data.success != '아이디없음') {
				alert('고객님의 아이디는 '+ data.success+'입니다.');
			}else{
				alert('입력하신 정보가 일치하지 않습니다. 다시 확인 후 입력바랍니다.');
			}
		},
		error : function (e) {
			console.log(e);
		}  
	});
 }); 
 
 
$('#pwfind').click(function() {

	var user_id = $('input[name="userId"]').val();
	var user_email = $('input[name="email2"]').val();
	console.log(user_id+'/'+user_email);
	
   	let ranValue1 = ['1','2','3','4','5','6','7','8','9','0'];
   	let ranValue2 = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
   	let ranValue3 = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
   	let ranValue4 = ['!','@','#','$','%','^','&','*','(',')'];
   	
   	var temp_pw = "";
   	
   	for(i=0 ; i<2; i++) {
   		let ranPick1 = Math.floor(Math.random() * ranValue1.length);
   		let ranPick2 = Math.floor(Math.random() * ranValue2.length);
   		let ranPick3 = Math.floor(Math.random() * ranValue3.length);
   		let ranPick4 = Math.floor(Math.random() * ranValue4.length);
   		temp_pw = temp_pw + ranValue1[ranPick1] + ranValue2[ranPick2] + ranValue3[ranPick3] + ranValue4[ranPick4];
   	}
	
   	
	$.ajax({
		type:'POST',
		url : 'findpw',
		data:{'user_id':user_id,
				'user_email':user_email,
				'temp_pw':temp_pw},
		dataType : 'JSON',
		success : function (data) {
			if (data.success == '1') {
				alert('이메일로 인증번호를 발송했습니다.');
				
			}else{
				alert('입력하신 정보가 일치 하지 않습니다. 다시 확인 후 입력바랍니다.');
			}
		},
		error : function (e) {
			console.log(e);
		}  
	});


}); 
 

</script>
</html>