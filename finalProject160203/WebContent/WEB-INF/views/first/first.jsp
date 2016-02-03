<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

.intro-wrap {position: absolute; left: 0px; top: 0px; width: 100%; height: 100%; overflow: hidden; z-index:-100;}
.bgwrap {position: absolute; left: 0px; top: 0px; width: 100%; height: 100%;}
.intro-wrap > .bgwrap > div {position: absolute; left: 0px; top: 0px; width: 100%; height: 100%; background-color:#000; text-align: center;}
.intro-wrap > .bgwrap > div > img {height: 100%; width: auto; max-width: inherit;}

div.first1{
float:left;
width: 28%;
height: 600px;
}
div.first2{
float:left;
width: 72%;
height: 600px;
}
</style>
<script type="text/javascript">

function popupOpen(){
	var popUrl = "join.do";	//팝업창에 출력될 페이지 URL
	var popOption = "width=800, height=600,top=70, left=220, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);
	}
</script>
</head>
<body>


<div class="intro-wrap">
	<div class="bgwrap">
		<div style="display: block;">
			<img alt="image_1" src="./image/1.jpg" style="size: 100%"/>
		</div>
		<div style="display: none;">
			<img alt="image_2" src="./image/2.jpg" style="size: 100%"/>
		</div>
		<div style="display: none;">
			<img alt="image_3" src="./image/3.jpg" style="size: 100%"/>
		</div>
	</div>
</div>


<script type="text/javascript">
	var $imgList = $('.bgwrap>div');				// bgwrap div 안에 있는 div 자식들을 가져옴
	var nImgCount = $imgList.children().length;		// 위에서 가져온 div 자식들의 개수
	var nDuration = 3000;							// 이미지를 변경할 시간 (3000 = 3초)
	var bAuto = true;								// 자동으로 변경할 지 여부
	var nIndex = 0;									// 변경할 이미지의 Index
	
	if(bAuto == true) {
		setInterval(autoSlide, nDuration);			// Javascript setInterval 함수 호출
	}
	
	function autoSlide() {
		/* 3초마다 이 함수에 들어오게 됨 */
		// % 연산은 나누기를 한 후 나머지 값을 가져오는 연산입니다.
		// nImgCount = 4
		/*
			nIndex = 0
			++nIndex = 1
			(++nIndex % nImageCount) = (1 % 4 = 1)
			$($imgList.get(0)).fadeOut(1000);	// 0 Index에 있는 이미지를 fadeOut
			$($imgList.get(1)).fadeIn(1000);	// 1  Index에 있는 이미지를 fadeIn
		*/
		/*
			nIndex = 1
			++nIndex = 2
			(++nIndex % nImageCount) = (2 % 4 = 2)
			$($imgList.get(1)).fadeOut(1000);	// 1 Index에 있는 이미지를 fadeOut
			$($imgList.get(2)).fadeIn(1000);	// 2 Index에 있는 이미지를 fadeIn
		*/
		var next = (++nIndex % nImgCount);
		$($imgList.get(next - 1)).fadeOut(1000);
		$($imgList.get(next)).fadeIn(1000);
	}
</script>


<c:if test="${loginfalse eq 1 }">
<script type="text/javascript">
alert("아이디나 비밀번호가 틀렸습니다. 다시 로그인하세요.");
</script>
</c:if>

<c:if test="${not empty login }">
<script type="text/javascript">
location.href="login1.do";
</script>
</c:if>

<div class="first">
<div class="first1">

</div>
<div class="first2">
<form action="login.do" method="post">
<input type="hidden" name="loginok" value="0">
<br><br><br><br><br><br><br><br><br><br><br><br><br>

<table >
<tr>
<td style="color: white">
아이디
</td>
<td >
<input type="text" name="user_email" size="20">
</td>
</tr>
<tr>
<td style="color: white">
비밀번호
</td>
<td>
<input type="password" name="user_pw" size="20">
</td>
</tr>
<tr>
<td colspan="2">
<input type="submit" value="로그인">
<input type="button" value="회원가입" onclick="location.href='javascript:popupOpen()'">
</td>
</tr>
</table>
</form>
</div>


</div>
</body>
</html>