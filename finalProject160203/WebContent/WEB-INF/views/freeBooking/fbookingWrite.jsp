<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="CSS/booking.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script>
 
<!-- Smart Editor -->



</head>
<body>

<div class="hb_wrap booking_wrap"><div class="navi">
	<h2 style="font-size:27px;font-family: 'nanumgothic','nanum','dotum';color:#40434A;">게임부킹</h2>
	
</div>
<div class="hb_wrap news_view">
	<div class="bbs_view dminhs">
		<div class="bbs">
			<form id="writeForm" method="post" action="/booking/board/exec/write" enctype="multipart/form-data">
				<input type="hidden" name="board_idx" value="22">
				<input type="hidden" id="editorAddImage" name="editorAddImage">
				<input type="hidden" name="highlight" id="highlight" value="">
				<div class="writeList">
					<ul class="bbs-wtinfo">
						<li class="title">
							<span class="title" style="margin-left: 50px;">글제목</span>
							<input type="text" class="title" name="title" maxlength="100" style="margin-left: -100px;"/>
						</li>
					</ul>
					
					<ul class="bbs-wtinfo">
						<li class="title">
							<span class="title" style="margin-left: 50px;">카테고리</span>
							<div style="margin-left: -440px;">
							<select name="category_second">
								<option value="00">구장확보</option>
								<option value="01">구장미확보</option>
							</select>									
							&nbsp;&nbsp;&nbsp;&nbsp;
							<select name="category_second">
								<option value="00">구장확보</option>
								<option value="01">구장미확보</option>
							</select>
							</div>
							
						</li>
					</ul>
					
				
					<div class="editer">
						<textarea id="content" name="content"></textarea>
					</div>
				

					
				</div>
								<div class="bbs-wt-bt">
					<div class="bbs-btngr">
						<a href="#none" class="bbs-wbbtn writeBtn">확인</a>
						<a href="/booking/board/list?board_idx=22&page=" class="bbs-gbtn">목록</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
				</div>
</body>


<!-- Smart Editor -->
<script type="text/javascript">
 
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "content",
    sSkinURI: "<%=request.getContextPath()%>/se2/SmartEditor2Skin.html",
    fCreator: "createSEditor2"
});
 
//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
function submitContents(elClickedObj) {
    // 에디터의 내용이 textarea에 적용된다.
    oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [ ]);
 
    // 에디터의 내용에 대한 값 검증은 이곳에서
    // document.getElementById("textAreaContent").value를 이용해서 처리한다.
  
    try {
        elClickedObj.form.submit();
    } catch(e) {
     
    }
}
 
// textArea에 이미지 첨부
function pasteHTML(filepath){
   <%--  var sHTML = '<img src="<%=request.getContextPath()%>/path에서 설정했던 경로/'+filepath+'">'; --%>
    var sHTML = <%=request.getSession().getServletContext().getRealPath("/") + File.separator + "pds"%>
    oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
}
 
</script>



</html>