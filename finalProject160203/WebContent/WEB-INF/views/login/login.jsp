<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
<title>Insert title here</title>
</head>

<script type="text/javascript">
function popupOpen(){
	var popUrl = "myinform.do";	//팝업창에 출력될 페이지 URL
	var popOption = "width=500, height=800,top=70, left=220, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);
	}
function popupMessage(){
	event.preventDefault();
	var popUrl = "messagedetail.do?receiver_user_email=${login.user_email}";
	var popOption = 'width=800, height=400,top=70, left=220, resizable=no, scrollbars=no, status=no;';    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);
	}

	
</script>

<body>
<table>
<tr>
<td class="loginview" colspan="3"><img src="image/loginview.png" width="10%">${login.user_email }님이 접속하셨습니다.</td>
</tr>
<tr>
<td style="background-image:url(image/message.png);background-repeat:no-repeat; width:60px;height: 60px;text-align: left;
			color: white; font-size: 13pt;" >

<c:if test="${empty messagecheck }">
<table style="width: 100%"><tr><td style="text-align: center">${fn:length(messagecheck) }</td></tr></table></td><td>
<a href="" onclick="popupMessage()">
도착한 쪽지가 없습니다. 
<img src="./image/not_message.png"/></a></td></c:if>
<c:if test="${not empty messagecheck }">


<table style="width: 100%"><tr><td style="text-align: center">${fn:length(messagecheck1) }</td></tr></table></td> 
<td><a href="" onclick="popupMessage()">
새로운 쪽지가 ${fn:length(messagecheck1)}개 있습니다.<img src="./image/ok_message.png"/></a></td></c:if>
<!-- <td> -->
<!-- <input type="button" value="message" onclick="popupMessage()"> -->
<!-- </td> -->


</tr>
<tr>
 <td colspan="3"><input type="button" value="내정보" onclick="location.href='javascript:popupOpen()'">
<input type="button" value="로그아웃" onclick="location.href='logout.do'"></td>
</tr>
</table>
</body>
</html>