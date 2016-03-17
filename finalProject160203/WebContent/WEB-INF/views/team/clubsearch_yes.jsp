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
<script type="text/javascript">
function popupOpen(){
	var popUrl = "";	//팝업창에 출력될 페이지 URL
	var popOption = "width=500, height=800,top=70, left=220, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);
	}
</script>
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
			<tr>
				<td>${j.team_name }</td>
				<td><img src="image/${j.team_logo }" style="height: 100px;"
					onclick="javascript:window.open('teamdetail.do?team_name=${j.team_name }','',
  'width=400, height=400,top=70, left=220, resizable=no, scrollbars=no, status=no;');">
				</td>
				<td>${j.team_location1 }/${j.team_location2 }/${j.team_location3 }</td>
				
			</tr>
		</c:forEach>

	</table>
</body>
</html>