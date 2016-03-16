<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>
<link href="CSS/bbstable.css" rel="stylesheet" >

<div class="box_border" style="margin-top:5px; margin-bottom: 10px;">
<form name="frmForm1" id="_frmFormSearch" method="post" action="">

<table style="margin-left:auto; margin-right:auto; margin-top:3px; margin-bottom:3px; border:0; padding:0;">
<tr>
	<td>Search : </td>
	<td style="padding-left:5px;">
	<select id="_s_category" name="s_category">
		<option value="" selected="selected">선택</option>
		<option value="title">Title</option>
		<option value="contents">Content</option>								
	</select>
</td>
<td style="padding-left:5px;"><input type="text" id="_s_keyword" name="s_keyword" value="${s_keyword}"/></td>
<td style="padding-left:5px;"><span class="button blue"><button type="button" id="_btnSearch"> 검색 </button></span></td>
		</tr>
	</table>
	<input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:pageNumber}"/>						
	<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?10:recordCountPerPage}"/>						
	</form>
</div>


<jsp:useBean id="ubbs" class="sist.co.help.BBSHelp"/>
<table class="list_table" style="width:85%;">

<colgroup>
	<col style="width:5%;"/>
	<col style="width:15%;"/>
	<col style="width:auto;"/>
	<col style="width:20%;"/>
	<col style="width:13%;"/>
	<col style="width:7%;"/>
	<col style="width:7%;"/>
</colgroup>

<thead>
	<tr>
		<th>번호</th> <th>분류</th> <th>제목</th> <th>작성자</th>  <th>작성일</th>  <th>조회수</th>  <th>추천수</th> 
	</tr>
</thead>

<c:if test="${empty bbslist}">
	<tr>
		<td colspan="7">작성된 글이 없습니다.</td>
	</tr>
</c:if>

<c:forEach items="${bbslist}" var="bbs" varStatus="vs">
<c:if test="${bbs.del == 0}">
	<tr class="_hover_tr">
		<td>${vs.count}</td> 
		<td>
		<c:if test="${bbs.topic == '국내축구' }">
		<img src="./image/bbs_korea.jpg"/></c:if>
		<c:if test="${bbs.topic == '해외축구' }">
		<img src="./image/bbs_europe.jpg"/></c:if>
		<c:if test="${bbs.topic == '노닥거리' }">
		<img src="./image/bbs_free.jpg"/></c:if>
		${bbs.topic}</td>
		<%-- <td style="text-align: left"><a href='bbsdetail.do?bbs_no=${bbs.bbs_no}'>${bbs.title}</a> --%>
		<td style="text-align: left"><a href='bbsdetail.do?bbs_no=${bbs.bbs_no}'><c:out value="${bbs.title}"/></a>
		 &nbsp;&nbsp;
		 <a href="#" 
		 onclick="javascript:window.open('./commentlist.do?bbs_no=${bbs.bbs_no}','','location=0,status=0,scrollbars=1,width=750,height=300');">[${bbs.commentcount}]</a>
		</td>	
		<td style="position:relative;" class="popGrp">
			<p class="popBtn">${bbs.user_email}</p>
		<div class="popView" style="position:absolute; left:70px; top:33px; width:100px; height:40px; display:none; border:1px solid #333; background:white; z-index:100;">
		 <a href="#" onclick="javascript:popupOpen7('${bbs.user_email}')">쪽지보내기</a>
			<p class="popClose">닫기</p>	
		</div>
		</td>
			<c:set var="rdate" value="${bbs.wdate}"/>
			<c:set var="len" value="${fn:length(wdate)}"/>
		<td>${fn:substring(bbs.wdate, 0, 10)}</td>  
		<td>${bbs.readcount}</td> 
		<td>${bbs.good}</td> 
	</tr>
</c:if>
<c:if test="${bbs.del == 1}">
	<tr class="_hover_tr">
		<td>${vs.count}</td> 
		<td></td>
		<td style="text-align: left">이 글은 삭제 되었습니다.</td>
		<td>${bbs.user_email}</td> 
		<td></td> 
		<td></td> 
		<td></td>
	</tr>
</c:if>	
</c:forEach>
</table>

<br>
<div id="buttons_wrap">
	<button type="button" id="_btnAdd">글쓰기</button>
</div>
<br>

<div id="paging_wrap">
<jsp:include page="/WEB-INF/views/common/paging.jsp" flush="false">
	<jsp:param value="${pageNumber}" name="pageNumber"/>
	<jsp:param value="${pageCountPerScreen}" name="pageCountPerScreen"/>
	<jsp:param value="${recordCountPerPage}" name="recordCountPerPage"/>
	<jsp:param value="${totalRecordCount}" name="totalRecordCount"/>							
</jsp:include>				
</div>
<form name="frmForm2" id="_frmForm" method="get" action="bbswrite.do">
</form>

<br>
<a href="http://sports.news.naver.com/videoCenter/index.nhn?uCategory=wfootball&category=champs&id=178017">
<img src="./image/bbs_video3.png"/></a>
<br>

<script type="text/javascript">
$(document).ready(function() {   // 마우스에 따라서 컬러를 변경
   $("._hover_tr").mouseover(function() {
      $(this).children().css("background-color","#efefef");
   }).mouseout(function() {
      $(this).children().css("background-color","#FFFFFF");
   });    

	$(".popBtn").click(function() {
		$(this).parents(".popGrp").find(".popView").show();
	});
	$(".popClose").click(function() {
		$(this).parents(".popGrp").find(".popView").hide();
	});
	
});

$("#_btnAdd").click(function() {   
//  alert('글쓰기');   
 $("#_frmForm").attr({ "target":"_self", "action":"bbswrite.do" }).submit();
});

$("#_btnSearch").click(function() {
 //alert('search');                  
 $("#_frmFormSearch").attr({ "target":"_self", "action":"bbslist.do" }).submit();
});

function goPage(pageNumber) {   
 $("#_pageNumber").val(pageNumber) ;
 $("#_frmFormSearch").attr("target","_self").attr("action","bbslist.do").submit();
}

function popupOpen7(a) {
	var popUrl = "messagesend.do?a="+a; //팝업창에 출력될 페이지 URL
	var popOption = 'width=800, height=400,top=70, left=220, resizable=no, scrollbars=no, status=no;'; //팝업창 옵션(optoin)
	window.open(popUrl, "", popOption); 
}
</script>





