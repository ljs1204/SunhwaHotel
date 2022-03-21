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
		}		
	</style>
</head>
<body>
	<form action="updating" method="post">
	<table>
    <tr>
    	<th>이미지</th>
        <th>상품번호</th>   
        <th>이름</th>
     	<th>가격</th>
     	<th>삭제</th>
    </tr>
    <!-- 	
    	<c:if test="${adOrderList eq null || size == 0}">
				<tr>
					<td colspan="9">등록된 글이 없습니다.</td>
				</tr>
		</c:if>	
	 -->		
			<c:forEach items="${adOrderList}" var="adOrderList">
			<tr>
			 	<td>${adOrderList.product_img}</td> 
				<td>${adOrderList.product_num}</td>
				<td>${adOrderList.product_name}</td>
				<td>${adOrderList.product_price}</td>	
				<td>{adOrderList.product_num}</a></td>				
			</tr>	
			</c:forEach>
		</table>
	</form>
</body>
</html>