<%@page import="soccer.co.DTO.foot_user_DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="CSS/CLUBtable.css" rel="stylesheet" >

   <form action="createTeamAf.do" method="post" enctype="multipart/form-data">
      <input type="hidden" value="${login.user_email}" name="team_managerid">
      <table class="list_table" style="width:85%;">
         <tr>
            <th>팀장 명</th>
            <td style="text-align: left">${login.user_email}(${login.user_name})</td>
         </tr>
         <tr>
            <th>팀 명</th>
            <td style="text-align: left"><input type="text" name="team_name"></td>
         </tr>
         <tr>
            <th>팀 소개</th>
            <td style="text-align: left"><textarea name="team_intro" rows="5" cols="50"></textarea>
            </td>
         </tr>

         <tr>
            <th>주 활동 지역</th>
            <td style="text-align: left"><select name="team_location1">
            <c:forEach items="${list}" var="vo">
               <option>${vo}</option>            
            </c:forEach>
            </select>
            </td>
         </tr>
         <tr>
            <th rowspan="2">활동 지역</th>
            <td style="text-align: left"><select name="team_location2">
            <c:forEach items="${list}" var="vo">
               <option>${vo}</option>            
            </c:forEach>
            </select>
            </td>
            </tr>
            <tr>
            <td style="text-align: left">
            <select name="team_location3">
            <c:forEach items="${list}" var="vo">
               <option>${vo}</option>            
            </c:forEach>
            </select>
    	</td>
         </tr>

         <tr>
            <th>팀 모집 유무</th>
            <td style="text-align: left"><input id="cmn-toggle-1" class="cmn-toggle cmn-toggle-round" name="team_j" type="checkbox">
            <label for="cmn-toggle-1"></label></td>
         </tr>
         <tr>
            <th>팀 정보 공개 유무</th>
            <td style="text-align: left"><input id="cmn-toggle-2" class="cmn-toggle cmn-toggle-round" name="team_o" type="checkbox">
            <label for="cmn-toggle-2"></label></td>
         </tr>
         <tr>

            <th>홈구장 </th>
            <td style="text-align: left"><a href="#" onclick="javascript:window.open('./post.do','','location=0,status=0,scrollbars=1,width=530,height=330');">
   <img src="image/wofun.png"></a>
   <br>
   <input type="text" name="team_h" id="addr1" size="70"> </td>

         </tr>
         <tr>
            <th>팀로고</th>
            <td style="text-align: left"><input type="file" name="file"></td>
         </tr>
         <tr>
            <td colspan="2"><input type="submit" value="팀 생성"></td>
         </tr>
      </table>
   </form>
       