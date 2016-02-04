<%@ page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<link href="CSS/KICKOFF.css" rel="stylesheet" >

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
<form action="freegameAf.do" method="post">
<table class="list_table" style="width:60%;">

<tr>
	<th>클럽이름</th>
	<td style="text-align: left"><input type="text" name="team_name" readonly="readonly" value="${team.team_name}"></td>
</tr>

<tr>
	<th>게임요약</th>
	<td style="text-align: left"><input type="text" name="game_content"></td>
</tr>

<tr>
	<th>게임일자</th>
	<td style="text-align: left"><input type="text" name="game_date" id="datepicker1"></td>
</tr>

<tr>
	<th>경기장</th>
		<td style="text-align: left"><a href="#" onclick="javascript:window.open('./post.do','','location=0,status=0,scrollbars=1,width=530,height=330');">
	  <img src="image/wofun.png"></a>
	  <br>
	  <input type="text" name="ground" id="addr1" size="20"></td>
</tr>

<tr>
	<th>대전료</th>
	<td style="text-align: left"><input type="text" name="pay"></td>
</tr>

<tr>
	<td colspan="2" align="right"><input type="submit" value="경기등록"></td>
</tr>


</table>

</form>