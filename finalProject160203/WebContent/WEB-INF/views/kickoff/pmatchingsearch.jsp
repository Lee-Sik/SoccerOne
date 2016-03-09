<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<link href="CSS/KICKOFF.css" rel="stylesheet" >

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<!DOCTYPE html>
<script>

$(function() {
  $( "#datepicker1" ).datepicker({
    dateFormat: 'yy-mm-dd',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    dayNames: ['일','월','화','수','목','금','토'],
    dayNamesShort: ['일','월','화','수','목','금','토'],
    dayNamesMin: ['일','월','화','수','목','금','토'],
    showMonthAfterYear: true,
    yearSuffix: '년'
  });
});
</script>

<form name="ms" id="_frmFormSearch" method="post" action="">
<table class="list_table" style="width:85%;">
<tr>
	<td colspan="7">
		지역구 : <select name="game_location">
			<option value="강남구" selected="selected">강남구</option>
			<option value="강동구">강동구</option>
			<option value="강북구">강북구</option>
			<option value="강서구">강서구</option>
			<option value="관악구">관악구</option>
			<option value="광진구">광진구</option>
			<option value="구로구">구로구</option>
			<option value="금천구">금천구</option>
			<option value="노원구">노원구</option>
			<option value="도봉구">도봉구</option>
			<option value="동대문구">동대문구</option>
			<option value="동작구">동작구</option>
			<option value="마포구">마포구</option>
			<option value="서대문구">서대문구</option>
			<option value="서초구">서초구</option>
			<option value="성동구">성동구</option>
			<option value="성북구">성북구</option>
			<option value="송파구">송파구</option>
			<option value="양천구">양천구</option>
			<option value="영등포구">영등포구</option>
			<option value="용산구">용산구</option>
			<option value="은평구">은평구</option>
			<option value="종로구">종로구</option>
			<option value="중구">중구</option>
			<option value="중랑구">중랑구</option>
		</select>
		
		경기일자 : <input type="text" name="game_date" id="datepicker1" size="15">

		경기장 : <select name="suBground">
			<option value="is not null" selected="selected">유</option>
			<option value="null">무</option> 
		</select>
		
		대전료 : <select name="pay1">
			<option value="10000" selected="selected">10,000</option>
			<option value="51000">51,000</option>
			<option value="71000">71,000</option>
			<option value="110000">110,000</option>
		</select>
		<select name="pay2">
			<option value="50000">50,000</option>
			<option value="70000">70,000</option>
			<option value="100000">100,000</option>
			<option value="150000" selected="selected">150,000</option>
		</select>
	</td>
</tr>

<tr>
	<td align="center" colspan="6">
		<button type="button" id="_btnSearch">검색</button>
	</td>
</tr>
<colgroup>
<col style="width:40px;" />
<col style="width:60px;" />
<col style="width:70px;" />
<col style="width:80px;" />
<col style="width:60px;" />
<col style="width:35px;" />
</colgroup>
<tr>

	<th>지역구</th> <th>클럽명</th> <th>경기일자</th> <th>경기장</th> <th>대전료</th>  <th>대전현황</th> 
</tr>
<c:if test="${not empty pmatchingsearchlist}">
	<c:forEach items="${pmatchingsearchlist}" var="pglist" varStatus="vs">
	<tr>
		<td>${pglist.game_location}</td> 
		<td>${pglist.team_name}</td>
		<td>${pglist.game_date}</td> 
		<td>${pglist.ground}</td> 
		<td><fmt:formatNumber value="${pglist.pay}" pattern="#,###.##' 원'"/></td> 
			<c:if test="${pglist.game_state == 0}">
				<td bgcolor="orange"><a href='pmatchingdetail.do?game_no=${pglist.game_no}'>대기중</a></td> 
			</c:if>
		
			<c:if test="${pglist.game_state == 1}">
				<td bgcolor="green">경기중</td> 
			</c:if>
			
			<c:if test="${pglist.game_state == 2}">
				<td bgcolor="lightgray">경기완료</td> 
			</c:if>
		
	</tr>
	</c:forEach>
</c:if>

<c:if test="${empty pmatchingsearchlist}">

	<tr>
		<td colspan="6">검색된 경기가 없습니다.</td>
	</tr>

</c:if>

</table>
</form>

<br><br><br><br>


<script type="text/javascript">

$("#_btnSearch").click(function() {

// 	if(document.ms.game_date.value == ""){
// 		alert("날짜를 입력해주세요");
// 	}
	
	$("#_frmFormSearch").attr({ "target":"_self", "action":"pmatchingsearchAf.do" }).submit();
});

</script>














