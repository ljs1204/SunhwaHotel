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
		}	
	</style>
</head>
<body>
	<h1>관리자 문의리스트</h1>
	<table>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일자</th>
			
		</tr>
		<c:forEach items="${list}" var="board">
			<tr>
				<td>${board.board_num}</td>
				<!--  <td><a href="detail?board_num=${board.board_num}">${board.board_title}</a></td>-->
				<td><a href="detail?board_num=${board.board_num}">${board.board_title}</a></td>
				<td>${board.mem_id}</td>
				<td>${board.reg_datetime}</td>
			</tr>
		</c:forEach>
	</table>
</body>
<script>

</script>
</html>