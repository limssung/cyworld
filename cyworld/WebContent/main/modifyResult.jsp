<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)request.getAttribute("result");
	if(id != null){
%>		
		{
			"sw" : "ok",
			"id" : "<%=id %>"
		}
<%		
	}else{
%>		
		{
			"sw" : "no"
		}
<%		
	}
%>