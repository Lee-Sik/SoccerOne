<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="CSS/msgtable.css" rel="stylesheet" >
<link href="CSS/main.css" rel="stylesheet" >
<head>
<script>
function func1(){
	opener.parent.location.reload();
	window.close();
	
}

</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<form action="messageanswer1.do" method="post">
<table width="100%">
<col width="20%">
<col width="80%">
<tr>
<th>쪽지종류</th>
<td style="text-align: left;"><input type="text" value="message" name="message_type" readonly="readonly"></td>
</tr>

<tr>
<th>보내는 사람</th>
<td style="text-align: left;"><input type="hidden" value="${message.sender_user_email }" name="sender_user_email">${message.sender_user_email }</td>
</tr>
<tr>
<th>받는 사람</th>
<td style="text-align: left;"><input type="hidden" value="${message.receiver_user_email }" name="receiver_user_email">${message.receiver_user_email }</td>
</tr>
<tr>
<th>내용</th>
<td style="text-align: left;"><textarea rows="5" cols="70" name="message"></textarea> </td>
</tr>
<tr>
<td colspan="4">
<input type="submit" value="보내기">
<input type="button" value="목록" onclick="location.href='messagedetail.do'">
<input type="button" value="닫기" onclick="func1()">
</td>
</tr>
</table>
</form>


</body>
</html>