<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
</head>
<body>
	<table>
		<tr>
			<th>상품번호</th>
			<td>${dto.product_num}</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${dto.product_name}</td>
		</tr>
		<tr>
			<th>가격</th>
			<td>${dto.product_price}</td>
		</tr>
		<tr>
		<c:if test="${photos.size()>0}">
		<tr>
			<th>사진</th>
			<td>
				<c:forEach items="${photos}" var="photo">
					<img src="/photo/${photo.newFileName}" width="250px"/><br/><br/>
				</c:forEach>				
			</td>
		</tr>
		</c:if>
			<th colspan="2">
				<input type="button" value="리스트" onclick="location.href='./writingForm'"/>
				<!-- <input type="button" value="삭제" onclick="location.href='./deleting?product_num=${dto.product_num}'"/> -->
			</th>			
		</tr>
	</table>
</body>
<script></script>
</html>