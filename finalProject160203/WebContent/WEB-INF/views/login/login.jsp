<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>
<title>Insert title here</title>
</head>


<c:if test="${ not empty login}">
<script type="text/javascript">
var messagecheck;
var messagecheck1;
$.ajax({//내 서버에서 필요한 객체를 자바스크립트로 가져오는 ajax
    url: "getMyMessage.do",
    dataType: 'text',
    jsonpCallback: 'callback',
    type: 'get',
    success: function (data) {
    	alert(data);
    	 var pattern = /[\[\]]/g;   // 특수문자 제거
    		
    	data = data.replace(pattern, "");
    	var check=data.split(",");
    	
    	messagecheck  =check[0];
		messagecheck1 =check[1];
		
		
    	var table = document.createElement("div");// 1.노드를 생성한다.
    	
    	var td = document.createElement("td");
		if(messagecheck1==0){
			table.innerHTML ='<div style="text-align: center"><span style="text-align: center">'+messagecheck1+'</span></div>';
		
		td.innerHTML='<a href="" onclick="popupMessage()"> 도착한 쪽지가 없습니다.</a>';
		
		}else{
			table.innerHTML ='<div style="text-align: center"><span style="text-align: center">'+messagecheck1+'</span></div>';
			
		td.innerHTML='<a href="" onclick="popupMessage()"> 새로운 쪽지가'
		+		'<span class="messagecheck1" >'+messagecheck1+'</span>개 있습니다.'
		+'</a>';
		
		}
   	 
		document.getElementById('loginBasket1').appendChild(td);
		document.getElementById('loginBasket2').appendChild(table);
		
		$('.messagecheck').html(data[1]);
		$('.messagecheck1').html(data[3]);
		
    }
});


	function popupOpen() {
		var popUrl = "myinform.do"; //팝업창에 출력될 페이지 URL
		var popOption = "width=500, height=800,top=70, left=220, resizable=no, scrollbars=no, status=no;"; //팝업창 옵션(optoin)
		window.open(popUrl, "", popOption);
	}
	
	
	function popupMessage() {
		event.preventDefault();
		var popUrl = "messagedetail.do?receiver_user_email=${login.user_email}";
		var popOption = 'width=800, height=400,top=70, left=220, resizable=no, scrollbars=no, status=no;'; //팝업창 옵션(optoin)
		window.open(popUrl, "", popOption);
	}
</script>
</c:if>
<c:if test="${empty login }">
<script type="text/javascript">
function popupOpen1() {
	var popUrl = "join.do"; //팝업창에 출력될 페이지 URL
	var popOption = "width=900, height=800,top=70, left=220, resizable=no, scrollbars=no, status=no;"; //팝업창 옵션(optoin)
	window.open(popUrl, "", popOption);
}
</script>
</c:if>
<body>
	<table>
		<tr>
		
			<td class="loginview" colspan="3">
			<img src="image/loginview.png"
				width="10%">
				<c:if test="${ not empty login}">
				${login.user_email }님이 접속하셨습니다.
				</c:if>
				</td>
		</tr>
		<tr id="loginBasket1">
			<td id="loginBasket2" style="background-image: url(image/message.png); background-repeat: no-repeat; width: 60px; height: 60px; text-align: left; color: white; font-size: 13pt;">
				
			</td> 
			<td>
				<c:if test="${ empty login}">
					로그인하세요!
				</c:if>
			</td>
		</tr>
		<tr>
		<c:if test="${ not empty login}">
			<td colspan="3"><input type="button" value="내정보"
				onclick="location.href='javascript:popupOpen()'"> <input
				type="button" value="로그아웃" onclick="location.href='logout.do'"></td>
				</c:if>
				<c:if test="${empty login }">
				<td colspan="3"><input type="button" value="회원가입"
				onclick="location.href='javascript:popupOpen1()'"> </td>
				</c:if>
		</tr>
	</table>
</body>
</html>