<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!-- <link rel="stylesheet" type="text/css" media="all" href="booking/ie11.css" />
<script type="text/javascript" src="//wcs.naver.net/wcslog.js"></script>
<script type="text/javascript" src="booking/json"></script> -->
<link href="CSS/booking.css" rel="stylesheet" type="text/css" />



			<!-- 콘텐츠 -->			
				<div class="hb_wrap booking_wrap">


<div class="book_list_top" style="width: 80%; margin-left: 30px;">
	<div class="tab_area">
		<ul class="tab">
					<li class="on"><a href="/booking/stadium/main?area=00&date=&selectGround=&kword=">전체</a></li>
			<li class="" style="padding-left: 5.2px;"><a href="/booking/stadium/main?area=01&date=&selectGround=&kword=">동대문구</a></li>
			<li class=""><a href="/booking/stadium/main?area=02&date=&selectGround=&kword=">도봉구</a></li>
			<li class=""><a href="/booking/stadium/main?area=03&date=&selectGround=&kword=">성북구</a></li>
			<li class=""><a href="/booking/stadium/main?area=04&date=&selectGround=&kword=">중랑구</a></li>
			<li class=""><a href="/booking/stadium/main?area=05&date=&selectGround=&kword=">서대문구</a></li>
			<li class=""><a href="/booking/stadium/main?area=06&date=&selectGround=&kword=">성동구</a></li>
			<li class=""><a href="/booking/stadium/main?area=07&date=&selectGround=&kword=">마포구</a></li>
			<li class=""><a href="/booking/stadium/main?area=08&date=&selectGround=&kword=">영등포구</a></li>
			<li class=""><a href="/booking/stadium/main?area=09&date=&selectGround=&kword=">강북구</a></li>
			<li class=""><a href="/booking/stadium/main?area=10&date=&selectGround=&kword=">중 구</a></li>
			<li class=""><a href="/booking/stadium/main?area=11&date=&selectGround=&kword=">구로구</a></li>
			<li class=""><a href="/booking/stadium/main?area=12&date=&selectGround=&kword=">강서구</a></li>
			<li class="" style="width: 60px;"><a href="/booking/stadium/main?area=13&date=&selectGround=&kword=">동작구</a></li>
			<!-- <li class="" style="padding-left: 10.5px;"></li> -->
			<li class=""><a href="/booking/stadium/main?area=14&date=&selectGround=&kword=">관악구</a></li>
			<li class=""><a href="/booking/stadium/main?area=15&date=&selectGround=&kword=">노원구</a></li>
			<li class="" style="width: 59px;"><a href="/booking/stadium/main?area=16&date=&selectGround=&kword=">송파구</a></li>
			
			<li class=""><a href="/booking/stadium/main?area=16&date=&selectGround=&kword=">은평구</a></li>
			<li class=""><a href="/booking/stadium/main?area=16&date=&selectGround=&kword=">양천구</a></li>
			<li class=""><a href="/booking/stadium/main?area=16&date=&selectGround=&kword=">강남구</a></li>
			<li class=""><a href="/booking/stadium/main?area=16&date=&selectGround=&kword=">금천구</a></li>
			<li class=""><a href="/booking/stadium/main?area=16&date=&selectGround=&kword=">종로구</a></li>
			<li class=""><a href="/booking/stadium/main?area=16&date=&selectGround=&kword=">용산구</a></li>
			<li class=""><a href="/booking/stadium/main?area=16&date=&selectGround=&kword=">강동구</a></li>			
			<li class=""><a href="/booking/stadium/main?area=16&date=&selectGround=&kword=">서초구</a></li>
			<li class=""><a href="/booking/stadium/main?area=16&date=&selectGround=&kword=">광진구</a></li>
			<li class=""></li><li class=""></li><li class=""></li><li class=""></li>
			
		</ul>
		<br><br>
	</div>
	<!-- <div class="schedule_info">
		<div class="calendar">

		</div>
		<div class="game_booking">
			<h4>게임부킹</h4>
			<a href="/booking/board/list?board_idx=22" class="more">게임부킹 더보기</a>
			<ul class="game_booking">

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
		</div>
	</div> -->
</div>
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
		<td class="status"><span class="none"></span></td>
		<c:if test="${dto.game2 == null}">
		<td class="status"><span class="occupied">확정</span></td>
		</c:if>
		<!-- <td class="status"><span class="booking">부킹</span></td> -->
		<td class="status"><span class="none"></span></td>
		<td class="status"><span class="reserved">예약</span></td>
		<td class="status"><span class="none"></span></td>
		<td class="status"><span class="occupied">확정</span></td>
		<td class="status"><span class="none"></span></td>
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















