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
	} else{
		
		alert("2");
		var foot1 = document.f.user_foot1.value;
		var foot = document.f.user_foot;
		foot.value = foot1;
		alert("3");
		var position11 = document.f.user_position11.value;
		var position12 = document.f.user_position12.value;
		var position13 = document.f.user_position13.value;
		var position1 = document.f.user_position1;
		var position2 = document.f.user_position2;
		var position3 = document.f.user_position3;
		position1.value = position11;
		position2.value = position12;
		position3.value = position13;
		alert("4"); 

		var phone1 = document.f.user_phone1.value;
		var phone1 = document.f.user_phone1.value;

		var phone1 = document.f.user_phone1.value;
		var phone2 = document.f.user_phone2.value;
		var phone3 = document.f.user_phone3.value;
		var phone = document.f.user_phone;
		var a = phone3 + "-" + phone1 + "-" + phone2;
		phone.value = a;
		alert("5");

		var birth1 = document.f.user_birth1.value;
		var birth2 = document.f.user_birth2.value;
		var birth3 = document.f.user_birth3.value;
		var birth = document.f.user_birth;
		var b = birth1 + "-" + birth2 + "-" + birth3;
		birth.value = b;
		alert("6");

		alert(document.f.user_pw.value);
		alert(document.f.user_name.value);
		alert(document.f.user_birth.value);
		alert(document.f.user_age.value);
		alert(document.f.user_phone.value);
		alert(document.f.user_high.value);
		alert(document.f.user_weight.value);
		alert(document.f.user_foot.value);
		alert(document.f.user_position1.value);
		alert(document.f.user_position2.value);
		alert(document.f.user_position3.value);
		alert(document.f.user_address.value);
		alert(document.f.user_profile.value);
		
	
	var phone1 = document.getElementsByName('user_phone1');
	var phone2 = document.getElementsByName('user_phone2');
	var phone3 = document.getElementsByName('user_phone3');
	document.getElementsByName('user_phone').value = phone3[0].value+"-"+phone1[0].value+"-"+phone2[0].value;
	
	
	var user_birth1 = document.getElementsByName('user_birth1');
	var user_birth2 = document.getElementsByName('user_birth2');
	var user_birth3 = document.getElementsByName('user_birth3');
	document.getElementsByName('user_birth').value = user_birth1[0].value+"-"+user_birth2[0].value+"-"+user_birth3[0].value;
	
	document.f.submit(); 
	}
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
<td>
<input type="text" name="user_birth1" maxlength="4" size="4" onkeyPress="if ((event.keyCode<48) || (event.keyCode>57)) event.returnValue=false;">년

<input type="text" name="user_birth2"maxlength="2"size="2" onkeyPress="if ((event.keyCode<48) || (event.keyCode>57)) event.returnValue=false;">월

<input type="text" name="user_birth3" maxlength="2"size="2"onkeyPress="if ((event.keyCode<48) || (event.keyCode>57)) event.returnValue=false;">일
<input type="hidden" name="user_birth">
</td>

</tr>
<tr>
<td>AGE</td>
<td><input type="text" name="user_age"size="2" onkeyPress="if ((event.keyCode<48) || (event.keyCode>57)) event.returnValue=false;"></td>
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
<td><input type="text" name="user_high" onkeyPress="if ((event.keyCode<48) || (event.keyCode>57)) event.returnValue=false;">cm</td>
</tr>
<tr>
<td>user_weight</td>
<td><input type="text" name="user_weight" onkeyPress="if ((event.keyCode<48) || (event.keyCode>57)) event.returnValue=false;">kg</td>
</tr>
<tr>
<td>user_foot</td>
<td>
<select name="user_foot1">
<option value="">선택하세요</option>
<option value="0">왼발</option>
<option value="1">오른발</option>
<option value="2">양발</option>
</select>
<input type="hidden" name="user_foot">
</td>
</tr>
<tr>
<td>주포지션</td>
<td>
<select name="user_position11">
<option value=""></option>
								<option value="GK(골키퍼)">GK(골키퍼)</option>
								<option value="RB(오른쪽 수비수)">RB(오른쪽 수비수)</option>
								<option value="LB(왼쪽 수비수)">LB(왼쪽 수비수)</option>
								<option value="CB(중앙 수비수)">CB(중앙 수비수)</option>
								<option value="CM(중앙 미드필더)">CM(중앙 미드필더)</option>
								<option value="CAM(공격형 미드필더)">CAM(공격형 미드필더)</option>
								<option value="CDM(수비형 미드필더)">CDM(수비형 미드필더)</option>
								<option value="LM(왼쪽 윙어)">LM(왼쪽 윙어)</option>
								<option value="RM(오른쪽 윙어)">RM(오른쪽 윙어)</option>
								<option value="ST(스트라이커)">ST(스트라이커)</option>
								<option value="LWF(왼쪽 공격수)">LWF(왼쪽 공격수)</option>
								<option value="RWF(오른쪽 공격수)">RWF(오른쪽 공격수)</option>
</select>
<input type="hidden" name="user_position1">
</td>
</tr>
<tr>
<td>활동포지션1</td>
<td>
<select name="user_position12">
<option value=""></option>
								<option value="GK(골키퍼)">GK(골키퍼)</option>
								<option value="RB(오른쪽 수비수)">RB(오른쪽 수비수)</option>
								<option value="LB(왼쪽 수비수)">LB(왼쪽 수비수)</option>
								<option value="CB(중앙 수비수)">CB(중앙 수비수)</option>
								<option value="CM(중앙 미드필더)">CM(중앙 미드필더)</option>
								<option value="CAM(공격형 미드필더)">CAM(공격형 미드필더)</option>
								<option value="CDM(수비형 미드필더)">CDM(수비형 미드필더)</option>
								<option value="LM(왼쪽 윙어)">LM(왼쪽 윙어)</option>
								<option value="RM(오른쪽 윙어)">RM(오른쪽 윙어)</option>
								<option value="ST(스트라이커)">ST(스트라이커)</option>
								<option value="LWF(왼쪽 공격수)">LWF(왼쪽 공격수)</option>
								<option value="RWF(오른쪽 공격수)">RWF(오른쪽 공격수)</option>
</select>
<input type="hidden" name="user_position2">
</td>
</tr>
<tr>
<td>활동포지션2</td>
<td>
<select name="user_position13">
<option value=""></option>
								<option value="GK(골키퍼)">GK(골키퍼)</option>
								<option value="RB(오른쪽 수비수)">RB(오른쪽 수비수)</option>
								<option value="LB(왼쪽 수비수)">LB(왼쪽 수비수)</option>
								<option value="CB(중앙 수비수)">CB(중앙 수비수)</option>
								<option value="CM(중앙 미드필더)">CM(중앙 미드필더)</option>
								<option value="CAM(공격형 미드필더)">CAM(공격형 미드필더)</option>
								<option value="CDM(수비형 미드필더)">CDM(수비형 미드필더)</option>
								<option value="LM(왼쪽 윙어)">LM(왼쪽 윙어)</option>
								<option value="RM(오른쪽 윙어)">RM(오른쪽 윙어)</option>
								<option value="ST(스트라이커)">ST(스트라이커)</option>
								<option value="LWF(왼쪽 공격수)">LWF(왼쪽 공격수)</option>
								<option value="RWF(오른쪽 공격수)">RWF(오른쪽 공격수)</option>
</select>
<input type="hidden" name="user_position3">
</td>
</tr>
<tr>
<td>user_address</td>
<td><input type="text" name="user_address" size="60"></td>
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