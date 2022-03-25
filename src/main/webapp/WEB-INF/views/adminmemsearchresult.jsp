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
<from>
<body>
	<table>
		<tr>
			<th>아이디</th>
			<th>이름(한글)</th>
			<th>이름(영문)</th>
			<th>생년월일</th>
			<th>이메일</th>
			<th>회원등급</th>
			<th>마일리지 내역</th>
		</tr>
		<c:forEach items="${memlist}" var="memlist">
			<tr>
				<td>${memlist.mem_id}</td>
				<td>${memlist.mem_name_kr}</td>
				<td>${memlist.mem_name_en}</td>
				<td>${memlist.mem_birth}</td>
				<td>${memlist.mem_email}</td>
				<td>${memlist.mem_grade}</td>
				<td><button onclick="location.href='adminmilesearch?mem_id=${memlist.mem_id}'">마일리지내역조회</button></td>
			</tr>
		</c:forEach>
	</table>
</from>	

</body>
</html>
<script>
var userId = "${sessionScope.loginId}";
console.log(userId);
if (userId == "") {
	console.log(userId);
	location.href="logout";
}


var grade = "${sessionScope.grade}";
console.log(grade);
if (grade != "admin") {
	console.log(grade);
	location.href="logout";
}
</script>