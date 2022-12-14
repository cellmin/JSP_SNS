<%@page import="reply.ReplyDao"%>
<%@page import="reply.Reply"%>
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
			String userID = String.valueOf(request.getSession().getAttribute("userID"));
			String replytxt = request.getParameter("replyTxt").replaceAll("\"", "\\\"");
			Reply reply = new Reply();
			
			reply.setBoardID(request.getParameter("boardID"));
			reply.setUserID(userID);
			reply.setReplyTxt(replytxt);
			
			if(ReplyDao.getInstance().insertReply(reply)) { %>
				<script type="text/javascript">
					alert('등록이 완료되었습니다.');
					window.location.href = "../Views/replylist.jsp?boardID=<%= reply.getBoardID() %>"
				</script>
		<%	} else { %>
				<script type="text/javascript">
					alert('등록에 실패하였습니다.');
					window.history.back();
				</script>
		<%	} %>
	</body>
</html>



