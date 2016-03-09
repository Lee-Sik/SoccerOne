<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://mbostock.github.com/d3/d3.v2.js"></script>


<link href="CSS/clubview.css" rel="stylesheet" type="text/css">

 <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<title>Insert title here</title>

</head>
<script>
longpass=[];
shotpass=[];
goal=[];
play_time=[];
game_record_day=[];

myTeamMember=[];

$.ajax({//내 서버에서 필요한 객체를 자바스크립트로 가져오는 ajax
    url: "getMyRecord.do",
    dataType: 'JSON',
    jsonpCallback: 'callback',
    type: 'get',
    success: function (data) {
      // console.log(data);
       for(var i=0;i<data.length;i++){
    	  
           longpass.push(data[i].longpass);              // 긴 패스 성공률 
           shotpass.push(data[i].shotpass);              // 짧은 패스 성공률 
           goal.push(data[i].goal);						 // 득점
           play_time.push(data[i].play_time);			 // 출장 시간 
           game_record_day.push(data[i].game_record_day);//경기 날짜
       }
       //-----------------------
 $(function () {
    		
    $('#passGraph').highcharts({
        title: {
            text: '패스 성공률',
            x: -20 //center
        },
        subtitle: {
            text: '나의 최근 5경기 패스 성공률',
            x: -20
        },
        xAxis: {
            categories: game_record_day
        },
        yAxis: {
            title: {
                text: '패스 성공률(100%)'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
            valueSuffix: '%',
            shared: true
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: [{
            name: 'Long Pass',
            data: longpass
        }, {
            name: 'Short Pass',
            data: shotpass
        }]
    });
    		//------------------------
    	    $('#goalGraph').highcharts({
    	        title: {
    	            text: '득점',
    	            x: -20 //center
    	        },
    	        subtitle: {
    	            text: '나의 최근 5경기 득점',
    	            x: -20
    	        },
    	        xAxis: {
    	            categories: game_record_day
    	        },
    	        yAxis: {
    	            title: {
    	                text: '패스 성공률(100%)'
    	            },
    	            plotLines: [{
    	                value: 0,
    	                width: 1,
    	                color: '#808080'
    	            }]
    	        },
    	        tooltip: {
    	            valueSuffix: 'Goal',
    	            shared: true
    	        },
    	        legend: {
    	            layout: 'vertical',
    	            align: 'right',
    	            verticalAlign: 'middle',
    	            borderWidth: 0
    	        },
    	        series: [{
    	            name: 'Goal',
    	            data: goal
    	        }]
    	    });
    		
    	    $('#playTimeGraph').highcharts({
    	        title: {
    	            text: '출장 시간',
    	            x: -20 //center
    	        },
    	        subtitle: {
    	            text: '나의 최근 5경기 시간',
    	            x: -20
    	        },
    	        xAxis: {
    	            categories: game_record_day
    	        },
    	        yAxis: {
    	            title: {
    	                text: '출장 시간'
    	            },
    	            plotLines: [{
    	                value: 0,
    	                width: 1,
    	                color: '#808080'
    	            }]
    	        },
    	        tooltip: {
    	            valueSuffix: 'Time',
    	            shared: true
    	        },
    	        legend: {
    	            layout: 'vertical',
    	            align: 'right',
    	            verticalAlign: 'middle',
    	            borderWidth: 0
    	        },
    	        series: [{
    	            name: '출장 시간',
    	            data: play_time
    	        }]
    	    });
    		
});
       //-----------------------
      
    }
});

$.ajax({//내 서버에서 필요한 객체를 자바스크립트로 가져오는 ajax
    url: "getTeamMember.do",
    dataType: 'JSON',
    jsonpCallback: 'callback',
    type: 'get',
    success: function (data) {
    	
        for(var i=0;i<data.length;i++){
        	
        	var tmp = {
        		    name: data[i].user_name,
        		    data:[data[i].attack,data[i].defender,data[i].user_speed,data[i].physic,data[i].mind,data[i].stamina],
        		    pointPlacement: 'on'
        		    	
        		};
        	
           myTeamMember.push(tmp);// kk에 json 객체 담기 
           
        }
           
           $(function () {

        	    $('#container').highcharts({
        	        chart: {
        	            polar: true,
        	            type: 'line'
        	        },
        	        title: {
        	            text: '능력치',
        	            x: -80
        	        },
        	        pane: {
        	            size: '80%'
        	        },
        	        xAxis: {// 육각형 꼭지점의 능력
        	            categories: ['공격', '수비', '스피드', '몸 싸움',
        	                    '맨탈', '체력'],
        	            tickmarkPlacement: 'on',
        	            lineWidth: 0
        	        },

        	        yAxis: {
        	            gridLineInterpolation: 'polygon',
        	            lineWidth: 0,
        	            min: 0,
        	            max:100
        	        },

        	        legend: {
        	            align: 'right',
        	            verticalAlign: 'top',
        	            y: 70,
        	            layout: 'vertical',
        	           
        	        },

        	        series: myTeamMember

        	    });
        	});
         
    }
});


// $(document).ready(function(){

   
// });
</script>

<body>

   <table class="list_table" style="width: 85%">


      <tr>
         <td width="300"><img alt="" src="image/${login.user_profile }"
            style="width: 100%; margin: auto; padding: 0;"></td>

         <td>
            <table style="width: 100%" class="qwe">
               <tr>
                  <th colspan="2">클럽과 나의
                     연결고리</th>
               </tr>
               <tr>
                  <td>이름</td>
                  <td>${login.user_name }</td>
               </tr>
               <tr>
                  <td>생일</td>
                  <td>${login.user_birth }</td>
               </tr>
               <tr>
                  <td>나이</td>
                  <td>${login.user_age }</td>
               </tr>
               <tr>
                  <td>키</td>
                  <td>${login.user_high }</td>
               </tr>
               <tr>
                  <td>몸무게</td>
                  <td>${login.user_weight }</td>
               </tr>
               <tr>
                  <td>포지션1</td>
                  <td>${login.user_position1 }</td>
               </tr>
               <tr>
                  <td>포지션2</td>
                  <td>${login.user_position2 }</td>
               </tr>
               <tr>
                  <td>포지션3</td>
                  <td>${login.user_position3 }</td>
               </tr>
               <tr>
                  <td>스피드</td>
                  <td>${login.user_speed}</td>
               </tr>
               <tr>
                  <td>참석률</td>
                  <td>${login.user_attendrate }</td>
               </tr>
               <tr>
                  <td>출장시간</td>
                  <td>${login.user_attendtime }</td>
               </tr>
               <tr>
                  <td>득점률</td>
                  <td>${login.user_goal }</td>
               </tr>
            </table>
         </td>
      </tr>
      <tr>
         <td colspan="2">
            
            <div id="container" style="min-width: 400px; max-width: 600px; height: 400px; margin: 0 auto"></div>
        	<div id="passGraph" class="Graph" ></div>
        	<div id="goalGraph" class="Graph" ></div>
        	<div id="playTimeGraph" class="Graph" ></div>
        	
         </td>
      </tr>
   </table>
   
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-more.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>

</body>
</html>