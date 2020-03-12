<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<회원가입 페이지>



<form action="/joinProc" method=post>
	
		<input type="text" id="email" name="email" placeholder="이메일 입력" required>
		<input type="password" id="pwd" name="pwd" placeholder="비밀번호 입력" required>
		<input type="password" id="pwd2" name="pwd2" placeholder="비밀번호 재입력" required>
		<input type="text" id="nickname" name="nickname" placeholder="닉네임 입력" required>
		<input type="text" id="phone" name="phone" placeholder="EX 010-1234-5678" required>
		
		<button type="submit">가입</button>
		
</form>

</body>
</html>