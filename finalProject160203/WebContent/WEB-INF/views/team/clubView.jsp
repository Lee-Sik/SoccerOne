<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	<div id="box">
		<div id="intro" class="title">
			<div class="content">
				<img alt="팀로고" src="image/2.jpg">
			</div>
			<div class="content">팀 소개 내용</div>
		</div>
		<div id="calendar" class="title">
			<div class="content">캘린더</div>
			<div class="content">일정 내용 5개</div>
		</div>
		<div id="board" class="title">
			<div class="content">최근 경기</div>
			<div class="content">팀 게시판</div>
		</div>
		<div id="position" class="title">
			<div class="content">베스트 11 이미지</div>
			<div class="content">팀원들 가져오기</div>
		</div>
		<div class="title">
			<div id="map" style="width: 500px; height: 450px"></div>
		</div>
	</div>
	

</body>
</html>