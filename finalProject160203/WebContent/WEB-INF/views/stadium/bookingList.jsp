<%@page import="java.util.Calendar"%>
<%@page import="soccer.co.Service.impl.foot_stadiumService_impl"%>
<%@page import="soccer.co.Service.foot_stadiumService"%>
<%@page import="soccer.co.DAO.foot_stadium_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   

<!-- <link rel="stylesheet" type="text/css" media="all" href="booking/ie11.css" />
<script type="text/javascript" src="//wcs.naver.net/wcslog.js"></script>
<script type="text/javascript" src="booking/json"></script> -->
<link href="CSS/booking.css" rel="stylesheet" type="text/css" />
<!-- // jQuery UI CSS파일  -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<!-- // jQuery 기본 js파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<!-- // jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script type="text/javascript">

/* var dtNow = new Date();  
$(document).ready(function () {  
	 var x = new Date(2013, 1, 22, 0, 0, 0, 0);
     $( "#testDatepicker" ).datepicker({
    		 setDate:"7/11/2011"
    	});
});   */

	
	
 $(function() {
    $( "#testDatepicker" ).datepicker({
    	
    	 onSelect: function (dateText, inst) {  
    		
    		 var v = $( "#testDatepicker" ).val();
    		 		 
    		 location.href="./bookingList.do?day=" + v + "&mode=day";
    	 }  
    	
    	
    }); 
	/* $("#testDatepicker").click(function(){
		var v = $("#testDatepicker").val();
		location.href = "./bookingDayList.do?day=" + v;
	}); */
	
});
	  
	  
	  
	  
</script>


			<!-- 콘텐츠 -->			
				<div class="hb_wrap booking_wrap">


<div class="book_list_top" style="width: 82%; margin-left: 30px;">
	<div class="tab_area">
		<ul class="tab">
					<li class="on"><a href="./bookingList.do">전체</a></li>
			<li class="" style="padding-left: 5.2px;"><a href="./bookingList.do?mode=area&area=동대문구">동대문구</a></li>
			<li class=""><a href="./bookingList.do?mode=area&area=도봉구">도봉구</a></li>
			<li class=""><a href="./bookingList.do?mode=area&area=성북구">성북구</a></li>
			<li class=""><a href="./bookingList.do?mode=area&area=중랑구">중랑구</a></li>
			<li class=""><a href="./bookingList.do?mode=area&area=서대문구">서대문구</a></li>
			<li class=""><a href="./bookingList.do?mode=area&area=성동구">성동구</a></li>
			<li class=""><a href="./bookingList.do?mode=area&area=마포구">마포구</a></li>
			<li class=""><a href="./bookingList.do?mode=area&area=영등포구">영등포구</a></li>
			<li class=""><a href="./bookingList.do?mode=area&area=강북구">강북구</a></li>
			<li class=""><a href="./bookingList.do?mode=area&area=중구">중 구</a></li>
			<li class=""><a href="./bookingList.do?mode=area&area=구로구">구로구</a></li>
			<li class=""><a href="./bookingList.do?mode=area&area=강서구">강서구</a></li>
			<li class="" style="width: 60px;"><a href="./bookingList.do?mode=area&area=동작구">동작구</a></li>
			<!-- <li class="" style="padding-left: 10.5px;"></li> -->
			<li class=""><a href="./bookingList.do?mode=area&area=관악구">관악구</a></li>
			<li class=""><a href="./bookingList.do?mode=area&area=노원구">노원구</a></li>
			<li class="" style="width: 59px;"><a href="./bookingList.do?mode=area&area=송파구">송파구</a></li>
			
			<li class=""><a href="./bookingList.do?mode=area&area=은평구">은평구</a></li>
			<li class=""><a href="./bookingList.do?mode=area&area=양천구">양천구</a></li>
			<li class=""><a href="./bookingList.do?mode=area&area=강남구">강남구</a></li>
			<li class=""><a href="./bookingList.do?mode=area&area=금천구">금천구</a></li>
			<li class=""><a href="./bookingList.do?mode=area&area=종로구">종로구</a></li>
			<li class=""><a href="./bookingList.do?mode=area&area=용산구">용산구</a></li>
			<li class=""><a href="./bookingList.do?mode=area&area=강동구">강동구</a></li>			
			<li class=""><a href="./bookingList.do?mode=area&area=서초구">서초구</a></li>
			<li class=""><a href="./bookingList.do?mode=area&area=광진구">광진구</a></li>
			<li class=""></li><li class=""></li><li class=""></li><li class=""></li>
			
		</ul>
		<br><br>
	</div> <!-- tab_area -->
	
	 <div class="schedule_info">
		<div class="calendar">
	<form name="f1" action="">	
	<div id="testDatepicker" style="margin-top: -10px;">
		<input type="hidden" name="booking_day" id="testDatepicker">
	</div>
	</form>
		</div>
	 
		<div class="game_booking" style="margin-left: 225px; margin-top: -215px; width: 70%;">
			<h4>게임부킹</h4>
			<a href="/booking/board/list?board_idx=22" class="more">게임부킹 더보기</a>
			<ul class="game_booking" style="margin-top: -18px;">

							<li><a href="/booking/board/view?board_idx=22&post_idx=66487">
					<span class="area">서울, 경기</span>
					<strong>[구장확보]</strong>
					 토요일  2월6일 / 15시30분~18시경기 4부팀초청					</a>
				</li>
			 				<li><a href="/booking/board/view?board_idx=22&post_idx=66486">
					<span class="area">서울, 경기</span>
					<strong>[구장확보]</strong>
					일요일  2월7일 / 9시30분~11시30분경기 4부루키팀초청					</a>
				</li>
			 				<li><a href="/booking/board/view?board_idx=22&post_idx=66482">
					<span class="area">서울, 경기</span>
					<strong>[구장확보]</strong>
					2월14일2시경기 재미있게하실팀모십니다.					</a>
				</li>
			 				<li><a href="/booking/board/view?board_idx=22&post_idx=66479">
					<span class="area">서울, 인천</span>
					<strong>[구장확보]</strong>
					&lt;&lt;2월 대여현황&gt;&gt; 상대팀 초청 및 구장대여 합니...					</a>
				</li>
			 				<li><a href="/booking/board/view?board_idx=22&post_idx=66478">
					<span class="area">경기</span>
					<strong>[구장확보]</strong>
					◆[설연휴 할인-준준베이스볼 평일 및 주말 대관진행중] ...					</a>
				</li>
			 
			</ul>
		</div> <!-- game_booking -->
		
	</div> <!-- schedule_info -->
