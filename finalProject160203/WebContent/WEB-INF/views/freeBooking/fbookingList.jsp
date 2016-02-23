<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="CSS/booking.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>

<script type="text/javascript">

$(function(){
	
	$("#search_subject").val($("#cl").html());
	
	$("#cl").click(function(){
		$("#cl1").toggle();
		$("#cl2").toggle();
	});
	$("#cl1").click(function(){
		
		$("#cl").html($(this).html());
		$("#cl1").toggle();
		$("#cl2").toggle();
		$("#search_subject").val($("#cl").html());
	});
	$("#cl2").click(function(){
		
		$("#cl").html($(this).html());
		$("#cl1").toggle();
		$("#cl2").toggle();
		$("#search_subject").val($("#cl").html());
	});
	
	
});

</script>

</head>
<body>

<div class="hb_wrap booking_wrap"><div class="navi" style="margin-top: -40px;">
	<h2 style="font-size:27px;font-family: 'nanumgothic','nanum','dotum';color:#40434A;">게임부킹</h2>
	
</div>
<div class="hb_wrap news_view">
	<div class="bbs_view dminhs">
		<div class="bbs">
						<div class="bbs-tab-area" style="position: relative;">
				<ul style="width:100%">
										<li class="on" style="width:5.55556%">
						<a href="/booking/board/list/?board_idx=22&category=00">전체</a>
					</li>
															<li class="" style="width:5.55556%">
						<a href="/booking/board/list/?board_idx=22&category=01">서울</a>
					</li>
										<li class="" style="width:5.55556%">
						<a href="/booking/board/list/?board_idx=22&category=02">인천</a>
					</li>
										<li class="" style="width:5.55556%">
						<a href="/booking/board/list/?board_idx=22&category=03">대전</a>
					</li>
										<li class="" style="width:5.55556%">
						<a href="/booking/board/list/?board_idx=22&category=04">광주</a>
					</li>
										<li class="" style="width:5.55556%">
						<a href="/booking/board/list/?board_idx=22&category=05">대구</a>
					</li>
										<li class="" style="width:5.55556%">
						<a href="/booking/board/list/?board_idx=22&category=06">부산</a>
					</li>
										<li class="" style="width:5.55556%">
						<a href="/booking/board/list/?board_idx=22&category=07">울산</a>
					</li>
										<li class="" style="width:5.55556%">
						<a href="/booking/board/list/?board_idx=22&category=08">경기</a>
					</li>
										<li class="" style="width:5.55556%">
						<a href="/booking/board/list/?board_idx=22&category=09">강원</a>
					</li>
										<li class="" style="width:5.55556%">
						<a href="/booking/board/list/?board_idx=22&category=10">충북</a>
					</li>
										<li class="" style="width:5.55556%">
						<a href="/booking/board/list/?board_idx=22&category=11">충남</a>
					</li>
										<li class="" style="width:5.55556%">
						<a href="/booking/board/list/?board_idx=22&category=12">전북</a>
					</li>
										<li class="" style="width:5.55556%">
						<a href="/booking/board/list/?board_idx=22&category=13">전남</a>
					</li>
										<li class="" style="width:5.55556%">
						<a href="/booking/board/list/?board_idx=22&category=14">경북</a>
					</li>
										<li class="" style="width:5.55556%">
						<a href="/booking/board/list/?board_idx=22&category=15">경남</a>
					</li>
										<li class="" style="width:5.55556%">
						<a href="/booking/board/list/?board_idx=22&category=16">제주</a>
					</li>
										<li class="" style="width:5.55556%">
						<a href="/booking/board/list/?board_idx=22&category=17">세종</a>
					</li>
									</ul>
			</div>
						<div class="bbs-list-top">
				<div class="bbs-tbtn" style="margin-top: 20px;"><a href="./fbookingWrite.do" class="bbs-wbbtn">글쓰기</a></div>
				<form method="get" id="postSearchForm" action="/booking/board/list/">
					<input type="hidden" name="board_idx" value="22">
					<input type="hidden" name="category" value="00">
					<div class="bbs-sch">
						<div class="bbs-combo">
							<dl class="bbs-cb">
								<dt id="cl">제목</dt>
								<dd id="cl1" style="display: none;">제목</dd>
								<dd id="cl2" style="display: none;">작성자</dd>
								
							</dl>
							<select name='search_method' style="display: block;">
								<option value='title' >제목</option>
								<option value='title' >제목</option>
								<option value='user_name' >작성자</option>
							</select>
							
						</div>
						<input type="hidden" name="search_subject" id="search_subject">
						<input type="text" name="search_word" value="" />
						<a href="#none" class="bbs-btn-sch postSearchBtn">검색</a>
					</div>
				</form>
			</div>
			<table class="bbs-list" summary="구분 제목별 게시글을 나타낸 표">
				<thead>
					<tr>
						<th class="num">번호</th>
						<th class="cat" style="width:100px">구 분</th>
						<th class="title">제목</th>
						<th class="writer">작성자</th>
						<th class="date">등록일</th>
						<th class="hit">조회</th>
					</tr>
				</thead>
				<tbody>
				<!--공지일경우 bbs-noti // 형광펜 div.title 에 색정보 클래스 (yellow,green,blue,pink,orange)-->
					<c:forEach var="dto" items="${mlist}">
					<tr class="bbs-noti">
						<td><img src="//img.gameone.kr/board/ico_em.gif" alt="알림" /></td>
						<td>공지</td>
						<td>
							<div class="title " style="width:280px;overflow:hidden;">
								<a href="./fbookingDetail.do?seq=${dto.free_b_seq}" style="line-height:20px;text-overflow:ellipsis;white-space:nowrap;word-wrap:normal;max-width:260px;display:inline-block;overflow:hidden;padding: 0; float:left;">[알림] ${dto.free_b_title}</a>
								<span class="reply"  style=" float:left;padding-top:1px;">[1]</span>							</div>
						</td>
						<td>
							<div class="writer">
								<img src='//img.gameone.kr/community/label_01.png' alt="레벨이미지" />
								${dto.user_name}															</div>
						</td>
						<td>${dto.free_b_date}</td>
						<td>${dto.free_b_hit}</td>
					</tr>
					</c:forEach>
					
					<c:forEach var="dto" items="${list}" varStatus="vs">
					<tr>
						<td>${vs.count}</td>
						<td>${dto.free_b_location}</td>
						<td>
							<div class="title ">
								<a href="./fbookingDetail.do?seq=${dto.free_b_seq}" style="line-height:20px;text-overflow:ellipsis;white-space:nowrap;word-wrap:normal;max-width:270px;display:inline-block;overflow:hidden;padding: 0; float:left;">
									[${dto.free_b_sendrecieve}] ${dto.free_b_title}			</a>
																								<img src="//img.gameone.kr/board/ico_new.gif" alt="새글" style=" float:left; padding:6px 0 5px 0;" />							</div>
						</td>
						<td>
							<div class="writer">
								<img src='//img.gameone.kr/community/label_01.png' alt="레벨이미지" />
								${dto.user_name}															</div>
						</td>
						<td>${dto.free_b_date}</td>
						<td>${dto.free_b_hit}</td>
					</tr>
					</c:forEach>
									</tbody>
			</table>
			
			<div class="bbs-list-bt">
				<div class="bbs-btngr" style="margin-top: 10px;">
					<a href="./fbookingWrite.do" class="bbs-wbbtn">글쓰기</a>
				</div>
			</div>
		</div>
		<!--게시판 목록end-->
	</div>
</div>

				</div>
				
				
				
				
</body>
</html>