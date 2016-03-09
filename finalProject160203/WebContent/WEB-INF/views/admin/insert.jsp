<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
$(document).ready(function() {
	$('.act').on('click',function(){
		window.open('adminSearch.do','',
	    'width=600, height=400,top=70, left=220, resizable=no, scrollbars=no, status=no;');
	});
});

</script>
<body>
<div align="center">
	<table id="boundary">
		<tr><th>WIN Team</th><th>score</th><th>:</th><th>score</th><th>LOSE Team</th></tr>
		<tr>
			<td><input type="text" class="act" ></td>
			<td><input type="text" class="act" size="2"></td>
			<td>VS</td>
			<td><input type="text" size="2" class="act"></td>
			<td><input type="text" class="act"></td>
		<tr>
	</table>

	<form>
		<!-- 		<table> -->
		<%-- <%-- 					<c:forEach items="${gameRecList}" var="gameRecVO"> --%>
		<!-- 						<tr> -->
		<!-- 							<td> -->
		<!-- 								<div style="background-color: blue;"> -->
		<%-- 									<img src="image/${gameRecVO.win_team_logo}" --%>
		<!-- 										style="width: 200px; height: 100px;" -->
		<%-- 										onclick="javascript:window.open('teamView.do?team_name=${gameRecVO.win_team}','', --%>
		<%--                                              'width=600, height=400,top=70, left=220, resizable=no, scrollbars=no, status=no;');"> --%>

		<%-- 									<div>${gameRecVO.win_team}</div> --%>
		<!-- 								</div> -->
		<!-- 							</td> -->
		<!-- 							<td>VS</td> -->
		<!-- 							<td> -->
		<!-- 								<div style="background-color: red;"> -->
		<%-- 									<img src="image/${gameRecVO.lose_team_logo}" --%>
		<!-- 										style="width: 200px; height: 100px;" -->
		<%-- 										onclick="javascript:window.open('teamView.do?team_name=${gameRecVO.lose_team}','', --%>
		<%--                                              'width=600, height=400,top=70, left=220, resizable=no, scrollbars=no, status=no;');"> --%>
		<%-- 									<div>${gameRecVO.lose_team}</div> --%>
		<!-- 								</div> -->
		<!-- 							</td> -->
		<!-- 						</tr> -->
		<!-- 						<tr> -->
		<!-- 							<td>win</td> -->
		<%-- 							<td>${gameRecVO.score}</td> --%>
		<!-- 							<td>lose</td> -->
		<!-- 						</tr> -->
		<!-- <!-- 					</c:forEach> -->
		<!-- 				</table> -->
		<!-- 				<input type="submit" value="경기 기록 저장"> -->
	</form>
</div>
</body>
</html>