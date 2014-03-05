<%@page import="com.jsp.board.dao.impl.BoardDAOImpl"%>
<%@page import="com.jsp.board.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="euc-kr"%>
<%
	// 파라메터 받기
	String title   = request.getParameter("title");
	String writer  = request.getParameter("writer");
	String content = request.getParameter("content");
	
	// 가방에 값 담기 
	BoardVO vo = new BoardVO();
	vo.setTitle(title);
	vo.setWriter(writer);
	vo.setContent(content); 
	
	// DB 등록 
	BoardDAOImpl boardDAO = new BoardDAOImpl();
	boardDAO.addBoard(vo);
	
	System.out.println("글 등록 성공!!!!"); 
	
	// 브라우저야 getBoardList.jsp를 다시 호출 해라 !!!! <--- 명령 
	response.sendRedirect("getBoardList.jsp");
	
	//request.getRequestDispatcher("getBoardList.jsp").forward(r,r);
	
%>













