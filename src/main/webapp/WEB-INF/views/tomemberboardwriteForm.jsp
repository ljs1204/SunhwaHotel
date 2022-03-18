<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<style>
		 table{
	         margin-left: auto;
	         margin-right: auto;
	         font-size : 15pt;
   		 }	
	
	</style>
</head>
<body>
	<form action="tomemberboardwrite" method="POST">
		<h2 style="text-align:center;">고객 문의 글쓰기 </h2>
		<table>	
			<tr>
				<th>아이디</th>
				<td>
				<input type="text" name="mem_id" value=${loginId} readonly> 
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="board_title" 
				style= "width:500px;height:30px;font-size:12px;"/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="board_content"				
				style= "width:500px;height:200px;font-size:12px;"/></textarea></td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="등록"/>
					<!-- <input type="submit" onclick="location.href='./list'" value="등록"/> -->
					<input type="button" onclick="location.href='./tomemberboardlist.jsp'" value="취소"/>
				</th>
			</tr>
		</table>
	</form>
</body>
<script>
</script>
</html>
