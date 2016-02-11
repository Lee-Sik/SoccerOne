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
<body>
<div align="center">
<form action="writecal1.do" method="post">
<table>



<tr>
<th>지정날짜</th>

<td><input type="text" name="team_name" value="${team.team_name }">
	<br>
	<input type="text" name="year" value="${cdtoclick.year }" readonly="readonly" size="5">년 
	<input type="text" name="month" value="${cdtoclick.month }" readonly="readonly" size="3">월 
	<input type="text" name="day" value="${cdtoclick.day }" readonly="readonly" size="3">일 
	
	
</td>
</tr>



<tr>
<th>제목</th>
<td><input type="text" name="textname" size="102"></td>
</tr>

<tr>
<th>위치</th>
<td><input type="text" name="location" size="102"></td>
</tr>


<tr>
<th>내용</th>
<td><textarea name="text" rows="35" cols="100"></textarea></td>
</tr>

</table>
<input type="submit" value="확인">

</form>
<input type="button" value="취소"  name="fi" onclick="self.close()">
</div>
</body>
</html>