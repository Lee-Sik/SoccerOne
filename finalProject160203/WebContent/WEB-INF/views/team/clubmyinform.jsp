<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://mbostock.github.com/d3/d3.v2.js"></script>

 <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<title>Insert title here</title>
<style>
			/* tell the SVG path to be a thin blue line without any area fill */
			path {
				stroke: steelblue;
				stroke-width: 1;
				fill: none;
			}
			
			.axis {
			  shape-rendering: crispEdges;
			}
			.x.axis line {
			  stroke: lightgrey;
			}
			.x.axis .minor {
			  stroke-opacity: .5;
			}
			.x.axis path {
			  display: none;
			}
			.y.axis line, .y.axis path {
			  fill: none;
			  stroke: #000;
			}
		</style>
<style>
table.qwe {
	font-size: 12pt;
	font-family: -윤고딕310;
	border-collapse: collapse;
}

td {
	text-align: center;
}

table, tr, td {
	border: 1px solid lightgray;
}
</style>
</head>
<script>
longpass=[];
shotpass=[];
goal=[];
play_time=[];
game_record_day=[];

$.ajax({//내 서버에서 필요한 객체를 자바스크립트로 가져오는 ajax
    url: "getMyRecord.do",
    dataType: 'JSON',
    jsonpCallback: 'callback',
    type: 'get',
    success: function (data) {
       
       for(var i=0;i<data.length;i++){
           longpass.push(data[i].longpass);// kk에 json 객체 담기 
           shotpass.push(data[i].shotpass);// kk에 json 객체 담기 
           goal.push(data[i].goal);// kk에 json 객체 담기 
           play_time.push(data[i].play_time);// kk에 json 객체 담기 
           game_record_day.push(data[i].game_record_day);// kk에 json 객체 담기 
       }
       
    	//--------------line 그래프-----------------------------------
       /* implementation heavily influenced by http://bl.ocks.org/1166403 */
       // define dimensions of graph
       var m = [80, 80, 80, 80]; // margins
       var w = 400 - m[1] - m[3]; // width
       var h = 400 - m[0] - m[2]; // height

       // create a simple data array that we'll plot with a line (this array represents only the Y values, X will just be the index location)
       var data = [3, 6, 2, 7, 5, 2, 0, 3, 8, 9, 2, 5, 9, 3, 6, 3, 6, 2, 7, 5, 2, 1, 3, 8, 9, 2, 5, 9, 2, 7];
       // X scale will fit all values from data[] within pixels 0-w
       var x = d3.scale.linear().domain([0, longpass.length]).range([0, w]);
       // Y scale will fit values from 0-10 within pixels h-0 (Note the inverted domain for the y-scale: bigger is up!)
       var y = d3.scale.linear().domain([0, 100]).range([h, 0]);
       	// automatically determining max range can work something like this
       	// var y = d3.scale.linear().domain([0, d3.max(data)]).range([h, 0]);
       // create a line function that can convert data[] into x and y points
       var line = d3.svg.line()
       	// assign the X function to plot our line as we wish
       	.x(function(d,i) { 
       		return x(i); 
       	})
       	.y(function(d) { 
       		return y(d); 
       	})
       	// Add an SVG element with the desired dimensions and margin.
       	var graph = d3.select("#graph").append("svg:svg")
       	      .attr("width", w + m[1] + m[3])
       	      .attr("height", h + m[0] + m[2])
       	    .append("svg:g")
       	      .attr("transform", "translate(" + m[3] + "," + m[0] + ")");
       	// create yAxis
       	var xAxis = d3.svg.axis().scale(x).tickSize(-h).tickSubdivide(true);
       	// Add the x-axis.
       	graph.append("svg:g")
       	      .attr("class", "x axis")
       	      .attr("transform", "translate(0," + h + ")")
       	      .call(xAxis);
       	// create left yAxis
       	var yAxisLeft = d3.svg.axis().scale(y).ticks(4).orient("left");
       	// Add the y-axis to the left
       	graph.append("svg:g")
       	      .attr("class", "y axis")
       	      .attr("transform", "translate(-25,0)")
       	      .call(yAxisLeft);
       	
       		// Add the line by appending an svg:path element with the data line we created above
       	// do this AFTER the axes above so that the line is above the tick-lines
       		graph.append("svg:path").attr("d", line(longpass));
       	//------------------------------------------------------------------------
    }
});
$(document).ready(function(){

	
});
</script>

<body>

	<table style="width: 100%">


		<tr>
			<td width="300"><img alt="" src="image/${login.user_profile }"
				style="width: 100%; margin: auto; padding: 0;"></td>

			<td>
				<table style="width: 100%" class="qwe">
					<tr>
						<th colspan="2" style="background-color: lightgray;">클럽과 나의
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
				<div id="graph" class="aGraph" ></div>
			</td>
		</tr>
	</table>
	   <script type="text/javascript">
$(function () {

    $('#container').highcharts({

        chart: {
            polar: true,
            type: 'line'
        },

        title: {
            text: 'Budget vs spending',
            x: -80
        },

        pane: {
            size: '80%'
        },

        xAxis: {
            categories: ['Sales', 'Marketing', 'Development', 'Customer Support',
                    'Information Technology', 'Administration'],
            tickmarkPlacement: 'on',
            lineWidth: 0
        },

        yAxis: {
            gridLineInterpolation: 'polygon',
            lineWidth: 0,
            min: 0
        },

        legend: {
            align: 'right',
            verticalAlign: 'top',
            y: 70,
            layout: 'vertical'
        },

        series: [{
            name: 'Allocated Budget',
            data: [43000, 19000, 60000, 35000, 17000, 10000],
            pointPlacement: 'on'
        }, {
            name: 'Actual Spending',
            data: [50000, 39000, 42000, 31000, 26000, 14000],
            pointPlacement: 'on'
        }]

    });
});
      </script>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-more.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>

<div id="container" style="min-width: 400px; max-width: 600px; height: 400px; margin: 0 auto"></div>

</body>
</html>