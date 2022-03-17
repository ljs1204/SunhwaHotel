<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>SeonhwaHotel login</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<style>
			.row {
                display: flex;
                flex-wrap: wrap;
                margin-right: -15px;
                margin-left: -15px;
            }

            .box{
				margin: 0 auto;
                min-width: 600px;
                max-width: 50%;
            }

            .register-login-section {
                padding-top: 200px;
                padding-bottom: 80px;
            }
            .register-form form .group-input input, .login-form form .group-input input {
                border: 1px solid #ebebeb;
                height: 50px;
                width: 100%;
            }
            .forget {
                line-height: 20px;
                margin-top: 10px;
                margin-right: 10px;
                margin-bottom: 10px;
                font-size: 14px;
                color: #6B6B6B;
                float:right;
            }
            .btn{
                margin-top: 10px;
                color: #ffffff;
                background: black;
                font-size: 14px;
                font-weight: 700;
                text-transform: uppercase;
                padding: 13px 45px 11px;
                cursor: pointer;
                width: 600px;
            }
            h2{
                text-align: center;
                margin-bottom: 10px; 
            }
		
	</style>
</head>
<body>
	<header class="site-header">
		<jsp:include page="header.jsp" flush="true" />
	</header>
	
	<div class="register-login-section spad">
        <div class="container">
            <div class="row">
                <div class="box">
                    <div class="login-form">
                        <h2>Seonhwa Hotel Login</h2>
                        <form action="login" method="post">
                            <div class="group-input">
                                <label for="userId">아이디</label>
                                <input type="text" name="userId" id="userId">
                            </div>
                            <div class="group-input">
                                <label for="pass">비밀번호</label>
                                <input type="password" name="userPw" id="userPw">
                            </div>
                            <div class="gi-more">
                                <a href="./findIdPw" class="forget">아이디 및 비밀번호 찾기</a>
                            </div>
                            <button type="submit" class="btn">로그인</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
	<footer class="footer-section">
		<jsp:include page="footer.jsp" flush="true" />
	</footer>
	

</body>
<script>
	var msg="${msg}";
	
	if(msg != ""){
	    alert(msg);
	}
</script>
</html>