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
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=b96f6f78cb32a760eab6750a6cdc3266&libraries=services"></script>


<script>

$.ajax({//내 서버에서 필요한 객체를 자바스크립트로 가져오는 ajax
    url: "getTeamMember.do",
    dataType: 'JSON',
    jsonpCallback: 'callback',
    type: 'get',
    success: function (data) {
    	
       kk=[];
       for(var i=0;i<data.length;i++){
          kk.push(data[i]);// kk에 json 객체 담기 
        
       }
       
       for(var i=0; i<kk.length; i++){
    		  // alert(kk[i].user_position1+','+kk[i].user_profile+','+kk[i].user_name);
    		  var basket=document.getElementById("basket");// basket에 노드를 추가한다.
    		  var gujang=document.getElementById("gujang");// gujang에 노드를 추가한다.
    		  
    		  newDiv = document.createElement("div");// 1.노드를 생성한다.
    		  $(newDiv).attr('class', 'member');
    		  $(newDiv).attr('style', "background-image: url('image/member_bg.png'); background-size: 70px");
    		  $(newDiv).attr('id', i);
    		  $(newDiv).attr('ondragstart', 'drag(event,this)');
    		  $(newDiv).attr('draggable', 'true');
    		  
    		  $(newDiv).attr('ondrop', 'drop3(event,this)');
    		  $(newDiv).attr('ondragover', 'allowDrop3(event)');
    		  
    		  newDiv.innerHTML = 
    				'<div class="member_pic">'
    					+'<p>'
    						+'<img align="middle" src="image/'+kk[i].user_profile+'" '+'id="'+kk[i].user_profile+'-img" '+'style="width: 64px; height: 46px; margin: auto;">'
    					+'</p>'
    				+'</div>'
    				+'<div class="member_position">'+kk[i].user_position1+'</div>'
    				+'<div class="member_name" style="font-size: 11px;">'+kk[i].user_name+'</div>';
    				
    		  if(kk[i].x == 0 && kk[i].y == 0){//if x,y 좌표가 null이면 basket에 추가 하고,
  
        			basket.appendChild(newDiv);
    			  
    		  }else{//null이 아니면, gujang에 추가 
    			  gujang.appendChild(newDiv);
    		  
    			  $(newDiv).css({
    		    	   "position" : "absolute",
    		    	   "top" :  kk[i].y+'px',
    		    	   "left" : kk[i].x+'px'
    		    	});
    		  }
    	   }
    }
});

