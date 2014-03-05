<%@page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>새글등록</title>
<script>
<%
	// request.getContextPath(); // ==> /03BoardWeb
%>
function checkForm(){
	
	//document.getElementsByName("title");
	var frm = document.getElementById("regForm");
	if ( frm.title.value.length == 0 ) {
		alert("제목을 입력하세요.");
		frm.title.focus(); 
		return false; 
	}
	if ( frm.writer.value.length == 0 ) {
		alert("작성자를 입력하세요.");
		frm.writer.focus(); 
		return false; 
	}
	if ( frm.content.value.length == 0 ) {
		alert("내용을 입력하세요.");
		frm.content.focus(); 
		return false; 
	}
	
	return true; 
}
</script>
</head>
<body>
<center>
	<h3>새글 등록하기............</h3>
<!--  logout 자리  -->
	<hr>
		<form action="addBoard_proc.jsp" method="post"
				id="regForm" onsubmit="return checkForm();"> 
		<table border="1" cellpadding="0" cellspacing="0">
			<tr>
				<td>제목</td><td align="left"><input type="text" name="title" id="titleID"/></td>
			</tr>
			<tr>
				<td>작성자</td><td align="left"><input type="text" name="writer" size="10"/></td>
			</tr>
			<tr>
				<td>내용</td><td align="left"><textarea name="content" cols="40" rows="10"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value=" 새글 등록 "/></td>
			</tr>
		</table>
		</form>
	<hr>
</center>
</body>
</html>





