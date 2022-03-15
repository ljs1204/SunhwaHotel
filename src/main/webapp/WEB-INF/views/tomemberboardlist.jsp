<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<button onclick="location.href='writeForm'">글쓰기</button>
	<table>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
		
		
		<c:forEach items="${tomemberboardlist}" var="tomemberboardlist">
			<tr>
				<td>${tomemberboardlist.board_num}</td>
				<td><a href="detail?board_num=${tomemberboardlist.board_num}">${tomemberboardlist.board_title}</a></td>
				<td>${tomemberboardlist.mem_id}</td>
				<td>${tomemberboardlist.reg_datetime}</td>
			</tr>
			</c:forEach>
	</table>
</body>
</html>