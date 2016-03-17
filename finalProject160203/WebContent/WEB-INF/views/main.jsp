<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>

<link href="CSS/communitytable.css" rel="stylesheet" >

<style>
body{
   background-image: url('./image/main_bg.jpg');
   background-repeat: no-repeat;
   background-position: left;
}
</style>

<html>
<body>


<div align="center">
<p style="width: 100%;background-color: black; font-size: 20pt; color: white;"><b>이달의선수</b></p>
<table>
<c:if test="${not empty fulist}">
 <tr> 
   <c:forEach items="${fulist}" var="a" begin="1" end="4">
     
            <td style="background-color: lightblue">
            <img alt="${a.user_profile}" src="image/${a.user_profile}" style="width: 150px;">
            <p style="text-align: center; color:white"><b>${a.user_name}</b></p>
            
            </td> 
           
      
   </c:forEach>
   </tr>
    <tr> 
   <c:forEach items="${fulist}" var="b" begin="4" end="7">
            <td>
            <img alt="${b.user_profile}" src="image/${b.user_profile}" style="width: 150px;"><br>
            ${b.user_name}
            </td> 
   </c:forEach>
   </tr>
</c:if>
</table>

</div>



<div>
<table class="list_table">
<colgroup>
<col style="width:280px;" />
<col style="width:50px;" />
<col style="width:90px;" />
</colgroup>
<tr>
   <td colspan="3" style="text-align: left; font-weight: bold">축덕 포럼 게시글</td>
</tr>
<tr>
      <th>제목</th> <th>작성자</th>  <th>작성일</th>
</tr>
<c:if test="${not empty bbslist}">
   <c:forEach items="${bbslist}" var="bbslist" varStatus="vs" begin="1" end="5">
      <tr>      
            <td style="text-align: left"><a href='bbsdetail.do?bbs_no=${bbslist.bbs_no}'>${bbslist.title}</a></td>
            <td>${bbslist.user_email}</td> 
            <c:set var="rdate" value="${bbslist.wdate}"/>
            <c:set var="len" value="${fn:length(wdate)}"/>    
            <td>${fn:substring(bbslist.wdate, 0, 10)}</td>   
      </tr>
   </c:forEach>
</c:if>
</table>
</div>
<br>
<h4 class="booking">부킹 정보</h4>
<div class="book_list stadium_list" style="width: 95%; margin-left: 2%;" >
		<table class="list_table" summary="부킹정보" style="width: 80%;">
			<colgroup>
				<col span="1" width="70" />
				<col span="1" width="110" />
				<col span="10" width="43" />
				<col span="1" width="60" />
				<col span="1" />
			</colgroup>
			<thead>
				<tr>
					<th>대관날짜</th>
					<th>구장명</th>
					<th>1게임</th>
					<th>2게임</th>
					<th>3게임</th>
					<th>4게임</th>
					<th>5게임</th>
					<th>6게임</th>
					<th>7게임</th>
					<th>부킹확인</th>
					<th>지역</th>
				</tr>
			</thead>
			<!--status의 상태 클래스
			booking = 부킹
			reserved = 예약
			occupied = 확정
			none = 아무것도 없는상태
			-->
	<tbody>
	<c:if test="${empty blist}">
	<tr>
		<td colspan="11">작성된 글이 없습니다.</td>
	</tr>
	</c:if>
	
	<c:forEach var="dto" items="${blist}">
	<tr>
		<th>${dto.booking_day.substring(0,8)}</th>
		<th><strong style="color: white;">${dto.stadium_name}</a></strong></th>
	
	 	<c:choose>
				<c:when test="${empty dto.game1}">
				<td class="status"><span class="booking">부킹</span></td>
				</c:when>
				
				<c:otherwise>	
				  <c:choose>				 	
				 	<c:when test="${dto.game1=='예약'}">
					<td class="status"><span class="reserved">예약</span></td>
					</c:when>
				 			
				 	<c:otherwise>
				 	<td class="status"><span class="occupied">확정</span></td>
				 	</c:otherwise>				
					</c:choose>
				</c:otherwise>
		</c:choose>
		
		<c:choose>
				<c:when test="${empty dto.game2}">
				<td class="status"><span class="booking">부킹</span></td>
				</c:when>
				
				<c:otherwise>	
				  <c:choose>				 	
				 	<c:when test="${dto.game2=='예약'}">
					<td class="status"><span class="reserved">예약</span></td>
					</c:when>
				 			
				 	<c:otherwise>
				 	<td class="status"><span class="occupied">확정</span></td>
				 	</c:otherwise>				
					</c:choose>
				</c:otherwise>
		</c:choose>
		
		<c:choose>
				<c:when test="${empty dto.game3}">
				<td class="status"><span class="booking">부킹</span></td>
				</c:when>
				
				<c:otherwise>	
				  <c:choose>				 	
				 	<c:when test="${dto.game3=='예약'}">
					<td class="status"><span class="reserved">예약</span></td>
					</c:when>
				 			
				 	<c:otherwise>
				 	<td class="status"><span class="occupied">확정</span></td>
				 	</c:otherwise>				
					</c:choose>
				</c:otherwise>
		</c:choose>
		
		<c:choose>
				<c:when test="${empty dto.game4}">
				<td class="status"><span class="booking">부킹</span></td>
				</c:when>
				
				<c:otherwise>	
				  <c:choose>				 	
				 	<c:when test="${dto.game4=='예약'}">
					<td class="status"><span class="reserved">예약</span></td>
					</c:when>
				 			
				 	<c:otherwise>
				 	<td class="status"><span class="occupied">확정</span></td>
				 	</c:otherwise>				
					</c:choose>
				</c:otherwise>
		</c:choose>
		
		<c:choose>
				<c:when test="${empty dto.game5}">
				<td class="status"><span class="booking">부킹</span></td>
				</c:when>
				
				<c:otherwise>	
				  <c:choose>				 	
				 	<c:when test="${dto.game5=='예약'}">
					<td class="status"><span class="reserved">예약</span></td>
					</c:when>
				 			
				 	<c:otherwise>
				 	<td class="status"><span class="occupied">확정</span></td>
				 	</c:otherwise>				
					</c:choose>
				</c:otherwise>
		</c:choose>      
		
		
		<c:choose>
				<c:when test="${empty dto.game6}">
				<td class="status"><span class="booking">부킹</span></td>
				</c:when>
				
				<c:otherwise>	
				  <c:choose>				 	
				 	<c:when test="${dto.game6=='예약'}">
					<td class="status"><span class="reserved">예약</span></td>
					</c:when>
				 			
				 	<c:otherwise>
				 	<td class="status"><span class="occupied">확정</span></td>
				 	</c:otherwise>				
					</c:choose>
				</c:otherwise>
		</c:choose>
		
		<c:choose>
				<c:when test="${empty dto.game7}">
				<td class="status"><span class="booking">부킹</span></td>
				</c:when>
				
				<c:otherwise>	
				  <c:choose>				 	
				 	<c:when test="${dto.game7=='예약'}">
					<td class="status"><span class="reserved">예약</span></td>
					</c:when>
				 			
				 	<c:otherwise>
				 	<td class="status"><span class="occupied">확정</span></td>
				 	</c:otherwise>				
					</c:choose>
				</c:otherwise>
		</c:choose>  
		
	<td><a href="./bookingDetail.do?booking_seq=${dto.booking_seq}&stadium_seq=${dto.stadium_seq}" class="btn viewbt">보 기</a></td>
	<td><strong>${dto.booking_area}</strong></td>
	</tr>
	</c:forEach>

</table>
</div>















</body>
</html>