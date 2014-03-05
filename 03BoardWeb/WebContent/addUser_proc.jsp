<%@page import="com.jsp.user.dao.impl.UserDAOImpl"%>
<%@page import="com.jsp.user.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1.브라우저로부터 전송된 파라메터 값 추출 
	String id       = request.getParameter("id");
	String password = request.getParameter("password");
	String name     = request.getParameter("name");
	String role     = request.getParameter("role");
	
	// 2.DB 연동 
	// VO 가방에 값을 옮겨 담는다.
	// VO/ DTO / TO 
	UserVO vo = new UserVO();
	vo.setId(id);
	vo.setPassword(password);
	vo.setName(name);
	vo.setRole(role);
	
	UserDAOImpl userDAO = new UserDAOImpl();
	userDAO.addUser(vo); // 회원 등록
	
	System.out.println( "회원 등록 호출 ! ");
	
	// 등록 성공시! 로그인 창으로 이동 
	response.sendRedirect("login.jsp");

%>


















