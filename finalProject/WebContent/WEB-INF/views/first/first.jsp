<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
div.first{
background-image: url("image/back3.jpg");
background-size: contain;
width: 100%;
height: 600px;

}

div.first1{
float:left;
width: 28%;
height: 600px;
}
div.first2{
float:left;
width: 72%;
height: 600px;
}
</style>
<script type="text/javascript">

function popupOpen(){
	var popUrl = "join.do";	//팝업창에 출력될 페이지 URL
	var popOption = "width=800, height=600,top=70, left=220, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);
	}
</script>
</head>
<body>
<c:if test="${loginfalse eq 1 }">
<script type="text/javascript">
alert("아이디나 비밀번호가 틀렸습니다. 다시 로그인하세요.");
</script>
</c:if>

<c:if test="${not empty login }">
<script type="text/javascript">
location.href="login1.do";
</script>
</c:if>

<div class="first">
<div class="first1">

</div>
<div class="first2">
<form action="login.do" method="post">
<input type="hidden" name="loginok" value="0">
<br><br><br><br><br><br><br><br><br><br><br><br><br>

<table >
<tr>
<td style="color: white">
아이디
</td>
<td >
<input type="text" name="user_email" size="20">
</td>
</tr>
<tr>
<td style="color: white">
비밀번호
</td>
<td>
<input type="password" name="user_pw" size="20">
</td>
</tr>
<tr>
<td colspan="2">
<input type="submit" value="로그인">
<input type="button" value="회원가입" onclick="location.href='javascript:popupOpen()'">
</td>
</tr>
</table>
</form>
</div>


</div>
</body>
</html>