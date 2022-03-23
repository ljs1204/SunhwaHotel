<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<th>아이디</th>
			<th>이름(한글)</th>
			<th>이름(영문)</th>
			<th>생년월일</th>
			<th>이메일</th>
			<th>회원등급</th>
		</tr>
		<c:forEach items="${memlist}" var="memlist">
			<tr>
				<td>${memlist.mem_id}</td>
				<td>${memlist.mem_name_kr}</td>
				<td>${memlist.mem_name_en}</td>
				<td>${memlist.mem_birth}</td>
				<td>${memlist.mem_email}</td>
				<td>${memlist.mem_grade}</td>
			</tr>
		</c:forEach>
	</table>
<form name="search" action="search">
 
    <select name ="select">
    	<option value="mem_id">아이디</option>
    	<option value="mem_name_kr">이름(한글)</option>
    	<option value="mem_name_en">이름(영어)</option>
    	<option value="mem_birth">생년월일</option>
    </select> 
    <input type ="text" name ="keyword">
    <input type ="submit" value="검색">
  
</form>
	

</body>
</html>
