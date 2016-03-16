<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>
<link href="CSS/admintable.css" rel="stylesheet" >

<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript">


function a(this1){

	 var basket=document.getElementById("basket");
	 var home=document.getElementById("home");
	 var away=document.getElementById("away");
	 if(this1.value ==''){
		 if(this1.id =='h'){
			 $(home).empty();
		 }else{
			 $(away).empty();
		 }
		 
	 }else if(isNaN(this1.value) == true){
	
		alert("숫자만 입력 할 수 있습니다.");
		this1.focus();
		this1.value='';
	}else if(this1.value> 30){
		alert("30골 이상 넣을 수 없을 겁니다!!!");
		this1.focus();
		this1.value='';
	}else if(this1.value<0){
		alert("음수는 입력 할 수 없습니다.");
		this1.focus();
		this1.value='';
	}else{//숫자성공 0~30
		$.ajax({//내 서버에서 필요한 객체를 자바스크립트로 가져오는 ajax
		    url: "getTeamMember2.do",
		    dataType: 'JSON',
		    data: {team1:'${team1.team_name}',team2:'${team2.team_name}'},
		    jsonpCallback: 'callback',
		    type: 'get',
		    success: function (data) {
		    	console.log(data);
		       aa=[];
		       bb=[];
		       for(var i=0;i<data[0].length;i++){
		          aa.push(data[0][i]);
		         
		       }
		       for(var i=0;i<data[1].length;i++){
		           bb.push(data[1][i]);
		          
		        }
		       
		       for(var i=0;i<this1.value;i++){
					//alert(i);
					 newDiv = document.createElement("div");
					 $(newDiv).attr('class','item');
					 newDiv.style.display='none';
					 newDiv.innerHTML ='<p>'+(i+1)+' 골</p>'
				   +'<select name="job">'
				   +'<option value="">직업선택</option>'
				   +'<option value="학생">학생</option>'
				   +'<option value="회사원">회사원</option>'
				   +'<option value="기타">기타</option>'
				   +'</select>';
					 if(this1.id=='h'){
						 home.appendChild(newDiv);
					 }
					 else{
						 away.appendChild(newDiv); 
					 }
					 $('.item').slideDown();
				}
		    }
		});
	}
}
</script>

<style type="text/css">
body, table{
    font-size: 12px;
    font-family: "Nanum Gothic", sans-serif;
}

</style>

</head>
<table class="list_table">
<tr>
	<th>게임 번호</th> <th>경기일자</th> <th></th> <th></th>
</tr>
			<div id="basket">
			게임 시퀀스 번호 : ${record.game_no}<br>
			경기일자 : ${record.game_date}<br>
			홈팀 지역 : ${team1.team_location1}<br>
			
			
			
			
			<img src="image/${team1.team_logo}" style="width: 50px; height:30px;">: ${team1.team_name}
			<input type="text" size="3" oninput="a(this)" id="h"> VS <input type="text" size="3" oninput="a(this)" id="a">
			${team2.team_name}:<img src="image/${team2.team_logo}" style="width: 50px; height:30px;"><br>
			어웨이팀 지역: ${team2.team_location1}<br>
			
			
			<div id="home" style="float:left"><p>홈 팀</p></div><div style="float:left"><p>VS</p></div><div id="away"><p>어웨이 팀</p></div>
			</div>
			
			<div style="clear: both">
			<button>저장</button>
			</div>

</table>


