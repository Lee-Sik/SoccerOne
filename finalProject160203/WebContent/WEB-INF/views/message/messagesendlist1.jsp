<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<c:if test="${messagesendlist1.message_type eq 'teamapplymeg'}">
<td>팀가입신청</td>
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
<th colspan="2">

<input type="button" value="목록" onclick="location.href='messagedetail.do'">
<input type="button" value="닫기" onclick="func1()">
</th>
</tr>
</table>


</body>
</html>