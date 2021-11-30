<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
	<%@page import="vo.FriendVO"%>
<%@page import="vo.MemberFriendVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
//���̲��⸦ ������ �� ����Ǵ� function
// $(function(){
//    $("#deleteFriend").on('click',function(){
      
//       var result = confirm("���̰��踦 ���� �����ðڽ��ϱ�?")
       
//       if(result){
<%--          $("#friendForm").attr("action","<%=request.getContextPath()%>/friendDelete.do"); --%>
//          $("#friendForm").submit();

//           alert("���� ��Ͽ��� �����Ǿ����ϴ�.");
//       }
     
//    });
   
// });

function fn_submit(vara){
   $.ajax({
      "url" : "<%=request.getContextPath()%>/friendDelete.do",
      "data" : "mem_id=" + vara,
      "success" : function(data){
         
         $("#result").html(data);
          alert("���� ��Ͽ��� �����Ǿ����ϴ�.");
         },
      "error" : function(hx){
         alert(hx.status);
      },
      "dataType" : "html"
   });
   
}


  $(function(){
	  $(".accept").on('click',function(){
		  var id = $(this).attr("id");
// 		  alert(id);
		  
		  $.ajax({
			  "url" : "<%=request.getContextPath()%>/friendAccept.do",
			 "data" : {"id":id},
			 "success" :function(data){
				 alert("������ �����Ǿ����ϴ�.")
				 //location.reload();	
				$("#friendListBtn").trigger("click");
			 },
			 "error":function(hx){
				 alert(hx.status);
			 },
			 "dataType" : "html"
		  });
	  });
  });
	
  $(function(){
	  $(".delete").on('click',function(){
		  var id = $(this).attr("id");
// 		  alert(id);
		  
		  $.ajax({
			  "url" : "<%=request.getContextPath()%>/friendAcceptDel.do",
			  "data" : {"id":id},
			  "success" : function(data){
				  alert("���̽�û�� �����Ͽ����ϴ�.")
					$("#friendListBtn").trigger("click");

			  },
			  "error":function(hx){
				  alert(hx.status);
			  },
			  "dataType" : "html"
		  });
	  });
  });	
</script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Single+Day&display=swap');
body{
	font-family: 'Single Day', cursive;
}
img{
width : 50px;
height : 50px;
border-radius : 50px;
}
#myList{
    width : 600px;
    height : 45px;
    border-radius: 10px;
    background :#D8D8D8;
    font-size : 17px;
    line-height : 48px;
 }
#myList span{
   position: relative;
   left : 10px;
}
.name{
	color : orange;
	font-size : 1.13em;
}

</style>
</head>
<body>

<%
   List<MemberFriendVO> memFriendList = (List<MemberFriendVO>)request.getAttribute("AllFriendList");
%>
<div id="myList"> <span>���� ���� ���</span></div><br>
<table border="0" style="border-collapse: collapse;">

<%

if(memFriendList == null|| memFriendList.size()==0){
%>
<tr><td colspan="3">������ ���� ģ���� �� ���� �����ϴ�.</td></tr>
<%

}else{
   int cnt = 0;
   for(MemberFriendVO memList : memFriendList){
%>
<!-- <img src="/cyworld/images/cy_logo.png" style="width:60px;"/> -->
<tr>
<td style="width:60px;height:50px;"><img src="<%=memList.getHome_pic()%>" alt ="Ȩ�ǻ���"></td>
<td style="width:120px;height:50px;"><%=memList.getMem_name() %>(<%=memList.getMem_id() %>)</td>
<td style="width:60px;"><span id="deleteFriend<%=cnt%>" style="color:#6E6E6E; font-size: 35px;" 
   onclick="fn_submit('<%=memList.getMem_id() %>')"><i class="fa fa-minus-square" aria-hidden="true" style="cursor:pointer;"></i></span></td>
<!-- deleteFriend+cnt �� ��ư���� ������ id���� �����Ѵ� , Ŭ���� ���� ����� mem_id�� ���޵ǰ���-->
</tr>

<%-- <input type="hidden" name="home_id" id="home_id" value="<%=session.getAttribute("homeChk") %>"> --%>
<%
   cnt++;
   }
}

%>      

</table>
<form id="friendForm" method="get" action="<%=request.getContextPath()%>/friendDelete.do" >
<input type="hidden" name="mem_id" id="mem_id" value="">
</form>
<br>

<%
	String userName = (String)session.getAttribute("userName");
	String friendName = (String)session.getAttribute("friendName");

//1.�α��ν� session���� �ҷ���
// 	List<MemberFriendVO> sendList = (List<MemberFriendVO>)session.getAttribute("sendList");
//2.allfriend.do���� �޾ƿ�
	List<MemberFriendVO> sendList2 = (List<MemberFriendVO>)request.getAttribute("sendList2");
%>
<div id="myList"><span>���ο� ���̽�û</span>
<form id="acceptFriend" action="<%=request.getContextPath()%>/friendAccept.do">
<table border="0" style="border-collapse: collapse;">
<%
	if(sendList2 == null|| sendList2.size()==0){
%>
	<tr><td>��û�� ������ �����ϴ�.</td></tr>
<%
	}else
		
	for(MemberFriendVO sendList3 : sendList2){
%>
	<tr>
		<td "width:130px;height:60px; padding-right: 25px;"><img src="../images/cyworld_logo.png" alt="�ΰ�"></td>
		<td "width:450px;height:60px;  padding-right: 25px;"><span class="name" style="padding-right: 10px;"><%=sendList3.getMem_name()%> </span>���� ������ ��û�ϼ̽��ϴ�.<br>
		  ������ �����ðڽ��ϱ�?</td>
		<td "width:90px;height:60px;"><input type="button" class="accept" value = "����" id="<%=sendList3.getMem_id()%>" />
			<input type="button" class="delete" value="����" id="<%=sendList3.getMem_id()%>"/></td>
	</tr>
<%
	}
%>		
</table>
</form>
</div>


</body>
</html>