<%@ page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("utf-8"); %>

<h1>공식경기 등록</h1>
<form action="publicgameAf.do" method="post">
<table>

<tr>
	<td>클럽이름</td>
	<td><input type="text" name="team_name"></td>
</tr>

<tr>
	<td>소속지역</td>
	<td><input type="text" name="game_location"></td>
</tr>

<tr>
	<td>게임일자</td>
	<td><input type="text" name="game_date"></td>
</tr>

<tr>
	<td>경기장</td>
	<td><input type="text" name="ground"></td>
</tr>

<tr>
	<td>대전료</td>
	<td><input type="text" name="pay"></td>
</tr>

<tr>
	<td>게임상태</td>
	<td><input type="text" name="game_state"></td>
</tr>

<tr>
	<td colspan="2" align="right"><input type="submit" value="경기등록"></td>
</tr>

</table>
</form>