<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>

<link href="CSS/communitytable.css" rel="stylesheet" >
<style>
body{
   background-image: url('./image/main_bg.jpg');
   background-repeat: no-repeat;
   background-position: left;
}
</style>

<html>
<body>


<div>
<table class="list_table">
<colgroup>
<col style="width:280px;" />
<col style="width:50px;" />
<col style="width:90px;" />
</colgroup>
<tr>
   <td colspan="3" style="text-align: left; font-weight: bold">축덕 포럼 게시글</td>
</tr>
<tr>
      <th>제목</th> <th>작성자</th>  <th>작성일</th>
</tr>
<c:if test="${not empty bbslist}">
   <c:forEach items="${bbslist}" var="bbslist" varStatus="vs" begin="1" end="5">
      <tr>      
            <td style="text-align: left"><a href='bbsdetail.do?bbs_no=${bbslist.bbs_no}'>${bbslist.title}</a></td>
            <td>${bbslist.user_email}</td> 
            <c:set var="rdate" value="${bbslist.wdate}"/>
            <c:set var="len" value="${fn:length(wdate)}"/>    
            <td>${fn:substring(bbslist.wdate, 0, 10)}</td>   
      </tr>
   </c:forEach>
</c:if>
</table>
</div>





<div>

상호야 부탁할게

</div>









<div>
회원목록
<table>
<c:if test="${not empty fulist}">
 <tr> 
   <c:forEach items="${fulist}" var="fulist" begin="1" end="4">
     
            <td>
            <img alt="" src="image/${fulist.user_profile }" style="width: 150px;"><br>
            ${fulist.user_name}
            
            </td> 
           
      
   </c:forEach>
   </tr>
    <tr> 
   <c:forEach items="${fulist}" var="fulist" begin="4" end="7">
     
            <td>
            <img alt="" src="image/${fulist.user_profile }" style="width: 150px;"><br>
            ${fulist.user_name}
            
            </td> 
           
      
   </c:forEach>
   </tr>
</c:if>
</table>

</div>







</body>
</html>