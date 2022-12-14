<%@page import="member.Member"%>
<%@page import="member.MemberDao"%>
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
			String id = request.getParameter("userID");
			String pwd = request.getParameter("userPWD");
			Member member = MemberDao.getInstance().getMemberinfo(id);
			
			if((!member.getUserID().equals(null)) && pwd.equals(member.getUserPassword())) { 
				session.setAttribute("userID", member.getUserID());
				response.addCookie(new Cookie("ID", member.getUserID()));
				response.addCookie(new Cookie("userName", member.getUserName())); %>
			<script type="text/javascript">
				alert('로그인 성공!');
				window.location.href = "../Main.jsp";
			</script>
		<%  } else if(!member.getUserID().equals(null)) {%>
			<script type="text/javascript">
				alert('비밀번호가 틀리셨습니다.\n다시한번 확인 부탁드립니다.');
				window.history.back();
			</script>
		<% 	} else { %>
			<script type="text/javascript">
				alert('등록되지 않은 아이디 입니다.');
				window.history.back();
			</script>
		<%	} %>
	</body>
</html>