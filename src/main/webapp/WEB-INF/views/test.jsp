<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<style>
	body {
		margin: 10%;
	}
	
	.adnavi {
		
	}
	
	ul, li {
		list-style: none;
	}
	
	.adnavi {
		float: left;
		width: 100%;
		height: 700px;
	}
	
	.boardFrame {
		float: right;
		width: 1300px;
		margin-right: 15%;
	}
	
	table {
		width: 800px;
	}
	
	table, tr, td, th {
		border: solid black 1px;
		border-collapse: collapse;
	}
	
	#map {
		width: 30%;
		height: 400px;
		margin-bottom: 50px;
		float: right;
		margin-right: 500px;
	}
	
	table, tr, th, td {
		border: black 1px solid;
		border-collapse: collapse;
	}
	
	#infotable {
		width: 30%;
		float: left;
		width: 500px;
		height: 500px;
		margin-bottom: 50px;
		text-align: center;
	}
	
	th {
		background-color: rgb(214, 214, 214);
	}
	
	textarea {
		width: 800px;
		height: 100px;
		border: none;
		resize: none;
	}
	
	#navy {
		width: 100%;
		height: 100px;
		background-color: grey;
	}
	
	#foot {
		width: 100%;
		height: 100px;
		background-color: grey;
	}
	
	
