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

<div id="Container" >
		<div class="wrap">
			<!-- 콘텐츠 -->
			<div class="contents">
				<div class="hb_wrap booking_wrap">
							<div class="book_top">
								<h3>야구장 정보 및 부킹관리</h3>
								<ul class="navi">
									<li>HOME</li>
									<li>야구부킹</li>
									<li>야구장부킹</li>
									<li><strong>야구장 정보 및 부킹관리</strong></li>
								</ul>
							</div>
							<div class="book_list_top">
								<div class="manage_list">
									<ul>
                                                                                                                                
                                            <li>
                                                <span class="num">1</span>
                                                <span class="name">신촌야구장</span>
                                                <span class="btn"><a href="/booking/stadium/write?ground_seq=5739" class="sbbtn">야구장정보</a></span>
                                                <span class="btn"><a href="/booking/stadium/writeb?ground_seq=5739" class="sbbtn">부킹등록</a></span>
                                                <span class="btn"><a href="/booking/stadium/write?mode=delete&ground_seq=5739" class="del">삭제</a></span>
                                            </li>
                                                                                                                                										<!---->
									</ul>
								</div>
								<div class="btn_group">
									<div class="right">
										<a href="/booking/stadium/write" class="bbtn">구장등록</a>
									</div>
								</div>
							</div>
</div>
</div>
</div>
</div>

</body>
</html>