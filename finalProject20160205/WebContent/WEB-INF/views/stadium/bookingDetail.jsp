<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="CSS/booking.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
</head>
<body>
<div class="hb_wrap booking_wrap" style="margin-top: -20px;">

<div class="book_view" style="width: 83%; margin-left: 30px;">
	<h4>축구장 부킹신청</h4>
	<div class="share_box">
		<ul class="share_nav">
			<!--
			<li><a href="javascript:void(0);"><span class="fb">facebook</span></a></li>
			<li><a href="javascript:void(0);"><span class="tw">twitter</span></a></li>

			<li><a href="javascript:void(0);"><span class="lk">locker</span></a></li>
			<li><a href="javascript:void(0);"><span class="tm">team</span></a></li>
			<li><a href="javascript:void(0);"><span class="lg">league</span></a></li>

			<li><a href="javascript:void(0);"><span class="ks">kakaostory</span></a></li>
			<li><a href="javascript:void(0);"><span class="bd">band</span></a></li>
			 -->
		</ul>
	</div>
	<ul class="input_list view_list">
		<li><span class="title">등록자 정보</span>
			<ul class="inner_list bar">
				<li><strong>[일반등록]</strong> ${sdto.user_email} </li>
				<li>연락처 : ${sdto.stadium_phone}</li>
			</ul>
		</li>
		<li><span class="title">구장명</span>
			<strong>${sdto.stadium_name}</strong>
		</li>
		<li><span class="title">사용날짜</span>
			<strong>${bdto.booking_day}</strong>
		</li>
	</ul>
	<table class="game_table">
		<colgroup>
			<col span="1" width="83" />
			<col span="1" width="145" />
			<col span="1" width="105" />
			<col span="1" width="165" />
			<col span="1" width="85" />
			<col span="1" />
		</colgroup>
		<caption>
		<dl>
			<dt>대관료 납부계좌</dt>
			<dd>
				<dl>
					<dd>${bdto.rentalaccount}</dd>
				</dl>
				<p>※ 입금후, 관리자가 확정(예약완료)을 해야 부킹신청 완료됩니다.</p>
			</dd>
		</dl></caption>
		
		<thead>
			<tr>
				<th>게임</th>
				<th>대관시작시간</th>
				<th>대관시간</th>
				<th>대관비용</th>
				<th>상태</th>
				<th>예약현황</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th>1게임</th>
				<td>08시 00분 부터</td>
				<td>2시간</td>
				<td><span class="price">${bdto.rentalsum}원</span><span class="option">심판없음</span></td>
				<td class="status"><span class="booking">부킹</span></td><td><strong>예약가능</strong></td>
			</tr>
			<tr>
				<th>2게임</th>
				<td>10시 00분 부터</td>
				<td>2시간</td>
				<td><span class="price">${bdto.rentalsum}원</span><span class="option">심판없음</span></td>
				<td class="status"><span class="booking">부킹</span></td><td><strong>예약가능</strong></td>
			</tr>
			<tr>
				<th>3게임</th>
				<td>12시 00분 부터</td>
				<td>2시간</td>
				<td><span class="price">${bdto.rentalsum} 원</span><span class="option">심판없음</span></td>
				<td class="status"><span class="booking">부킹</span></td><td><strong>예약가능</strong></td>
			</tr>
			<tr>
				<th>4게임</th>
				<td>14시 00분 부터</td>
				<td>2시간</td>
				<td><span class="price">${bdto.rentalsum} 원</span><span class="option">심판없음</span></td>
				<td class="status"><span class="booking">부킹</span></td><td><strong>예약가능</strong></td>
			</tr>
			<tr>
				<th>5게임</th>
				<td>16시 00분 부터</td>
				<td>2시간</td>
				<td><span class="price">${bdto.rentalsum} 원</span><span class="option">심판없음</span></td>
				<td class="status"><span class="booking">부킹</span></td><td><strong>예약가능</strong></td>
			</tr>
			<tr>
				<th>6게임</th>
				<td>18시 00분 부터</td>
				<td>2시간</td>
				<td><span class="price">${bdto.rentalsum} 원</span><span class="option">심판없음</span></td>
				<td class="status"><span class="booking">부킹</span></td><td><strong>예약가능</strong></td>
			</tr>
			<tr>
				<th>7게임</th>
				<td>20시 00분 부터</td>
				<td>2시간</td>
				<td><span class="price">${bdto.rentalsum} 원</span><span class="option">심판없음</span></td>
				<td class="status"><span class="booking">부킹</span></td><td><strong>예약가능</strong></td>
			</tr>
		</tbody>
		</table>
		
		<h4>축구장 정보</h4>
	<ul class="input_list view_list">
		<li><span class="title">구장명</span>
			<strong>${sdto.stadium_name}</strong>
		</li>
		<li><span class="title">구장주소</span>
			${sdto.addr}		</li>
		<li><span class="title">야구장사용 참고내용</span>
			<p class="description">${sdto.s_content}</p>
		</li>
		<li><span class="title">찾아오는 방법</span>
			<p class="description">${sdto.findway}</p>
		</li>
		<li><span class="title">구장연락처</span>
			<strong>${sdto.stadium_phone}<br> <br> ${sdto.stadium_img1}</strong>
		</li>
	</ul>
	<ul class="img_list">
		<li style="width: 750px; height: 360px;" ><a href="http://file.clubone.kr/community/booking/old/b503e120e6eb4ef0.jpg" target="_blank"><img src="\\211.238.142.152\공유\ryu\1.jpg" style="width: 730px; height: 350px;"/></a></li>
		<li style="margin-top: 20px;"><a href="http://file.clubone.kr/community/booking/old/b503e120e6eb4ef0.jpg" target="_blank"><img src="image/stadiumImg/abs.jpg" /></a></li>		
		<li style="margin-top: 20px;"><a href="http://file.clubone.kr/community/booking/old/30b7c9f84fc0e642.jpg" target="_blank"><img src="image/stadiumImg/abs.jpg" /></a></li>		
		<li style="margin-top: 20px;"><a href="http://file.clubone.kr/community/booking/old/424b33afd7b95c86.jpg" target="_blank"><img src="image/stadiumImg/abs.jpg" /></a></li>			
		<li style="margin-top: 20px;"><a href="http://file.clubone.kr/community/booking/old/424b33afd7b95c86.jpg" target="_blank"><img src="image/stadiumImg/abs.jpg" /></a></li>
		
		<!-- <li style="width: 750px; height: 360px;" ><a href="http://file.clubone.kr/community/booking/old/b503e120e6eb4ef0.jpg" target="_blank"><img src="http://file.clubone.kr/community/booking/old/b503e120e6eb4ef0.jpg" style="width: 730px; height: 350px;"/></a></li>
		<li style="margin-top: 20px;"><a href="http://file.clubone.kr/community/booking/old/b503e120e6eb4ef0.jpg" target="_blank"><img src="http://file.clubone.kr/community/booking/old/b503e120e6eb4ef0.jpg" /></a></li>		
		<li style="margin-top: 20px;"><a href="http://file.clubone.kr/community/booking/old/30b7c9f84fc0e642.jpg" target="_blank"><img src="http://file.clubone.kr/community/booking/old/30b7c9f84fc0e642.jpg" /></a></li>		
		<li style="margin-top: 20px;"><a href="http://file.clubone.kr/community/booking/old/424b33afd7b95c86.jpg" target="_blank"><img src="http://file.clubone.kr/community/booking/old/424b33afd7b95c86.jpg" /></a></li>			
		<li style="margin-top: 20px;"><a href="http://file.clubone.kr/community/booking/old/424b33afd7b95c86.jpg" target="_blank"><img src="http://file.clubone.kr/community/booking/old/424b33afd7b95c86.jpg" /></a></li>		 -->
				
	</ul>
	<div class="btn_group">
		<div class="right">
			<a href="http://www.gameone.kr/booking/stadium/main&lig_idx=0" class="sbbtn">목록보기</a>
		</div>
	</div>
		
		
