<%@page import="vo.MemberFriendVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
//일촌목록으로 넘어가는 function
$(function(){
   $("#friendListBtn").on("click",function(){
      location.href="<%=request.getContextPath()%>/allFriendList.do";
   });
   
})
  
</script>
</head>
<body>
<%
   MemberFriendVO memFriendVo = (MemberFriendVO)request.getAttribute("memberFriendVo");
%>
<%--  <input type="hidden" name="home_id" id="home_id" value="<%=memFriendVo.getHome_id()%>"> --%>
 <input type="button" value="일촌관리" name="friendList" id="friendListBtn">
</body>
</html>