</style>
</head>
<body>
	<h1>마이페이지</h1>
	<hr>
	<div class="adnavi">
		<br>
		<div class="row">
			<div class="col-2" style="height: 600px; border-right:1px solid rightgray;">
				<div class="list-group" id="list-tab" role="tablist">
					<a class="list-group-item list-group-item-action active" id="list-home-list" data-toggle="list" href="#list-home" role="tab" aria-controls="home">회원 등급 수정</a>
					<a class="list-group-item list-group-item-action" id="list-profile-list" data-toggle="list" href="#list-profile" role="tab" aria-controls="profile">회원 관리</a>
					<a class="list-group-item list-group-item-action" id="list-messages-list" data-toggle="list" href="#list-messages" role="tab" aria-controls="messages">글 관리</a>
					<a class="list-group-item list-group-item-action" id="list-settings-list" data-toggle="list" href="#list-settings" role="tab" aria-controls="settings">문의/신고 처리</a>
					<a class="list-group-item list-group-item-action" id="list-settings-list" data-toggle="list" href="#list-noticeWrite" role="tab" aria-controls="noticeWrite">공지 글쓰기</a>
					<a class="list-group-item list-group-item-action" id="list-settings-list" data-toggle="list" href="#list-boardWrite" role="tab" aria-controls="boardWrite">구내식당 글쓰기</a>


				</div>
			</div>
			<div class="col-10" style="width: 100%; height: auto;">
				<div class="tab-content" id="nav-tabContent">

					<!-- 회원 등급 수정 -->
					<div class="tab-pane fade show active" id="list-home" role="tabpanel" aria-labelledby="list-home-list">
						<table class="table" style="text-align: center;">
							<thead class="thead-dark">
								<tr>
									<th scope="col">회원 아이디</th>
									<th scope="col">닉네임</th>
									<th scope="col">회원등급</th>
									<th scope="col">업주 회원으로</th>
									<th scope="col">업주코드</th>
									<th scope="col">확정</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach items="${memResult}" var="admin">

									<tr>
										<th scope="row">${admin.mem_id }</th>
										<td>${admin.mem_nick }</td>
										<td>${admin.mem_grade }</td>
										<td>
											<input type="button" class="checkinfo" value="발급/취소">

										</td>

										<c:if test="${admin.mem_bcode ne null }">
											<td id="bcode">${admin.mem_bcode }</td>

										</c:if>
										<c:if test="${admin.mem_bcode eq null }">
											<td id="bcode"></td>
										</c:if>
										<td>
											<input class="agreeBtn" type="button" value="확정">
										</td>
									</tr>

								</c:forEach>
							</tbody>
						</table>

					</div>
					<!-- 회원 관리 -->
					<div class="tab-pane fade" id="list-profile" role="tabpanel" aria-labelledby="list-profile-list">
						<table class="table" style="text-align: center;">
							<thead class="thead-dark">
								<tr>
									<th scope="col">회원 아이디</th>
									<th scope="col">닉네임</th>
									<th scope="col">회원등급</th>
									<th scope="col">업주 회원으로</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach items="${memResult}" var="admin">

									<tr>
										<th scope="row">${admin.mem_id }</th>
										<td>${admin.mem_nick }</td>
										<td>${admin.mem_grade }</td>
										<td style="width: 15%"></td>
									</tr>

								</c:forEach>
							</tbody>
						</table>


					</div>

					<!-- 글 관리 -->
					<div class="tab-pane fade" id="list-messages" role="tabpanel" aria-labelledby="list-messages-list">
						<table class="table" style="text-align: center;">
							<thead class="thead-dark">
								<tr>
									<th scope="col">글제목(식당)</th>
									<th scope="col">글내용</th>
									<th scope="col">별점</th>
									<th scope="col">가격</th>
									<th scope="col">작성자 아이디</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach items="${cafeResult}" var="cafe">

									<tr>
										<th scope="row">${cafe.cafe_title }</th>
										<td>${cafe.cafe_content }</td>
										<td>${cafe.cafe_ratestaravg }</td>
										<td>${cafe.cafe_diet_price }</td>
										<td>${cafe.mem_id }</td>
									</tr>

								</c:forEach>
							</tbody>
						</table>
					</div>

					<!-- 문의/신고 처리 -->
					<div class="tab-pane fade" id="list-settings" role="tabpanel" aria-labelledby="list-qst-list">
						<table class="table" style="text-align: center;">
							<thead class="thead-dark">
								<tr>
									<th scope="col">글제목(식당)</th>
									<th scope="col">글내용</th>
									<th scope="col">작성시간</th>
									<th scope="col">작성자 아이디</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach items="${qstResult}" var="qst">

									<tr>
										<th scope="row">${qst.qst_title }</th>
										<td>
											<a href="qstDetail?qst_idx=${qst.qst_idx}">${qst.qst_content}</a>
										</td>
										<td>${qst.qst_posttime }</td>
										<td>${qst.mem_id }</td>
									</tr>

								</c:forEach>
							</tbody>
						</table>
					</div>

					<!-- 공지 글쓰기 -->
					<div class="tab-pane fade" id="list-noticeWrite" role="tabpanel" aria-labelledby="list-messages-list">

						<section style="width: 100%; height: auto;" class="container">
							<div style="width: 100%; height: auto;">
								<div>
									<h2>공지사항 작성하기</h2>
								</div>
								<div style="width: 100%; height: 3px;"></div>
								<div style="width: 100%; height: 3px; background-color: rgb(138, 138, 138); border: 1px solid transparent; border-radius: 20px 20px 20px 20px;"></div>
								<div style="width: 100%; height: 70px;"></div>

								<div style="display: flex;">
									<div style="width: 3%;"></div>
									<div style="width: 94%;">
										<div style="width: 100%; display: flex;">
											<!--식당명-->
											<div style="width: 40%;"></div>
											<!--목록-->
											<div style="width: 60%; text-align: right;">
												<input type="button" class="btn btn-dark" onclick="location.href='./noticeList'" value="목록">
											</div>
										</div>
										<div style="width: 100%; height: 3px;"></div>
										<div style="width: 100%; height: 3px; background-color: rgb(7, 7, 7); border: 1px solid transparent; border-radius: 20px 20px 20px 20px;"></div>
										<!--고객명 날짜 수정 삭제-->
										<div style="display: flex;">
											<div style="width: 2%;"></div>
											<div style="width: 10%;">
												<a name="mem_id">작성자</a>
												<input name="notice_idx" value="${noticeInfo.notice_idx}" style="display: none;" />
											</div>
											<div style="width: 50%;">
												<a>날짜</a>
											</div>
											<div style="text-align: right; width: 36%;"></div>
											<div style="width: 2%;"></div>
										</div>
										<div style="width: 100%; height: 30px;"></div>
									</div>
									<div style="width: 3%;"></div>
								</div>


								<div style="display: flex; width: 100%; height: auto;">
									<div style="width: 5%; height: auto;"></div>
									<div style="width: 90%; height: auto;">
										<form action="noticeWrite" method="post">
											<!--제목-->
											<div class="form-group input-group">
												<div class="input-group-prepend">
													<span class="input-group-text"> <a>제목</a>
													</span>
												</div>

												<div class="form-control" style="height: auto;">
													<input name="notice_title" class="form-control" type="text" value="" placeholder="제목을 입력해주세요" />
												</div>
											</div>


											<!--내용-->
											<div class="form-group input-group">
												<div class="input-group-prepend">
													<span class="input-group-text"> <a>내용</a>
													</span>
												</div>
												<div class="form-control" style="height: auto;">
													<textarea type="text" style="height: 190px;" class="form-control" placeholder="내용을 입력해주세요" id="comment" name="comment" cols="45" rows="8" required=""></textarea>
												</div>
											</div>
											<div style="width: 100%; height: 15px;"></div>


											<!-- 제출 버튼-->
											<div class="form-group">
												<button type="submit" class="btn btn-primary btn-block">저장</button>
											</div>


										</form>
									</div>
									<div style="width: 5%; height: auto;"></div>
								</div>
								<div style="width: 100%; height: 60px;"></div>


							</div>
							<div style="width: 100%; height: 100px;"></div>
						</section>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>