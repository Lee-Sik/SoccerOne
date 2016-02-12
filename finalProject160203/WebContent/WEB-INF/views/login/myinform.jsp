<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="./CSS/main.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<div align="center">
<br>
<p class="wow1" style="size: 20">회 원 정 보 확 인</p>
<br>
<table class="myinform">
<col width=100>
<col width=100>
<tr>
<td>프로필사진</td>
<td><img alt="" src="image/${login.user_profile }"> </td>
</tr>
<tr>
<td>아이디</td>
<td>${login.user_email }</td>
</tr>
<tr>
<td>이름</td>
<td>${login.user_name }</td>
</tr>
<tr>
<td>나이</td>
<td>${login.user_age }</td>
</tr>
<tr>
<td>휴대폰번호</td>
<td>${login.user_phone }</td>
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
<td>주 발</td>
<td>${login.user_foot }</td>
</tr>
<tr>
<td>주 포지션</td>
<td>${login.user_position1 }</td>
</tr>
<tr>
<td>선호 포지션1</td>
<td>${login.user_position2 }</td>
</tr>
<tr>
<td>선호 포지션2</td>
<td>${login.user_position3 }</td>
</tr>

<c:if test="${login.user_team != null}">
<tr>
<td>팀</td>
<td>${login.user_team }</td>
</tr>

</c:if>
<tr>
<td><input type="button" value="수정하기" onclick="location.href='modify.do'"><td>
</tr>
</table>

</div>
</body>
</html>