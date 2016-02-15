<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

		<div class="club_notteam" align="center">
			<table border="1" style="border-collapse: 1;">
				<tr>
					<td colspan="2">현재 소속한 팀이 없습니다.<br></td>
				</tr>
			</table>
			<table>
				<c:forEach var="a" items="${notteamlist}">
					<tr>
						<td>a</td>
						<td><a href="#">${a.team_name} 팀이 팀을 구하고 있습니다.</a></td>
					</tr>
				</c:forEach>
			</table>

		</div>


</body>
</html>