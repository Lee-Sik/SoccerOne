<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
로그인을 하셔야 볼 수 있습니다.
<form action="loginjy.do" method="post">
<br><br><br><br><br><br><br><br><br><br><br><br><br>
<table >
<tr>
<td style="color: white">
아이디
</td>
<td >
<input type="text" name="user_email" size="20">
</td>
</tr>
<tr>
<td style="color: white">
비밀번호
</td>
<td>
<input type="password" name="user_pw" size="20">
</td>
</tr>
<tr>
<td colspan="2">
<input type="submit" value="로그인">
<input type="button" value="회원가입" onclick="location.href='join.do'">
</td>
</tr>
</table>
</form>

</body>
</html>