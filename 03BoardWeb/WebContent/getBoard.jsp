<%@page import="com.jsp.board.dao.impl.BoardDAOImpl"%>
<%@page import="com.jsp.board.vo.BoardVO"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%
	//파라메터 받기
// 	String xxxxxxxxxxxxx = request.getParameter("xxxxxxxxxxxxx");
// 	if(xxxxxxxxxxxxx == null)
// 	{
// 		out.print("<script>alert('1111111111');</script>");
// 		return ;
// 	}


	String seqTxt = request.getParameter("seq"); 
	int seq = Integer.parseInt(seqTxt); 
	
	BoardVO vo = new BoardVO();
	vo.setSeq(seq);
	
	BoardDAOImpl boardDAO = new BoardDAOImpl();
	BoardVO detailBoard = boardDAO.getBoard(vo);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 상세</title>
<script>

function checkForm(){
	
	//document.getElementsByName("title");
	var frm = document.getElementById("regForm");
	if ( frm.title.value.length == 0 ) {
		alert("제목을 입력하세요.");
		frm.title.focus(); 
		return false; 
	}
	if ( frm.content.value.length == 0 ) {
		alert("내용을 입력하세요.");
		frm.content.focus(); 
		return false; 
	}
	
	// confirm으로 수정 여부 확인 
	return confirm("수정 하시겠습니까?"); 
	
}
</script>
</head>
<body>
<center>
<h3>글 상세</h3>
<!--  logout 자리  -->
<%@ include file="includePage.jsp" %>

<hr>
<form action="updateBoard_proc.jsp?seq=<%= detailBoard.getSeq() %>" method="post"
		id="regForm" onsubmit="return checkForm();">
<table border="1" cellpadding="0" cellspacing="0">
<tr>
<td>제목</td>
<td align="left"><input name="title" type="text" value="<%= detailBoard.getTitle() %>" /></td>
</tr>
<tr>
<td>작성자</td>
<td align="left"><%= detailBoard.getWriter() %></td>
</tr>
<tr>
<td>내용</td>
<td align="left"><textarea name="content" cols="40" rows="10"><%= detailBoard.getContent() %></textarea></td>
</tr>
<tr>
<td>등록일</td>
<td align="left"><%= detailBoard.getRegDate() %></td>
</tr>
<tr>
<td>조회수</td>
<td align="left"><%= detailBoard.getCnt() %></td>
</tr>
<tr>
<td colspan="2" align="center">
<input type="submit" value="글 수정"/>
</td>
</tr>
</table>
</form>
<hr>
<a href="addBoard.jsp">글등록</a>&nbsp;&nbsp;&nbsp;
<a href="deleteBoard_proc.jsp?seq=<%= detailBoard.getSeq() %>">글삭제</a>&nbsp;&nbsp;&nbsp;
<a href="getBoardList.jsp">글목록</a>
</center>
</body>
</html>
















