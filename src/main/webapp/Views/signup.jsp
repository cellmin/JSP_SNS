<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>회원가입</title>
        <style type="text/css">
        	#signup-wrap {
        		margin: 20px auto 10px auto;
        		text-align: center;
        		padding: 20px;
        	}
        	#signup_box {
        		border-top: 1px solid black;
        		padding-top: 50px;
        	}
        	#signup_box > input[type=text],
        	#signup_box > input[type=password] {
        		width: 300px;	
        		height: 30px;
        		margin-bottom: 10px;
        	}
        	#btnSignUp, #btn2Main {
        		margin-top: 20px;
        		padding: 5px 20px;
        		background-color: #333;
        		color: #FFFFFF;
        		cursor: pointer;
        	}
        </style>
    </head>
    <body>
        <div id="signup-wrap">
            <h1>회원가입</h1>
            <form id="signup_box" method="post" action="../Views/signupResult.jsp">
                <input type="text" name="userID" id="userID" placeholder="아이디"><br>
                <input type="text" name="userName" id="userName" placeholder="이름"><br>
                <input type="password" name="userPWD" id="userPWD" placeholder="비밀번호"><br>
                <input type="button" id="btn2Main" value="처음으로">
                <input type="button" id="btnSignUp" value="회원가입">
            </form>
        </div>

        <script>
            window.onload = function() {

            	btnSignUp.onclick = function() {
                    if(!userID.value.trim()) {
                        alert('아이디를 입력하세요.');
                        userID.value = "";
                        return;
                    } else if(!userName.value.trim()) {
                    	alert('이름을 입력하세요.');
                    	userName.value = "";
                    	return;
                    } else if(!userPWD.value.trim()) {
                        alert('비밀번호를 입력하세요.');
                        userPWD.value = "";
                        return;
                    } else if(window.confirm('회원가입을 하시겠습니까?')) {
                    	signup_box.submit();
                    }
                };
                
                btn2Main.onclick = function() {
					window.location.href = "../Main.jsp";
				}
            };
        </script>
    </body>
</html>