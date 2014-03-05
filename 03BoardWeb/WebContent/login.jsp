<%@page import="com.jsp.user.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	UserVO sessionUser = (UserVO) session.getAttribute("USER");
	if ( sessionUser != null ){
		response.sendRedirect("getBoardList.jsp");
		return ;
	}

	String cookieId = null; 
	String idSave = null; 
	
	// Client 의 브라우저가 보내준 쿠키 값. 
	Cookie [] cookies = request.getCookies();
	if ( cookies != null ){
		
		for(int k = 0; k < cookies.length; k++ ) {
			Cookie cookie = cookies[k];
			String cookieName = cookie.getName(); // getValue();
			if( "id".equals(cookieName)){
				cookieId = cookie.getValue(); // admin 
				idSave = "Y";
				break; 
			}
		}
		
	} //if 	
	
	

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
</head>
<body>
<center>
<h1>로그인</h1>
<hr>
<form action="login_proc.jsp" method="post">
	<table border="1" cellpadding="0" cellspacing="0">
	<tr><td>아이디</td>
	    <td><input type="text" name="id" 
	    	value="<%= cookieId == null ? "" : cookieId %>"    /></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="password"/></td>
	</tr>
	<tr>
		<td>아이디 저장</td>
		<td><input type="checkbox" name="idSave" value="Y" 
			<%= "Y".equals(idSave) ? "checked" : "" %>
		/></td>
	</tr>
	<tr><td colspan="2" align="center"><input type="submit" value="로그인"/></td></tr>
	</table>
</form>
<hr>
</center>
</body>
</html>








