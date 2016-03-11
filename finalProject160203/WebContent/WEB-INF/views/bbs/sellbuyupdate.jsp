<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<link href="CSS/bbstable.css" rel="stylesheet" >

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.js"></script> 
<script type="text/javascript" src="./editor/js/HuskyEZCreator.js" charset="utf-8"></script>

<script>
$(document).ready(function(){
	$("#save").click(function(){		
		alert("save click");
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
		alert(document.getElementById("content").value);
		$("#frm").submit();		
	})
})
</script>

</head>
<body>

<form id="frm" action="sellbuyupdateAf.do" method="post" >
<table class="list_table" width="100%">

<colgroup>
<col style="width: 10%;">
<col style="width: auto;">
</colgroup>

	<tr class="id">
		<th>아이디</th><td style="text-align: left"><input type="hidden" name="user_email" readonly="readonly" 
		value='${login.user_email}'/>${login.user_email}</td>
	</tr>
	<tr>
		<th>말머리</th>
		<td style="text-align: left">
			<select id="topic" name="topic">
				<option value="" selected="selected">선택</option>
				<option value="팝니다">팝니다</option>
				<option value="삽니다">삽니다</option>	
				<option value="나눔장터">나눔장터</option>		
			</select>
		</td>
	</tr>
	<tr>
		<th>제목</th>
		<td style="text-align: left"><input type="text" id="title" name="title" style="width: 500px;" value="${sellbuy.title}"/></td>
	</tr>
	<tr>
		<th>내용</th>
		<td> 
			<textarea rows="10" cols="30" id="content" name="content" style="width:766px; height:412px; ">${sellbuy.content}</textarea>
			
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
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" id="save" value="저장" onclick="fOnAppLoad(this)"/>
			<input type="hidden" name="sellbuy_no" value="${sellbuy.sellbuy_no}" />
			<input type="button" value="취소"/>
		</td>
	</tr>
</table>
</form>
