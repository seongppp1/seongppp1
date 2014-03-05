<%@page import="com.jsp.user.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
	"USER" : session 안에 들어 있다. 
	// request, page, session, application 에 들어 있는 값만 가능하다. 
	request.setAttribute("userList", userList); 
--%>
<c:if test="${ not empty USER.name }">
${USER.name}님 환영합니다.
</c:if>



<c:forEach items="${userList}">
	
</c:forEach>

































