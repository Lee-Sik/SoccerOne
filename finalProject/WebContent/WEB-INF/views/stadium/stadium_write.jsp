<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<SCRIPT LANGUAGE="JavaScript" SRC="https://www.ionnuri.org/ks20/js/jquery/jquery.js"></SCRIPT>
<script type="text/javascript">
	
var num;

$(document).ready(function() {
	
	$("#btnPnumber").click(function() {
		
		if($("#email").val() == '') {
			alert("이메일을 입력해주세요.");
			return;
		}
		<c:forEach var="dto" items="${lists}" >
		if($("#email").val() == "${dto.email}" ){
			alert("중복된 이메일 입니다.");
			$("#email").val().focus();
			return;
		}
		</c:forEach>

		$("#emailFrame").fadeIn(350);
		$("#btnPnumber").attr("disabled",true);
					
		http = jQuery.ajax({
			url		: "./email.do",
	   		type	: "POST",
			data 	: 'receive='+$("#email").val()+'&result=${result}',
			dataType: 'html',
	   		async	: true,
			success : function(msg) {

				alert("인증번호가 메일로 발송되었습니다.");
				
				if(!f.emai.value) {
					alert("이메일주소를 입력해주세요.");
					return;
				} 

				num = msg;	
			}
	  	});

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
<table class="list_table" style="width:70%;">
<caption style="text-align: left;">야구장 등록</caption>
<tr height="1;">
<td colspan="2" bgcolor="black"></td>
	
</tr>
<colgroup>
	<col style="width:30%;" />
	<col style="width:70%;" />
</colgroup>
<tbody>
	
<tr>
	<td class="td1">구장명</td><td class="td2"> <input type="text"> </td>
</tr>
<tr>
	<td class="td1">구장주소</td><td class="td2"> 
	
	<a href="#" onclick="javascript:window.open('./zipsearch.do','','location=0,status=0,scrollbars=1,width=530,height=330');">
	<img src="image/wofun.PNG"></a> <br>
	<input type="text" id="addr1" size="70"> <br> 
	<input type="text" value="상세주소">
	</td>
</tr>
<tr>
	<td class="td1">야구장 참고내용</td><td class="td2"> <textarea rows="5" cols="50"></textarea> </td>
</tr>
<tr>
	<td class="td1">찾아오는 방법</td><td class="td2"> <textarea rows="5" cols="50"></textarea> </td>
</tr>
<tr>
	<td class="td1">구장사진</td><td class="td2">
	야구장 사진 1 <input type="file"> <br>
	야구장 사진 2 <input type="file"> <br>
	야구장 사진 3 <input type="file"> <br>
	야구장 사진 4 <input type="file"> <br>
	  
	 </td>
</tr>
<tr>
	<td class="td1">구장연락처</td><td class="td2"> <input type="text"> </td>
</tr>
<tr>
	<td class="td1">이메일 인증</td><td class="td2"> 
	<input type="text" size="" name="email" id="email" value="" style="width: 200px; height: 20px;"/>
	<input type="button" name="btnPnumber" value="메일인증요청" id="btnPnumber" style="cursor:pointer;"/>
	
	</td>
</tr>

</tbody>	
</table>
</body>
</html>





















