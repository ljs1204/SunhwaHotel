<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<input type="button" onclick="location.href='./tomemberboardwriteForm'" value="글쓰기"/>	<table>
	<h1 style="text-align:center;">문의 게시판</h1>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
		
		
		<c:forEach items="${tomemberboardlist}" var="tomemberboardlist">
			<tr>
				<td>${tomemberboardlist.board_num}</td>
				<td><a href="tomemberboarddetail?board_num=${tomemberboardlist.board_num}">${tomemberboardlist.board_title}</a></td>
				<td>${tomemberboardlist.mem_id}</td>
				<td>${tomemberboardlist.reg_datetime}</td>
			</tr>
			
			</c:forEach>
	</table>
</body>
</html>