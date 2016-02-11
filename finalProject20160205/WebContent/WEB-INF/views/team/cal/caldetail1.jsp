<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
table.qwe{

	
	font-size: 12pt;
	font-family: -윤고딕310;
	border-collapse: collapse;
}
td{
	text-align: center;
}
table,tr,td{
	border:1px solid lightgray;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div align="center">
<table class="qwe">
<col width="100">
<col width="500">



<tr>
<td>날짜</td>
<td>${caldetail1.rdate }</td>
</tr>

<tr>
<td>제목</td>
<td>${caldetail1.textname }</td>

</tr>

<tr>
<td>내용</td>
<td>${caldetail1.text }</td>

</tr>

<tr>
<td>위치</td>
<td>${caldetail1.location }</td>

</tr>

<tr>
<td colspan="2"><input type="button" value="목록" onclick="location.href='caldetail.do?rdate=${caldetail1.rdate }&team_name=${caldetail1.team_name }'">
<input type="button" value="취소" onclick="self.close()"></td>
</tr>

</table>


</div>

</body>
</html>