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
			width: 400px;
			height: 80px;
			background-color: beige;
		}	
	 	.btn{
	 		background-color: white;
			color: black;
	 	}		
	</style>
</head>
<body>
<h2>마일리지 상품 등록</h2>
	<form action="writing" method="POST" enctype="multipart/form-data"> 
	<!--	<form action="writingFormDetail" method="POST" enctype="multipart/form-data">-->
		<table>
			<tr>
				<th>상품번호</th>
				<td><input type="text" name="product_num"/></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="product_name"/></td>
			</tr>			
			<tr>
				<th>가격</th>
				<td><input type="text" name="product_price"/></td>
			</tr>
			<tr>
				<th>사진</th>
				<td><input type="file" name="photos" multiple="multiple"/></td>
			</tr>			
			<tr>
				<tr>
				<th colspan="2">
					<input class="btn" type="button" id = "submit" value="등록"/>
					<input type="button" onclick="location.href='./adminOrderList'" value="취소"/>
				</th>
			</tr>
		</table>
	</form>
</body>
<script>		
	$('#submit').click(function(){

		var $product_num = $('input[name="product_num"]');
		var $product_name = $('input[name="product_name"]');
		var $product_price = $('input[name="product_price"]');
	
		if($('input[name="product_num"]').val() == ''){
			alert('상품번호를 입력하세요.');
		}
		else if($('input[name="product_name"]').val() == ''){
			alert('이름을 입력하세요.');
		}
		else if($('input[name="product_price"]').val() == ''){
			alert('가격을 입력하세요.');
		}else{
			var userupdate = {};
			userupdate.product_num = $product_num.val();
			userupdate.product_name = $product_name.val();
			userupdate.product_price = $product_price.val();
			console.log(userupdate);
				 	
			$.ajax({
				type:'post',
				url :'writing',
				data : userupdate,
				dataType:'json',
				success:function(data){
					console.log(data);
					if(data.success >0 ){
						alert('저장이 완료되었습니다.');						
					}
				},
				error:function(e){
					
				}
			});
		}	
	});
	
</script>
</html>