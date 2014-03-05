<%@page import="com.jsp.board.dao.impl.BoardDAOImpl"%>
<%@page import="com.jsp.board.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1.브라우저로부터 전송된 파라메터 값 추출 
	String seqTxt  = request.getParameter("seq");
	int seq = Integer.parseInt(seqTxt); 
	
	// 2.DB 연동 
	// VO 가방에 값을 옮겨 담는다.
	BoardVO vo = new BoardVO();
	vo.setSeq(seq);
	
	BoardDAOImpl boardDAO = new BoardDAOImpl();
	boardDAO.deleteBoard(vo); // 글 삭제
	
	System.out.println( "글 삭제 호출 ! ");
	
	// 글 목록으로 갈 경우.
	response.sendRedirect("getBoardList.jsp");
	
%>


















