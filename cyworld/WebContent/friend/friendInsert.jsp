<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ��û ��</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#insertFrinedBtn").on("click",function(){
		window.open('<%=request.getContextPath()%>/friendApp.do','���̽�û','width=400, height=500, left=100, top=50');
	});
	
})
  
</script> 
</head>
<body>
	
		<button type="button" value="���̽�û" name="insert_friend" id="insertFrinedBtn">���̽�û</button>

</body>
</html>