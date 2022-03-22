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
	<form action="writing" method="post" enctype="multipart/form-data">
	<!--  <form action="writing" method="post"> -->
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
			<!-- <tr>
			 	<th>사진</th>
				<td><input type="file" name="photos" multiple="multiple"/></td>
			</tr>	
			 -->		
			<tr>
				
				<th colspan="2">
					<input type="button" onclick="location.href='./adminOrderList'" value="취소"/>
					<!--  <input class="btn" type="button" id = "submit" value="등록" />-->
					<button id = "submit">등록</button>
				</th>
			</tr>
		</table>
	</form>
</body>
<script>	
	
</script>
</html>