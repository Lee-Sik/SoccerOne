<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="CSS/booking.css" rel="stylesheet" type="text/css" />
<!-- // jQuery UI CSS파일  -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<!-- // jQuery 기본 js파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<!-- // jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script type="text/javascript">

$(function() {
	
$("#submitBt").click(function() {
		
		if($("#testDatepicker").val() == ''){
			alert("날짜를 입력해주세요.");
			$("#testDatepicker").focus();
			return;
		}
		if($("#booking_area").val() == ''){
			alert("지역을 입력해주세요.");
			$("#booking_area").focus();
			return;
		}
		if($("#rentalsum").val() == ''){
			alert("대관료를 입력해주세요.");
			$("#rentalsum").focus();
			return;
		}
		if($("#bankuser").val() == ''){
			alert("납부계좌를 입력해주세요.");
			$("#bankuser").focus();
			return;
		}
			
		alert("부킹등록을 완료하였습니다.");
		
		$("#f1").submit();
	});
	
    $( "#testDatepicker" ).datepicker({
    	
    }); 

});

</script>

<style type="text/css">

td.td1 {
	background-color: #f4f4f4; 
	text-align: center;
	
}
td.td2 {
	background-color: #ffffff;
	text-align: left;
}

</style>

</head>
<body>
<form action="booking_write_ok.do" method="post" id="f1">
<div class="hb_wrap booking_wrap">
							
							<div class="book_write" style="width: 95%; margin-top: -3%;">
							

                                    <input type="hidden" name="mode" value="do">
                                    <input type="hidden" name="ground_seq" value="">

                                    <ul class="input_list">
                                    	<li>
                                            <span class="title">구장명</span>
                                            <input type="text" class="title" id="stadium_name" name="stadium_name" value="${stadium_name}" vname="구장명" required="required" readonly="readonly" style="margin-left: -70%;"/>
                                        	<input type="hidden" name="stadium_seq" value="${stadium_seq}">
                                        </li>
                                        <li>
                                            <span class="title">날짜</span>
                                            <input type="text" name="day" id="testDatepicker" class="title" style="margin-left: -70%;">
                                        </li>
                                        <li>
                                            <span class="title">지역</span>
                                            <select name="booking_area" id="booking_area" style="margin-left: -88%;" class="title">
											<option value="">지역구 선택</option>
											<c:forEach var="dto" items="${post1}">
												<option value="${dto.gugun}">${dto.gugun}</option>
											</c:forEach>
											</select>
                                        </li>
                                        <li>
                                            <span class="title">대관료</span>
                                           	<input type="text" class="title" id="rentalsum" name="rentalsum" style="margin-left: -69%;">원
                                        </li>
                                        <li>
                                            <span class="title">납부계좌</span>
                                           	<select name="bank" id="bank" style="margin-left: -4%;">
												<option value="">은행 선택</option>
												<option value="KB국민은행">KB국민은행</option>
												<option value="우리은행">우리은행</option>
												<option value="하나은행">하나은행</option>
												<option value="신한(조흥)은행">신한(조흥)은행</option>
												<option value="외환은행">외환은행</option>
												<option value="기업은행">기업은행</option>
												<option value="SC제일은행">SC제일은행</option>
											</select>
											&nbsp;계좌번호&nbsp;:&nbsp;<input type="text" class="title" name="banknum" size="15"> 
											&nbsp;예금주&nbsp;:&nbsp;<input type="text" class="title" id="bankuser" name="bankuser" size="10">
                                        </li>
                                    </ul>


                               
								<div class="btn_group">
									<div class="right">
										<a href="#" class="bbtn" id="submitBt" onclick="">부킹 등록하기</a>
										<a href="/booking/stadium/manage" class="sbbtn">목록보기</a>
									</div>
								</div>
							</div>
				</div>
</form>
</form>

</body>
</html>





























