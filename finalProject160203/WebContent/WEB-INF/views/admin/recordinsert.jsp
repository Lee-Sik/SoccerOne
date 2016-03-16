<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>
<link href="CSS/admintable.css" rel="stylesheet" >

<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript">

function save(){
	if($('#h').val() == '' || $('#a').val() == '' ){
		alert('스코어를 입력하세요.');
		return;
	}
	var game_no='${record.game_no}';
	var score= $('#h').val()+':'+$('#a').val();
	var team1_location1='${team1.team_location1}';
	var team1_logo='${team1.team_logo}';
	var team1_name='${team1.team_name}';
	var team2_name='${team2.team_name}';
	var team2_logo='${team2.team_logo}';
	var team2_location1='${team2.team_location1}';
	var game_date='${record.game_date}';
	var team1_goal;
	var team2_goal;
	
	 var hs=document.getElementsByClassName("hs");
	 var as=document.getElementsByClassName("as");
	 for(var h=0; h<hs.length; h++){
		 if(h==0){
			 team1_goal=hs[h].value;
		 }else{
			 team1_goal =team1_goal+'-'+hs[h].value;
		 }
	}
	 for(var a=0; a<as.length; a++){
			 if(a==0){
				 team2_goal=as[a].value;
			 }else{
				 team2_goal = team2_goal+'-'+as[a].value;
			 }
	}
	//alert(team1_goal);
	//alert(team2_goal);
		
	$.ajax({//내 서버에서 필요한 객체를 자바스크립트로 가져오는 ajax
	    url: "AdminGameRecord.do",
	    dataType: 'text',
	    data: {game_no:game_no,game_date:game_date,team1_location1:team1_location1
	    	,team1_logo:team1_logo,team1_name:team1_name,
	    	team2_name:team2_name,team2_logo:team2_logo,team2_location1:team2_location1,
	    	team1_goal:team1_goal , team2_goal:team2_goal, score:score},
	    jsonpCallback: 'callback',
	    type: 'get',
	    success: function (data) {
	   alert('저장');
	   window.opener.location.reload(); 
	   self.close();
	    	
			
	    }
	});
	
}

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
//user_profile
					 if(this1.id=='h'){
						 
						 newDiv.innerHTML ='<p>'+(i+1)+' 골</p>'
						   +'<select name="job" class="hs"></select>';
						 home.appendChild(newDiv);
					
					 }
					 else{
						 newDiv.innerHTML ='<p>'+(i+1)+' 골</p>'
						   +'<select name="job" class="as"></select>';
						 away.appendChild(newDiv); 
					 }
					 
					 $('.item').slideDown();
					
				}
		       if(this1.id=='h'){
		    	   
		  	 var hs=document.getElementsByClassName("hs");
		  			
				for(var k=0; k<this1.value; k++){
			   	   for(var j=0; j<aa.length;j++){
			    	 var newDiv2 = document.createElement("OPTION");
			    	 newDiv2.setAttribute("value", aa[j].user_name);
			    	    var t = document.createTextNode(aa[j].user_name);
			    	    newDiv2.appendChild(t);
			    	    hs[k].appendChild(newDiv2);
					}
				}
			   
			    
		      }else{
		    	  var as=document.getElementsByClassName("as");
		  			
					for(var k=0; k<this1.value; k++){
				   	   for(var j=0; j<bb.length;j++){
				    	 var newDiv2 = document.createElement("OPTION");
				    	 newDiv2.setAttribute("value", bb[j].user_name);
				    	    var t = document.createTextNode(bb[j].user_name);
				    	    newDiv2.appendChild(t);
				    	    as[k].appendChild(newDiv2);
						}
					}
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
<<<<<<< .mine
<div id="basket">
게임 시퀀스 번호 : ${record.game_no}<br>
경기일자 : ${record.game_date}<br>
홈팀 지역 : ${team1.team_location1}<br>
<img src="image/${team1.team_logo}" style="width: 50px; height:30px;">: ${team1.team_name}
<input type="text" size="3" oninput="a(this)" id="h"> VS <input type="text" size="3" oninput="a(this)" id="a">
${team2.team_name}:<img src="image/${team2.team_logo}" style="width: 50px; height:30px;"><br>
어웨이팀 지역: ${team2.team_location1}<br>
<div id="home" style="float:left"><p>홈 팀</p></div><div style="float:left"><p>VS</p></div><div id="away" style="float:left;"><p>어웨이 팀</p></div>
</div>
<div style="clear: both">
<button id="btn" onclick="save()">저장</button>
</div>
<body>
=======
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
>>>>>>> .r218

</table>


