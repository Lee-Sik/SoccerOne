<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<style>

/* mouse over link */
tr.ryu:hover {
    background-color: red;
}

/* selected link */
tr.ryu:active {
    background-color: yellow;
} 
</style>
<div id='mainmenu'>

	<ul>
		<li><a href='./first.do'><img src="./image/menu/main_home.jpg"></a></li>
		<li><a href='./kickoff.do'><img src="./image/menu/main_kickoff.jpg"></a></li>
		<li><a href='./bookingList.do'><img src="./image/menu/main_booking.jpg"></a></li>
		<li><a href='club.do?user_address=${login.user_address}&user_team=${login.user_team}'><img src="./image/menu/main_club.jpg"></a></li>
		<li><a href='./bbslist.do'><img src="./image/menu/main_community.jpg"></a></li>
		<li><a href='./hello.do'><img src="./image/menu/main_site.jpg"></a></li>
		<c:if test="${login.user_email eq 'admin'}">
		<li><a href='./adminmain.do'><img src="./image/menu/main_admin.jpg"></a></li>
		</c:if>
	</ul>
		팀 검색 : <input type="text" id="query" style="margin-top: 10px;">
			<div style="background-color: #f1f1f1;  position: absolute; right: 284px;">
			<table id="result">
			</table>
			</div>
</div>


<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script>
function move(this1) {
	window.open('teamView.do?team_name='+this1.innerHTML,'','','width=600, height=400,top=70, left=220, resizable=no, scrollbars=no, status=no;');
}

$(document).ready(function() {
	
	 
	//$("#query").on('keydown',function(){
		$('#query').on('input',function(){
			 if($('#query').val() != ''){
	//$("#query").bind("change",function(){
		$.ajax({//내 서버에서 필요한 객체를 자바스크립트로 가져오는 ajax
		    url: "searchTeam.do",
		    dataType: 'JSON',
		    data: { "query" : $("#query").val() },
		    jsonpCallback: 'callback',
		    type: 'get',
		    success: function (data) {
		       kk=[];
		      // alert(data.length);
		       console.log(data);
		       $('#result').empty();
		      // $('#result').append('<tr><th>팀 로고</th><th>팀 명</th></tr>');
		       for(var i=0;i<data.length;i++){
		          kk.push(data[i]);// kk에 json 객체 담기
		          
		          var newDiv = document.createElement("tr");// 1.노드를 생성한다.
		          $(newDiv).attr('class','ryu');
		          if(data[i].team_logo == null || data[i].team_logo==''){
		        	  newDiv.innerHTML = //'<tr>'
					       '<td><img src="image/noimage.jpeg" style="width: 40px; height: 30px;"/></td>'
					       	+'<td align="center">'
					       	+"<div onclick='move(this)'>"+data[i].team_name+'</div></td>';
					       	
		          }
		          else{
		        	  newDiv.innerHTML = //'<tr>'
					       '<td>'
					       +'<img src="image/'+data[i].team_logo+'" style="width: 40px; height: 30px;"/></td>'
					       	+'<td align="center">'	
					       +"<div onclick='move(this)'>"+data[i].team_name+'</div></td>';
		          }
		           
			       $('#result').append(newDiv);
			       //$("#result").hide();
			       //$('#result').slideDown("slow");
			      
		       
		       }
		       //$('#result').slideDown("slow");
		   
		       //아래에 element를 추가 
		    }
		
		});
	}else{
		   $('#result').empty();
	}
	
	});

	
});
</script>
