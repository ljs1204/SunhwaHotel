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
			width: 500px;
			height: 80px;
			background-color: beige;
		}
		#box{
			margin: 0 auto;
			width: 500px;
            min-width:500px;
            max-width: 50%;
            text-align:center;
		}
		input[type="text"]{
			width: 300px;
		}
		th{
			text-align: center !important;
		}
		button,input[type="button"]{
			background-color:black;
			color:white;
		}
			
	</style>
</head>
<body>
	<!-- 헤더 추가 -->
	<header class="site-header">
		<jsp:include page="header.jsp" flush="true" />
	</header>
	<!-- END head -->

	<div style="margin-top:200px;"></div>
	<div id="box">
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
			<tr>
			 		
			<tr>
				
				<th colspan="2" style="">
					<input type="button" onclick="location.href='./adminOrderList'" value="취소"/>
					<!--  <input class="btn" type="button" id = "submit" value="등록" />-->
					<button id = "submit">등록</button>
				</th>
			</tr>
		</table>
	</form>
	</div>
	<div style="margin-bottom:200px;"></div>
	
		<footer class="footer-section">
	<jsp:include page="footer.jsp" flush="true" />
	</footer>
	
	
</body>
<script>	
	
</script>
</html>