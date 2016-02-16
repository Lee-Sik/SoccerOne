<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<title>Insert title here</title>
</head>

<script type="text/javascript">
function popupOpen(){
	var popUrl = "myinform.do";	//팝업창에 출력될 페이지 URL
	var popOption = "width=500, height=700,top=70, left=220, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);
	}
</script>

<body>
<p class="loginview">
<img src="image/loginview.png" width="10%">${login.user_email }님이 접속하셨습니다.
<br><br>

<input type="button" value="내정보" onclick="location.href='javascript:popupOpen()'">
<input type="button" value="로그아웃" onclick="location.href='logout.do'">
</p>

</body>
</html>