<%@page import="java.io.File"%>
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
<script type="text/javascript" src="./editor/js/HuskyEZCreator.js" charset="utf-8"></script>
 
<!-- Smart Editor -->
<!-- Smart Editor -->

<script>
$(document).ready(function(){
	$("#save").click(function(){		
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
		
		if($("#free_b_title").val() == ''){
			alert("글제목을 입력해주세요.");
			$("#free_b_title").focus();
			return;
		}
		if($("#addr1").val() == ''){
			alert("주소를 입력해주세요.");
			$("#addr1").focus();
			return;
		}
		
		if($("#free_b_sendrecieve option:selected").val() == ''){
			alert("양수/양도 여부를 선택해주세요.");
			$("#free_b_sendrecieve").focus();
			return;
		}
		if($("#free_b_location option:selected").val() == ''){
			alert("지역구를 선택해주세요.");
			$("#free_b_location").focus();
			return;
		}
		if($("#content").val() == ''){
			alert("내용을 입력해주세요.");
			$("#content").focus();
			return;
		}
		alert("완료하였습니다.");
		$("#frm").submit();		
	})
})
</script>

</head>
<body>

<div class="hb_wrap booking_wrap" style="margin-top: -10%;"><div class="navi">

</div>
<div class="hb_wrap news_view">
	<div class="bbs_view dminhs">
		<div class="bbs">
			<form id="frm" action="fbookingWrite_ok.do" method="post" >
				
				<div class="writeList">
					<ul class="bbs-wtinfo">
						<li class="title">
							<span class="title" style="margin-left: 50px;">글제목</span>
							<input type="text" class="title" name="free_b_title" id="free_b_title" value="${fdto.free_b_title}" maxlength="100" style="margin-left: -100px;"/>
						</li>
					</ul>
					
					<ul class="bbs-wtinfo">
						<li class="title">
							<span class="title" style="margin-left: 50px;">주소</span>
							<input type="text" class="title" id="addr1" name="free_b_addr" value="${fdto.free_b_addr}" maxlength="100" style="margin-left: -100px;"
							onclick="javascript:window.open('./post.do','','location=0,status=0,scrollbars=1,width=530,height=330');" />
						</li>
					</ul>
					
					<ul class="bbs-wtinfo">
						<li class="title">
							<span class="title" style="margin-left: 50px;">카테고리</span>
							<div style="margin-left: -440px;">
							<select name="free_b_sendrecieve" id="free_b_sendrecieve">
								<option value="">구 분</option>
								<option value="양도">양도</option>
								<option value="양수">양수</option>
							</select>									
							&nbsp;&nbsp;&nbsp;&nbsp;
							<select name="free_b_location" id="free_b_location">
								<option value="">지역구 선택</option>
								<c:forEach var="dto" items="${post1}">
								<option value="${dto.gugun}">${dto.gugun}</option>
								</c:forEach>
							</select>
							</div>
							
						</li>
					</ul>
	
					<div class="editer" style="margin-left: 5.5%;">
						<textarea id="content" name="free_b_content" style="width: 50%;">${fdto.free_b_content}</textarea>
					</div>
					<script type="text/javascript">
 
					var oEditors = [];										
					$(function(){
					nhn.husky.EZCreator.createInIFrame({
						oAppRef: oEditors,
						elPlaceHolder: "content",
						//SmartEditor2Skin.html 파일이 존재하는 경로
						sSkinURI:"./editor/SmartEditor2Skin.html",
						
						htParams:{
							// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
							bUseToolbar:true,				
							// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
							bUseVerticalResizer:true,		
							// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
							bUseModeChanger:true,			
							fOnBeforeUnload:function(){							
							}
						}, 
						fOnAppLoad:function(){						
							//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
							oEditors.getById["content"].exec("PASTE_HTML", [""]);
						},
						fCreator:"createSEditor2"
					});
					});	
 
				</script>
				<input type="hidden" name="user_email" value="${login.user_email}">	
				<input type="hidden" name="mode" value="${mode}">
				<c:if test="${not empty fdto}">
				<input type="hidden" name="free_b_seq" value="${fdto.free_b_seq}">	
				</c:if>
				</div>
								<div class="bbs-wt-bt">
					<div class="bbs-btngr">
						<!--  <input type="submit" class="bbs-wbbtn writeBtn" value="확인"> -->
						<a href="#" class="bbs-wbbtn writeBtn" id="save" onclick="fOnAppLoad(this)">확인</a>
						<a href="/booking/board/list?board_idx=22&page=" class="bbs-gbtn">목록</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
				</div>
</body>






</html>