<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("UTF-8");
			session.removeAttribute("userID");
			Cookie[] cookies = request.getCookies();
			for(Cookie cookie : cookies) {
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
		%>
		<script type="text/javascript">
			alert('로그아웃 하셨습니다.');
			window.location.href = "../Main.jsp";
		</script>
	</body>
</html>