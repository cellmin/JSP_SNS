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
        <title>Member List</title>
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
           	
           	#contents tr>td:nth-child(2) > a{
                text-decoration: none;
                color: black;
            } 
            
            #contents tr>td:nth-child(4) > a{
            	text-decoration: none;
                color: black;
                font-size: 14px;
                border: 1px solid black;
                padding: 2px 5px;
                cursor: pointer;
                background-color: lightgray;
            }
            
			#btn2Main {
                padding: 5px 10px;
                background-color: lightgray;
                border: 1px solid gray;
                cursor: pointer;
                font-weight: bold;
            }

            span {
                font-size: 14px;
            }
        </style>
    </head>
    <body>
        <h1>회원목록</h1>
        <hr>
        <table id="contents">
            <tr>
                <th>번 호</th>
                <th>아이디</th>
                <th>이 름</th>
                <th>댓 글</th>
            </tr>
            <% 
            	request.setCharacterEncoding("UTF-8");
            	List<Member> members = MemberDao.getInstance().getMemberList();
            
            	if(members.isEmpty()) { %>
                <tr>
                    <td colspan="4"><span>저장된 데이터가 없습니다.</span></td>
                </tr>
            <% 	} %>

            <% 	for(Member member : members) { %>
                <tr>
                    <td>
                        <%= member.getIdx() %>
                    </td>
                    <td>
                        <a href="../Views/replylist.jsp?boardID=<%= member.getUserID() %>"><%= member.getUserID() %></a>
                    </td>
                    <td>
                        <%= member.getUserName() %>
                    </td>
                    <td>
                    	<a href="../Views/replylist.jsp?boardID=<%= member.getUserID() %>">댓 글</a>
                    </td>
                </tr>
            <% } %>
            	<tr>
	                <td colspan="4">
	                    <input type="button" value="메인으로" id="btn2Main">
	                </td>
	            </tr>
        </table>
        
        <script type="text/javascript">
        	window.onload = function() {
				
        		btn2Main.onclick = function() {
        			window.location.href = "../Main.jsp";
				}
        		
			}
        </script>
    </body>
</html>