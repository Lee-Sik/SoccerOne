<%@page import="soccer.co.DTO.foot_team_DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://maps.google.com/maps/api/js"></script>
<%
   foot_team_DTO myteam = (foot_team_DTO)session.getAttribute("team");
%>
<script>
var a,b;
var url='https://maps.googleapis.com/maps/api/geocode/json?address=서울 양천구 강서초등학교<%-- <%=myteam.getTeam_home()%> --%>&key=AIzaSyDmrTAC2knfxkHTWStqoS59Pf7IquSj9QE';

$.ajax({
    url: url,
    dataType: 'JSON',
    jsonpCallback: 'callback',
    type: 'GET',
    success: function (data) {
       alert(data.results[0].geometry.location.lat);
       alert(data.results[0].geometry.location.lng);
        a=data.results[0].geometry.location.lat;
        b=data.results[0].geometry.location.lng;
        something(a,b);
    }
});



function something(a,b){
              var m_title = "<%=myteam.getTeam_name()%> 홈 구장"; // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
             var m_marker_title = "<%=myteam.getTeam_home()%>";// 말풍선 안에 들어갈 내용
             
             function initialize() {
                var m_width = "99%";
                var m_height = "350px";
                
                var m_tmpLat = a;
                var m_tmpLng = b;   
                
             var mapLocation = new google.maps.LatLng(m_tmpLat,m_tmpLng); // 지도에서 가운데로 위치할 위도와 경도
             var markLocation = new google.maps.LatLng(m_tmpLat,m_tmpLng); // 마커가 위치할 위도와 경도
             /*
                 MapTypeId.ROADMAP - 기본 로드맵 보기를 표시합니다.
                 MapTypeId.SATELLITE - Google 어스 위성 이미지를 표시합니다.
                 MapTypeId.HYBRID - 일반 뷰와 위성 보기를 혼합하여 표시합니다.
                 MapTypeId.TERRAIN - 지형 정보를 바탕으로 실제 지도를 표시합니다.
             */

             var mapOptions = {
                 center: mapLocation, // 지도에서 가운데로 위치할 위도와 경도(변수)
                 zoom: 15, // 지도 zoom단계
                 mapTypeId: google.maps.MapTypeId.ROADMAP /* 기본 로드맵 보기를 표시합니다. */

             };
             var m=document.getElementById('map');
             var map = new google.maps.Map(m, mapOptions); // id: map, body에 있는 div태그의 id와 같아야 함


             var marker;
             marker = new google.maps.Marker({
                 position: markLocation, // 마커가 위치할 위도와 경도(변수)
                 map: map,
                // info: m_title,
                 title: m_marker_title // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
             });

             var content = m_title; // 말풍선 안에 들어갈 내용

             // 마커를 클릭했을 때의 이벤트. 말풍선
             var infowindow = new google.maps.InfoWindow({ content: content});

             google.maps.event.addListener(marker, "click", function() {
                 infowindow.open(map,marker);
             });

             }//initialize 끝

              google.maps.event.addDomListener(window, 'load', initialize);
}

</script>

<script>
function popupOpen1(){
		var popUrl = "";	//팝업창에 출력될 페이지 URL
		var popOption = "width=900, height=730,top=70, left=220, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
			window.open(popUrl,"",popOption);
		}

	function popupOpen2(){
		var popUrl = "";	//팝업창에 출력될 페이지 URL
		var popOption = "width=900, height=730,top=70, left=220, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
			window.open(popUrl,"",popOption);
		}
</script>

</head>
<body>
	
	

	<c:if test="${empty login.user_team}">

		<div class="club_notteam" align="center" >
			<table border="1" style="border-collapse: 1; ">
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

	</c:if>

	<c:if test="${not empty login.user_team}">
		<table>

			<tr>
				<td><img alt="팀로고" src="image/${team.team_logo} "
					style="width: 300px; height: 200px;"></td>
			
				<td>
					<!---------------------------------- 달력 ------------------------------------------>
					<div name="f" align="center">

						<table class="calcla">
							<tr class="date">
								<td colspan="7"><a
									href="club.do?cal=sleft&year=${cdto.year}&month=${cdto.month}&user_address=${login.user_address}&user_team=${login.user_team}"><img
										src="image/left.png"></a> ${cdto.year}년 ${cdto.month}월 <a
									href="club.do?cal=sright&year=${cdto.year}&month=${cdto.month}&user_address=${login.user_address}&user_team=${login.user_team}"><img
										src="image/right.png"></a></td>
							</tr>
							<tr class="date"><td>일</td><td>월</td><td>화</td><td>수</td><td>목</td><td>금</td><td>토</td></tr>
							<tr>
								<c:forEach begin="1" end="${cdto.dayOfWeek-1}" step="1">
									<td>&nbsp;</td>
								</c:forEach>
								<c:forEach var="i" step="1" begin="1" end="${cdto.lastday}">
									<td height="50" width="50" align="left" valign="top">
										${i } <a href="" onclick="popupOpen1()">
										<input type="hidden" name="write" value="writecal.do?year=${cdto.year}&month=${cdto.month}&day=${i }">
											<img src="image/pen.gif">
									</a> 
									<c:forEach var="j" items="${getmycal }">
											<c:if test="${i eq j.getRdate().substring(6, 8)}">
												<a href="" onclick="popupOpen2()"><img src='image/on.png'>
												<input type="hidden" name="caldetail" value="caldetail.do?rdate=${j.getRdate() }&id=${j.getTeam_name()}">
												</a>
											</c:if>
									</c:forEach></td>
									<c:if test="${(i+cdto.dayOfWeek-1)%7==0}"></tr><tr></c:if>
								</c:forEach>
								<c:forEach var="i" begin="1" step="1" end="${(7-(cdto.dayOfWeek +cdto.lastday-1)%7)%7}">
									<td>&nbsp;</td>
								</c:forEach>
							</tr>
						</table>
					</div>
				</td>
				<!---------------------------------- 달력 ------------------------------------------>
				
			</tr><tr>
				<td>팀 소개 내용 ${team.team_intro}</td>
				<td>일정 내용 5개</td>
			</tr>
			<tr>
				<td>
					<table>
						<c:forEach items="${gameRecList}" var="gameRecVO">
							<tr>
								<td style="background-color: blue;"><img
									src="image/${gameRecVO.win_team_logo}"
									style="width: 200px; height: 100px;"></td>
								<td>VS</td>
								<td style="background-color: red;"><img
									src="image/${gameRecVO.lose_team_logo}"
									style="width: 200px; height: 100px;"></td>
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
			<tr>
				<td colspan="2">구장 주소ㄴ리너림너라ㅣㅁ너ㅣ람너ㅣㅏㄹ</td>
			</tr>
			<tr>
				<td colspan="2" id="map" style="width: 500px; height: 450px"></td>
			</tr>


		</table>
	</c:if>

</body>
</html>