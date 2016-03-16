<%@page import="java.util.Calendar"%>
<%@page import="soccer.co.Service.impl.foot_stadiumService_impl"%>
<%@page import="soccer.co.Service.foot_stadiumService"%>
<%@page import="soccer.co.DAO.foot_stadium_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   

<link href="CSS/admincal.css" rel="stylesheet" type="text/css" />
<link href="CSS/admintable.css" rel="stylesheet" type="text/css" />
<!-- // jQuery UI CSS파일  -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<!-- // jQuery 기본 js파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<!-- // jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript">
$(function() {
    $( "#testDatepicker" ).datepicker({
    	
    	 onSelect: function (dateText, inst) {  
    		
    		 var v = $( "#testDatepicker" ).val();
    		 		 
    		 location.href="./notrecordcallist.do?day=" + v;
    	 }  
    }); 
	/* $("#testDatepicker").click(function(){
		var v = $("#testDatepicker").val();
		location.href = "./bookingDayList.do?day=" + v;
	}); */
	
});
</script>
</head>


<body>

<table style="width: 80%; margin-left: auto; margin-right: auto;">

<tr>
	<td class="cal">
		<div class="calendar">
			<form name="f1" action="">	
			<div id="testDatepicker" style="margin-left: 30px;">
				<input type="hidden" name="booking_day" id="testDatepicker">
			</div>
			</form>
		</div>
	</td>
	<td>
		<table class="list_table" >
			<tr>
				<td colspan="5" style="text-align: center; font-weight: bold">최근 경기완료 리스트</td>
			</tr>
			<tr>
			<th>번호</th> <th>경기일자</th> <th>홈 팀</th> <th>상대 팀</th> <th>입력 상태</th>
			</tr>
					<c:if test="${not empty adminrecordlist}">
						<c:forEach items="${adminrecordlist}" var="reclist" varStatus="vs">
							<tr>
								<td>${vs.count}</td>
								<td>${reclist.game_date}</td>
								<td>${reclist.team_name}</td>
								<td>${reclist.team_name1}</td>
								<c:if test="${reclist.game_state == 1}">
									<td bgcolor="orange" style="font-weight: bold;">
									<a href="#" 
		 							onclick="javascript:window.open('./recordinsert.do?game_no=${reclist.game_no}&teamName1=${reclist.team_name}&teamName2=${reclist.team_name1}','','location=0,status=0,scrollbars=1,width=600,height=450');">
									입력 대기중</a></td> 
<%-- 									${reclist} --%>
<%-- 홈팀 지역 : ${record.home_local}<br> --%>
<%-- 승리팀  : ${record.win_team}<br> --%>
<%-- 패배팀 : ${record.lose_team}<br> --%>
<%-- 어웨이팀 지역: ${record.away_local}<br> --%>
									
								</c:if>

							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty adminrecordlist}">
							<tr>
								<td colspan="5">입력 대기중인 경기가 없습니다.</td>
							</tr>
					</c:if>
		</table>
	</td>		
</tr>
</table>

</body>
</html>