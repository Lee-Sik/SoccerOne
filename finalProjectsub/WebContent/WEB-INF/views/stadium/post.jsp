<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />
		<script type="text/javascript" src="/direct/js/jquery-1.11.2.min.js"></script>
		<script type="text/javascript" src="//wcs.naver.net/wcslog.js"></script>
		<link href="/package/css?key=947a5c8567c6d82f39eabf6676a46337&dummy=1453861733" rel="stylesheet" type="text/css" />
		<script type="text/javascript">
				</script>
		<title>게임원</title>
		<link rel="shortcut icon" type="image/x-icon" href="/favicon.ico" />
		
		<script type="text/javascript">
				
			var f = document.f1;	
		
		      function result1() {
				
		    	  var gugun = f1.gugun.value;
		    	  var addrtype = f1.addrtype.value;
		    	  location.href="./post_result.do?gugun=" + gugun + "&addrtype=" + addrtype;
		    	  
			}
		
		</script>
		
	</head>
	<body ><form name="f1" method="post">
	<table width="500" border="0" cellpadding="0" cellspacing="0">
		<tbody>
		<tr>
			<td height="40" colspan="2" class="lp_10"><img src="//img.gameone.kr/admin/league/timg_search_addr.gif" width="87" height="20"></td>
		</tr>
		<tr>
			<td width="142" height="2" bgcolor="999999"></td>
			<td width="458" bgcolor="999999"></td>
		</tr>
		<tr>
			<td height="43" colspan="2" align="left" bgcolor="f4f4f4" class="lp_10 t_9">동(읍/면) 이름을 입력하세요. </td>
		</tr>
		<tr>
			<td height="1" bgcolor="e5e5e5"></td>
			<td bgcolor="e5e5e5"></td>
		</tr>
		<tr>
			<td height="100" colspan="2" align="center" bgcolor="#FFFFFF">
				<table width="520" border="0" cellpadding="0" cellspacing="0">
					<tbody>
						<tr>
							<td height="1" colspan="4" bgcolor="dfdfdf"></td>
							<td height="1" bgcolor="dfdfdf"></td>
						</tr>
						<tr>
							<td width="1" height="28" bgcolor="dfdfdf"></td>
							<td width="30" align="left" bgcolor="f4f4f4" class="lp_5 t_6" style="padding-left: 50px;">
							<select name="sido">
								<option value="서울">서울</option>
							</select>
							</td>
							
							<td width="68" align="left" bgcolor="f4f4f4" class="lp_5 t_6" style="padding-left: -20px; margin-left: -50px;">
							<select name="gugun">
								<option value="">지역구 선택</option>
							<c:forEach var="dto" items="${post1}">
								<option value="${dto.gugun}">${dto.gugun}</option>
						    </c:forEach>
							</select>
							</td>
							
							<td width="68" align="left" bgcolor="f4f4f4" class="lp_5 t_6">
							<select name="addrtype">
							    <option value="">학교 선택</option>
								<option value="초등학교">초등학교</option>
								<option value="중학교">중학교</option>
								<option value="고등학교">고등학교</option>
								<option value="대학교">대학교</option>
								<option value="기타">기타</option>
							</select>
							</td>
							
							<td width="100" height="70" align="left" bgcolor="f4f4f4">
							<input type="button" value="" style="background-image: url(//img.gameone.kr/admin/league/btn_search.gif); border: solid 0px #000000; width: 63px; height: 26px; cursor:pointer" onclick="result1();" />
							<!-- <input type="image" src="//img.gameone.kr/admin/league/btn_search.gif" width="63" height="26"> -->
							</td>
						</tr>
						<tr>
							<td height="1" colspan="4" bgcolor="ffffff"></td>
							<td height="1" bgcolor="ffffff"></td>
						</tr>
					</tbody>
				</table>
			</td>
		</tr>
		<tr>
			<td height="20" colspan="2" align="center" bgcolor="#FFFFFF">&nbsp;</td>
		</tr>
		<tr>
			<td height="1" bgcolor="c2c2c2"></td>
			<td bgcolor="c2c2c2"></td>
		</tr>
		<tr>
			<td height="50" colspan="2" align="center">
				<a href="#none" onclick="self.close()"><img src="//img.gameone.kr/admin/league/btn_w_close.gif" width="65" height="33" border="0"></a>
			</td>
		</tr>
	</tbody>
	</table>
</form>		<script type="text/javascript" src="/package/js?key=fa49cce509f0e3338ba355f44937115e&dummy=1453861733"></script>
		
		<script type="text/javascript">
			if(!wcs_add) var wcs_add = {};
			wcs_add["wa"] = "395a7e85edf87c";
			wcs_do();
		</script>

	</body>
</html>