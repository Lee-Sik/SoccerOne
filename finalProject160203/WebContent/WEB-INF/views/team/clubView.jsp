<%@page import="soccer.co.DTO.foot_user_DTO"%>
<%@page import="soccer.co.DTO.foot_team_DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<link href="CSS/clubview.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://maps.google.com/maps/api/js"></script>
<%
   foot_team_DTO myteam = (foot_team_DTO)session.getAttribute("team");
                 
%>
<script>
var a,b;
var url='https://maps.googleapis.com/maps/api/geocode/json?address=<%=myteam.getTeam_home()%>&key=AIzaSyDmrTAC2knfxkHTWStqoS59Pf7IquSj9QE';

$.ajax({ //구글 에서 가져오는 좌표 를 위한 ajax
    url: url,
    dataType: 'JSON',
    jsonpCallback: 'callback',
    type: 'GET',
    success: function (data) {
        a=data.results[0].geometry.location.lat;
        b=data.results[0].geometry.location.lng;
        something(a,b);
    }
});

$.ajax({//내 서버에서 필요한 객체를 자바스크립트로 가져오는 ajax
    url: "getTeamMember.do",
    dataType: 'JSON',
    jsonpCallback: 'callback',
    type: 'get',
    success: function (data) {
       kk=[];
       for(var i=0;i<data.length;i++){
          kk.push(data[i]);
          //alert(kk[i].user_address);
       }
    }
});

