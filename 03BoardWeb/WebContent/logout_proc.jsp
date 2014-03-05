<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 로그아웃 하는 방법 
	
	// 1) 
	//session.setAttribute("USER", null); 
	
	// 2)
	//session.removeAttribute("USER");
	
	// 3)
	session.invalidate(); // 모두 지워라. 깨긋히.. 
	response.sendRedirect("login.jsp");
%>














