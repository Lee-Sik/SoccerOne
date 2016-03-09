<%@page import="java.util.Calendar"%>
<%@page import="soccer.co.Service.impl.foot_stadiumService_impl"%>
<%@page import="soccer.co.Service.foot_stadiumService"%>
<%@page import="soccer.co.DAO.foot_stadium_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   

<link href="CSS/admincal.css" rel="stylesheet" type="text/css" />
<link href="CSS/Admintable.css" rel="stylesheet" type="text/css" />
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
    		 		 
    		 location.href="./adminmain.do?day=" + v;
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
			<div id="testDatepicker" style="margin-top: -10px; margin-left: -20px;">
				<input type="hidden" name="booking_day" id="testDatepicker">
			</div>
			</form>
		</div>
	</td>
	<td>
		<table class="list_table" >
			<tr>
			<th>경기일자</th> <th>홈 팀</th> <th>상대 팀</th> <th>입력 상태</th>
			<c:forEach items="${adminrecordlist}" var="reclist" varStatus="vs">
				<tr>
				<td>${reclist.game_date}</td>
				<td>${reclist.team_name}</td>
				<td>${reclist.team_name1}</td>
				<td>${reclist.game_state}</td>
				</tr>
			</c:forEach>
			</tr>
		</table>
	</td>		
</tr>
</table>

</body>
</html>