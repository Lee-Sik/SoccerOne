<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="soccer.co.DTO.foot_user_DTO" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="./CSS/main.css">
<link href="CSS/styles.css" rel="stylesheet" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
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
         <th>용병 유무</th>
         <td style="text-align: left" colspan="5" ><input id="cmn-toggle-1" class="cmn-toggle cmn-toggle-round" name="user_helper" type="checkbox">
         <label for="cmn-toggle-1"></label></td>
</tr>
<tr>
         <th>정보 공개 유무</th>
         <td style="text-align: left" colspan="5"><input id="cmn-toggle-2" class="cmn-toggle cmn-toggle-round" name="user_enabled" type="checkbox">
         <label for="cmn-toggle-2"></label></td>
</tr>

<tr>
<td><input type="button" value="수정하기" onclick="location.href='modify.do'"><td>
</tr>
</table>

</div>
</body>
</html>