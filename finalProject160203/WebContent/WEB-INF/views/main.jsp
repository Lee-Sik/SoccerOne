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








</body>
</html>