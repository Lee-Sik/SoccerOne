<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="soccer.co.DTO.foot_user_DTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link href="CSS/styles.css" rel="stylesheet" >
<link href="CSS/myinfo.css" rel="stylesheet" >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">
@import url(http://fonts.googleapis.com/css?family=Montserrat:400,700);
body, table{
	font-size: 10pt;
	font-family: "Nanum Gothic", sans-serif;
}
.wow1{
	text-align: center;
	color:black;
	font-size: 25pt;
	font-family: "Nanum Gothic", sans-serif;
}
.wow2{
	text-align: center;
	color:black;
	font-size: 13pt;
	font-family: "Nanum Gothic", sans-serif;
}
</style>

<script type="text/javascript">
var user_helper = document.f.user_helper;
var user_enabled = document.f.user_enabled;
<% foot_user_DTO fudto = (foot_user_DTO)session.getAttribute("login");
if(fudto.getUser_helper()==0){%>
	user_helper.value=="on";
<%}else if(fudto.getUser_helper()==1){%>
user_helper.value=="off";
<%}%>

<%
if(fudto.getUser_enabled()==0){%>
user_enabled.value=="on";
<%}else if(fudto.getUser_enabled()==1){%>
user_enabled.value=="off";
<%}%>
</script>

<body>
<div align="center">
<p class="wow1"><img src="image/join.png"><b>회원 정보 확인</b></p>

<table class="list_table">
<colgroup>
<col style="width:30%;"/>
<col style="width:auto;"/>
</colgroup>
<tr>
	<th>프로필사진</th>
	<td><img alt="" src="image/${login.user_profile }" style="width: 150px;"> </td>
</tr>
<tr>
	<th>아이디</th>
	<td>${login.user_email }</td>
</tr>
<tr>
	<th>이름</th>
	<td>${login.user_name }</td>
</tr>
<tr>
	<th>나이</th>
	<td>${login.user_age }</td>
</tr>
<tr>
	<th>휴대폰번호</th>
	<td>${login.user_phone }</td>
</tr>
<tr>
	<th>키</th>
	<td>${login.user_high }</td>
</tr>
<tr>
	<th>몸무게</th>
	<td>${login.user_weight }</td>
</tr>
<tr>
	<th>주 발</th>
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
	<th>주 포지션</th>
	<td>${login.user_position1 }</td>
</tr>
<tr>
	<th>선호 포지션1</th>
	<td>${login.user_position2 }</td>
</tr>
<tr>
	<th>선호 포지션2</th>
	<td>${login.user_position3 }</td>
</tr>

<c:if test="${login.user_team != null}">
<tr>
	<th>팀</th>
	<td>${login.user_team }</td>
</tr>
</c:if>

<tr>
         <th>용병 유무</th>
         <td style="text-align: left"><input id="cmn-toggle-1" class="cmn-toggle cmn-toggle-round" name="user_helper" type="checkbox">
         <label for="cmn-toggle-1"></label></td>
</tr>
<tr>
         <th>정보 공개 유무</th>
         <td style="text-align: left"><input id="cmn-toggle-2" class="cmn-toggle cmn-toggle-round" name="user_enabled" type="checkbox">
         <label for="cmn-toggle-2"></label></td>
</tr>

<tr>
<td colspan="2"><input type="button" value="수정하기" onclick="location.href='modify.do'"></td>
</tr>
</table>

</div>
</body>