<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
body{
	background-color: white;
}
.wow1{
	text-align: center;
	color:black;
	font-size: 30pt;
	font-family: -윤고딕310;
}
.wow2{
	text-align: center;
	color:black;
	font-size: 15pt;
	font-family: -윤고딕310;
}
table{
font-size: 15pt;
	font-family: -윤고딕310;


}

.center{

}
</style>
</head>
<body>
<div>
<div>
<table width="100%">
<br><br><br>
</table>
<script type="text/javascript">
function selectval1(val){
	var objid = document.getElementById('text3');
	objid.value = val;
}

function function1(val){
	var pw = document.getElementsByName('user_pw');
	var pw1 = document.getElementsByName('user_pw1');
	var name = document.getElementsByName('user_name');
	var age = document.getElementsByName('user_age');
	
	if(pw[0].value.length<=5||pw[0].value.length>=10){
		alert("비밀번호는 6자리부터 9자리까지만 입력하셔야합니다.");
		pw[0].focus();
	}
	else if(pw1[0].value!=pw[0].value){
		alert("비밀번호와 비밀번호 확인의 값은 같아야합니다.");
		pw1[0].focus();
	} 
	else if(name[0].value.length<=1||name[0].value.length>=6){
		alert("이름은 2자리부터 5자리까지 입력하셔야합니다.");
		name[0].focus();
	} 
	
	var phone1 = document.getElementsByName('user_phone1');
	var phone2 = document.getElementsByName('user_phone2');
	var phone3 = document.getElementsByName('user_phone3');
	document.getElementsByName('user_phone').value = phone3[0].value+"-"+phone1[0].value+"-"+phone2[0].value;
	
	document.f.submit(); 
}
</script>
</div>
<div class="center" align="center">
<p class="wow1"><img src="image/join.png"><b> SOCCER ONE 회원가입</b></p>
<p class="wow2">저희 홈페이지에 와주셔서 감사합니다. 반갑습니다</p>


<form action="join1.do" name="f" method="post">
<table>
<tr>
<td>e-mail</td>
<td><input type="text" name="user_email1" maxlength= "30">@
<select onchange="selectval1(this.value)">
<option value="">선택하세요</option>
<option value="naver.com">naver.com</option>
<option value="hanmail.com">hanmail.com</option>
<option value="hotmail.com">hotmail.com</option>
<option value="gmail.com">gmail.com</option>
<option value="">직접입력</option>
</select>
<input type="text" id = "text3" name="user_email2">
</td>
</tr>
<tr>
<td>PASSWORD</td>
<td><input type="password" name="user_pw" maxlength="8"></td>
</tr>
<tr>
<td>PASSWORD 확인</td>
<td><input type="password" name="user_pw1" maxlength="8"></td>

</tr>
<tr>
<td>NAME</td>
<td><input type="text" name="user_name"></td>
</tr>
<tr>
<td>Birth</td>

<script>
$(function() {
  $( "#datepicker1" ).datepicker({
    dateFormat: 'yy-mm-dd',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    dayNames: ['일','월','화','수','목','금','토'],
    dayNamesShort: ['일','월','화','수','목','금','토'],
    dayNamesMin: ['일','월','화','수','목','금','토'],
    showMonthAfterYear: true,
    yearSuffix: '년'
  });
});
</script>
<td><input type="text" name="user_birth" id="datepicker1">
</td>
</tr>
<tr>
<td>AGE</td>
<td><input type="text" name="user_age" onkeyPress="if ((event.keyCode<48) || (event.keyCode>57)) event.returnValue=false;"></td>
</tr>
<tr>
<td>phone</td>
<td>
<select name="user_phone3">
<option></option>
<option value="010">010</option>
<option value="011">011</option>
<option value="016">016</option>
<option value="019">019</option>
<option value="">기타</option>
</select> -
<input type="text" name="user_phone1" size="4" maxlength="4"onkeyPress="if ((event.keyCode<48) || (event.keyCode>57)) event.returnValue=false;">-
<input type="text" name="user_phone2" size="4" maxlength="4"onkeyPress="if ((event.keyCode<48) || (event.keyCode>57)) event.returnValue=false;">
<input type="hidden" name="user_phone">
</td>
</tr>
<tr>
<td>user_high</td>
<td><input type="text" name="user_high" onkeyPress="if ((event.keyCode<48) || (event.keyCode>57)) event.returnValue=false;"></td>
</tr>
<tr>
<td>user_weight</td>
<td><input type="text" name="user_weight" onkeyPress="if ((event.keyCode<48) || (event.keyCode>57)) event.returnValue=false;"></td>
</tr>
<tr>
<td>user_foot</td>
<td><input type="text" name="user_foot"></td>
</tr>
<tr>
<td>주포지션</td>
<td><input type="text" name="user_position1"></td>
</tr>
<tr>
<td>활동포지션1</td>
<td><input type="text" name="user_position2"></td>
</tr>
<tr>
<td>활동포지션2</td>
<td><input type="text" name="user_position3"></td>
</tr>
<tr>
<td>user_address</td>
<td><input type="text" name="user_address"></td>
</tr>
<tr>
<td>user_profile</td>
<td><input type="text" name="user_profile"></td>
</tr>
<tr>
<td align="center"><input type="button" value="회원가입" onclick="function1(this)"></td>
<td align="center"><input type="button" value="취소" onclick="self.close()"></td>
</tr>
</table>

</form>
</div>
</div>
</body>
</html>