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
			location.href="./fbookingDelete.do?seq=" + seq;
		}else{   //취소
		    return;
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
						[${fdto.free_b_sendrecieve}] ${fdto.free_b_title}
					</div>
					<span>[${fdto.free_b_location}]</span>
					<span class="from">자유대관</span>
				</h3>
				<c:if test="${not empty preDTO}">
				<a href="./fbookingDetail.do?seq=${preDTO.free_b_seq}" class="prev btn" style="margin-top: 25px;">이전글</a>				
				</c:if>
				<c:if test="${not empty nextDTO}">
				<a href="./fbookingDetail.do?seq=${nextDTO.free_b_seq}" class="next btn" style="margin-top: 25px;">다음글</a>	
			
				</c:if>	
				<div class="bbs-arc-info">	
					<div class="left" style="margin-top: -10px;">
						<dl class="bbs-wt-info">
							<dt>
								<img src='//img.gameone.kr/community/label_01.png' alt="레벨이미지" />
								${fdto.user_name}(${fdto.user_email})
							</dt>
							<dd>${fdto.free_b_date}</dd>
						</dl>
					</div>
					<div class="right" style="margin-top: -10px;">
						<ul class="hit_info">
							<li>조회 ${fdto.free_b_hit}</li>
						</ul>
						<ul class="bbs-btngr">
																				</ul>
					</div>
					
				</div>
			</div>
			<div style="text-align:right; margin:10px; ">
							</div>
			<div class="bbs-vw-contents" style="word-wrap:break-word; text-align: left;">
			${fdto.free_b_content}
			</div>

<div class="bbs-vw-bt">
				<div class="bbs-btngr">
					<a href="./fbookingWrite.do" class="bbs-wbbtn">글쓰기</a>
					<c:if test="${login.user_email == fdto.user_email}">
					<a href="./fbookingWrite.do?seq=${fdto.free_b_seq}&mode=update" class="bbs-gbtn">수정</a>					<!-- <a href="#" class="bbs-gbtn sh-mv">이동</a> -->
					<a href="#" class="bbs-gbtn delPost" onclick="delete1('${fdto.free_b_seq}')">삭제</a>
					</c:if>	
					<!-- <a href="#" class="bbs-gbtn">답글</a> -->
										<!-- <a href="#" class="bbs-gbtn sh-mv">이동</a> -->
										<a href="./fbookingList.do" class="bbs-gbtn">목록</a>
				</div>
				<ul class="bbs-prnx">
					<li>
						<span class="prev">이전글</span>		
						<c:choose>
							<c:when test="${empty preDTO}">
								<span class="title" style="text-overflow:ellipsis;white-space:nowrap;word-wrap:normal;width:350px;display:block; overflow:hidden;float:left;">이전글이 없습니다.</span>
							</c:when>
							
							<c:otherwise>	
								<a href="./fbookingDetail.do?seq=${preDTO.free_b_seq}">
								<span class="title" style="text-overflow:ellipsis;white-space:nowrap;word-wrap:normal;width:350px;display:block; overflow:hidden;float:left;">${preDTO.free_b_title}</span>
								</a>
								<span class="writer">${preDTO.user_name}</span>
								<span class="date">${preDTO.free_b_date}</span>
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
								<a href="./fbookingDetail.do?seq=${nextDTO.free_b_seq}">
								<span class="title" style="text-overflow:ellipsis;white-space:nowrap;word-wrap:normal;width:350px;display:block; overflow:hidden;float:left;">${nextDTO.free_b_title}</span>
								</a>
								<span class="writer">${nextDTO.user_name}</span>
								<span class="date">${nextDTO.free_b_date}</span>
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