<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
table{
font-size: 12pt;
	font-family: -윤고딕310;
}
.wow1{
	text-align: center;
	color:black;
	font-size: 20pt;
	font-family: -윤고딕310;
}
.wow2{
	text-align: center;
	color:black;
	font-size: 15pt;
	font-family: -윤고딕310;
}</style>
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">
function function1(){
	document.f.submit();	
}
</script>
<div class="center" align="center">

<p class="wow2"><br>_${teamapply.team_name }팀 입니다.
					<br>축구에 열정만 있다면 누구든 환영합니다. 반갑습니다._</p>
</div>

<form action="teamapplymeg.do" name="f" method="post">
<input type="hidden" name="team_name" value="${teamapply.team_name }">
<input type="hidden" name="team_managerid" value="${teamapply.team_managerid }">
<table>
<tr>
<td>이름</td>
<td>${login.user_name }</td>
</tr>
<tr>
<td>나이</td>
<td>${login.user_age }</td>
</tr>
<tr>
<td>키/몸무게</td>
<td>${login.user_high }/${login.user_weight }</td>
</tr>
<tr>
<td>핸드폰 번호</td>
<td>${login.user_phone}</td>
</tr>

<tr>
<td>나이</td>
<td>${login.user_age }</td>
</tr>
<tr>
<td>활동 지역</td>
<td>${login.user_address }</td>
</tr>
<tr>
<td>활동 포지션</td>
<td>${login.user_position1}/${login.user_position2}/${login.user_position3}</td>
</tr>
<tr>
<td>주 발</td>
<td>
<c:if test="${login.user_foot eq 0 }">
왼발
</c:if>
<c:if test="${login.user_foot eq 1 }">
오른발
</c:if>
<c:if test="${login.user_foot eq 2 }">
양발
</c:if>
</td>
</tr>
<tr>
<td>자기소개</td>
<td><textarea rows="5" cols="40" name="message">안녕하세요.</textarea> </td>
</tr>


<tr>
<td align="center"><input type="button" value="신청하기" onclick="function1()"></td>
<td align="center"><input type="button" value="취소" onclick="self.close()"></td>
</tr>
</table>
<input type="hidden" name="sender_user_email" value="${login.user_email }">
<input type="hidden" name="message_type" value="teamapplymeg">
<input type="hidden" name="receiver_user_email" value="${teamapply.team_managerid }">

</form>
</body>
</html>