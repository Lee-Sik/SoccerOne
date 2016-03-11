<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="CSS/Logintable.css" rel="stylesheet" >
<title>로그인</title>
</head>
<body>

<form action="loginjy.do" method="post">
	<table class="list_table" style="width: 80%;">
	<tr>
	 <td colspan="2">
		<font style="font-size: 18px; font-weight: bold;">LOGIN</font>	
	 </td>
	</tr>
	<tr>
		<th>
		아이디
		</th>
		<td >
		<input type="text" name="user_email" size="20">
		</td>
	</tr>
	<tr>
		<th>
		비밀번호
		</th>
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