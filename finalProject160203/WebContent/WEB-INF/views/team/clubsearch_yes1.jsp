<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="CSS/clubview.css" rel="stylesheet" type="text/css">
</head>
<body>

	<table class="list_table" width="100%">
		<tr>
			<td colspan="3">
				<form action="clubsearch_yes1.do" method="post">
				팀 명 : <input type="text" name="team_name"> 활동 지역 : <select
				name="team_location1">
				<option>전 지역</option>
				<c:forEach items="${list}" var="vo">
					<option>${vo}</option>
				</c:forEach>
			</select> 
			<input type="submit" value="검색">
			</form>
			</td>
		</tr>
		<tr>
			<th>클럽명</th>
			<th>팀로고</th>
			<th>팀 활동 지역</th>
		</tr>


		<c:forEach var="j" items="${allteam }">
			<c:if
				test="${searchteam.team_name eq 'noname' &&( j.team_location1 eq searchteam.team_location1 ||
			  j.team_location2 eq searchteam.team_location1 || j.team_location3 eq searchteam.team_location1) &&
			 j.team_join eq searchteam.team_join}">
				<tr>
					<td>${j.team_name }</td>
					<td><img src="image/${j.team_logo }" style="width: 50px;"
						onclick="javascript:window.open('teamdetail.do?team_name=${j.team_name }','',
  'width=400, height=400,top=70, left=220, resizable=no, scrollbars=no, status=no;');">
					</td>
					<td>${j.team_location1 }/${j.team_location2 }/${j.team_location3 }</td>
					
				</tr>
			</c:if>


			<c:if test="${searchteam.team_name eq j.team_name}">
				<tr>
					<td>${j.team_name }</td>
					<td><img src="image/${j.team_logo }" style="width: 50px;"
						onclick="javascript:window.open('teamdetail.do?team_name=${j.team_name }','',
  'width=400, height=400,top=70, left=220, resizable=no, scrollbars=no, status=no;');">
					</td>
					<td>${j.team_location1 }/${j.team_location2 }/${j.team_location3 }</td>
					
				</tr>
			</c:if>

			<c:if
				test="${searchteam.team_name eq 'noname' && searchteam.team_location1 eq '전 지역'
						 && j.team_join eq searchteam.team_join}">
				<tr>
					<td>${j.team_name }</td>
					<td><img src="image/${j.team_logo }" style="width: 50px;"
						onclick="javascript:window.open('teamdetail.do?team_name=${j.team_name }','',
  'width=400, height=400,top=70, left=220, resizable=no, scrollbars=no, status=no;');">
					</td>
					<td>${j.team_location1 }/${j.team_location2 }/${j.team_location3 }</td>
					
				</tr>
			</c:if>


		</c:forEach>

	</table>

</body>
</html>