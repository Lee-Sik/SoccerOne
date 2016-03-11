<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="CSS/msgtable.css" rel="stylesheet" >
<link href="CSS/main.css" rel="stylesheet" >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
function func1(){
	opener.parent.location.reload();
	window.close();
	
}
</script>
</head>
<body>
<table class="list_table" width="85%">
	<colgroup>
	<col width="20%">
	<col width="80%">
	</colgroup>
	<tr>
		<th>쪽지종류</th>
		<c:if test="${messagesendlist1.message_type eq 'teamapplymeg'}">
		<td>팀가입신청</td>
		</c:if>
		<c:if test="${messagesendlist1.message_type eq 'matching'}">
	<td>경기신청</td>
	</c:if>
		<c:if test="${messagesendlist1.message_type eq 'message'}">
		<td>메세지</td>
		</c:if>
	</tr>

	<tr>
		<th>보낸사람</th>
		<td>${messagesendlist1.sender_user_email }</td>
	</tr>
	<tr>
	<tr>
		<th>받은사람</th>
		<td>${messagesendlist1.receiver_user_email }</td>
	</tr>
	<tr>
		<th>보낸시간</th>
		<td>${messagesendlist1.wdate }</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>${messagesendlist1.message }</td>
	</tr>
	<tr>
		<th>수신여부</th>
		<td>${messagesendlist1.message_read }</td>
	</tr>
	
	<tr>
		<td colspan="2">
		<input type="button" value="목록" onclick="location.href='messagesendlist.do?sender_user_email=${login.user_email}'">
		<input type="button" value="닫기" onclick="func1()">
		</td>
	</tr>
</table>


</body>
</html>