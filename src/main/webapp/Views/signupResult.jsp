<%@page import="member.MemberDao"%>
<%@page import="member.Member"%>
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
			Member member = new Member();
			member.setUserID(request.getParameter("userID"));
			member.setUserName(request.getParameter("userName"));
			member.setUserPassword(request.getParameter("userPWD"));
			
			MemberDao memberdb = new MemberDao().getInstance();
			if(memberdb.isExistID(member)) { %>
			<script>
				alert("이미 존재하는 아이디 입니다.");
				window.history.back();
			</script>
		<%	} else if(memberdb.insertMember(member)) { %>
			<script>
				alert("회원가입이 완료되었습니다.");
				window.location.href = "../Main.jsp";
			</script>
		<%	} else { %>
			<script>
				alert("문제가 발생하였습니다.\n 죄송합니다.");
				window.location.href = "../Main.jsp";
			</script>
		<%	} %>
	</body>
</html>