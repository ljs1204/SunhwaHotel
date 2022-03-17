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
			margin-left: auto;
	        margin-right: auto;
	        font-size : 15pt;
			
   		 }	
</style>
</head>
<body>
	<table>
		<tr>
			<th>글번호</th>
			<td>${tomemberboarddetail.board_num}</td>
		</tr>
		<tr>
			<th>작성일자</th>
			<td>${tomemberboarddetail.reg_datetime}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${tomemberboarddetail.mem_id}</td>
		</tr>		
		<tr>
			<th>제목</th>
			<td>${tomemberboarddetail.board_title}</td>			
		</tr>
		<tr>
			<th>내용</th>
			<td>${tomemberboarddetail.board_content}</td>
		<!-- <td><textarea name="board_content"				
			style= "width:500px;height:200px;font-size:12px;" 
			placeholder="내용을 입력해주세요."></textarea></td>	-->		
						
		</tr>
	</table>
</body>
<script>

//삭제 관련 내용 
// var msg="${msg}";

//if(msg != ""){
//	alert(msg);
 //}
</script>
</html>