<%@page import="com.jsp.board.dao.impl.BoardDAOImpl"%>
<%@page import="com.jsp.board.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1.브라우저로부터 전송된 파라메터 값 추출 
	String seqTxt  = request.getParameter("seq");
	int seq = Integer.parseInt(seqTxt); 
	
	String title   = request.getParameter("title");
	String content = request.getParameter("content");
	
	// 2.DB 연동 
	// VO 가방에 값을 옮겨 담는다.
	BoardVO vo = new BoardVO();
	vo.setSeq(seq);
	vo.setTitle(title);
	vo.setContent(content);
	
	BoardDAOImpl boardDAO = new BoardDAOImpl();
	boardDAO.updateBoard(vo); // 글 수정 
	
	System.out.println( "글 수정 호출 ! ");
	
	// 글 목록으로 갈 경우.
	response.sendRedirect("getBoardList.jsp");
	
	// 글 상세 보기로 다시 갈 경우 ? 
	// response.sendRedirect(" 어디로 ? ");

%>


















