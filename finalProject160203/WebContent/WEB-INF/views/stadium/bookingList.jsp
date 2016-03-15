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

 function ground() {
	
	var email = "${login.user_email}";
	
	if(email==null || email==""){
		alert("로그인 해주십시오.");
		location.href = "./first.do";
	}else{
		location.href = "stadiumList.do?user_email=" + email;
	}
		
	
 }	
	
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


<div class="book_list_top" style="width: 95%; margin-left: 30px;">
	<div class="tab_area">
		<ul class="tab" style=" padding-left: 0px;">
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
			<li class="" style="width: 7.8%"><a href="./bookingList.do?mode=area&area=동작구">동작구</a></li>
			<!-- <li class="" style="padding-left: 10.5px;"></li> -->
			<li class=""><a href="./bookingList.do?mode=area&area=관악구">관악구</a></li>
			<li class=""><a href="./bookingList.do?mode=area&area=노원구">노원구</a></li>
			<li class="" style="width: 7.7%"><a href="./bookingList.do?mode=area&area=송파구">송파구</a></li>
			
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
	<div id="testDatepicker" style="margin-top: -10px; margin-left: -20px;">
		<input type="hidden" name="booking_day" id="testDatepicker">
	</div>
	</form>
		</div>
	 
		<div class="game_booking" style="margin-left: 250px; margin-top: -215px; width: 70%;">
			<h4>자유대관</h4>
			<a href="./fbookingList.do" class="more">자유대관 더보기</a>
			<ul class="game_booking" style="margin-top: -18px;">
			<c:forEach var="dto" items="${flist}">		
				<li><a href="./fbookingDetail.do?seq=${dto.free_b_seq}">
					<span class="area">${dto.free_b_location}</span>
					<strong>[${dto.free_b_sendrecieve}]</strong>
					 ${dto.free_b_title}					</a>
				</li>
			</c:forEach> 	
			 
			</ul>
		</div> <!-- game_booking -->
		
	</div> <!-- schedule_info -->
</div> <!-- book_list_top -->

<div class="book_list_body">
	<div class="book_search">
		
		<div class="btn_group w720">
		
			<div class="right" style="padding-top: 20px; padding-right: 50px; margin-right: -100px;">
				<a href="#" class="bbtn" onclick="ground();">그라운드 부킹등록</a>
			</div>
		</div>
</div>
</div>

<form action="" id="_frmFormSearch" name="frmForm1" method="post">

<h4 class="booking">부킹 정보</h4>
	<div class="book_list stadium_list" style="width: 95%; margin-left: 100px;">
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
	<c:if test="${empty blist}">
	<tr>
		<td colspan="11">작성된 글이 없습니다.</td>
	</tr>
	</c:if>
	
	<c:forEach var="dto" items="${blist}">
	<tr>
		<th>${dto.booking_day.substring(0,8)}</th>
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
<br>
<div id="paging_wrap">
<input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:pageNumber}"/>						
	<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?10:recordCountPerPage}"/>
<jsp:include page="/WEB-INF/views/common/paging.jsp" flush="false">
	<jsp:param value="${pageNumber}" name="pageNumber"/>
	<jsp:param value="${pageCountPerScreen}" name="pageCountPerScreen"/>
	<jsp:param value="${recordCountPerPage}" name="recordCountPerPage"/>
	<jsp:param value="${totalRecordCount}" name="totalRecordCount"/>							
</jsp:include>				
</div>
</form>

<br><br><br><br><br><br>

<script type="text/javascript">
function goPage(pageNumber) {	
	$("#_pageNumber").val(pageNumber) ;
	$("#_frmFormSearch").attr("target","_self").attr("action","bookingList.do").submit();
}
</script>











