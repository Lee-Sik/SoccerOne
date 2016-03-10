<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
function popupOpen1() {
	
	var popUrl = "loginpopup2.do"; //팝업창에 출력될 페이지 URL
	var popOption = "width=500, height=400,top=150, left=220, resizable=no, scrollbars=no, status=no;"; //팝업창 옵션(optoin)
	window.open(popUrl, "", popOption);
}

</script>
<body onload="popupOpen1()">


</body>
</html>