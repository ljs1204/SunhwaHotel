<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src = "https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<style>
		 table{
	         margin-left: auto;
	         margin-right: auto;
	         font-size : 15pt;
   		 }	
</style>
</head>
<body>
	<!-- <form action="update" method="post"> -->	
	<h1 style="text-align:center;">회원정보수정</h1>
	<h4 style="text-align:center;">※비밀번호는 공백없이 8자 이상, 특수문자 + 영문 + 숫자 조합으로 입력 바랍니다.</h4>
		<table>
			<tr>
				<th>아이디</th>
				<td>
				${myProfile.mem_id}
				<input type="hidden" name="id" value="${myProfile.mem_id}"/>
				</td>
			</tr>
			<tr>
				<th>비밀번호 변경</th>
				<td><input class="pwconfirmSet"  id="inputPassword" type="password" name="pw" value="${myProfile.mem_pw}"/></td>
			</tr>
			<tr>
				<th rowspan="2">비밀번호 확인</th>
				<td><input class="pwconfirmSet" id="inputPasswordCheck" type="password" name="pwConfirm"  value="${myProfile.mem_pw}"/>
				<input type="button" id="ps_submit" value="확인"/>
				</td>
			</tr>
			<tr>
				<td id="confirm">				
				</td>				
			</tr>	
			<tr>
				<th>이름(한글)</th>
				<td> 
				${myProfile.mem_name_kr}
				<input type="hidden" name="mem_name_kr" value="${myProfile.mem_name_kr}"/>
				</td>
			</tr>
			<tr>
				<th>이름(영문)</th>
				<td>
				${myProfile.mem_name_en}
				<input type="hidden" name="mem_name_en" value="${myProfile.mem_name_en}"/>
				</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>
				${myProfile.mem_birth}
				<input type="hidden" name="mem_birth" value="${myProfile.mem_birth}"/>
				</td>
			</tr>			
			<tr>
				<th>휴대폰번호</th>
				<td><input type="text" name="phone" value="${myProfile.mem_phone}"/></td>
			</tr>
			<tr>
				<th>이메일주소</th>
				<td>
					<input type="text" name="email" value="${myProfile.mem_email}"/>
					<input type="button" id="indetify" value="인증"/>
				</td>
			</tr>	
			<tr>
				<th>
				</th>
				<td>
					<input type="hidden" id="emailIdnum" value=""/>
					<input type="hidden" id="emailIdbtn" value="확인"/>				
				</td>		
			</tr>
			<tr>
				<th colspan="2">
					<input type="button" id="submit" value="저장"/>
				</th>		
			</tr>
		</table>
</body>
<script>   
// 2022-03-11 백유나 비밀번호 조건 START   
	$(function(){

		$('#ps_submit').on('click',function(){
			
			var pw = $('#inputPassword').val();
		    var num = pw.search(/[0-9]/g);
		    var eng = pw.search(/[a-z]/ig);
		    var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
			
			pw = $('input[name="pw"]').val();
			pwConfirm = $('input[name="pwConfirm"]').val();	
	 		
	 		if(pw.length<8){
	 			alert('비밀번호는 8자 이상으로 작성바랍니다.');
	 		}else if(num < 0 || eng < 0 || spe < 0 ){
	 			alert('비밀번호는 영문,숫자,특수문자 조합으로 입력바랍니다.');
	 		}else if(pw!=pwConfirm){
	 			alert('비밀번호가 일치 하지 않습니다.');
		   	}else {
			   alert('이 비밀번호는 사용가능합니다.');
		   }
		});
	});
// 2022-03-11 백유나 비밀번호 조건 END
	var pw = '';
	var pwConfirm = '';
	var pw_check = 'T';
    var certifinum = null;
    var certifinum_check = false;
    
    random();
    
    function random(){
        // clearInterval(time);
        //var cnt = 11;
        
        console.log('난수번호');
        randomNum = Math.floor(Math.random()*1000000);
        certifinum = randomNum;
    };

	$('#indetify').click(function(){
		console.log('중복 체크시작');
		var email = $('input[name="email"]').val();
		console.log('check email : ',email);
		
		$.ajax({
			type:'get',
			url :'overlayemail',
			data:{'email':email},
			dataType:'json',
			success:function(data){
				console.log(data);
							
				
				if(data.emailTF){
					alert('이미 사용중인 이메일주소 입니다.');

				} else{
					alert('메일로 인증번호를 전송했습니다.');
					$('#emailIdnum').attr('type','text');
					$('#emailIdbtn').attr('type','button');
					random();
					
					
					win = window.open('emailPage','최신식 구글 메일','width=800,height=600');
				}

			},
			error:function(e){
				console.log('에러...');
				console.log(e);	
			}
		});		
	});
	
	
	$('#emailIdbtn').click(function(){
		$('#emailIdnum').val();
		if($('#emailIdnum').val() == certifinum){
			certifinum_check = true;
			alert('이메일 인증을 성공하였습니다.');
			$('#emailIdnum').attr('type','hidden');
			$('#emailIdbtn').attr('type','hidden');

		} else {
			certifinum_check = false;
			alert('인증번호 확인 후 재 입력 바랍니다.');
		}		
	});
	
	//이메일 값이 한번이라도 바뀌면, 체크를 false로
	$('input[name="email"]').keyup(function(e){
		certifinum_check = false;
	});	
	

	$('#submit').click(function(){
		//var pw = '';
		//var pwConfirm = '';		
		var $id = $('input[name="id"]');
		var $pw = $('input[name="pw"]');
		var $phone = $('input[name="phone"]');
		var $email = $('input[name="email"]');
		
		if(pw_check == 'F'){
			alert('비밀번호 확인을 해주세요');
			$pw.focus();						
		} else if($phone.val() == ''){
			alert('휴대폰 번호를 입력 해주세요');
			$name.focus();			
		} else if($email.val() == ''){
			alert('이메일 주소를 입력 해주세요');
			$name.focus();			
		} else if(!certifinum_check){
			alert('메일 인증을 진행해주세요 ');
		} else{
			var userupdate = {};
			userupdate.mem_id = $id.val();
			userupdate.mem_pw = $pw.val();
			userupdate.mem_phone = $phone.val();
			userupdate.mem_email = $email.val();
			console.log(userupdate);
			
	 	
			$.ajax({
				type:'get',
				url :'profileupdate',
				data : userupdate,
				dataType:'json',
				success:function(data){
					console.log(data);
					if(data.success >0 ){
						alert('회원 정보 수정이 완료되었습니다.');						
					}
				},
				error:function(e){
					
				}
			});
		 
		}
		
	
	});
	
	
	
	



</script>
</html>