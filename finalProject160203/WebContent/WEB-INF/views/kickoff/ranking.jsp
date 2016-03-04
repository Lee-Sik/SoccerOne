<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>

<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js ie6 oldie" lang="ko"> <![endif]-->
<!--[if IE 7]>    <html class="no-js ie7 oldie" lang="ko"> <![endif]-->
<!--[if IE 8]>    <html class="no-js ie8 oldie" lang="ko"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="ko"> <!--<![endif]-->
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

  <title>서울시 구별 리그 데이터 분석</title>
  <meta name="description" content="2010년 서울 독거노인 현황. 각 구별 독거노인 분포를 지도 위에 버블차트로 시각화하였습니다. 버블의 크기로 인구수를 표현해 지역적 분포를 파악하기 쉽게 하였습니다.">
  <meta name="author" content="링크잇, http://linkit.kr">

  <!-- CSS concatenated and minified via ant build script-->
  <link rel="stylesheet" href="http://fonts.googleapis.com/earlyaccess/nanumgothic.css">
  <link rel="stylesheet" href="CSS/reset.css">
  <link rel="stylesheet" href="CSS/style.css">
  <link rel="stylesheet" href="CSS/bootstrap.min.css">
  <link href="CSS/KICKOFF.css" rel="stylesheet" >
  <!-- end CSS-->

  <script src="js/libs/modernizr-2.0.6.min.js"></script>
</head>

<body>

<form action="./rankingAf.do" method="post">
	<input type="hidden" name="team_location" value="강서구">
	<input type="submit" value="강서구">
</form>
<form action="./rankingAf.do" method="post">
	<input type="hidden" name="team_location" value="마포구">
	<input type="submit" value="마포구">
</form>
<form action="./rankingAf.do" method="post">
	<input type="hidden" name="team_location" value="강남구">
	<input type="submit" value="강남구">
</form>
<form action="./rankingAf.do" method="post">
	<input type="hidden" name="team_location" value="영등포구">
	<input type="submit" value="영등포구">
</form>
<form action="./rankingAf.do" method="post">
	<input type="hidden" name="team_location" value="광진구">
	<input type="submit" value="광진구">
</form>
<form action="./rankingAf.do" method="post">
	<input type="hidden" name="team_location" value="송파구">
	<input type="submit" value="송파구">
