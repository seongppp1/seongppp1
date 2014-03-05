<%@page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>회원등록</title>
<script>

function checkForm(){
	
	//document.getElementsByName("title");
	var frm = document.getElementById("regForm");
	
	// =================================
	// 동식..
	console.log("[" + frm.id.value + "]");
	//if(!frm.id.value)
    //{
    //      alert("아이디를 입력하세요(동식)");
    //      return false;
    //}
	// =================================
	
	
	if ( frm.id.value.length == 0 ) {
		alert("아이디를 입력하세요.");
		frm.id.focus(); 
		return false; 
	}
	if ( frm.password.value.length == 0 ) {
		alert("비밀번호를 입력하세요.");
		frm.password.focus(); 
		return false; 
	}
	if ( frm.name.value.length == 0 ) {
		alert("이름을 입력하세요.");
		frm.name.focus(); 
		return false; 
	}

	var idx = frm.role.selectedIndex; 
	var role = frm.role.options[ idx ].value; 
	if ( role == "" ){
		alert ("역할을 선택하세요.");
		frm.role.focus();
		return false; 
	}
	
	return true; 
}
</script>
</head>
<body>
<center>
	<h3>회원 등록하기............</h3>
<!--  logout 자리  -->
	<hr>
		<form action="addUser_proc.jsp" method="post"
				id="regForm" onsubmit="return checkForm();">
		<table border="1" cellpadding="0" cellspacing="0">
			<tr>
				<td>아이디</td><td align="left"><input type="text" name="id" size="20"/></td>
			</tr>
			<tr>
				<td>비밀번호</td><td align="left"><input type="password" name="password" size="20"/></td>
			</tr>
			<tr>
				<td>이름</td><td align="left"><input type="text" name="name" size="20"/></td>
			</tr>
			<tr>
				<td>역할</td>
				<td align="left">
					<select name="role">
						<option value="">== 선택 ==</option>
						<option value="Admin">관리자</option>
						<option value="User">회원</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value=" 회원 등록 "/></td>
			</tr>
		</table>
		</form>
	<hr>
</center>
</body>
</html>