</div> <!-- book_list_top -->

<div class="book_list_body">
	<div class="book_search">
		
		<div class="btn_group w720">
		
			<div class="right" style="padding-top: 20px; padding-right: 50px;">
				<a href="stadiumList.do?user_email=${login.user_email}" class="bbtn">그라운드 부킹등록</a>
			</div>
		</div>
</div>
</div>


<h4 class="booking">부킹 정보</h4>
	<div class="book_list stadium_list">
		<table class="list_table" summary="부킹정보">
			<colgroup>
				<col span="1" width="70" />
				<col span="1" width="110" />
				<col span="10" width="43" />
				<col span="1" width="60" />
				<col span="1" />
			</colgroup>
			<thead>
				<tr>
					<th>대관날짜</th>
					<th>구장명</th>
					<th>1게임</th>
					<th>2게임</th>
					<th>3게임</th>
					<th>4게임</th>
					<th>5게임</th>
					<th>6게임</th>
					<th>7게임</th>
					<th>부킹확인</th>
					<th>지역</th>
				</tr>
			</thead>
			<!--status의 상태 클래스
			booking = 부킹
			reserved = 예약
			occupied = 확정
			none = 아무것도 없는상태
			-->
	<tbody>
	<c:forEach var="dto" items="${blist}">
	<tr>
		<th>${dto.booking_day}</th>
		<th><strong><a href="#" hidden_href="/booking/stadium/view?idx=5305&lig_idx=0" 
		class="viewbt">${dto.stadium_name}</a></strong></th>
	
	 	<c:choose>
				<c:when test="${empty dto.game1}">
				<td class="status"><span class="booking">부킹</span></td>
				</c:when>
				
				<c:otherwise>	
				  <c:choose>				 	
				 	<c:when test="${dto.game1=='예약'}">
					<td class="status"><span class="reserved">예약</span></td>
					</c:when>
				 			
				 	<c:otherwise>
				 	<td class="status"><span class="occupied">확정</span></td>
				 	</c:otherwise>				
					</c:choose>
				</c:otherwise>
		</c:choose>
		
		<c:choose>
				<c:when test="${empty dto.game2}">
				<td class="status"><span class="booking">부킹</span></td>
				</c:when>
				
				<c:otherwise>	
				  <c:choose>				 	
				 	<c:when test="${dto.game2=='예약'}">
					<td class="status"><span class="reserved">예약</span></td>
					</c:when>
				 			
				 	<c:otherwise>
				 	<td class="status"><span class="occupied">확정</span></td>
				 	</c:otherwise>				
					</c:choose>
				</c:otherwise>
		</c:choose>
		
		<c:choose>
				<c:when test="${empty dto.game3}">
				<td class="status"><span class="booking">부킹</span></td>
				</c:when>
				
				<c:otherwise>	
				  <c:choose>				 	
				 	<c:when test="${dto.game3=='예약'}">
					<td class="status"><span class="reserved">예약</span></td>
					</c:when>
				 			
				 	<c:otherwise>
				 	<td class="status"><span class="occupied">확정</span></td>
				 	</c:otherwise>				
					</c:choose>
				</c:otherwise>
		</c:choose>
		
		<c:choose>
				<c:when test="${empty dto.game4}">
				<td class="status"><span class="booking">부킹</span></td>
				</c:when>
				
				<c:otherwise>	
				  <c:choose>				 	
				 	<c:when test="${dto.game4=='예약'}">
					<td class="status"><span class="reserved">예약</span></td>
					</c:when>
				 			
				 	<c:otherwise>
				 	<td class="status"><span class="occupied">확정</span></td>
				 	</c:otherwise>				
					</c:choose>
				</c:otherwise>
		</c:choose>
		
		<c:choose>
				<c:when test="${empty dto.game5}">
				<td class="status"><span class="booking">부킹</span></td>
				</c:when>
				
				<c:otherwise>	
				  <c:choose>				 	
				 	<c:when test="${dto.game5=='예약'}">
					<td class="status"><span class="reserved">예약</span></td>
					</c:when>
				 			
				 	<c:otherwise>
				 	<td class="status"><span class="occupied">확정</span></td>
				 	</c:otherwise>				
					</c:choose>
				</c:otherwise>
		</c:choose>      
		
		
		<c:choose>
				<c:when test="${empty dto.game6}">
				<td class="status"><span class="booking">부킹</span></td>
				</c:when>
				
				<c:otherwise>	
				  <c:choose>				 	
				 	<c:when test="${dto.game6=='예약'}">
					<td class="status"><span class="reserved">예약</span></td>
					</c:when>
				 			
				 	<c:otherwise>
				 	<td class="status"><span class="occupied">확정</span></td>
				 	</c:otherwise>				
					</c:choose>
				</c:otherwise>
		</c:choose>
		
		<c:choose>
				<c:when test="${empty dto.game7}">
				<td class="status"><span class="booking">부킹</span></td>
				</c:when>
				
				<c:otherwise>	
				  <c:choose>				 	
				 	<c:when test="${dto.game7=='예약'}">
					<td class="status"><span class="reserved">예약</span></td>
					</c:when>
				 			
				 	<c:otherwise>
				 	<td class="status"><span class="occupied">확정</span></td>
				 	</c:otherwise>				
					</c:choose>
				</c:otherwise>
		</c:choose>  
		
	<td><a href="./bookingDetail.do?booking_seq=${dto.booking_seq}&stadium_seq=${dto.stadium_seq}" class="btn viewbt">보 기</a></td>
	<td><strong>${dto.booking_area}</strong></td>
	</tr>
	</c:forEach>
	
<!-- 	<tr>
		<th>2.5(금)</th>
		<th><strong><a href="#" hidden_href="/booking/stadium/view?idx=5305&lig_idx=0" 
		class="viewbt">소망인조잔디구장</a></strong></th>
		<td class="status"><span class="none"></span></td>
		<td class="status"><span class="booking">부킹</span></td>
		<td class="status"><span class="none"></span></td>
		<td class="status"><span class="reserved">예약</span></td>
		<td class="status"><span class="none"></span></td>
		<td class="status"><span class="occupied">확정</span></td>
		<td class="status"><span class="none"></span></td>
	<td><a href="#" hidden_href="/booking/stadium/view?idx=5305&lig_idx=0" class="btn viewbt">보 기</a></td>
	<td><strong>경기</strong></td>
	</tr> -->
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</table>
</div>


</div>

<br><br><br><br><br><br>