</form>
  <div id="container" class="container">
    <header>
    	<h1>서울시 구별 리그 데이터 분석</h1>
    	</br></br>

    </header>
    <div id="main" role="main">
    	<div class="main_header">
    		<div id="view_selection" class="btn-group">
	        <a href="#" id="all" class="btn active">서울시 리그 인구수 구별 분포</a>
          <a href="#" id="district" class="btn">서울시 리그 인구수 구별 순위</a>
	      </div>
	      
	      <div class="legend">
	      	<ul>
	      		<li><span class="color blue"></span> 중위 리그</li>
	      		<li><span class="color green"></span> 하위 리그</li>
	      		<li><span class="color purple"></span> 상위 리그</li>
	      	</ul>
	      </div>
    	</div>
	      
      <div id="vis"></div>
      <div class="alt-image">
      	<p><strong>지금 사용하고 계신 웹브라우저에서 기능이 지원되지 않아 이미지로 대체했습니다. <a href="http://browsehappy.com">더 좋은 웹브라우저</a>를 사용하시면 실제 동작하는 차트를 보실 수 있습니다.</strong></p>
      	<img src="http://linkit.kr/data-visualization-gallery/img/bubble-chart.jpg" alt="2010년 서울 독거노인 현황 차트 이미지">
      </div>

      <table class="visuallyhidden" summary="이 표는 2010년 서울 독거노인 현황을 구와 경제상황으로 나누어 표현하였습니다. 경제상황은 일반, 저소득, 국민기초생활보장수급권자로 구분하였습니다.">
      	<caption class="visuallyhidden">2010년 서울 독거노인 현황</caption>
      	<thead>
      		<tr>
      			<th class="visuallyhidden" scope="col">구</th>
	      		<th class="visuallyhidden" scope="col">그룹</th>
	      		<th class="visuallyhidden" scope="col">인구수</th>
      		</tr>
      	</thead>
      	<tbody class="visuallyhidden">
      											<tr>
										<td class="visuallyhidden">종로구</td>
										<td class="visuallyhidden">국민기초생활보장수급권자</td>
										<td class="visuallyhidden">888</td>
									</tr>
														<tr>
										<td class="visuallyhidden">중구</td>
										<td class="visuallyhidden">국민기초생활보장수급권자</td>
										<td class="visuallyhidden">904</td>
									</tr>
														<tr>
										<td class="visuallyhidden">용산구</td>
										<td class="visuallyhidden">국민기초생활보장수급권자</td>
										<td class="visuallyhidden">1189</td>
									</tr>
														<tr>
										<td class="visuallyhidden">성동구</td>
										<td class="visuallyhidden">국민기초생활보장수급권자</td>
										<td class="visuallyhidden">1155</td>
									</tr>
														<tr>
										<td class="visuallyhidden">광진구</td>
										<td class="visuallyhidden">국민기초생활보장수급권자</td>
										<td class="visuallyhidden">1176</td>
									</tr>
														<tr>
										<td class="visuallyhidden">동대문구</td>
										<td class="visuallyhidden">국민기초생활보장수급권자</td>
										<td class="visuallyhidden">1212</td>
									</tr>
														<tr>
										<td class="visuallyhidden">중랑구</td>
										<td class="visuallyhidden">국민기초생활보장수급권자</td>
										<td class="visuallyhidden">1827</td>
									</tr>
														<tr>
										<td class="visuallyhidden">성북구</td>
										<td class="visuallyhidden">국민기초생활보장수급권자</td>
										<td class="visuallyhidden">1157</td>
									</tr>
														<tr>
										<td class="visuallyhidden">강북구</td>
										<td class="visuallyhidden">국민기초생활보장수급권자</td>
										<td class="visuallyhidden">1753</td>
									</tr>
														<tr>
										<td class="visuallyhidden">도봉구</td>
										<td class="visuallyhidden">국민기초생활보장수급권자</td>
										<td class="visuallyhidden">702</td>
									</tr>
														<tr>
										<td class="visuallyhidden">노원구</td>
										<td class="visuallyhidden">국민기초생활보장수급권자</td>
										<td class="visuallyhidden">2610</td>
									</tr>
														<tr>
										<td class="visuallyhidden">은평구</td>
										<td class="visuallyhidden">국민기초생활보장수급권자</td>
										<td class="visuallyhidden">1795</td>
									</tr>
														<tr>
										<td class="visuallyhidden">서대문구</td>
										<td class="visuallyhidden">국민기초생활보장수급권자</td>
										<td class="visuallyhidden">1084</td>
									</tr>
														<tr>
										<td class="visuallyhidden">마포구</td>
										<td class="visuallyhidden">국민기초생활보장수급권자</td>
										<td class="visuallyhidden">1159</td>
									</tr>
														<tr>
										<td class="visuallyhidden">양천구</td>
										<td class="visuallyhidden">국민기초생활보장수급권자</td>
										<td class="visuallyhidden">1370</td>
									</tr>
														<tr>
										<td class="visuallyhidden">강서구</td>
										<td class="visuallyhidden">국민기초생활보장수급권자</td>
										<td class="visuallyhidden">2443</td>
									</tr>
														<tr>
										<td class="visuallyhidden">구로구</td>
										<td class="visuallyhidden">국민기초생활보장수급권자</td>
										<td class="visuallyhidden">1306</td>
									</tr>
														<tr>
										<td class="visuallyhidden">금천구</td>
										<td class="visuallyhidden">국민기초생활보장수급권자</td>
										<td class="visuallyhidden">1449</td>
									</tr>
														<tr>
										<td class="visuallyhidden">영등포구</td>
										<td class="visuallyhidden">국민기초생활보장수급권자</td>
										<td class="visuallyhidden">1788</td>
									</tr>
														<tr>
										<td class="visuallyhidden">동작구</td>
										<td class="visuallyhidden">국민기초생활보장수급권자</td>
										<td class="visuallyhidden">1426</td>
									</tr>
														<tr>
										<td class="visuallyhidden">관악구</td>
										<td class="visuallyhidden">국민기초생활보장수급권자</td>
										<td class="visuallyhidden">1788</td>
									</tr>
														<tr>
										<td class="visuallyhidden">서초구</td>
										<td class="visuallyhidden">국민기초생활보장수급권자</td>
										<td class="visuallyhidden">538</td>
									</tr>
														<tr>
										<td class="visuallyhidden">강남구</td>
										<td class="visuallyhidden">국민기초생활보장수급권자</td>
										<td class="visuallyhidden">1159</td>
									</tr>
														<tr>
										<td class="visuallyhidden">송파구</td>
										<td class="visuallyhidden">국민기초생활보장수급권자</td>
										<td class="visuallyhidden">976</td>
									</tr>
														<tr>
										<td class="visuallyhidden">강동구</td>
										<td class="visuallyhidden">국민기초생활보장수급권자</td>
										<td class="visuallyhidden">1483</td>
									</tr>
														<tr>
										<td class="visuallyhidden">종로구</td>
										<td class="visuallyhidden">저소득</td>
										<td class="visuallyhidden">182</td>
									</tr>
														<tr>
										<td class="visuallyhidden">중구</td>
										<td class="visuallyhidden">저소득</td>
										<td class="visuallyhidden">130</td>
									</tr>
														<tr>
										<td class="visuallyhidden">용산구</td>
										<td class="visuallyhidden">저소득</td>
										<td class="visuallyhidden">2062</td>
									</tr>
														<tr>
										<td class="visuallyhidden">성동구</td>
										<td class="visuallyhidden">저소득</td>
										<td class="visuallyhidden">324</td>
									</tr>
														<tr>
										<td class="visuallyhidden">광진구</td>
										<td class="visuallyhidden">저소득</td>
										<td class="visuallyhidden">235</td>
									</tr>
														<tr>
										<td class="visuallyhidden">동대문구</td>
										<td class="visuallyhidden">저소득</td>
										<td class="visuallyhidden">237</td>
									</tr>
														<tr>
										<td class="visuallyhidden">중랑구</td>
										<td class="visuallyhidden">저소득</td>
										<td class="visuallyhidden">295</td>
									</tr>
														<tr>
										<td class="visuallyhidden">성북구</td>
										<td class="visuallyhidden">저소득</td>
										<td class="visuallyhidden">4667</td>
									</tr>
														<tr>
										<td class="visuallyhidden">강북구</td>
										<td class="visuallyhidden">저소득</td>
										<td class="visuallyhidden">1147</td>
									</tr>
														<tr>
										<td class="visuallyhidden">도봉구</td>
										<td class="visuallyhidden">저소득</td>
										<td class="visuallyhidden">3423</td>
									</tr>
														<tr>
										<td class="visuallyhidden">노원구</td>
										<td class="visuallyhidden">저소득</td>
										<td class="visuallyhidden">843</td>
									</tr>
														<tr>
										<td class="visuallyhidden">은평구</td>
										<td class="visuallyhidden">저소득</td>
										<td class="visuallyhidden">299</td>
									</tr>
														<tr>
										<td class="visuallyhidden">서대문구</td>
										<td class="visuallyhidden">저소득</td>
										<td class="visuallyhidden">374</td>
									</tr>
														<tr>
										<td class="visuallyhidden">마포구</td>
										<td class="visuallyhidden">저소득</td>
										<td class="visuallyhidden">179</td>
									</tr>
														<tr>
										<td class="visuallyhidden">양천구</td>
										<td class="visuallyhidden">저소득</td>
										<td class="visuallyhidden">277</td>
									</tr>
														<tr>
										<td class="visuallyhidden">강서구</td>
										<td class="visuallyhidden">저소득</td>
										<td class="visuallyhidden">549</td>
									</tr>
														<tr>
										<td class="visuallyhidden">구로구</td>
										<td class="visuallyhidden">저소득</td>
										<td class="visuallyhidden">210</td>
									</tr>
														<tr>
										<td class="visuallyhidden">금천구</td>
										<td class="visuallyhidden">저소득</td>
										<td class="visuallyhidden">592</td>
									</tr>
														<tr>
										<td class="visuallyhidden">영등포구</td>
										<td class="visuallyhidden">저소득</td>
										<td class="visuallyhidden">469</td>
									</tr>
														<tr>
										<td class="visuallyhidden">동작구</td>
										<td class="visuallyhidden">저소득</td>
										<td class="visuallyhidden">123</td>
									</tr>
														<tr>
										<td class="visuallyhidden">관악구</td>
										<td class="visuallyhidden">저소득</td>
										<td class="visuallyhidden">5178</td>
									</tr>
														<tr>
										<td class="visuallyhidden">서초구</td>
										<td class="visuallyhidden">저소득</td>
										<td class="visuallyhidden">1416</td>
									</tr>
														<tr>
										<td class="visuallyhidden">강남구</td>
										<td class="visuallyhidden">저소득</td>
										<td class="visuallyhidden">1897</td>
									</tr>
														<tr>
										<td class="visuallyhidden">송파구</td>
										<td class="visuallyhidden">저소득</td>
										<td class="visuallyhidden">723</td>
									</tr>
														<tr>
										<td class="visuallyhidden">강동구</td>
										<td class="visuallyhidden">저소득</td>
										<td class="visuallyhidden">908</td>
									</tr>
														<tr>
										<td class="visuallyhidden">종로구</td>
										<td class="visuallyhidden">일반</td>
										<td class="visuallyhidden">4939</td>
									</tr>
														<tr>
										<td class="visuallyhidden">중구</td>
										<td class="visuallyhidden">일반</td>
										<td class="visuallyhidden">3754</td>
									</tr>
														<tr>
										<td class="visuallyhidden">용산구</td>
										<td class="visuallyhidden">일반</td>
										<td class="visuallyhidden">4114</td>
									</tr>
														<tr>
										<td class="visuallyhidden">성동구</td>
										<td class="visuallyhidden">일반</td>
										<td class="visuallyhidden">6148</td>
									</tr>
														<tr>
										<td class="visuallyhidden">광진구</td>
										<td class="visuallyhidden">일반</td>
										<td class="visuallyhidden">5868</td>
									</tr>
														<tr>
										<td class="visuallyhidden">동대문구</td>
										<td class="visuallyhidden">일반</td>
										<td class="visuallyhidden">3584</td>
									</tr>
														<tr>
										<td class="visuallyhidden">중랑구</td>
										<td class="visuallyhidden">일반</td>
										<td class="visuallyhidden">6572</td>
									</tr>
														<tr>
										<td class="visuallyhidden">성북구</td>
										<td class="visuallyhidden">일반</td>
										<td class="visuallyhidden">1288</td>
									</tr>
														<tr>
										<td class="visuallyhidden">강북구</td>
										<td class="visuallyhidden">일반</td>
										<td class="visuallyhidden">5939</td>
									</tr>
														<tr>
										<td class="visuallyhidden">도봉구</td>
										<td class="visuallyhidden">일반</td>
										<td class="visuallyhidden">2140</td>
									</tr>
														<tr>
										<td class="visuallyhidden">노원구</td>
										<td class="visuallyhidden">일반</td>
										<td class="visuallyhidden">9277</td>
									</tr>
														<tr>
										<td class="visuallyhidden">은평구</td>
										<td class="visuallyhidden">일반</td>
										<td class="visuallyhidden">10307</td>
									</tr>
														<tr>
										<td class="visuallyhidden">서대문구</td>
										<td class="visuallyhidden">일반</td>
										<td class="visuallyhidden">6752</td>
									</tr>
														<tr>
										<td class="visuallyhidden">마포구</td>
										<td class="visuallyhidden">일반</td>
										<td class="visuallyhidden">7338</td>
									</tr>
														<tr>
										<td class="visuallyhidden">양천구</td>
										<td class="visuallyhidden">일반</td>
										<td class="visuallyhidden">6428</td>
									</tr>
														<tr>
										<td class="visuallyhidden">강서구</td>
										<td class="visuallyhidden">일반</td>
										<td class="visuallyhidden">7585</td>
									</tr>
														<tr>
										<td class="visuallyhidden">구로구</td>
										<td class="visuallyhidden">일반</td>
										<td class="visuallyhidden">6508</td>
									</tr>
														<tr>
										<td class="visuallyhidden">금천구</td>
										<td class="visuallyhidden">일반</td>
										<td class="visuallyhidden">2619</td>
									</tr>
														<tr>
										<td class="visuallyhidden">영등포구</td>
										<td class="visuallyhidden">일반</td>
										<td class="visuallyhidden">6698</td>
									</tr>
														<tr>
										<td class="visuallyhidden">동작구</td>
										<td class="visuallyhidden">일반</td>
										<td class="visuallyhidden">7089</td>
									</tr>
														<tr>
										<td class="visuallyhidden">관악구</td>
										<td class="visuallyhidden">일반</td>
										<td class="visuallyhidden">3284</td>
									</tr>
														<tr>
										<td class="visuallyhidden">서초구</td>
										<td class="visuallyhidden">일반</td>
										<td class="visuallyhidden">4413</td>
									</tr>
														<tr>
										<td class="visuallyhidden">강남구</td>
										<td class="visuallyhidden">일반</td>
										<td class="visuallyhidden">5428</td>
									</tr>
														<tr>
										<td class="visuallyhidden">송파구</td>
										<td class="visuallyhidden">일반</td>
										<td class="visuallyhidden">8144</td>
									</tr>
														<tr>
										<td class="visuallyhidden">강동구</td>
										<td class="visuallyhidden">일반</td>
										<td class="visuallyhidden">5688</td>
									</tr>
					      	</tbody>
      </table>
    </div>
    <footer style="display:none;">
    	<p>이 차트는 <a href="http://d3js.org/">D3.js</a>로 만들었으며 <a href="http://vallandingham.me/bubble_charts_in_d3.html">"Creating Animated Bubble Charts in D3"</a>를 보고 만든 것입니다.</p>
    	<p>개발: 김영국 (<a href="mailto:master@linkit.kr">master@linkit.kr</a>), 도움: 전진우 (<a href="mailto:apps4one@gmail.com">apps4one@gmail.com</a>)</p>
    	<p>링크잇 데이터 시각화 갤러리 <a href="http://linkit.kr/data-visualization-gallery/#bubble-chart" target="_blank">#bubble-chart</a></p>
    </footer>
  </div> <!--! end of #container -->


  <script src="./js/libs/jquery.min.js"></script>
  <script src="./js/script.js"></script>
  <script src="./js/CustomTooltip.js"></script>
  <script>!(document.documentElement.className.match('no-svg')) && (document.write('<script src="./js/libs/d3.min.js"><\/script><script src="./js/libs/d3.csv.min.js"><\/script><script src="./js/libs/d3.layout.min.js"><\/script><script src="./js/libs/d3.geom.min.js"><\/script><script src="./js/vis.js"><\/script>'))</script>
  <script>

    (function($) {
    	if (document.documentElement.className.match('no-svg')) {
    		return;
    	}
    	
      $('#view_selection a').on('click', function(e) {
      	e.preventDefault();
      	
        var view_type = $(this).attr('id');
        
        $('#view_selection a').removeClass('active');
        $(this).toggleClass('active');
        
        toggle_view(view_type);
      });
    })(jQuery);
</script> 
  <script type="text/javascript">

	  var _gaq = _gaq || [];
	  _gaq.push(['_setAccount', 'UA-32332596-1']);
	  _gaq.push(['_trackPageview']);
	
	  (function() {
	    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
	    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
	    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	  })();
	
	</script>
</body>
</html>
