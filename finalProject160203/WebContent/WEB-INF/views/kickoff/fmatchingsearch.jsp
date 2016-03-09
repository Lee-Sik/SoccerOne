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
	<td colspan="5">
		
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
	<td align="center" colspan="5">
		<button type="button" id="_btnSearch">검색</button>
	</td>
</tr>
<colgroup>
<col style="width:60px;" />
<col style="width:70px;" />
<col style="width:80px;" />
<col style="width:60px;" />
<col style="width:35px;" />
</colgroup>
<tr>

	<th>클럽명</th> <th>경기일자</th> <th>경기장</th> <th>대전료</th>  <th>대전현황</th> 
</tr>
<c:if test="${not empty fmatchingsearchlist}">
	<c:forEach items="${fmatchingsearchlist}" var="fglist" varStatus="vs">
	<tr>
		<td>${fglist.team_name}</td>
		<td>${fglist.game_date}</td> 
		<td>${fglist.ground}</td> 
		<td><fmt:formatNumber value="${fglist.pay}" pattern="#,###.##' 원'"/></td> 
			<c:if test="${fglist.game_state == 0}">
				<td bgcolor="orange">대기중
			</td> 
			</c:if>
			
			<c:if test="${fglist.game_state == 1}">
				<td bgcolor="lightgray">완료
			</td> 
			</c:if>
		
	</tr>
	</c:forEach>
</c:if>

<c:if test="${empty fmatchingsearchlist}">

	<tr>
		<td colspan="5">검색된 경기가 없습니다.</td>
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
	
	$("#_frmFormSearch").attr({ "target":"_self", "action":"fmatchingsearchAf.do" }).submit();
});

</script>














