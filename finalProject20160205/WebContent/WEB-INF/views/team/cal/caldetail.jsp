<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
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
<body>
	
<div align="center">
<table class="qwe">
<col width="10">
<col width="300">
<col width="400">
<col width="100">

<c:forEach var="i" items="${ caldetail}">
<tr>
<td>날짜</td>
<td>제목</td>
<td>내용</td>
<td>위치</td>
</tr>
<tr>
<td>${i.rdate }</td>
<td>${i.textname }</td>

<td><a href="caldetail1.do?no=${i.no }">${i.text }</a></td>

<td>${i.location }</td>
</tr>

</c:forEach>
</table>

<input type="button" value="취소" onclick="self.close()">
</div>

</body>
</html>