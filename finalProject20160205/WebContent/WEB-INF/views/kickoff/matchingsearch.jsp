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

<body>
<form action="matchingsearchAf.do">
<table class="list_table" style="width:85%;">
<tr>
	<td colspan="7">
		활동지역 : <select name="game_location">
			<option value="강남구">강남구</option>
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
		
		게임일시 : <input type="text" name="game_date" id="datepicker1" size="15">

		구장유무 : <select name="suBground">
			<option></option>
			<option value="is not null">유</option>
			<option value="null">무</option> 
		</select>
		
		대전료 : <select name="pay1">
			<option></option>
			<option value="10000">10,000</option>
			<option value="51000">51,000</option>
			<option value="71000">71,000</option>
			<option value="110000">110,000</option>
			<option value="all">모두</option>
		</select>
		<select name="pay2">
			<option></option>
			<option value="50000">50,000</option>
			<option value="70000">70,000</option>
			<option value="100000">100,000</option>
			<option value="150000">150,000</option>
			<option value="all">모두</option>
		</select>
	</td>
</tr>

<tr>
	<td align="center" colspan="7">
		<input type="submit" value="검색">
	</td>
</tr>
<colgroup>
<col style="width:40px;" />
<col style="width:60px;" />
<col style="width:150px;" />
<col style="width:70px;" />
<col style="width:80px;" />
<col style="width:60px;" />
<col style="width:35px;" />
</colgroup>
<tr>

	<th>지역구</th> <th>클럽명</th> <th>경기요약</th> <th>경기일자</th> <th>운동장</th> <th>대전료</th>  <th>대전현황</th> 
</tr>
<c:if test="${not empty matchingsearchlist}">
	<c:forEach items="${matchingsearchlist}" var="fglist" varStatus="vs">
	<tr>
		<td>${fglist.game_location}</td> 
		<td>${fglist.team_name}</td>
		<td>${fglist.game_content}</td> 
		<td>${fglist.game_date}</td> 
		<td>${fglist.ground}</td> 
		<td>${fglist.pay}</td> 
			<c:if test="${fglist.game_state == 0}">
				<td bgcolor="orange">부킹중
			</td> 
			</c:if>
			
			<c:if test="${fglist.game_state == 1}">
				<td bgcolor="lightgray">부킹완료
			</td> 
			</c:if>
		
	</tr>
	</c:forEach>
</c:if>

<c:if test="${empty matchingsearchlist}">

	<tr>
		<td colspan="7">검색된 경기가 없습니다.</td>
	</tr>

</c:if>



</table>
</form>




<br><br><br><br>

</body>