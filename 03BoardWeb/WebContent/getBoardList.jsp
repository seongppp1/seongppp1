<%@page import="com.jsp.user.vo.UserVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="com.jsp.board.dao.impl.BoardDAOImpl"%>
<%@page import="com.jsp.board.vo.BoardVO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%!

// 선언부 
// _jspService() 메서드의 외부에 포함되는 코드 
// 외부? 디폴트 객체(내장 개체)를 쓸 수 없다. 
// 멤버 변수, 멤버 메서드, 멤버 클래스 
public String maskDate(Date date, String pattern ){
	// pattern : yyyy-MM-dd 
	DateFormat df = new SimpleDateFormat(pattern) ;
	return df.format(date); 
}// 
%>

<%
	// 이미 web.xml에 Filter가 세팅 되어 있나요?
	
	request.setCharacterEncoding("UTF-8");

	// 1. 파라메터 처리 
	String searchCondition = request.getParameter("searchCondition");	
	String searchKeyword = request.getParameter("searchKeyword");	
	
	// 2. DB 연동
	BoardVO vo = new BoardVO();
	vo.setSearchCondition(searchCondition);
	vo.setSearchKeyword(searchKeyword);
	
	BoardDAOImpl boardDAO = new BoardDAOImpl();
	List<BoardVO> boardList = boardDAO.getBoardList(vo);
%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 목록</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script>

	// 2안 
	$(function(){
		// jQuery가 CSS 파싱 엔진을 가지고 있다. ? 속도가 ? 느리데요.
		// HTML5의 엔진이 더 빠르다. 
		$("#searchCondition").val("<%= searchCondition %>");
	});
</script>
</head>
<body>
<center>
<h1>글 목록</h1>
<!--  logout 자리  -->
<%@ include file="includePage.jsp" %>


<!-- 검색 시작 -->
<form action="getBoardList.jsp" method="post">
	<table border="1" cellpadding="0" cellspacing="0" width="700">
	<tr>
		<td align="right">
			<select name="searchCondition">
				<option value="TITLE" 
				<%= ("TITLE".equals(searchCondition) ? "selected" : "" ) %> >제목
				<option value="CONTENT"
				<%= ("CONTENT".equals(searchCondition) ? "selected" : "" ) %> >내용
			</select>
			<input name="searchKeyword" 
					type="text" value="<%=searchKeyword%>"/>
			<input type="submit" value="검색"/>
		</td>
	</tr>
	</table>
</form>
<!-- 검색 종료 -->

<table border="1" cellpadding="0" cellspacing="0" width="700">
<tr>
	<th bgcolor="orange" width="100">번호</th>
	<th bgcolor="orange" width="200">제목</th>
	<th bgcolor="orange" width="150">작성자</th>
	<th bgcolor="orange" width="150">등록일</th>
	<th bgcolor="orange" width="100">조회수</th>
</tr>


<!-- 목록 데이터 시작 -->
<%
for(int k = 0; k < boardList.size(); k++ ) {
	BoardVO board = boardList.get( k ); // 1 Row
	
	// <%= 10 %\> 
	// <% out.println( 10 ); %\>
%>
<tr>
	<td><%= board.getSeq() %></td> 
	<td align="left"><a href="getBoard.jsp?seq=<%= board.getSeq() %>"><%= board.getTitle() %></a></td>
	<td><%= board.getWriter() %></td>
	<td><%= maskDate( board.getRegDate(), "yyyy/MM/dd HH:mm" ) %></td>
	<td><%= board.getCnt() %></td> 
</tr>
<%
}//for(boardList)
%>
<!-- 목록 데이터 끝 -->


</table>
<br>
<a href="addBoard.jsp">새글 등록</a>
</center>
</body>
</html>


























