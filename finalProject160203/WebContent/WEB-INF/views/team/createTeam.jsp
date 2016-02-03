<%@page import="soccer.co.DTO.foot_user_DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

   <form action="createTeamAf.do" method="post" enctype="multipart/form-data">
      <input type="hidden" value="${login.user_email}" name="team_managerid">
      <table>
         <tr>
            <td>팀장 명</td>
            <td>${login.user_email}(${login.user_name})</td>
         </tr>
         <tr>
            <td>팀 명</td>
            <td><input type="text" name="team_name"></td>
         </tr>
         <tr>
            <td>팀 소개</td>
            <td><textarea name="team_intro" rows="5" cols="50"></textarea>
            </td>
         </tr>

         <tr>
            <td>주 활동 지역</td>
            <td><select name="team_location1">
            <c:forEach items="${list}" var="vo">
               <option>${vo}</option>            
            </c:forEach>
            </select>
            </td>
         </tr>
         <tr>
            <td>활동 지역</td>
            <td><select name="team_location2">
            <c:forEach items="${list}" var="vo">
               <option>${vo}</option>            
            </c:forEach>
            </select>
            </td>
         </tr>
         <tr>
            <td>활동 지역</td>
            <td><select name="team_location3">
            <c:forEach items="${list}" var="vo">
               <option>${vo}</option>            
            </c:forEach>
            </select>
            </td>
         </tr>

         <tr>
            <td>팀 모집 유무</td>
            <td><input id="cmn-toggle-1" class="cmn-toggle cmn-toggle-round" name="team_j" type="checkbox">
            <label for="cmn-toggle-1"></label></td>
         </tr>
         <tr>
            <td>팀 정보 공개 유무</td>
            <td><input id="cmn-toggle-2" class="cmn-toggle cmn-toggle-round" name="team_o" type="checkbox">
            <label for="cmn-toggle-2"></label></td>
         </tr>
         <tr>
            <td>홈구장 </td>
            <td><a href="#" onclick="javascript:window.open('./zipsearch.do','','location=0,status=0,scrollbars=1,width=530,height=330');">
   <img src="image/wofun.png"></a> <br>
   <input type="text" name="team_h" id="addr1" size="70"> </td>
         </tr>
         <tr>
            <td>팀로고</td>
            <td><input type="file" name="file"></td>
         </tr>
         <tr>
            <td colspan="2"><input type="submit" value="팀 생성"></td>
         </tr>
      </table>
   </form>
       