<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<link href="CSS/KICKOFF.css" rel="stylesheet" >

<table class="list_table" style="width:85%;">
<colgroup>
<col style="width:40px;" />
<col style="width:50px;" />
<col style="width:100px;" />
<col style="width:100px;" />
<col style="width:80px;" />
<col style="width:30px;" />
</colgroup>
<tr>
	<td colspan="6" style="text-align: center; font-weight: bold">최근 공식경기 등록 현황</td>
</tr>

<tr>
		<th>지역구</th> <th>클럽명</th> <th>경기일자</th>  <th>경기장</th> <th>대전료</th>  <th>대전현황</th> 
</tr>
<c:forEach items="${publicgamelist}" var="pglist" varStatus="vs">
	<tr>
		<td>${pglist.game_location}</td>
		<td>${pglist.team_name}</td>
		<td>${pglist.game_date}</td> 
		<td>${pglist.ground}</td> 
		<td><fmt:formatNumber value="${pglist.pay}" pattern="#,###.##' 원'"/></td> 
			<c:if test="${pglist.game_state == 0}">
				<td bgcolor="orange">대기중</td> 
			</c:if>
			
			<c:if test="${pglist.game_state == 1}">
				<td bgcolor="green">경기중</td> 
			</c:if>
			<c:if test="${pglist.game_state == 2}">
				<td bgcolor="lightgray">경기완료</td> 
			</c:if>
	</tr>
</c:forEach>
</table>

<br><br><br><br>

<table class="list_table" style="width:85%;">
<colgroup>
<col style="width:50px;" />
<col style="width:100px;" />
<col style="width:100px;" />
<col style="width:80px;" />
<col style="width:50px;" />
</colgroup>
<tr>
	<td colspan="5" style="text-align: center; font-weight: bold">최근 친선경기 등록 현황</td>
</tr>
<tr>
		<th>클럽명</th> <th>요약</th>  <th>경기일자</th>  <th>경기장</th> <th>대전료</th> 
</tr>
<c:forEach items="${freegamelist}" var="fglist" varStatus="vs">
	<tr>
		<td>${fglist.team_name}</td>
		<td>${fglist.game_content}</td> 
		<td>${fglist.game_date}</td> 
		<td>${fglist.ground}</td> 
		<td><fmt:formatNumber value="${fglist.pay}" pattern="#,###.##' 원'"/></td> 
	</tr>
</c:forEach>
</table>