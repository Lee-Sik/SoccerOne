<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>
<link href="CSS/kickoff.css" rel="stylesheet" >

<table class="list_table" style="width:85%;">
<colgroup>
<col style="width:10%;" />
<col style="width:15%;" />
<col style="width:15%;" />
<col style="width:auto;" />
<col style="width:10%;" />
<col style="width:10%;" />
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
</table>

<br><br><br><br>

<table class="list_table" style="width:85%;">
<colgroup>
<col style="width:15%;" />
<col style="width:25%;" />
<col style="width:10%;" />
<col style="width:auto;" />
<col style="width:10%;" />
<col style="width:10%;" />
</colgroup>
<tr>
	<td colspan="6" style="text-align: center; font-weight: bold">최근 친선경기 등록 현황</td>
</tr>
<tr>
		<th>클럽명</th> <th>요약</th>  <th>경기일자</th>  <th>경기장</th> <th>대전료</th> <th>대전현황</th> 
</tr>
<c:forEach items="${freegamelist}" var="fglist" varStatus="vs">
	<tr>
		<td>${fglist.team_name}</td>
		
		<c:set var="game_content" value="${fglist.game_content}"/>
			<c:set var="len" value="${fn:length(game_content)}"/>
		<td>${fn:substring(fglist.game_content, 0, 15)}...</td>  
		
		
<%-- 		<td>${fglist.game_content}</td>  --%>
		<td>${fglist.game_date}</td> 
		<td>${fglist.ground}</td> 
		<td><fmt:formatNumber value="${fglist.pay}" pattern="#,###.##' 원'"/></td> 
		<c:if test="${fglist.game_state == 0}">
				<td bgcolor="orange"><a href='fmatchingdetail.do?game_no=${fglist.game_no}'>대기중</a></td> 
			</c:if>
			
			<c:if test="${fglist.game_state == 1}">
				<td bgcolor="green">경기중</td> 
			</c:if>
			<c:if test="${fglist.game_state == 2}">
				<td bgcolor="lightgray">경기완료</td> 
			</c:if>
	</tr>
</c:forEach>
</table>