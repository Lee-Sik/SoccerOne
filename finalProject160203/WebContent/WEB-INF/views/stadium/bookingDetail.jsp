<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>

<style type="text/css">

* {
 
  padding: 0;
}



.pop-layer .pop-container {
  padding: 20px 25px;
}

.pop-layer p.ctxt {
  color: #666;
  line-height: 25px;
}

.pop-layer .btn-r {
  width: 100%;
  margin: 10px 0 20px;
  padding-top: 10px;
  border-top: 1px solid #DDD;
  text-align: right;
}

.pop-layer {
  display: none;
  position: absolute;
  top: 50%;
  left: 50%;
  width: 410px;
  height: auto;
  background-color: #fff;
  border: 5px solid #3571B5;
  z-index: 10;
}

.dim-layer {
  display: none;
  position: fixed;
  _position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 100;
}

.dim-layer .dimBg {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: #000;
  opacity: .5;
  filter: alpha(opacity=50);
}

.dim-layer .pop-layer {
  display: block;
}

a.btn-layerClose {
  display: inline-block;
  height: 25px;
  padding: 0 14px 0;
  border: 1px solid #304a8a;
  background-color: #3f5a9d;
  font-size: 13px;
  color: #fff;
  line-height: 25px;
}

a.btn-layerClose:hover {
  border: 1px solid #091940;
  background-color: #1f326a;
  color: #fff;
}

</style>

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/
jquery.min.js"></script>
<link href="CSS/booking.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="js/popup.js"></script>
<SCRIPT src="/package/js?key=0d7ccdbacf4ba90e3f8193d5d3298160&amp;dummy=1455255208" type=text/javascript></SCRIPT>
<script type="text/javascript">

$(function(){
	$("#img1").hover(function(){
		$("#img").attr("src","file://211.238.142.152/공유/ryu/<c:url value='${sdto.stadium_img1}'/>");
	});
	$("#img2").hover(function(){
		$("#img").attr("src","file://211.238.142.152/공유/ryu/<c:url value='${sdto.stadium_img2}'/>");
	});
	$("#img3").hover(function(){
		$("#img").attr("src","file://211.238.142.152/공유/ryu/<c:url value='${sdto.stadium_img3}'/>");
	});
	$("#img4").hover(function(){
		$("#img").attr("src","file://211.238.142.152/공유/ryu/<c:url value='${sdto.stadium_img4}'/>");
	});
	$(".booking").click(function(){
		var $st = $(this).attr('id');
		var $time = $(this).attr('title');
		$("#st").html($st);
		$("#gametime").val($st);
		$("#time").html($time);
		$(".bookinglayer").css("display", "block");
		
		
		
	});
	$("#closesimbtn").click(function(){
		$(".bookinglayer").fadeOut(); 
	});
	
	 
	$(".btn-example").click(function(){
		alert("ddd");
        var $href = $(this).attr('href');
        layer_popup($href); 
    });
	 
});

	function booking() {
		/* window.open('./BookingLayer.do','','location=no,status=0,scrollbars=1,width=530,height=330'); */
		window.open('./BookingLayer.do','window','location=no, directories=no,resizable=no,status=no,toolbar=no,menubar=no, width=300,height=400,left=0, top=0, scrollbars=yes');return false
	}
	

    function layer_popup(el){
		alert("ddd");
    	
        var $el = $(el);        //레이어의 id를 $el 변수에 저장
        var isDim = $el.prev().hasClass('dimBg');   //dimmed 레이어를 감지하기 위한 boolean 변수

        isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

        var $elWidth = ~~($el.outerWidth()),
            $elHeight = ~~($el.outerHeight()),
            docWidth = $(document).width(),
            docHeight = $(document).height();

        // 화면의 중앙에 레이어를 띄운다.
        if ($elHeight < docHeight || $elWidth < docWidth) {
            $el.css({
                marginTop: -$elHeight /2,
                marginLeft: -$elWidth/2
            })
        } else {
            $el.css({top: 0, left: 0});
        }

        $el.find('a.btn-layerClose').click(function(){
            isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
            return false;
        });

        $('.layer .dimBg').click(function(){
            $('.dim-layer').fadeOut();
            return false;
        });

    }
    
    function reserve1() {
		
	}
	
