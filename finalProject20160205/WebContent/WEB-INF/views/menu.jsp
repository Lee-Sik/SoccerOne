<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% request.setCharacterEncoding("utf-8"); %>

<div id='cssmenu'>

<ul>
   <li><a href='./first.do'>홈으로</a></li>
   
   <li class='active'><a href='./kickoff.do'>킥오프</a>
      <ul>
         <li><a href='./matching.do'>매칭등록</a></li>
         <li><a href='./matchingsearch.do'>매칭검색</a></li>
         <li><a href='./lanking.do'>랭킹</a></li>
      </ul>
   </li>
   
   <li class='active'><a href='#'>구장대관</a>
      <ul>
         <li><a href='bookingList.do'>공식대관</a></li>
         <li><a href='#'>자유대관</a></li>
         <li><a href='#'>자유계약선수</a></li>
      </ul>
   </li>
   
   <li class='active'><a href='club.do?user_address=${login.user_address}&user_team=${login.user_team}'>클럽</a>
      <ul>
      	 <c:if test="${empty login.user_team }">
         <li><a href='#'>클럽검색/입단</a></li>
         </c:if>
         <c:if test="${not empty login.user_team }">
         <li><a href='#'>클럽검색/모집</a></li>
         </c:if>
         <li><a href='#'>내 정보</a></li>
         
        	<c:if test="${empty login.user_team }">
         	<li><a href='team_create.do?user_email=${login.user_email }'>팀 생성</a></li>
        	</c:if>
         
         <li><a href='#'>클럽설정</a></li>
         <li><a href='#'>클럽게시판</a></li>
      </ul>
   </li>
   
    <li class='active'><a href='./comunity.do'>커뮤니티</a>
      <ul>
         <li><a href='./bbslist.do'>축덕포럼</a></li>
         <li><a href='#'>짤방게시판</a></li>
         <li><a href='#'>중고장터</a></li>
      </ul>
   </li>
  
  <li class='active'><a href='#'>사이트소개</a>
      <ul>
         <li><a href='#'>인사말</a></li>
         <li><a href='#'>개설목적</a></li>
         <li><a href='#'>연락처</a></li>
      </ul>
   </li>


</ul>
</div>


