<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="CSS/booking.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div id="BookingLayer" class="bookinglayer" style="display: block;">
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
</body>
</html>