<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% request.setCharacterEncoding("utf-8"); %>

<div id='cssmenu'>

	<ul>
		<li><a href='./first.do'>홈으로</a></li>

		<li class='active'><a href='./kickoff.do'>킥오프</a>
			<ul>
				<li><a href='#'>매칭 등록</a>
					<ul>
						<li><a href='publicgame.do'>랭킹전</a></li>
						<li><a href='freegame.do'>친선경기</a></li>
					</ul></li>

				<li><a href='#'>매칭 검색</a>
					<ul>
						<li><a href='publicms.do'>랭킹전</a></li>
						<li><a href='freems.do'>친선경기</a></li>
					</ul></li>

				<li><a href='./matching.do'>랭킹</a></li>
			</ul></li>

		
   <li class='active'><a href='#'>구장대관</a>
      <ul>
         <li><a href='bookingList.do'>공식대관</a></li>
         <li><a href='fbookingList.do'>자유대관</a></li>
         <li><a href='#'>자유계약선수</a></li>
      </ul>
   </li>
   <li class='active'><a
			href='club.do?user_address=${login.user_address}&user_team=${login.user_team}'>클럽</a>
			<ul>
				<c:if test="${empty team }">
					<li><a href='clubsearch_no.do'>클럽검색/입단</a></li>
					<li><a href='team_create.do?user_email=${login.user_email }'>팀생성</a></li>
				</c:if>
				<c:if test="${not empty team }">
					<li><a href='clubsearch_yes.do'>클럽검색/모집</a></li>
					<li><a href='clubmyinform.do'>내정보</a></li>
					<c:if test="${login.user_email eq team.team_managerid }">
						<li><a href='teamsetting.do'>클럽설정</a></li>
					</c:if>
					<li><a href='#'>클럽게시판</a></li>
				</c:if>


			</ul></li>
   
   
    <li class='active'><a href='./community.do'>커뮤니티</a>
      <ul>
         <li><a href='./bbslist.do'>축덕포럼</a></li>
         <li><a href='./gallerylist.do'>짤방게시판</a></li>
         <li><a href='#'>중고장터</a></li>
      </ul>
   </li>
  
	<li class='active'><a href='./introduce.do'>사이트소개</a>
		<ul>
	       <li><a href='#'>인사말</a></li>
	       <li><a href='#'>개설목적</a></li>
	       <li><a href='./address.do'>연락처</a></li>
	   </ul>
	</li>



</div>


