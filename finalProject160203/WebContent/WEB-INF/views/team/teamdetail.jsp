<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./CSS/table.css">
<style type="text/css">

</style>
</head>
<body>


<table>
<c:forEach var="j" items="${allteam }">

<c:if test="${j.team_name eq teamdetail && j.team_open == 1}">
<tr>
<th class="detail">팀로고</th>
<td>
<img src="image/${j.team_logo }" style="width: 300px;">
</td>
</tr>
<tr>
<th class="detail">팀이름</th>
<td>${j.team_name }</td>
</tr><tr>
<th class="detail">활동지역</th>
<td>${j.team_location1 }/${j.team_location2 }/${j.team_location3 }</td>
</tr>
<tr>
<th class="detail">팀원 수</th>
<td>${j.team_menbernum }</td>
</tr>
<tr>
<th class="detail">팀원모집여부</th>
<td>${j.team_join }</td>
</tr>
<tr>
<th class="detail">전체경기수(승률)</th>
</tr>
</c:if>


<c:if test="${j.team_name eq teamdetail && j.team_open == 0}">
<script>
alert("비공개 설정한 팀으로 기본 정보 만 볼수 있습니다.");
</script>

<tr>
<th class="detail">팀로고</th>
<td>
<img src="image/${j.team_logo }" style="width: 300px;">
</td>
</tr>
<tr>
<th class="detail">팀이름</th>
<td>${j.team_name }</td>
</tr><tr>
<th class="detail">활동지역</th>
<td>${j.team_location1 }/${j.team_location2 }/${j.team_location3 }</td>
</tr>
<tr>
<th class="detail">팀원 수</th>
<td>비공개</td>
</tr>
<tr>
<th class="detail">팀원모집여부</th>
<td>${j.team_join }</td>
</tr>
<tr>
<th class="detail">전체경기수(승률)</th>
<Td>비공개</Td>
</tr>
</c:if>

</c:forEach>
</table>
</body>
</html>