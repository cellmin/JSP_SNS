<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>로그인</title>
        <style type="text/css">
        	a, input[type=button], input[type=reset] {
        		cursor: pointer;
        		text-decoration: none;
        	}
        	#login-wrap {
        		margin: 20px auto 10px auto;
        		text-align: center;
        		padding: 20px;
        	}
        	h1 {
        		border-bottom: 1px solid black;
        	}
        	#login_box {
        		padding-top: 50px;
        		width: 500px;
        		margin: 0 auto;
        		text-align: center;
        	}
        	#login_box > input[type=text],
        	#login_box > input[type=password] {
        		width: 300px;	
        		height: 30px;
        		margin-bottom: 10px;
        	}
        	#btnSignUp, #btnReset {
        		margin-top: 20px;
        		padding: 5px 20px;
        		background-color: #333;
        		color: #FFFFFF;
        	}
        	#others {
        		list-style: none;
        		display: flex;
        		justify-content: center;
        		padding-right: 30px;
        	}
        	#others>li {
        		padding: 5px 0;
        	}
        	#others>li>a {
        		padding: 0 15px;
        		color: #000;
        	}
        	#others>li:first-child>a {
				border-right: 2px solid lightgray;
			}
        </style>
    </head>
    <body>
        <div id="login-wrap">
            <h1>로그인</h1>
            <form id="login_box" method="post" action="../Views/loginresult.jsp">
                <input type="text" name="userID" id="userID" placeholder="아이디"><br>
                <input type="password" name="userPWD" id="userPWD" placeholder="비밀번호"><br>
                <input type="reset" id="btnReset" value="다시입력">
                <input type="button" id="btnSignUp" value="로그인">
                <ul id="others">
	            	<li><a href="./../Main.jsp">처음으로</a></li>
	            	<li><a href="./signup.jsp">회원가입</a></li>
	            </ul>
            </form>
        </div>

        <script>
            window.onload = function() {

            	btnSignUp.onclick = function() {
            		if(!userID.value.trim()) {
                        alert('아이디를 입력하세요.');
                        userID.value = "";
                        return;
                    } else if(!userPWD.value.trim()) {
                        alert('비밀번호를 입력하세요.');
                        userPWD.value = "";
                        return;
                    } else if(window.confirm('로그인 하시겠습니까?')) {
                    	login_box.submit();
                    }
                };
            };
        </script>
    </body>
</html>