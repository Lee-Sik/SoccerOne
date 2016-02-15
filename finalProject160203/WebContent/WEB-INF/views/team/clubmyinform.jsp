<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
table.qwe{

	
	font-size: 12pt;
	font-family: -윤고딕310;
	border-collapse: collapse;
}
td{
	text-align: center;
}
table,tr,td{
	border:1px solid lightgray;
}
</style>
</head>
<body>
<div style="float:left; width: 50%;">
<img alt="" src="image/${login.user_profile }" style="width:100%">
</div>

<div style="float:left;width: 50%;">
<p style="font-size: 30pt;color: blue;">팀 내 나의 정보</p>
<table style="width: 100%" class="qwe">
<tr>
<td>이름</td>
<td>${login.user_name }</td>
</tr>
<tr>
<td>생일</td>
<td>${login.user_birth }</td>
</tr>
<tr>
<td>나이</td>
<td>${login.user_age }</td>
</tr>
<tr>
<td>키</td>
<td>${login.user_high }</td>
</tr>
<tr>
<td>몸무게</td>
<td>${login.user_weight }</td>
</tr>
<tr>
<td>포지션1</td>
<td>${login.user_position1 }</td>
</tr>
<tr>
<td>포지션2</td>
<td>${login.user_position2 }</td>
</tr>
<tr>
<td>포지션3</td>
<td>${login.user_position3 }</td>
</tr>
<tr>
<td>스피드</td>
<td>${login.user_speed}</td>
</tr>
<tr>
<td>참석률</td>
<td>${login.user_attendrate }</td>
</tr>
<tr>
<td>출장시간</td>
<td>${login.user_attendtime }</td>
</tr>
<tr>
<td>득점률</td>
<td>${login.user_goal }</td>
</tr>
</table>
</div>

<div style="width: 100%">
육각형으로 보여주기
</div>

<div style="width: 100%">
개인 그래프
</div>

</body>
</html>