</script>
<script> //--------------------포지션 드레그 엔 드롭-------------------------//
try {
	tmp= false;
var userPosition = []; //나중에 el 태그로 넣어 준다.

	function savePosition(){

		var jsonStr = JSON.stringify(kk);
		console.log("jsonStr : " + jsonStr);
		$.ajax({
			url : 'savePosition.do'
	        ,method : "post"
			,dataType : 'json'
			,data : jsonStr
			,processData : true /*querySTring make false*/
			,contentType : "application/json; charset=UTF-8"
			,success : function(data, stat, xhr) {
				alert("success");
			}
		    ,error : function(xhr, stat, err) {
		    	alert("error");
		    	console.log(err);
		    }
		});


	}
   
   function allowDrop(ev) {
      ev.preventDefault();
   }
   
   function allowDrop2(ev) {
	   //alert('allowDrop2');
	      ev.preventDefault();
	}
   
   function allowDrop3(ev) {
	      ev.preventDefault();
	}
   function drop3(ev,this2) {
	   ev.preventDefault();
	  
	   data3=this2.id;//target
	   
	   tmp = true;
	   
   }
   
   
   function drag(ev,this1) {
   
      ev.dataTransfer.setData("text",this1.id);
      //alert(this1.id);
   }
   
   function drop2(ev) {
	   ev.preventDefault();
	   var data = ev.dataTransfer.getData("text");
	   
	   if(tmp){
		   //alert('a');
			var target = document.getElementById(data3);
	 		var source = document.getElementById(data);
	 		
			if(source.parentNode.id == 'gujang'){//외부에서 들어 올때
				
			//alert('외부에서 접근');
			 var index = Array.prototype.indexOf.call(basket.children, target);
			// alert(index);
				document.getElementById('gujang').appendChild(target);
				
				$(target).css({
		   	  	 "position" : "absolute",
		   	 	  "top" : kk[data].y +'px',
		   		   "left" : kk[data].x +'px'
		   		});
				
				//document.getElementById('basket').appendChild(source);
				// document.getElementById('basket').insertBefore(source,target);
				
				
				   var list = document.getElementById("basket");
				    list.insertBefore(source, list.childNodes[index+1]);
				
				$(source).css({
		   	  	 "position" : "relative",
		   	 	  "top" : 0 +'px',
		   		   "left" : 0 +'px'
		   		});
				
				var tmpX=kk[data].x;
				var tmpY=kk[data].y;
				kk[data].x=0;
				kk[data].y=0;
				kk[data3].x=tmpX;
				kk[data3].y=tmpY;
				
			}else{//내부끼리 교환
				
				 var sourceClone=source.cloneNode(true);
					 var targetClone=target.cloneNode(true);
							 
					  document.getElementById('basket').replaceChild(targetClone,source);
					  document.getElementById('basket').replaceChild(sourceClone,target);
		
			}
			
		   tmp= false;
	   }else{//배경에 닿았을 때
		   var obj = document.getElementById(data);
		   
	    $(obj).css({
    	   "position" : "relative",
    	   "top" : 0 +'px',
    	   "left" : 0 +'px'
    	});
	    
	    kk[data].x =0;//json 객체의 포지션을 변경 ->나중에 저장 할 때 필요
	    kk[data].y = 0;
	   
	   ev.target.appendChild(obj);
	   
	   	tmp= false;
	   }
   }
   

   function drop(ev) {
      ev.preventDefault();
      var $nodes1 = $(ev.target).contents();
//      alert("body의 자식노드자식 노드 갯수는 ? " + $nodes1.size());

	  // if($nodes1.size() < 11){
    	  
       var data = ev.dataTransfer.getData("text");  //id
    		    	  
       var obj = document.getElementById(data); //.cloneNode(true);
      
   	  var x_pos = ev.pageX-45;//이동 할 x좌표
      var y_pos = ev.pageY-55;//이동 할 y좌표
      
      var source = document.getElementById(data);
     //alert(x_pos+','+y_pos);
		if(tmp){//카드끼리 위치 바꾸기
			//alert('b');
// 			alert(data3);//target
// 			alert(data);//source

			var target = document.getElementById(data3);
	 		
	 		//alert(source.parentNode.id);
			if(source.parentNode.id == 'gujang'){//내부
				//alert(target.id);
		 		$(target).css({
	    	  	 "position" : "absolute",
	    	 	  "top" : kk[data].y +'px',
	    		   "left" : kk[data].x +'px'
	    		});
		 	//	alert(source.id);
	 		$(source).css({
	    	  	 "position" : "absolute",
	    	 	  "top" : kk[data3].y +'px',
	    		   "left" : kk[data3].x +'px'
	    		});
	 		var tmpX=kk[data].x;
	 		var tmpY=kk[data].y;
	 		kk[data].x=kk[data3].x;
	 		kk[data].y=kk[data3].y;
	 		kk[data3].x=tmpX;
	 		kk[data3].y=tmpY;
	 		
			}else{//basket에서 들어올때
				
				 var index = Array.prototype.indexOf.call(basket.children, source);
				document.getElementById('gujang').appendChild(source);
			//	alert('kk[data3].y='+kk[data3].y);
				$(source).css({
		    	  	 "position" : "absolute",
		    	 	  "top" : kk[data3].y +'px',
		    		   "left" : kk[data3].x +'px'
		    	});
				
				var list = document.getElementById("basket");
			    list.insertBefore(target, list.childNodes[index+1]);
				
			    $(target).css({
			   	  	 "position" : "relative",
			   	 	  "top" : 0 +'px',
			   		   "left" : 0 +'px'
			   		});
				
			    var tmpX=kk[data3].x;
				var tmpY=kk[data3].y;
				kk[data3].x=0;
				kk[data3].y=0;
				kk[data].x=tmpX;
				kk[data].y=tmpY;
			}
			tmp= false;
			
		}else if(source.parentNode.id == 'basket' && $nodes1.size() < 11){//배경에 닿았을 때
			  kk[data].x =ev.pageX-45;//json 객체의 포지션을 변경 ->나중에 저장 할 때 필요
		      kk[data].y =ev.pageY-55;
			  
     	 	ev.target.appendChild(obj);
     	 	
     	 	$(obj).css({
    	  	 "position" : "absolute",
    	 	  "top" : y_pos +'px',
    		   "left" : x_pos +'px'
    		});
     	 	tmp= false;
 		}else if(source.parentNode.id == 'gujang'){
 			  kk[data].x =ev.pageX-45;//json 객체의 포지션을 변경 ->나중에 저장 할 때 필요
		      kk[data].y =ev.pageY-55;
			  
     	 	//ev.target.appendChild(obj);
     	 	$(obj).css({
    	  	 "position" : "absolute",
    	 	  "top" : y_pos +'px',
    		   "left" : x_pos +'px'
    		});
     	 	tmp= false;
 		}else{
 			 alert("인원을 11명 이상 추가 할 수 없습니다.");
 		}
    }
      
} catch (exception) {
   alert('예외 발생');
} finally {} //--------------------포지션 드레그 엔 드롭-----------
</script>

