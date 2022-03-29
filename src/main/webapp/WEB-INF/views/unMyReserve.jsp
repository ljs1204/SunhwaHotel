<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src = "https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<style>
		table, th, td{
			border : 1px solid black;
			border-collapse: collapse;
			padding: 5px;
			width: 400px;
			height: 80px;
			background-color: beige;
		}			
	</style>
</head>
<body>
<h2>비 회원 예약조회</h2>
	<form action="beMyReserve" method="get">
	<table>
			<tr>
				<th>예약번호</th>
			<!-- 예약번호는 예약 히스토리 테이블에 있음  reserve -->
			<!-- .은 클래스/ #은 id  -->
				<td><input type="text" name="reserve_num" id = "reserve_num"/></td>
			</tr>
			<tr>
			<!--  비 회원 테이블 nonMember-->
				<th>이름(영문)</th>
				<td><input type="text" name="non_name_en" id = "non_name_en"/></td>
			</tr>			
			<tr>
				<th>이메일</th>
				<td><input type="text" name="non_email" id = "non_email"/></td>
			</tr>	
			<tr>			
				<th colspan="2">
					<input type="button" onclick="location.href='./'" value="취소"/>
					<button>확인</button>
				</th>
			</tr>
		</table>
		</form>
</body>
<script>	
/* 
 $('#submit_chk').click(function() {
	var reserve_num = $('#reserve_num').val();
	var non_name_en = $('#non_name_en').val();	
	var non_email = $('#non_email').val();	
	console.log(reserve_num+'/'+non_name_en +'/'+ non_email);

	$.ajax({
		type:'POST',
		url : 'beMyReserve',
		data:{'reserve_num':reserve_num,'non_name_en':non_name_en, 'non_email':non_email},
		dataType : 'JSON',
		success : function (data) {
			if (data.success = 1) {
				location.href = './unMyReserveDetail';
			}else{
				alert('일치하지 않는 정보가 있습니다. 재 확인 후 입력바랍니다. .');
			}
		},
		error : function (e) {
			console.log(e);
		}
	});
}); 	
*/
</script>
</html>