<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	// 상대 경로 
	//response.sendRedirect("getBoardList.jsp");

	// 절대 경로 (IP:Port 안 써도 된다.)
	//response.sendRedirect(request.getContextPath() 
	//							+ "/getBoardList.jsp");
	
	
	// forward (WAS 내부에서 페이지를 이동한다.)
	request.getRequestDispatcher("/getBoardList.jsp")
			 .forward(request, response) ;

%>
