</div>

	<div id="BookingLayer" class="bookinglayer">
		<form name="BookingLayerForm" id="BookingLayerForm" action="/booking/stadium/reserve" method="post">
			<div class="section_header">
				<h3>야구장 부킹신청</h3>
				<h4>소망인조잔디구장</h4>
			</div>
			<div class="section">
				<table class="game_table" summary="야구장 부킹신청">
						<thead>
							<tr>
								<th>게임</th>
								<th>대관시작시간</th>
								<th>대관시간</th>
								<th>대관비용</th>
							</tr>
						<thead>
						<tbody>
							<tr>
								<th>1st</th>
								<td>06시 00분 부터</td>
								<td>2시간</td>
								<td><span class="price">150,000 원</span><span class="option">심판포함</span></td>
							</tr>
						</tbody>
				</table>

				<dl class="user_tel">
					<dt><img src="http://file.clubone.kr/player/member_default.jpg"  width="30" height="30"/>한상호</dt>
					<dd><div class="combobox">
						<strong class="selected">010</strong>
						<ul class="combo">
						</ul>
						<select id="num1" name="num1">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select>
					</div><span class="dash">-</span>
					<input type="text" id="num2" name="num2" maxlength="4" />
					<span class="dash">-</span>
					<input type="text" id="num3" name="num3" maxlength="4" /></dd>
				</dl>
				<p class="confirm">위 정보로 야구장 부킹신청을 하시겠습니까?</p>
				<ul class="notice">
						<!--<li>3시간내 입금확인이 되지 않을 시 신청은 자동해제됩니다.</li>
						<li>최종확정시 쪽지를 통해 안내됩니다.</li>-->
				</ul>
			</div>
			<input type="hidden" id="booker_id" name="booker_id" value="sangho210">
			<input type="hidden" id="booker_name" name="booker_name" value="한상호">
			<input type="hidden" id="booking_idx" name="booking_idx" value="5295">
			<input type="hidden" id="booking_num" name="booking_num" value="">
		</form>
		<div class="btn_group">
			<a href="#" class="simbtn" id="submitBt" target_form="BookingLayerForm">확인</a>
			<a href="javascript:void(0);" class="close simbtn">취소</a>
		</div>
	</div>



</div>




</body>
</html>