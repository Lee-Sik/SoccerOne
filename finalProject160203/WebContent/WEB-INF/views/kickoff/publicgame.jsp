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
<form action="publicgameAf.do" method="post">
<table class="list_table" style="width:60%;">

<tr>
	<th>클럽이름</th>
	<td style="text-align: left"><input type="text" name="team_name" readonly="readonly" value="${team.team_name}"></td>
</tr>

<tr>
	<th>소속지역</th>
	<td style="text-align: left"><select name="game_location">
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
		</select></td>
</tr>

<tr>
	<th>게임일자</th>
	<td style="text-align: left"><input type="text" name="game_date" id="datepicker1"></td>
</tr>

<tr>
	<th>경기장</th>
<!-- 	<td style="text-align: left"><input type="text" name="ground"></td> -->
	<td style="text-align: left"><a href="#" onclick="javascript:window.open('./post.do','','location=0,status=0,scrollbars=1,width=530,height=330');">
	  <img src="image/wofun.png"></a>
	  <br>
	  <input type="text" name="ground" id="addr1" size="20"></td>
</tr>

<tr>
	<th>경기요약</th>
	<td style="text-align: left"><textarea rows="10" cols="50" name="game_content"></textarea></td>
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