<%@page import="reply.ReplyDao"%>
<%@page import="reply.Reply"%>
<%@page import="member.Member"%>
<%@page import="member.MemberDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Reply List</title>
        <style>
            *, html, body {margin: 0;padding: 0; box-sizing: border-box;}

            h1 {
                margin: 20px auto 10px auto;
                text-align: center;
            }

            #contents {
                margin: 0 auto;
                margin-top: 20px;
                border-collapse: collapse;
            }

            #contents tr>th,
            #contents tr>td {
                padding: 7px 20px;
                text-align: center;
            }

            #contents tr>td {
                border-top: 1px solid lightgray;
                border-bottom: 1px solid lightgray;
            }

            #contents tr:nth-child(1) {
                border-top: 3px solid black;
                border-bottom: 2px solid black;
            }

            #contents tr:last-child>td {
                border-bottom: 3px solid black;
            }

            #contents tr:first-child td {
                text-align: right;
                padding-right: 20px;
            }
            
            #txt>p {
            	padding: 5px;
			    width: 100%;
			    text-align: left;
			    white-space: pre-wrap;
            }

            a {
                text-decoration: none;
                color: black;
                font-size: 14px;
                border: 1px solid black;
                padding: 2px 5px;
                cursor: pointer;
            }
            
            #contents tr>td:nth-child(5) > a{
                background-color: lightgray;
            }
            
            #btn_wrap {
            	display: flex;
            	justify-content: center;
            }
            
            #replyTxt {
            	padding: 5px;
            	width: 700px;
            	height: 70px;
            	border: 1px solid black;
            	cursor: pointer;
            	display: block;
            	margin-right: 10px;
            	margin-left: 20px;
            	resize: none;
            	cursor: text;
            }
            
			#btn2MemberList, #btnReply {
				display: block;
                padding: 5px 40px;
                background-color: lightgray;
                border: 1px solid gray;
                cursor: pointer;
                font-weight: bold;
            }
            
            #btn2MemberList {
            	margin: auto;
            }

            span {
                font-size: 14px;
            }
        </style>
    </head>
    <body>
        <h1>댓글목록</h1>
        <hr>
        <table id="contents">
        	<colgroup>
        		<col width = "100px">
        		<col width = "120px">
        		<col width = "120px">
        		<col width = "500px">
        	</colgroup>
        	
            <tr>
                <th>번 호</th>
                <th>글쓴이</th>
                <th>대 상</th>
                <th>내 용</th>
            </tr>
            <% 
            	request.setCharacterEncoding("UTF-8");
            	String boardID = request.getParameter("boardID");
            	List<Reply> replies = ReplyDao.getInstance().getReplies(boardID);
            	int cnt = replies.size();
            
            	if(replies.isEmpty()) { %>
                <tr>
                    <td colspan="4"><span>저장된 데이터가 없습니다.</span></td>
                </tr>
            <% 	} %>

            <% 	for(Reply reply : replies) { %>
                <tr>
                    <td>
                        <%= cnt-- %>
                    </td>
                    <td>
                        <%= reply.getUserID() %>
                    </td>
					<td>
                        <%= reply.getBoardID() %>
                    </td>
                    <td id="txt">
                        <p><%= reply.getReplyTxt() %></p>
                    </td>
                </tr>
            <% } %>
            	<tr>
	                <td colspan="4">
	                	<form id="btn_wrap" method="post" action="../Views/reply.jsp">
	                		<input type="hidden" name="boardID" value="<%= boardID %>">
		                	<textarea id="replyTxt" name="replyTxt"></textarea>
		                    <input type="button" value="등 록" id="btnReply">
		                </form>
	                </td>
	            </tr>
            	<tr>
	                <td colspan="4">
	                    <input type="button" value="회원목록으로" id="btn2MemberList">
	                </td>
	            </tr>
        </table>
        
        <script type="text/javascript">
        	window.onload = function() {
        		
        		btnReply.onclick = function() {
        			if(window.confirm('댓글을 등록하시겠습니까?')) {
        				btn_wrap.submit();
        			}
				}
				
        		btn2MemberList.onclick = function() {
        			window.location.href = "../Views/memberlist.jsp";
				}
        		
			}
        </script>
    </body>
</html>