function something(a,b){
              var m_title = "<%=myteam.getTeam_name()%> 홈 구장"; // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
             var m_marker_title = "<%=myteam.getTeam_home()%>";// 말풍선 안에 들어갈 내용
             
             function initialize() {
                var m_width = "400px";
                var m_height = "300px";
                
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
<script> //--------------------포지션 드레그 엔 드롭-------------------------//
try {
var userPosition = []; //나중에 el 태그로 넣어 준다.
   
   function allowDrop(ev) {
      ev.preventDefault();
   }

   function drag(ev,this1) {
   
      ev.dataTransfer.setData("text",this1.id);
      //alert(this1.id);
   }

   function drop(ev) {
      ev.preventDefault();
      var bool = true;
      
      var data = ev.dataTransfer.getData("text");  //id
      //alert(data);
      for(var i=0; i<userPosition.length; i++){
         if(userPosition[i] == data){ // userPosition에 data가 있으면
            bool = false;
         }
      }
      if(bool){
         userPosition.push(data);//id 값을 userPosition배열 에 넣는다.
      }
      
      var x_pos = ev.clientX + document.body.scrollLeft-50 + 'px';//이동 할 x좌표
      var y_pos = ev.clientY + document.body.scrollTop-35 + 'px';//이동 할 y좌표
      var obj = document.getElementById(data);//.cloneNode(true);         //이동 할 객체
      
      ev.target.appendChild(obj);
      obj.style.position = "absolute";
      obj.style.left = x_pos;
      obj.style.top = y_pos;
   }
   
} catch (exception) {
   alert('예외 발생');
} finally {} //--------------------포지션 드레그 엔 드롭-------------------------
</script>
<script> //--------------------구글맵-------------------------
   function initialize() {
      var mapProp = {
         center : new google.maps.LatLng(51.508742, -0.120850),
         zoom : 5,
         mapTypeId : google.maps.MapTypeId.ROADMAP
      };
      var map = new google.maps.Map(document.getElementById("map"), mapProp);
   }
   google.maps.event.addDomListener(window, 'load', initialize);

 //--------------------구글맵-------------------------
</script>
<script>

window.onload = function () {
	
   for(var i=0; i<kk.length; i++){
	  // alert(kk[i].user_position1+','+kk[i].user_profile+','+kk[i].user_name);

	  newDiv = document.createElement("div");// 1.노드를 생성한다.
	  newDiv.setAttribute("class", "member");
	  newDiv.setAttribute("style", "background-image: url('image/member_bg.png'); background-size: 70px");
	  newDiv.setAttribute("id", kk[i].user_profile);
	  newDiv.setAttribute("ondragstart", "drag(event,this)");
	  newDiv.setAttribute("draggable", "true");
	  
	  newDiv.innerHTML = '<div class="member_position">'+kk[i].user_position1+'</div>'
			+'<div class="member_pic">'
				+'<p>'
					+'<img align="middle" src="image/'+kk[i].user_profile+'" '+'id="'+kk[i].user_profile+'-img" '+'style="width: 70px; height: 50px; margin: auto;">'
				+'</p>'
			+'</div>'
			+'<div class="member_name">'+kk[i].user_name+'</div>';
	   
		var basket=document.getElementById("basket");// 2.basket에 노드를 추가한다.
		basket.appendChild(newDiv);
   }
}
</script>
</head>
<body>

      <table>
         <tr>
            <td><img alt="팀로고" src="image/${team.team_logo} "
               style="width: 300px; height: 200px;"></td>
            <td>
               <!---------------------------------- 달력 ------------------------------------------>
               <div align="center">

                  <table class="calcla">
                     <tr class="date">
                        <td colspan="7"><a
                           href="club.do?cal=sleft&year=${cdto.year}&month=${cdto.month}&user_address=${login.user_address}&user_team=${login.user_team}"><img
                              src="image/left.png"></a> ${cdto.year}년 ${cdto.month}월 <a
                           href="club.do?cal=sright&year=${cdto.year}&month=${cdto.month}&user_address=${login.user_address}&user_team=${login.user_team}"><img
                              src="image/right.png"></a></td>
                     </tr>
                     <tr class="date">
                        <td>일</td>
                        <td>월</td>
                        <td>화</td>
                        <td>수</td>
                        <td>목</td>
                        <td>금</td>
                        <td>토</td>
                     </tr>
                     <tr>
                        <c:forEach begin="1" end="${cdto.dayOfWeek-1}" step="1">
                           <td>&nbsp;</td>
                        </c:forEach>
                        <c:forEach var="i" step="1" begin="1" end="${cdto.lastday}">
                           <td height="50" width="50" align="left" valign="top">${i }
                              <a
                              href="javascript:window.open('writecal.do?year=${cdto.year}&month=${cdto.month}&day=${i }','',
                                          'width=900, height=600,top=70, left=220, resizable=no, scrollbars=no, status=no;');">

                                 <img src="image/pen.gif">
                           </a> <c:forEach var="j" items="${getmycal }">
                                 <c:if test="${i eq j.getRdate().substring(6, 8)}">

                                    <a
                                       href="javascript:window.open('caldetail.do?rdate=${j.getRdate() }&team_name=${j.getTeam_name()}','',
                                          'width=900, height=600,top=70, left=220, resizable=no, scrollbars=no, status=no;');">
                                       <img src='image/on.png'>
                                    </a>

                                 </c:if>
                              </c:forEach>
                           </td>
                           <c:if test="${(i+cdto.dayOfWeek-1)%7==0}">
                     </tr>
                     <tr>
                        </c:if>
                        </c:forEach>
                        <c:forEach var="i" begin="1" step="1"
                           end="${(7-(cdto.dayOfWeek +cdto.lastday-1)%7)%7}">
                           <td>&nbsp;</td>
                        </c:forEach>
                     </tr>
                  </table>
               </div>
            </td>
            <!---------------------------------- 달력 ------------------------------------------>
         </tr>
         <tr>
            <td>팀 소개 내용 ${team.team_intro}</td>
            <td>
					<table class="qwe">
						<col width="10">
						<col width="300">
						<col width="400">
						<col width="100">
						<tr>
								<td>날짜</td>
								<td>제목</td>
								<td>내용</td>
								<td>위치</td>
							</tr>
						<c:forEach var="i" items="${ getmycal}" end="4">
							
							<tr>
								<td>${i.rdate }</td>
								<td>${i.textname }</td>
								<td><a href="" onclick="javascript:window.open('caldetail1.do?no=${i.no }','',
                         'width=600, height=400,top=70, left=220, resizable=no, scrollbars=no, status=no;');">${i.text }</a></td>
								<td>${i.location }</td>
							</tr>
						</c:forEach>
						<c:if test="${empty getmycal }">
							
							<tr>
							<td colspan="4">이번달의 일정이 없습니다.</td>
							</tr>
						</c:if>
					</table>
				</td>
			</tr>
		
         <tr>
            <td>
               <table>
                  <c:forEach items="${gameRecList}" var="gameRecVO">
                     <tr>
                        <td>
                           <div style="background-color: blue;">
                              <img src="image/${gameRecVO.win_team_logo}"
                                 style="width: 200px; height: 100px;"
                                 onclick="javascript:window.open('teamView.do?team_name=${gameRecVO.win_team}','',
                                             'width=600, height=400,top=70, left=220, resizable=no, scrollbars=no, status=no;');">
                           
                           <div>${gameRecVO.win_team}</div>
                           </div>
                        </td>
                        <td>VS</td>
                        <td>
                           <div style="background-color: red;">
                              <img src="image/${gameRecVO.lose_team_logo}"
                                 style="width: 200px; height: 100px;"
                                 onclick="javascript:window.open('teamView.do?team_name=${gameRecVO.lose_team}','',
                                             'width=600, height=400,top=70, left=220, resizable=no, scrollbars=no, status=no;');">
                              <div>${gameRecVO.lose_team}</div>
                           </div>
                        </td>
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
         <!----------------------------------포지션 ------------------------------------------>

      </table>

		<table class="1" style="width: 100%; height: 851px;">
			<tr>
				<td
					style="background-image: url('image/gujang.png'); width: 500px; height: 851px; background-repeat: no-repeat;"
					ondrop="drop(event)" ondragover="allowDrop(event)"></td>
				<td style="height: 681px;">
					<div style="overflow: scroll; height: 851px" id="basket">
<%-- 						<c:forEach items="${teamMemberList}" var="mem"> --%>
<!-- 							<div class="member" -->
<!-- 								style="background-image: url('image/member_bg.png'); background-size: 70px" -->
<%-- 								id="${mem.user_profile}" draggable="true" --%>
<!-- 								ondragstart="drag(event,this)"> -->
<%-- 								<div class="member_position">${mem.user_position1}</div> --%>
<!-- 								<div class="member_pic"> -->
<!-- 									<p> -->
<%-- 										<img align="middle" src="image/${mem.user_profile}" --%>
<%-- 											id="${mem.user_profile}-img" --%>
<!-- 											style="width: 70px; height: 50px; margin: auto;"> -->
<!-- 									</p> -->
<!-- 								</div> -->
<%-- 								<div class="member_name">${mem.user_name}</div> --%>
<!-- 							</div> -->
<%-- 						</c:forEach> --%>
					</div>
				</td>
			</tr>
			<!----------------------------------포지션 ------------------------------------------>
			<tr style="width: 100px;">


            <td colspan="2">주소 : ${team.team_home}</td>

			</tr>
			<tr>
				<td colspan="2" id="map" style="width: 400px; height: 300px"></td>
			</tr>
		</table>
	<script>

//alert(kk[0].user_address);
</script>
</body>
</html>