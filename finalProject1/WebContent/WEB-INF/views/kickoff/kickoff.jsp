<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<body>
<table>
<tr>
	<td colspan="6" style="text-align: center; font-weight: bold">최근 공식경기 등록 현황</td>
</tr>

<tr>
		<th>게임번호</th> <th>팀명</th> <th>팀레벨</th>  <th>경기날짜</th>  <th>운동장</th> <th>대관료</th>  <th>대전현황</th> 
</tr>
<c:forEach items="${publicgamelist}" var="fglist" varStatus="vs">
	<tr>
		<td>${vs.count}</td> 
		<td>${fglist.team_name}</td>
		<td>${fglist.game_content}</td> 
		<td>${fglist.game_date}</td> 
		<td>${fglist.ground}</td> 
		<td>${fglist.pay}</td> 
		<td>
			<c:if test="${fglist.game_state == 0}">
				<font style="background-color: orange;">부킹중</font>
			
			</c:if>
			
			<c:if test="${fglist.game_state == 1}">
				<font style="background-color: lightgray;">예약완료</font>
			
			</c:if>
		</td> 
	</tr>
</c:forEach>
</table>


<br><br><br><br>


<table>
<tr>
	<td colspan="6" style="text-align: center; font-weight: bold">최근 친선경기 등록 현황</td>
</tr>
<tr>
		<th>게임번호</th> <th>팀명</th> <th>요약</th>  <th>경기날짜</th>  <th>운동장</th> <th>대관료</th> 
</tr>
<c:forEach items="${freegamelist}" var="fglist" varStatus="vs">
	<tr>
		<td>${vs.count}</td> 
		<td>${fglist.team_name}</td>
		<td>${fglist.game_content}</td> 
		<td>${fglist.game_date}</td> 
		<td>${fglist.ground}</td> 
		<td>${fglist.pay}</td> 
	</tr>
</c:forEach>
</table>
</body>