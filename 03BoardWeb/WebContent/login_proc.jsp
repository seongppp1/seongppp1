<%@page import="com.jsp.user.dao.impl.UserDAOImpl"%>
<%@page import="com.jsp.user.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id       = request.getParameter("id");
	String password = request.getParameter("password");
	String idSave   = request.getParameter("idSave");
	
	System.out.println( idSave );
	
	UserVO vo = new UserVO();
	vo.setId(id);
	vo.setPassword(password);
	
	UserDAOImpl userDAO = new UserDAOImpl();
	// vo : where절에 넣기 위한 검색 조건
	// detailUser : DB에서 조회된 결과 
	UserVO detailUser = userDAO.getUser(vo);
	if ( detailUser != null) {
		// 로그인 성공 
		// session : 은행 계좌(금고)
		// "USER" : value(detailUser) 
		session.setAttribute("USER", detailUser); 
		
		// cookie 처리 ===========================
		if ("Y".equals(idSave)){
			Cookie idSaveCookie = new Cookie("id", id);
			idSaveCookie.setMaxAge(60 * 60) ; // 초 단위 
			response.addCookie(idSaveCookie);
		}
		
		// 성공시 글 목록으로 보내라. 
		response.sendRedirect("getBoardList.jsp");
	}
	else {
		// 로그인 실패 
		response.sendRedirect("login.jsp");
	}
	
	
%>