</head>
<body>

<table class="list_table" style="width: 85%;">
<colgroup>
<col width="35%"/>
<col width="50%"/>
</colgroup>
<tr>
	<th>클럽 엠블럼 </th>
	<th>이달의 일정</th>	
</tr>

<tr>
	<td align="center" width="400px;"><img alt="팀로고" 
	src="image/${team.team_logo}" style="width: 300px;"></td>
<!-- 이달의 일정 부분 -->		
	<td>
	<div align="center">
	<table class="list_table">
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
			<td height="50" width="50" align="left" valign="top" style="text-align: left;">${i }
				<a
				href="javascript:window.open('writecal.do?year=${cdto.year}&month=${cdto.month}&day=${i }','',
                                     'width=900, height=600,top=70, left=220, resizable=no, scrollbars=no, status=no;');">

					<img src="image/pen.gif">
			</a> <c:forEach var="j" items="${getmycal }" >
					<c:if test="${i eq j.getRdate().substring(6, 8)}">

						<a href="javascript:window.open('caldetail.do?rdate=${j.getRdate() }&team_name=${j.getTeam_name()}','',
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
</tr>
<!-- 이달의 일정 부분 -->	

<tr>
	<th colspan="2">마이 클럽 명</th>
</tr>

<tr>
	<td colspan="2" style="font-size: 18px;"><b>${team.team_intro}</b>
	<br><br>
	클럽장 : ${team.team_managerid}
	</td>
</tr>
</table>
<br><br>
<table class="list_table" style="width: 85%;">
	<col width="20%">
	<col width="25%">
	<col width="30%">
	<col width="25%">

<tr>
	<td colspan="4" style="font-size: 15px;"><b>이달의 일정</b></td>
</tr>

<tr>
	<th>날짜</th>
	<th>제목</th>
	<th>내용</th>
	<th>위치</th>
</tr>
	<c:forEach var="i" items="${getmycal}" end="4">

		<tr>
			<td>${i.rdate }</td>
			<td>${i.textname }</td>
			<td><a href=""
				onclick="javascript:window.open('caldetail1.do?no=${i.no }','',
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
				
				
<!-- 	<table> -->
<!-- 		<tr> -->
<%-- 			<td align="center" width="400px;"><img alt="팀로고" src="image/${team.team_logo} " --%>
<!-- 				style="width: 300px;"></td> -->
<!-- 			<td> -->
<!-- 				-------------------------------- 달력 ---------------------------------------- -->
<!-- 				<div align="center"> -->

<!-- 					<table class="calcla"> -->
<!-- 						<tr class="date"> -->
<!-- 							<td colspan="7"><a -->
<%-- 								href="club.do?cal=sleft&year=${cdto.year}&month=${cdto.month}&user_address=${login.user_address}&user_team=${login.user_team}"><img --%>
<%-- 									src="image/left.png"></a> ${cdto.year}년 ${cdto.month}월 <a --%>
<%-- 								href="club.do?cal=sright&year=${cdto.year}&month=${cdto.month}&user_address=${login.user_address}&user_team=${login.user_team}"><img --%>
<!-- 									src="image/right.png"></a></td> -->
<!-- 						</tr> -->
<!-- 						<tr class="date"> -->
<!-- 							<td>일</td> -->
<!-- 							<td>월</td> -->
<!-- 							<td>화</td> -->
<!-- 							<td>수</td> -->
<!-- 							<td>목</td> -->
<!-- 							<td>금</td> -->
<!-- 							<td>토</td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<%-- 							<c:forEach begin="1" end="${cdto.dayOfWeek-1}" step="1"> --%>
<!-- 								<td>&nbsp;</td> -->
<%-- 							</c:forEach> --%>
<%-- 							<c:forEach var="i" step="1" begin="1" end="${cdto.lastday}"> --%>
<%-- 								<td height="50" width="50" align="left" valign="top">${i } --%>
<!-- 									<a -->
<%-- 									href="javascript:window.open('writecal.do?year=${cdto.year}&month=${cdto.month}&day=${i }','', --%>
<%--                                           'width=900, height=600,top=70, left=220, resizable=no, scrollbars=no, status=no;');"> --%>

