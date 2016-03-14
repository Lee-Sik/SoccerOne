<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script>
$(document).ready(function() {
	
	 
	//$("#query").on('keydown',function(){
		$('#query').on('input',function(){
			 if($('#query').val() != ''){
	//$("#query").bind("change",function(){
		$.ajax({//내 서버에서 필요한 객체를 자바스크립트로 가져오는 ajax
		    url: "searchTeam.do",
		    dataType: 'JSON',
		    data: { "query" : $("#query").val() },
		    jsonpCallback: 'callback',
		    type: 'get',
		    success: function (data) {
		       kk=[];
		      // alert(data.length);
		       console.log(data);
		       $('#result').empty();
		      // $('#result').append('<tr><th>팀 로고</th><th>팀 명</th></tr>');
		       for(var i=0;i<data.length;i++){
		          kk.push(data[i]);// kk에 json 객체 담기
		          
		          var newDiv = document.createElement("tr");// 1.노드를 생성한다.
		          if(data[i].team_logo == null || data[i].team_logo==''){
		        	  newDiv.innerHTML = //'<tr>'
					       '<td><img src="image/noimage.jpeg" style="width: 50px; height: 30px;"/></td>'
					       	+'<td align="center">'+data[i].team_name+'</td>';
					       	//+'</tr>';
		          }
		          else{
		        	  newDiv.innerHTML = //'<tr>'
					       '<td><img src="image/'+data[i].team_logo+'" style="width: 50px; height: 30px;"/></td>'
					       	+'<td align="center">'+data[i].team_name+'</td>';
					       	//+'</tr>';
		          }
			       
			       $('#result').append(newDiv);
		       }
		       
		   
		       //아래에 element를 추가 
		    }
		
		});
	}else{
		   $('#result').empty();
	}
	
	});
// 	$('#search').on('click',function(){
// 		alert('d');
// 	});
	
});
</script>
<div id='cssmenu'>

	<ul>
		<li><a href='./first.do'>홈으로</a></li>

		<li class='active'><a href='./kickoff.do'>킥오프</a>
			<ul>
				<c:if test="${not empty login }">
					<li><a href='#'>경기 등록</a>
						<ul>
							<li><a href='publicgame.do'>랭킹전</a></li>
							<li><a href='freegame.do'>친선경기</a></li>
						</ul></li>

					<li><a href='#'>경기 검색</a>
						<ul>
							<li><a href='publicms.do'>랭킹전</a></li>
							<li><a href='freems.do'>친선경기</a></li>
						</ul></li>
				</c:if>
				<c:if test="${empty login }">
					<li><a href='#'>경기 등록</a>
						<ul>
							<li><a href='loginpopup.do'>랭킹전</a></li>
							<li><a href='loginpopup.do'>친선경기</a></li>
						</ul></li>

					<li><a href='#'>경기 검색</a>
						<ul>
							<li><a href='loginpopup.do'>랭킹전</a></li>
							<li><a href='loginpopup.do'>친선경기</a></li>
						</ul></li>
				</c:if>

				<li><a href='./ranking.do'>리그 랭킹</a></li>
			</ul></li>

		<li class='active'><a href='#'>구장대관</a>
			<ul>
				<li><a href='bookingList.do'>공식대관</a></li>
				<li><a href='fbookingList.do'>자유대관</a></li>
				<li><a href='faManList.do'>자유계약선수</a></li>
			</ul></li>
		<li class='active'><c:if test="${not empty login }">
				<a
					href='club.do?user_address=${login.user_address}&user_team=${login.user_team}'>클럽</a>
			</c:if> <c:if test="${ empty login }">
				<a href='loginpopup.do'>클럽</a>
			</c:if>
			<ul>
				<c:if test="${empty team }">
					<li><a href='clubsearch_no.do'>클럽검색/입단</a></li>
					<c:if test="${not empty login }">
						<li><a href='team_create.do?user_email=${login.user_email }'>팀생성</a></li>
					</c:if>
				</c:if>
				<c:if test="${not empty team }">
					<li><a href='clubsearch_yes.do'>클럽검색/모집</a></li>
					<li><a href='clubmyinform.do'>내정보</a></li>
					<c:if test="${login.user_email eq team.team_managerid }">
						<li><a href='teamsetting.do'>클럽설정</a></li>
					</c:if>
				</c:if>

			</ul></li>

		<li class='active'><a href='./community.do'>커뮤니티</a>
			<ul>
				<li><a href='./bbslist.do'>축덕포럼</a></li>
				<li><a href='./gallerylist.do'>짤방게시판</a></li>
				<li><a href='./sellbuylist.do'>중고장터</a></li>
			</ul></li>

		<li class='active'><a href='./introduce.do'>사이트소개</a>
			<ul>
				<li><a href='#'>인사말</a></li>
				<li><a href='#'>개설목적</a></li>
				<li><a href='./address.do'>연락처</a></li>
			</ul></li>
		<c:if test="${ login.user_email == 'admin'}">
			<li class='active'><a href='./adminmain.do'>관리자 페이지</a>
				<ul>
					<li><a href='./adminInsertGame.do'>경기기록 입력</a></li>
				</ul></li>
		</c:if>
		<div>
			팀명:<input type="text" id="query" >
			<table id="result">
			</table>
		</div>
	</ul>


</div>


