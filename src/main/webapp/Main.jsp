<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style type="text/css">
			#mainImg {
				display: block;
				margin: 0 auto 20px;
				width: 700px;
			}
			
			#btn-wrap {
				margin: 20px auto 10px auto;
				width: 100%;
				text-align: center;
				display: flex;
				justify-content: center;
			}
		
			#btnSignUp, #btnLogin, #btnMemberList {
				padding: 7px 30px;
				color: #FFFFFF;
				background-color: #333;
				cursor: pointer;
				margin: 5px 10px;
				display: block;
			}
		</style>
	</head>
	<body>
		<h1 style="margin: 20px 0 10px; text-align: center;">MAIN PAGE</h1><hr><br><br>
		<img id="mainImg" alt="MainPage Image" src="./image/back1.jpg">
		
		<div id="btn-wrap">
			<input type="button" value="회원가입" id="btnSignUp">
			<input type="button" value="로그인" id="btnLogin">
			<input type="button" value="회원목록" id="btnMemberList">
		</div>
		
		<script type="text/javascript">
			window.onload = function () {
				
				<% session = request.getSession(); %>
				
				<% if(session.getAttribute("userID") == null) { %>
					btnSignUp.style.display = 'block';
					btnLogin.value = "로그인";
				<% } else { %>
					btnSignUp.style.display = 'none';
					btnLogin.value = "로그아웃";
				<% } %>
				
				btnSignUp.addEventListener("click", ()=> {
					window.location.href = "./Views/signup.jsp";
				});
				
				btnLogin.addEventListener("click", ()=> {
					if(btnLogin.value == "로그인") {
						window.location.href = "./Views/login.jsp";
					}else {
						window.location.href = "./Views/logout.jsp";
					}
				});
				
				btnMemberList.addEventListener("click", ()=> {
					if(btnLogin.value == "로그인") {
						alert('권한이 없습니다. 로그인을 하세요.');
						window.location.href = "./Views/login.jsp";
					}else {
						window.location.href = "./Views/memberlist.jsp";
					}
				});
			}
		</script>
	</body>
</html>