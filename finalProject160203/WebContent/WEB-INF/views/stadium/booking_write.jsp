<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">

td.td1 {
	background-color: #f4f4f4; 
	text-align: center;
	
}
td.td2 {
	background-color: #ffffff;
	text-align: left;
}

</style>

</head>
<body>
<form action="booking_write_ok.do" method="post">
<table class="list_table" style="width:70%;">

<colgroup>
	<col style="width:20%;" />
	<col style="width:80%;" />
</colgroup>
<tbody>
<tr>
	
	<td class="td1">구장명</td><td class="td2">${stadium_name}
	<input type="hidden" name="stadium_seq" value="${stadium_seq}">
	</td>
</tr>	
<tr>
	<td class="td1">날짜</td><td class="td2"> <input type="date" name="day"> </td>
</tr>
<tr>
	<td class="td1">지역</td><td class="td2"> 
		<select name="booking_area">
			<option value="">지역구 선택</option>
		<c:forEach var="dto" items="${post1}">
			<option value="${dto.gugun}">${dto.gugun}</option>
		</c:forEach>
		</select>
	</td>
</tr>
<tr>
	<td class="td1">대관료</td><td class="td2"> <input type="text" name="rentalsum" size="10">원 </td>
</tr>
<tr>
	<td class="td1">납부계좌</td><td class="td2">
	<select name="bank">
		<option value="">은행 선택</option>
		<option value="KB국민은행">KB국민은행</option>
		<option value="우리은행">우리은행</option>
		<option value="하나은행">하나은행</option>
		<option value="신한(조흥)은행">신한(조흥)은행</option>
		<option value="외환은행">외환은행</option>
		<option value="기업은행">기업은행</option>
		<option value="SC제일은행">SC제일은행</option>
	</select>
	&nbsp;계좌번호&nbsp;:&nbsp; <input type="text" name="banknum" size="15"> 
	&nbsp;예금주&nbsp;:&nbsp;<input type="text" name="bankuser" size="10">
	</td>
</tr>
</tbody>
</table>
<br>
	<input type="submit" value="부킹등록">
</form>

</body>
</html>





























