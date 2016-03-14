<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script>
$(document).ready(function() {
	
	//$("#query").on('keydown',function(){
		$('#query').on('input',function(){
	
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
		       $('#result').append('<tr><th>팀 로고</th><th>팀 명</th></tr>');
		       for(var i=0;i<data.length;i++){
		          kk.push(data[i]);// kk에 json 객체 담기
		          
		          var newDiv = document.createElement("tr");// 1.노드를 생성한다.
		          if(data[i].team_logo == null || data[i].team_logo==''){
		        	  newDiv.innerHTML = //'<tr>'
					       '<td><img src="image/noimage.jpeg" style="width: 100px; height: 50px;"/></td>'
					       	+'<td align="center">'+data[i].team_name+'</td>';
					       	//+'</tr>';
		          }
		          else{
		        	  newDiv.innerHTML = //'<tr>'
					       '<td><img src="image/'+data[i].team_logo+'" style="width: 100px; height: 50px;"/></td>'
					       	+'<td align="center">'+data[i].team_name+'</td>';
					       	//+'</tr>';
		          }
			       
			       $('#result').append(newDiv);
		       }
		       
		   
		       //아래에 element를 추가 
		    }
		});
	
	});
// 	$('#search').on('click',function(){
// 		alert('d');
// 	});
	
});
</script>
</head>
<body>
<div>
<input type="text" id="query" >
<input type="button" id="search" value="검색">
<br>
<table id="result">

</table>

</div>


</body>
</html>