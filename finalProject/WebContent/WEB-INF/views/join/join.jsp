<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
body{
	background-color: white;
}
.wow1{
	text-align: center;
	color:black;
	font-size: 30pt;
	font-family: -윤고딕310;
}
.wow2{
	text-align: center;
	color:black;
	font-size: 15pt;
	font-family: -윤고딕310;
}
table{
font-size: 15pt;
	font-family: -윤고딕310;


}

.center{

}
</style>
</head>
<body>
<div>
<div>
<table width="100%">
<br><br><br>
</table>
<script type="text/javascript">
function function1(){
	document.f.submit();
	
	
}
</script>
</div>
<div class="center" align="center">
<p class="wow1"><b>회원가입</b></p>
<p class="wow2">_저희 홈페이지에 와주셔서 감사합니다. 반갑습니다_</p>


<form action="join1.do" name="f" method="post">
<table>
<tr>
<td>e-mail</td>
<td><input type="text" name="user_email"></td>
</tr>
<tr>
<td>PASSWORD</td>
<td><input type="password" name="user_pw"></td>
</tr>
<tr>
<td>PASSWORD 확인</td>
<td><input type="password" name="user_pw1"></td>

</tr>
<tr>
<td>NAME</td>
<td><input type="text" name="user_name"></td>
</tr>
<tr>
<td>Birth</td>
<td><input type="text" name="user_birth"></td>
</tr>
<tr>
<td>AGE</td>
<td><input type="text" name="user_age"></td>
</tr>
<tr>
<td>phone</td>
<td><input type="text" name="user_phone"></td>
</tr>
<tr>
<td>user_high</td>
<td><input type="text" name="user_high"></td>
</tr>
<tr>
<td>user_weight</td>
<td><input type="text" name="user_weight"></td>
</tr>
<tr>
<td>user_foot</td>
<td><input type="text" name="user_foot"></td>
</tr>
<tr>
<td>user_position1</td>
<td><input type="text" name="user_position1"></td>
</tr>
<tr>
<td>user_position2</td>
<td><input type="text" name="user_position2"></td>
</tr>
<tr>
<td>user_position3</td>
<td><input type="text" name="user_position3"></td>
</tr>
<tr>
<td>user_address</td>
<td><input type="text" name="user_address"></td>
</tr>
<tr>
<td>user_profile</td>
<td><input type="text" name="user_profile"></td>
</tr>
<tr>
<td align="center"><input type="button" value="회원가입" onclick="function1()"></td>
<td align="center"><input type="button" value="취소" onclick="self.close()"></td>
</tr>
</table>

</form>
</div>
</div>
</body>
</html>