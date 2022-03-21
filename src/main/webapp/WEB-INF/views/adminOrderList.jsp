<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
    <style>
		table, th, td{
			border : 1px solid black;
			border-collapse: collapse;
			padding: 5px;
			width: 900px;
			height: 120px;
		}
		
    </style>
</head>
<body>
	<!--   <div class = "one">		
			<img src="resources/mileage/인형.png" width = "90" height="80">
			<img src="resources/mileage/타올.png" width = "90" height="80">
			<img src="resources/mileage/디저트.png" width = "90" height="80">
			<img src="resources/mileage/와인.png" width = "90" height="80">
		</div>	
	 -->	
	<h2>마일리지 상품 리스트</h2>
	<button onclick="location.href= 'writingForm'">상품등록</button>
	<table>
    <tr>
    	<th>이미지</th>
        <th>상품번호</th>   
        <th>이름</th>
        <th>가격</th>
    </tr>	
    	<c:if test="${adOrderList eq null || size == 0}">
				<tr>
					<td colspan="9">등록된 글이 없습니다.</td>
				</tr>
		</c:if>		
			<c:forEach items="${adOrderList}" var="adOrderList">
		<!-- 	<fmt:parseNumber type="number" var = "baekyuna" value="${adOrderList.product_price}" /> -->
			<tr>
				<td>${adOrderList.product_img}</td>
				<td>${adOrderList.product_num}</td>
				<td>${adOrderList.product_name}</td>
				<td>${adOrderList.product_price}</td>					
			</tr>	
			</c:forEach>
		</table>	
	
</body>
<script>
</script>
</html>