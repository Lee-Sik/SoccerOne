<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
						<th class="cat" style="width:100px">구분</th>
						<th class="title">제목</th>
						<th class="writer">작성자</th>
						<th class="date">등록일</th>
						<th class="hit">조회</th>
					</tr>
				</thead>
				<tbody>
				<!--공지일경우 bbs-noti // 형광펜 div.title 에 색정보 클래스 (yellow,green,blue,pink,orange)-->
										<tr class="bbs-noti">
						<td><img src="//img.gameone.kr/board/ico_em.gif" alt="알림" /></td>
						<td>공지</td>
						<td>
							<div class="title " style="width:280px;overflow:hidden;">
								<a href="/booking/board/view?board_idx=22&post_idx=38822&page=1&category=00" style="line-height:20px;text-overflow:ellipsis;white-space:nowrap;word-wrap:normal;max-width:260px;display:inline-block;overflow:hidden;padding: 0; float:left;">[알림] 게시판 운영정책 (게시물 삭제예정)</a>
								<span class="reply"  style=" float:left;padding-top:1px;">[1]</span>							</div>
						</td>
						<td>
							<div class="writer">
								<img src='//img.gameone.kr/community/label_01.png' alt="레벨이미지" />
								게임원															</div>
						</td>
						<td>2015.10.13</td>
						<td>734</td>
					</tr>
															<tr>
						<td>15760</td>
						<td>서울, 경기</td>
						<td>
							<div class="title ">
								<a href="/booking/board/view?board_idx=22&post_idx=69720&page=1&category=00&search_method=&search_word=" style="line-height:20px;text-overflow:ellipsis;white-space:nowrap;word-wrap:normal;max-width:270px;display:inline-block;overflow:hidden;padding: 0; float:left;">
									[구장확보] 2월28일2시경기 재미있게하실팀모십니다.								</a>
																								<img src="//img.gameone.kr/board/ico_new.gif" alt="새글" style=" float:left; padding:6px 0 5px 0;" />							</div>
						</td>
						<td>
							<div class="writer">
								<img src='//img.gameone.kr/community/label_01.png' alt="레벨이미지" />
								윤재철															</div>
						</td>
						<td>2016.02.19</td>
						<td>1</td>
					</tr>
										<tr>
						<td>15759</td>
						<td>서울, 경기</td>
						<td>
							<div class="title ">
								<a href="/booking/board/view?board_idx=22&post_idx=69714&page=1&category=00&search_method=&search_word=" style="line-height:20px;text-overflow:ellipsis;white-space:nowrap;word-wrap:normal;max-width:270px;display:inline-block;overflow:hidden;padding: 0; float:left;">
									[구장확보] 3월1일 양평강상1구장 12시30분 게임 (4부,...								</a>
																								<img src="//img.gameone.kr/board/ico_new.gif" alt="새글" style=" float:left; padding:6px 0 5px 0;" />							</div>
						</td>
						<td>
							<div class="writer">
								<img src='//img.gameone.kr/community/label_01.png' alt="레벨이미지" />
								이훈상															</div>
						</td>
						<td>2016.02.19</td>
						<td>1</td>
					</tr>
										<tr>
						<td>15758</td>
						<td>서울, 인천...</td>
						<td>
							<div class="title ">
								<a href="/booking/board/view?board_idx=22&post_idx=69712&page=1&category=00&search_method=&search_word=" style="line-height:20px;text-overflow:ellipsis;white-space:nowrap;word-wrap:normal;max-width:270px;display:inline-block;overflow:hidden;padding: 0; float:left;">
									[구장확보] ＜＜급구＞＞ 20일(토),21일(일) - 상대팀...								</a>
																								<img src="//img.gameone.kr/board/ico_new.gif" alt="새글" style=" float:left; padding:6px 0 5px 0;" />							</div>
						</td>
						<td>
							<div class="writer">
								<img src='//img.gameone.kr/community/label_01.png' alt="레벨이미지" />
								정성영															</div>
						</td>
						<td>2016.02.19</td>
						<td>18</td>
					</tr>
										<tr>
						<td>15757</td>
						<td>서울, 경기</td>
						<td>
							<div class="title ">
								<a href="/booking/board/view?board_idx=22&post_idx=69710&page=1&category=00&search_method=&search_word=" style="line-height:20px;text-overflow:ellipsis;white-space:nowrap;word-wrap:normal;max-width:270px;display:inline-block;overflow:hidden;padding: 0; float:left;">
									[구장확보] 토요일 ~ 3시간								</a>
																								<img src="//img.gameone.kr/board/ico_new.gif" alt="새글" style=" float:left; padding:6px 0 5px 0;" />							</div>
						</td>
						<td>
							<div class="writer">
								<img src='//img.gameone.kr/community/label_01.png' alt="레벨이미지" />
								한용휘															</div>
						</td>
						<td>2016.02.19</td>
						<td>5</td>
					</tr>
										<tr>
						<td>15756</td>
						<td>서울, 인천...</td>
						<td>
							<div class="title ">
								<a href="/booking/board/view?board_idx=22&post_idx=69704&page=1&category=00&search_method=&search_word=" style="line-height:20px;text-overflow:ellipsis;white-space:nowrap;word-wrap:normal;max-width:270px;display:inline-block;overflow:hidden;padding: 0; float:left;">
									[구장확보] 급급 이번주 21일(일)오후5시~7시30분								</a>
																								<img src="//img.gameone.kr/board/ico_new.gif" alt="새글" style=" float:left; padding:6px 0 5px 0;" />							</div>
						</td>
						<td>
							<div class="writer">
								<img src='//img.gameone.kr/community/label_01.png' alt="레벨이미지" />
								이초롱															</div>
						</td>
						<td>2016.02.19</td>
						<td>8</td>
					</tr>
										<tr>
						<td>15755</td>
						<td>서울, 경기</td>
						<td>
							<div class="title ">
								<a href="/booking/board/view?board_idx=22&post_idx=69695&page=1&category=00&search_method=&search_word=" style="line-height:20px;text-overflow:ellipsis;white-space:nowrap;word-wrap:normal;max-width:270px;display:inline-block;overflow:hidden;padding: 0; float:left;">
									[구장확보] 토요일 20일 / 17시경기 4부루키팀초청								</a>
																								<img src="//img.gameone.kr/board/ico_new.gif" alt="새글" style=" float:left; padding:6px 0 5px 0;" />							</div>
						</td>
						<td>
							<div class="writer">
								<img src='//img.gameone.kr/community/label_01.png' alt="레벨이미지" />
								이태훈															</div>
						</td>
						<td>2016.02.19</td>
						<td>8</td>
					</tr>
										<tr>
						<td>15754</td>
						<td>서울, 인천...</td>
						<td>
							<div class="title ">
								<a href="/booking/board/view?board_idx=22&post_idx=69690&page=1&category=00&search_method=&search_word=" style="line-height:20px;text-overflow:ellipsis;white-space:nowrap;word-wrap:normal;max-width:270px;display:inline-block;overflow:hidden;padding: 0; float:left;">
									[구장확보] 20/21(토/일요일)] -4부팀 초청-동계시즌 할...								</a>
																								<img src="//img.gameone.kr/board/ico_new.gif" alt="새글" style=" float:left; padding:6px 0 5px 0;" />							</div>
						</td>
						<td>
							<div class="writer">
								<img src='//img.gameone.kr/community/label_01.png' alt="레벨이미지" />
								김형찬															</div>
						</td>
						<td>2016.02.19</td>
						<td>14</td>
					</tr>
										<tr>
						<td>15753</td>
						<td>서울, 인천...</td>
						<td>
							<div class="title ">
								<a href="/booking/board/view?board_idx=22&post_idx=69688&page=1&category=00&search_method=&search_word=" style="line-height:20px;text-overflow:ellipsis;white-space:nowrap;word-wrap:normal;max-width:270px;display:inline-block;overflow:hidden;padding: 0; float:left;">
									[구장확보] [김포로얄구장] 7만원대으로 인조잔디 구...								</a>
																								<img src="//img.gameone.kr/board/ico_new.gif" alt="새글" style=" float:left; padding:6px 0 5px 0;" />							</div>
						</td>
						<td>
							<div class="writer">
								<img src='//img.gameone.kr/community/label_01.png' alt="레벨이미지" />
								위경철															</div>
						</td>
						<td>2016.02.18</td>
						<td>19</td>
					</tr>
										<tr>
						<td>15752</td>
						<td>서울, 인천...</td>
						<td>
							<div class="title ">
								<a href="/booking/board/view?board_idx=22&post_idx=69686&page=1&category=00&search_method=&search_word=" style="line-height:20px;text-overflow:ellipsis;white-space:nowrap;word-wrap:normal;max-width:270px;display:inline-block;overflow:hidden;padding: 0; float:left;">
									[구장확보] [김포로얄구장]2월20일(토) 22:00~24:30 상대...								</a>
																								<img src="//img.gameone.kr/board/ico_new.gif" alt="새글" style=" float:left; padding:6px 0 5px 0;" />							</div>
						</td>
						<td>
							<div class="writer">
								<img src='//img.gameone.kr/community/label_01.png' alt="레벨이미지" />
								위경철															</div>
						</td>
						<td>2016.02.18</td>
						<td>6</td>
					</tr>
										<tr>
						<td>15751</td>
						<td>서울, 경기</td>
						<td>
							<div class="title ">
								<a href="/booking/board/view?board_idx=22&post_idx=69682&page=1&category=00&search_method=&search_word=" style="line-height:20px;text-overflow:ellipsis;white-space:nowrap;word-wrap:normal;max-width:270px;display:inline-block;overflow:hidden;padding: 0; float:left;">
									[구장확보] 신월리 야구장 일요 5타임 섭외완료								</a>
																								<img src="//img.gameone.kr/board/ico_new.gif" alt="새글" style=" float:left; padding:6px 0 5px 0;" />							</div>
						</td>
						<td>
							<div class="writer">
								<img src='//img.gameone.kr/community/label_01.png' alt="레벨이미지" />
								이경하															</div>
						</td>
						<td>2016.02.18</td>
						<td>13</td>
					</tr>
										<tr>
						<td>15750</td>
						<td>경기</td>
						<td>
							<div class="title ">
								<a href="/booking/board/view?board_idx=22&post_idx=69678&page=1&category=00&search_method=&search_word=" style="line-height:20px;text-overflow:ellipsis;white-space:nowrap;word-wrap:normal;max-width:270px;display:inline-block;overflow:hidden;padding: 0; float:left;">
									[구장확보] 21일 대부도 브라보야구장 에서 오전10시~1...								</a>
																								<img src="//img.gameone.kr/board/ico_new.gif" alt="새글" style=" float:left; padding:6px 0 5px 0;" />							</div>
						</td>
						<td>
							<div class="writer">
								<img src='//img.gameone.kr/community/label_01.png' alt="레벨이미지" />
								오세운															</div>
						</td>
						<td>2016.02.18</td>
						<td>23</td>
					</tr>
										<tr>
						<td>15749</td>
						<td>서울, 경기</td>
						<td>
							<div class="title ">
								<a href="/booking/board/view?board_idx=22&post_idx=69676&page=1&category=00&search_method=&search_word=" style="line-height:20px;text-overflow:ellipsis;white-space:nowrap;word-wrap:normal;max-width:270px;display:inline-block;overflow:hidden;padding: 0; float:left;">
									[구장확보] 일요일21일//17시경기/4부루키팀초청/ 용인...								</a>
																								<img src="//img.gameone.kr/board/ico_new.gif" alt="새글" style=" float:left; padding:6px 0 5px 0;" />							</div>
						</td>
						<td>
							<div class="writer">
								<img src='//img.gameone.kr/community/label_01.png' alt="레벨이미지" />
								이태훈															</div>
						</td>
						<td>2016.02.18</td>
						<td>14</td>
					</tr>
										<tr>
						<td>15748</td>
						<td>서울, 경기</td>
						<td>
							<div class="title ">
								<a href="/booking/board/view?board_idx=22&post_idx=69672&page=1&category=00&search_method=&search_word=" style="line-height:20px;text-overflow:ellipsis;white-space:nowrap;word-wrap:normal;max-width:270px;display:inline-block;overflow:hidden;padding: 0; float:left;">
									[구장확보] 겨울할인* 2/20일~21일 대관가능(파주게스...								</a>
																								<img src="//img.gameone.kr/board/ico_new.gif" alt="새글" style=" float:left; padding:6px 0 5px 0;" />							</div>
						</td>
						<td>
							<div class="writer">
								<img src='//img.gameone.kr/community/label_01.png' alt="레벨이미지" />
								정진욱															</div>
						</td>
						<td>2016.02.18</td>
						<td>8</td>
					</tr>
										<tr>
						<td>15747</td>
						<td>경기</td>
						<td>
							<div class="title ">
								<a href="/booking/board/view?board_idx=22&post_idx=69668&page=1&category=00&search_method=&search_word=" style="line-height:20px;text-overflow:ellipsis;white-space:nowrap;word-wrap:normal;max-width:270px;display:inline-block;overflow:hidden;padding: 0; float:left;">
									[구장확보] ◆[준준베이스볼 평일 및 주말 대관진행...								</a>
																								<img src="//img.gameone.kr/board/ico_new.gif" alt="새글" style=" float:left; padding:6px 0 5px 0;" />							</div>
						</td>
						<td>
							<div class="writer">
								<img src='//img.gameone.kr/community/label_01.png' alt="레벨이미지" />
								이원주															</div>
						</td>
						<td>2016.02.18</td>
						<td>9</td>
					</tr>
										<tr>
						<td>15746</td>
						<td>서울, 경기</td>
						<td>
							<div class="title ">
								<a href="/booking/board/view?board_idx=22&post_idx=69665&page=1&category=00&search_method=&search_word=" style="line-height:20px;text-overflow:ellipsis;white-space:nowrap;word-wrap:normal;max-width:270px;display:inline-block;overflow:hidden;padding: 0; float:left;">
									[구장확보] 토요일20일 / 17시~19시경기 4부루키팀초청/...								</a>
																								<img src="//img.gameone.kr/board/ico_new.gif" alt="새글" style=" float:left; padding:6px 0 5px 0;" />							</div>
						</td>
						<td>
							<div class="writer">
								<img src='//img.gameone.kr/community/label_01.png' alt="레벨이미지" />
								이태훈															</div>
						</td>
						<td>2016.02.18</td>
						<td>6</td>
					</tr>
										<tr>
						<td>15745</td>
						<td>서울, 경기</td>
						<td>
							<div class="title ">
								<a href="/booking/board/view?board_idx=22&post_idx=69662&page=1&category=00&search_method=&search_word=" style="line-height:20px;text-overflow:ellipsis;white-space:nowrap;word-wrap:normal;max-width:270px;display:inline-block;overflow:hidden;padding: 0; float:left;">
									[구장확보] 신월리 야구장 일요 5타임 4부중상 상대...								</a>
																								<img src="//img.gameone.kr/board/ico_new.gif" alt="새글" style=" float:left; padding:6px 0 5px 0;" />							</div>
						</td>
						<td>
							<div class="writer">
								<img src='//img.gameone.kr/community/label_01.png' alt="레벨이미지" />
								이경하															</div>
						</td>
						<td>2016.02.18</td>
						<td>16</td>
					</tr>
										<tr>
						<td>15744</td>
						<td>경기, 충남</td>
						<td>
							<div class="title ">
								<a href="/booking/board/view?board_idx=22&post_idx=69660&page=1&category=00&search_method=&search_word=" style="line-height:20px;text-overflow:ellipsis;white-space:nowrap;word-wrap:normal;max-width:270px;display:inline-block;overflow:hidden;padding: 0; float:left;">
									[구장미확보] 21일 일요일 경기 초대해주실 팀 구합니다...								</a>
																								<img src="//img.gameone.kr/board/ico_new.gif" alt="새글" style=" float:left; padding:6px 0 5px 0;" />							</div>
						</td>
						<td>
							<div class="writer">
								<img src='//img.gameone.kr/community/label_01.png' alt="레벨이미지" />
								정래준															</div>
						</td>
						<td>2016.02.18</td>
						<td>23</td>
					</tr>
										<tr>
						<td>15743</td>
						<td>서울, 인천...</td>
						<td>
							<div class="title ">
								<a href="/booking/board/view?board_idx=22&post_idx=69656&page=1&category=00&search_method=&search_word=" style="line-height:20px;text-overflow:ellipsis;white-space:nowrap;word-wrap:normal;max-width:270px;display:inline-block;overflow:hidden;padding: 0; float:left;">
									[구장확보] 3월 실내,실외 구장 및 동계 실내구장(국...								</a>
																								<img src="//img.gameone.kr/board/ico_new.gif" alt="새글" style=" float:left; padding:6px 0 5px 0;" />							</div>
						</td>
						<td>
							<div class="writer">
								<img src='//img.gameone.kr/community/label_01.png' alt="레벨이미지" />
								이수한															</div>
						</td>
						<td>2016.02.18</td>
						<td>12</td>
					</tr>
										<tr>
						<td>15742</td>
						<td>서울, 경기</td>
						<td>
							<div class="title ">
								<a href="/booking/board/view?board_idx=22&post_idx=69642&page=1&category=00&search_method=&search_word=" style="line-height:20px;text-overflow:ellipsis;white-space:nowrap;word-wrap:normal;max-width:270px;display:inline-block;overflow:hidden;padding: 0; float:left;">
									[구장확보] 2월28일 1타임 구장대여 합니다..								</a>
																								<img src="//img.gameone.kr/board/ico_new.gif" alt="새글" style=" float:left; padding:6px 0 5px 0;" />							</div>
						</td>
						<td>
							<div class="writer">
								<img src='//img.gameone.kr/community/label_01.png' alt="레벨이미지" />
								천덕용															</div>
						</td>
						<td>2016.02.18</td>
						<td>23</td>
					</tr>
										<tr>
						<td>15741</td>
						<td>서울, 경기</td>
						<td>
							<div class="title ">
								<a href="/booking/board/view?board_idx=22&post_idx=69640&page=1&category=00&search_method=&search_word=" style="line-height:20px;text-overflow:ellipsis;white-space:nowrap;word-wrap:normal;max-width:270px;display:inline-block;overflow:hidden;padding: 0; float:left;">
									[구장확보] 대관 및 시합신청(2시간 30분, 1심)								</a>
																								<img src="//img.gameone.kr/board/ico_new.gif" alt="새글" style=" float:left; padding:6px 0 5px 0;" />							</div>
						</td>
						<td>
							<div class="writer">
								<img src='//img.gameone.kr/community/label_01.png' alt="레벨이미지" />
								김민주															</div>
						</td>
						<td>2016.02.18</td>
						<td>23</td>
					</tr>
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