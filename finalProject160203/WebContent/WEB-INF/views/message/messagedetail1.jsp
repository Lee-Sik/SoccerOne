<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style type="text/css">
th{
	text-align: center
}
table{
	font-family: -윤고딕310;
}
</style>
<head>
<script>
function func1(){
	opener.parent.location.reload();
	window.close();
	
}

</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table width="100%">
<col width="20%">
<col width="80%">
<tr>
<th>쪽지종류</th>
<c:if test="${messagedetail1.message_type eq 'teamapplymeg'}">
<td>팀가입신청</td>
</c:if>
<c:if test="${messagedetail1.message_type eq 'message'}">
<td>메세지</td>
</c:if>
</tr>


<tr>
<th>보낸사람</th>
<td>${messagedetail1.sender_user_email }</td>
</tr>
<tr>
<th>보낸시간</th>
<td>${messagedetail1.wdate }</td>
</tr>
<tr>
<th>내용</th>
<td>${messagedetail1.message }</td>
</tr>
<c:if test="${messagedetail1.message_type eq '0' }">
<tr>
<th colspan="2">
<input type="button" value="승인" onclick="location.href='teamapplyallow.do?message_type=${messagedetail1.message_type}&no=${messagedetail1.no }&sender_user_email=${messagedetail1.sender_user_email}&receiver_user_email=${messagedetail1.receiver_user_email}'">
<input type="button" value="거부" onclick="location.href='teamapplyrefuse.do?message_type=${messagedetail1.message_type}&no=${messagedetail1.no }&sender_user_email=${messagedetail1.sender_user_email}&receiver_user_email=${messagedetail1.receiver_user_email}'">

</th>
</tr>
</c:if>

<tr>
<th colspan="2">
<input type="submit" value="답장" onclick="location.href='messageanswer.do?sender_user_email=${messagedetail1.sender_user_email}&receiver_user_email=${messagedetail1.receiver_user_email}'">
<input type="button" value="목록" onclick="location.href='messagedetail.do'">
<input type="button" value="닫기" onclick="func1()">
</th>
</tr>
</table>


</body>
</html>