</script>

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
	<div id="BookingLayer" class="bookinglayer">
		<form name="BookingLayerForm" id="BookingLayerForm" action="./booking_reserve.do" method="post">
			<div class="section_header">
				<h3 style="margin-top: -1px;">축구장 부킹신청</h3>
				<h4 style="margin-top: -1px;">${sdto.stadium_name}</h4>
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
								<th id="st"></th>
								<td id="time"></td>
								<td>2시간</td>
								<td><span class="price">${bdto.rentalsum}원</span><span class="option">심판미포함</span></td>
							</tr>
						</tbody>
				</table>

				<dl class="user_tel">
					<dt><img src="http://file.clubone.kr/player/member_default.jpg"  width="30" height="30"/>${login.user_email }</dt>
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
				<p class="confirm">위 정보로 축구장 부킹신청을 하시겠습니까?</p>
				<ul class="notice">
						<!--<li>3시간내 입금확인이 되지 않을 시 신청은 자동해제됩니다.</li>
						<li>최종확정시 쪽지를 통해 안내됩니다.</li>-->
				</ul>
			</div>
			<input type="hidden" id="user_email" name="user_email" value="${login.user_email}">
			<input type="hidden" id="gametime" name="gametime">
			<input type="hidden" name="booking_seq" value="${bdto.booking_seq}">
			<input type="hidden" name="stadium_seq" value="${sdto.stadium_seq}">
				
		<div class="btn_group">
			<input type="submit" class="simbtn" id="submitBt" value="확인">
			<!-- <a href="#" class="simbtn" id="submitBt" target_form="BookingLayerForm" onclick="">확인</a> -->
			<input type="button" class="simbtn" id="closesimbtn" value="취소">
			<!-- <a href="#" class="closesimbtn">취소</a> -->
		</div>
		</form>
	</div>
	
	<table class="game_table" border="1">
		<colgroup>
			<col span="1" width="83" />
			<col span="1" width="145" />
			<col span="1" width="105" />
			<col span="1" width="165" />
			<col span="1" width="85" />
			<col span="1" />
		</colgroup>
		<caption>
		<dl style="margin-top: 1px;">
			<dt>대관료 납부계좌</dt>
			<dd>
				<dl style="margin-top: -20px;">
					<dd>${bdto.rentalaccount}</dd>
				</dl>
				<p style="margin-top: -10px;">※ 입금후, 관리자가 확정(예약완료)을 해야 부킹신청 완료됩니다.</p>
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
	
				<c:choose>
				    <c:when test="${empty bdto.game1}">
				    <td class="status">				
					<span id="game1" title="08시 00분 부터" class="booking">부킹</span></td><td><strong>예약가능</strong></td>
				    </c:when>
	
				    <c:otherwise>			        
				        <c:choose>				        
						    <c:when test="${game1==1}">
						    <td class="status">				
							<span id="game1" title="08시 00분 부터" class="occupied">확정</span></td><td><strong>예약확정</strong></td>
						    </c:when>				        
						    
						    <c:otherwise>
						   	<td class="status">				
							<span id="game1" title="08시 00분 부터" class="reserved">예약</span></td><td><strong>예약중</strong></td>
						    </c:otherwise>
				        </c:choose>			
				    </c:otherwise>
				</c:choose>
			
			</tr>
			<tr>
				<th>2게임</th>
				<td>10시 00분 부터</td>
				<td>2시간</td>
				<td><span class="price">${bdto.rentalsum}원</span><span class="option">심판없음</span></td>
				<c:choose>
				    <c:when test="${empty bdto.game2}">
				    <td class="status">				
					<span id="game2" title="10시 00분 부터" class="booking">부킹</span></td><td><strong>예약가능</strong></td>
				    </c:when>
	
				    <c:otherwise>			        
				        <c:choose>				        
						    <c:when test="${game2==1}">
						    <td class="status">				
							<span id="game2" title="10시 00분 부터" class="occupied">확정</span></td><td><strong>예약확정</strong></td>
						    </c:when>				        
						    
						    <c:otherwise>
						   	<td class="status">				
							<span id="game2" title="10시 00분 부터" class="reserved">예약</span></td><td><strong>예약중</strong></td>
						    </c:otherwise>
				        </c:choose>			
				    </c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<th>3게임</th>
				<td>12시 00분 부터</td>
				<td>2시간</td>
				<td><span class="price">${bdto.rentalsum} 원</span><span class="option">심판없음</span></td>
					<c:choose>
				    <c:when test="${empty bdto.game3}">
				    <td class="status">				
					<span id="game3" title="12시 00분 부터" class="booking">부킹</span></td><td><strong>예약가능</strong></td>
				    </c:when>
				    <c:otherwise>			        
				        <c:choose>				        
						    <c:when test="${game3==1}">
						    <td class="status">				
							<span id="game3" title="12시 00분 부터" class="occupied">확정</span></td><td><strong>예약확정</strong></td>
						    </c:when>				        
						    
						    <c:otherwise>
						   	<td class="status">				
							<span id="game3" title="12시 00분 부터" class="reserved">예약</span></td><td><strong>예약중</strong></td>
						    </c:otherwise>
				        </c:choose>			
				    </c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<th>4게임</th>
				<td>14시 00분 부터</td>
				<td>2시간</td>
				<td><span class="price">${bdto.rentalsum} 원</span><span class="option">심판없음</span></td>
				<c:choose>
				    <c:when test="${empty bdto.game4}">
				    <td class="status">				
					<span id="game4" title="14시 00분 부터" class="booking">부킹</span></td><td><strong>예약가능</strong></td>
				    </c:when>
	
				    <c:otherwise>			        
				        <c:choose>				        
						    <c:when test="${game4==1}">
						    <td class="status">				
							<span id="game4" title="14시 00분 부터" class="occupied">확정</span></td><td><strong>예약확정</strong></td>
						    </c:when>				        
						    
						    <c:otherwise>
						   	<td class="status">				
							<span id="game4" title="14시 00분 부터" class="reserved">예약</span></td><td><strong>예약중</strong></td>
						    </c:otherwise>
				        </c:choose>			
				    </c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<th>5게임</th>
				<td>16시 00분 부터</td>
				<td>2시간</td>
				<td><span class="price">${bdto.rentalsum} 원</span><span class="option">심판없음</span></td>
				<c:choose>
				    <c:when test="${empty bdto.game5}">
				    <td class="status">				
					<span id="game5" title="16시 00분 부터" class="booking">부킹</span></td><td><strong>예약가능</strong></td>
				    </c:when>
	
				    <c:otherwise>			        
				        <c:choose>				        
						    <c:when test="${game5==1}">
						    <td class="status">				
							<span id="game5" title="16시 00분 부터" class="occupied">확정</span></td><td><strong>예약확정</strong></td>
						    </c:when>				        
						    
						    <c:otherwise>
						   	<td class="status">				
							<span id="game5" title="16시 00분 부터" class="reserved">예약</span></td><td><strong>예약중</strong></td>
						    </c:otherwise>
				        </c:choose>			
				    </c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<th>6게임</th>
				<td>18시 00분 부터</td>
				<td>2시간</td>
				<td><span class="price">${bdto.rentalsum} 원</span><span class="option">심판없음</span></td>
				<c:choose>
				    <c:when test="${empty bdto.game6}">
				    <td class="status">				
					<span id="game6" title="18시 00분 부터" class="booking">부킹</span></td><td><strong>예약가능</strong></td>
				    </c:when>
	
				    <c:otherwise>			        
				        <c:choose>				        
						    <c:when test="${game6==1}">
						    <td class="status">				
							<span id="game6" title="18시 00분 부터" class="occupied">확정</span></td><td><strong>예약확정</strong></td>
						    </c:when>				        
						    
						    <c:otherwise>
						   	<td class="status">				
							<span id="game6" title="18시 00분 부터" class="reserved">예약</span></td><td><strong>예약중</strong></td>
						    </c:otherwise>
				        </c:choose>			
				    </c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<th>7게임</th>
				<td>20시 00분 부터</td>
				<td>2시간</td>
				<td><span class="price">${bdto.rentalsum} 원</span><span class="option">심판없음</span></td>
				<c:choose>
				    <c:when test="${empty bdto.game7}">
				    <td class="status">				
					<span id="game7" title="20시 00분 부터" class="booking">부킹</span></td><td><strong>예약가능</strong></td>
				    </c:when>
	
				    <c:otherwise>			        
				        <c:choose>				        
						    <c:when test="${game7==1}">
						    <td class="status">				
							<span id="game7" title="20시 00분 부터" class="occupied">확정</span></td><td><strong>예약확정</strong></td>
						    </c:when>				        
						    
						    <c:otherwise>
						   	<td class="status">				
							<span id="game7" title="20시 00분 부터" class="reserved">예약</span></td><td><strong>예약중</strong></td>
						    </c:otherwise>
				        </c:choose>			
				    </c:otherwise>
				</c:choose>
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
			<strong>${sdto.stadium_phone}</strong>
		</li>
	</ul>
	<ul class="img_list" style="width: 98%;">

		<li style="width: 750px; height: 360px; " ><img id="img" src="file://211.238.142.152/공유/ryu/<c:out value='${sdto.stadium_img1}'/>" style="width: 730px; height: 350px;"/></a></li>
		<li style="margin-top: 20px;"><img id="img1" src="file://211.238.142.152/공유/ryu/<c:url value='${sdto.stadium_img1}'/>" /></a></li>		
		<li style="margin-top: 20px;"><img id="img2" src="file://211.238.142.152/공유/ryu/<c:url value='${sdto.stadium_img2}'/>" /></a></li>		
		<li style="margin-top: 20px;"><img id="img3" src="file://211.238.142.152/공유/ryu/<c:url value='${sdto.stadium_img3}'/>" /></a></li>			
		<li style="margin-top: 20px;"><img id="img4" src="file://211.238.142.152/공유/ryu/<c:url value='${sdto.stadium_img4}'/>" /></a></li>
		
		<!-- <li style="width: 750px; height: 360px;" ><a href="http://file.clubone.kr/community/booking/old/b503e120e6eb4ef0.jpg" target="_blank"><img src="http://file.clubone.kr/community/booking/old/b503e120e6eb4ef0.jpg" style="width: 730px; height: 350px;"/></a></li>
		<li style="margin-top: 20px;"><a href="http://file.clubone.kr/community/booking/old/b503e120e6eb4ef0.jpg" target="_blank"><img src="http://file.clubone.kr/community/booking/old/b503e120e6eb4ef0.jpg" /></a></li>		
		<li style="margin-top: 20px;"><a href="http://file.clubone.kr/community/booking/old/30b7c9f84fc0e642.jpg" target="_blank"><img src="http://file.clubone.kr/community/booking/old/30b7c9f84fc0e642.jpg" /></a></li>		
		<li style="margin-top: 20px;"><a href="http://file.clubone.kr/community/booking/old/424b33afd7b95c86.jpg" target="_blank"><img src="http://file.clubone.kr/community/booking/old/424b33afd7b95c86.jpg" /></a></li>			
		<li style="margin-top: 20px;"><a href="http://file.clubone.kr/community/booking/old/424b33afd7b95c86.jpg" target="_blank"><img src="http://file.clubone.kr/community/booking/old/424b33afd7b95c86.jpg" /></a></li>		 -->
				
	</ul>
	<div class="btn_group">
		<div class="right">
			<a href="./bookingList.do" class="sbbtn">목록보기</a>
		</div>
	</div>
		
		
</div>

	
	
	<div style="height: 300px;"></div>
 <a href="#layer1" class="btn-example">일반 팝업레이어</a>
<div id="layer1" class="pop-layer">
    <div class="pop-container">
        <div class="pop-conts">
            <!--content //-->
            <p class="ctxt mb20">Thank you.<br>
                Your registration was submitted successfully.<br>
                Selected invitees will be notified by e-mail on JANUARY 24th.<br><br>
                Hope to see you soon!
            </p>

            <div class="btn-r">
                <a href="#" class="btn-layerClose">Close</a>
            </div>
            <!--// content-->
        </div>
    </div>
</div>


</div>

		<script type="text/javascript">
			if(!wcs_add) var wcs_add = {};
			wcs_add["wa"] = "395a7e85edf87c";
			wcs_do();
		</script>


</body>
</html>