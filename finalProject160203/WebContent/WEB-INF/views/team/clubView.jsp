<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://maps.googleapis.com/maps/api/js"></script>
<script>
	function initialize() {
		var mapProp = {
			center : new google.maps.LatLng(51.508742, -0.120850),
			zoom : 5,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		var map = new google.maps.Map(document.getElementById("map"), mapProp);
	}
	google.maps.event.addDomListener(window, 'load', initialize);
</script>

</head>
<body>
	
	<c:if test="${empty login.user_team}">
	
	<div class="club_notteam" align="center">
		<table border="1" style="border-collapse: 1">
		<tr>
		<td colspan="2">현재 소속한 팀이 없습니다.<br></td>
		</tr>
		</table>
		<table>
		<c:forEach var ="a" items="${notteamlist}">
			<tr>
				<td>a</td>
				<td><a href="#">${a.team_name} 팀이 팀을 구하고 있습니다.</a></td>
			</tr>
		</c:forEach>
		</table>
		
	</div>
	
	</c:if>
	
	<c:if test="${not empty login.user_team}"> 
	<table>

		<tr>
			<td>
				<img alt="팀로고" src="image/${team.team_logo} " style="width: 300px; height: 200px;">
			</td>
			
			<td>
			
			팀 소개 내용	${team.team_intro}
			</td>
		</tr>
		<tr >
			<td>캘린더</td>
			<td>일정 내용 5개</td>
		</tr>
		<tr>
			<td>
				<table>
				<c:forEach items="${gameRecList}" var="gameRecVO">
					<tr>
						<td style="background-color: blue;"><img src="image/${gameRecVO.win_team_logo}" style="width: 200px; height: 100px;"></td><td>VS</td><td style="background-color: red;"><img src="image/${gameRecVO.lose_team_logo}" style="width: 200px; height: 100px;"></td>
					</tr>
					<tr>
						<td>win</td>
						<td>${gameRecVO.score}</td>
						<td>lose</td>
					</tr>
				</c:forEach>
				</table>
			</td>
			<td>팀 게시판</td>
		</tr>
		<tr>
			<td>베스트 11 이미지</td>
			<td>팀원들 가져오기</td>
		</tr>
		<tr >
			<td colspan="2">구장 주소ㄴ리너림너라ㅣㅁ너ㅣ람너ㅣㅏㄹ</td>
		</tr>
		<tr >
			<td colspan="2" id="map" style="width: 500px; height: 450px"></td>
		</tr>
	
	
	</table>
	</c:if>
	
</body>
</html>