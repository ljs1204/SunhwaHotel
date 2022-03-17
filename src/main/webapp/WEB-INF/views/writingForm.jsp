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
<h2>마일리지 상품 등록</h2>
	<form action="writing" method="POST" enctype="multipart/form-data">
		<table>
			<tr>
				<th>상품번호</th>
				<td><input type="text" name="product_num"/></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="product_name"/></td>
			</tr>			
			<tr>
				<th>가격</th>
				<td><input type="text" name="product_price"/></td>
			</tr>
			<tr>
				<th>사진</th>
				<td><input type="file" name="photos" multiple="multiple"/></td>
			</tr>			
			<tr>
				<tr>
				<th colspan="2">
					<input type="submit" value="등록"/>
					<input type="button" onclick="location.href='./adminOrderList'" value="취소"/>
				</th>
			</tr>
		</table>
	</form>
</body>
<script>	
//	var photocnt = 0;
	
//	$('button').hide();
	
//	$('#open').click(function(){
//		   win = window.open('groupBuyPhoto2','','width=700,height=700'); //주소값,창이름,옵션	
//		});
	
	$('#submit').click(function(){
		if($('input[name="product_num"]').val() == ''){
			alert('상품번호를 입력하세요.');
		}
		else if($('input[name="product_name"]').val() == ''){
			alert('이름을 입력하세요.');
		}
		else if($('input[name="product_price"]').val() == ''){
			alert('가격을 입력하세요.');
		}else{
			alert('작성이 완료되었습니다.');
			document.getElementsByTagName('button')[0].click();
			
		}
	});

</script>
</html>