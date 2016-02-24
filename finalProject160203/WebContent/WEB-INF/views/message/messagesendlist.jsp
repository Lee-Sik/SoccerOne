<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
table{
	text-align: center;
}
</style>
<script>
function func1(){
	opener.parent.location.reload();
	window.close();
	
}

</script>
</head>
<body>
<table width="100%">
<col width="10%">
<col width="10%">
<col width="10%">
<col width="40%">
<col width="20%">
<col width="10%">
<tr>
<td>종류</td>
<td>보낸사람</td>
<td>받는사람</td>
<td>내용</td>
<td>날짜</td>
<td>수신확인</td>
</tr>
<c:if test="${empty messagesendlist }">
<tr>
<td colspan="3" style="text-align: center;"><br>보낸 쪽지함이 비어있습니다.</td>
</tr>
</c:if>

<c:if test="${not empty messagesendlist }">
<c:forEach var="j" items="${messagesendlist }">
<tr>
<c:if test="${j.message_type eq 'teamapplymeg'}">
<td>가입신청</td>
</c:if>

<c:if test="${j.message_type eq 'message'}">
<td>쪽지</td>
</c:if>

<td>${j.sender_user_email }</td>
<td>${j.receiver_user_email }</td>
<td style="text-align: left"><a href="messagesendlist1.do?no=${j.no}">${j.message }</a></td>
<td>${j.wdate }</td>
<td>
<c:if test="${j.message_read eq 0 }">
unread
</c:if>
<c:if test="${j.message_read eq 1 }">
read
</c:if>
</td>
</tr>
</c:forEach>
</c:if>
</table>
<form action="messagesend.do" method="post">
<input type="button" value="목록" onclick="location.href='messagedetail.do'">
<input type="button" value="닫기" onclick="func1()">
</form>
</body>
</html>