<!-- 										<img src="image/pen.gif"> -->
<%-- 								</a> <c:forEach var="j" items="${getmycal }" end="0"> --%>
<%-- 										<c:if test="${i eq j.getRdate().substring(6, 8)}"> --%>

<!-- 											<a -->
<%-- 												href="javascript:window.open('caldetail.do?rdate=${j.getRdate() }&team_name=${j.getTeam_name()}','', --%>
<%--                                           'width=900, height=600,top=70, left=220, resizable=no, scrollbars=no, status=no;');"> --%>
<!-- 												<img src='image/on.png'> -->
<!-- 											</a> -->
<%-- 										</c:if> --%>
<%-- 									</c:forEach> --%>
<!-- 								</td> -->
<%-- 								<c:if test="${(i+cdto.dayOfWeek-1)%7==0}"> --%>
<!-- 						</tr> -->
<!-- 						<tr> -->
<%-- 							</c:if> --%>
<%-- 							</c:forEach> --%>
<%-- 							<c:forEach var="i" begin="1" step="1" --%>
<%-- 								end="${(7-(cdto.dayOfWeek +cdto.lastday-1)%7)%7}"> --%>
<!-- 								<td>&nbsp;</td> -->
<%-- 							</c:forEach> --%>
<!-- 						</tr> -->
<!-- 					</table> -->
<!-- 				</div> -->
<!-- 			</td> -->
			<!---------------------------------- 달력 ------------------------------------------>
<!-- 		</tr> -->
<!-- 		<tr> -->
<%-- 			<td>팀 소개 내용 ${team.team_intro}</td> --%>
<!-- 			<td> -->
<!-- 				<table class="qwe"> -->
<%-- 					<col width="20%"> --%>
<%-- 					<col width="25%"> --%>
<%-- 					<col width="30%"> --%>
<%-- 					<col width="25%"> --%>
					
<!-- 					<tr> -->
<!-- 						<td>날짜</td> -->
<!-- 						<td>제목</td> -->
<!-- 						<td>내용</td> -->
<!-- 						<td>위치</td> -->
<!-- 					</tr> -->
<%-- 					<c:forEach var="i" items="${ getmycal}" end="4"> --%>

<!-- 						<tr> -->
<%-- 							<td>${i.rdate }</td> --%>
<%-- 							<td>${i.textname }</td> --%>
<!-- 							<td><a href="" -->
<%-- 								onclick="javascript:window.open('caldetail1.do?no=${i.no }','', --%>
<%--                          'width=600, height=400,top=70, left=220, resizable=no, scrollbars=no, status=no;');">${i.text }</a></td> --%>
<%-- 							<td>${i.location }</td> --%>
<!-- 						</tr> -->
<%-- 					</c:forEach> --%>
<%-- 					<c:if test="${empty getmycal }"> --%>

<!-- 						<tr> -->
<!-- 							<td colspan="4">이번달의 일정이 없습니다.</td> -->
<!-- 						</tr> -->

<%-- 					</c:if> --%>
<!-- 				</table> -->
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
			<td id="gujang"
				style="background-image: url('image/gujang.png'); width: 500px; height: 851px; background-repeat: no-repeat;"
				ondrop="drop(event)" ondragover="allowDrop(event)"></td>
			<td style="height: 681px;">
				<div style="overflow: scroll; height: 851px" id="basket"
					ondrop="drop2(event)" ondragover="allowDrop2(event)"></div> <input
				type="button" onclick="savePosition()" value="위치 저장"> <!-- 			ajax로 kk의 json 객체를 전송 해야 한다. -->
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
// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new daum.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 10 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places(); 

// 키워드로 장소를 검색합니다
ps.keywordSearch('서울 양천구 서울강서초등학교', placesSearchCB); 

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (status, data, pagination) {
    if (status === daum.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new daum.maps.LatLngBounds();

        for (var i=0; i<1; i++) {
            displayMarker(data.places[i]);    
            bounds.extend(new daum.maps.LatLng(data.places[i].latitude, data.places[i].longitude));
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new daum.maps.Marker({
        map: map,
        position: new daum.maps.LatLng(place.latitude, place.longitude) 
    });

    // 마커에 클릭이벤트를 등록합니다
    daum.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.title + '</div>');
        infowindow.open(map, marker);
    });
}
</script>
</body>
</html>