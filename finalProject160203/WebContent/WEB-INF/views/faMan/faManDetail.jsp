<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="CSS/booking.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
	function delete1(seq) {
		if (confirm("정말 삭제하시겠습니까??") == true){    //확인
			location.href="./faManDelete.do?seq=" + seq;
		}else{   //취소
		    return;
		}
	}
	
	function write1() {
		
		var email = "${login.user_email}";
		
		if(email==null || email==""){
			alert("로그인 해주십시오.");
			location.href = "./first.do";
		}else{
			location.href = "./faManWrite.do?mode=write";
		}
	}

	
</script>

</head>
<body>

<div class="hb_wrap booking_wrap"><div class="navi" style="margin-top: -150px;">
	
</div>
<div class="hb_wrap news_view">
	<div class="bbs_view dminhs">
		<div class="bbs">
		
			<div class="bbs-vw-hd">
				<h3 class="btitle" style="height:auto; padding:0 50px; word-wrap:break-word;">
					<div>
						[${fdto.fa_man_type}] ${fdto.fa_man_title}
					</div>
					<span>[${fdto.fa_man_location}]</span>
					<span class="from">자유계약</span>
				</h3>
				<c:if test="${not empty preDTO}">
				<a href="./faManDetail.do?seq=${preDTO.fa_man_seq}" class="prev btn" style="margin-top: 25px;">이전글</a>				
				</c:if>
				<c:if test="${not empty nextDTO}">
				<a href="./faManDetail.do?seq=${nextDTO.fa_man_seq}" class="next btn" style="margin-top: 25px;">다음글</a>	
			
				</c:if>	
				<div class="bbs-arc-info">	
					<div class="left" style="margin-top: -10px;">
						<dl class="bbs-wt-info">
							<dt>
								<img src='//img.gameone.kr/community/label_01.png' alt="레벨이미지" />
								${fdto.user_name}(${fdto.user_email})
							</dt>
							<dd>${fdto.fa_man_date}</dd>
						</dl>
					</div>
					<div class="right" style="margin-top: -10px;">
						<ul class="hit_info">
							<li>조회 ${fdto.fa_man_hit}</li>
						</ul>
						<ul class="bbs-btngr">
																				</ul>
					</div>
					
				</div>
			</div>
			<div style="text-align:right; margin:10px; ">
							</div>
			<div class="bbs-vw-contents" style="word-wrap:break-word; text-align: left;">
			${fdto.fa_man_content}
			</div>

<div class="bbs-vw-bt">
				<div class="bbs-btngr">
					<a href="" class="bbs-wbbtn" onclick="write1();">글쓰기</a>
					<c:if test="${login.user_email == fdto.user_email}">
					<a href="./faManWrite.do?seq=${fdto.fa_man_seq}&mode=update" class="bbs-gbtn">수정</a>					<!-- <a href="#" class="bbs-gbtn sh-mv">이동</a> -->
					<a href="#" class="bbs-gbtn delPost" onclick="delete1('${fdto.fa_man_seq}')">삭제</a>
					</c:if>	
					<!-- <a href="#" class="bbs-gbtn">답글</a> -->
										<!-- <a href="#" class="bbs-gbtn sh-mv">이동</a> -->
										<a href="./faManList.do" class="bbs-gbtn">목록</a>
				</div>
				<ul class="bbs-prnx">
					<li>
						<span class="prev">이전글</span>		
						<c:choose>
							<c:when test="${empty preDTO}">
								<span class="title" style="text-overflow:ellipsis;white-space:nowrap;word-wrap:normal;width:350px;display:block; overflow:hidden;float:left;">이전글이 없습니다.</span>
							</c:when>
							
							<c:otherwise>	
								<a href="./faManDetail.do?seq=${preDTO.fa_man_seq}">
								<span class="title" style="text-overflow:ellipsis;white-space:nowrap;word-wrap:normal;width:350px;display:block; overflow:hidden;float:left;">${preDTO.fa_man_title}</span>
								</a>
								<span class="writer">${preDTO.user_name}</span>
								<span class="date">${preDTO.fa_man_date}</span>
							</c:otherwise>
						</c:choose>		
					</li>
					
					<li>
						<span class="next">다음글</span>
						<c:choose>
							<c:when test="${empty nextDTO}">
								<span class="title" style="text-overflow:ellipsis;white-space:nowrap;word-wrap:normal;width:350px;display:block; overflow:hidden;float:left;">다음글이 없습니다.</span>
							</c:when>
							
							<c:otherwise>	
								<a href="./faManDetail.do?seq=${nextDTO.fa_man_seq}">
								<span class="title" style="text-overflow:ellipsis;white-space:nowrap;word-wrap:normal;width:350px;display:block; overflow:hidden;float:left;">${nextDTO.fa_man_title}</span>
								</a>
								<span class="writer">${nextDTO.user_name}</span>
								<span class="date">${nextDTO.fa_man_date}</span>
							</c:otherwise>
						</c:choose>	
					</li>
									</ul>
			</div>

</div>
</div>
</div>
</div>



</body>
</html>