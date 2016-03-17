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
			 $('#home div').empty();
		 }else{
			 $('#away div').empty();
		 }
		 
	 }else if(isNaN(this1.value) == true){
	
		alert("숫자만 입력 할 수 있습니다.");
		this1.focus();
		this1.value='';
		return;
	}else if(this1.value>= 10){
		alert("10골 이상 넣을 수 없을 겁니다!!!");
		this1.focus();
		this1.value='';
		
		if(this1.id =='h'){
	          $('#home div').empty();
	       }else{
	          $('#away div').empty();
	       }
		return;
	}else if(this1.value<0){
		alert("음수는 입력 할 수 없습니다.");
		this1.focus();
		this1.value='';
		return;
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
   	text-align:center;
    font-size: 12px;
    font-family: "Nanum Gothic", sans-serif;
}

</style>
</head>

<h2>경기 기록 입력</h2>
<div id="basket">
<table class="list_table" style="width: 70%;">
<colgroup>
   <col width="50%;"/>
   <col width="50%;"/>
</colgroup>
   <tr>
      <th>[${team1.team_location1}]<br><b>${team1.team_name}</b></th> 
      <th>[${team2.team_location1}]<br><b>${team2.team_name}</b></th> 
   </tr>
   <tr>
      <td>
         <img src="image/${team1.team_logo}" style="width: 100px;"><br>
         
      </td>
      <td>
         <img src="image/${team2.team_logo}" style="width: 100px;"><br>
      </td>
   </tr>
   <tr>
      <td>
         <div id="home" style="float:left">HOME</div>
         <input type="text" size="3" oninput="a(this)" id="h">
      </td>
      <td>
         <div id="away" style="float:left;">AWAY</div>
         <input type="text" size="3" oninput="a(this)" id="a">
      </td>
   
   </tr>
</table>
</div>
<br>
<button style="text-align: center;" id="btn" onclick="save()">기록 저장</button>

