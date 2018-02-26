<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript">
	function checkValue(){
		if(!document.loginform.id.value){
			alert("아이디를 입력하세요");
			document.loginform.id.focus();
			return false;
		}
		if(!document.loginform.password.value){
			alert("패스워드를 입력하세요");
			document.loginform.password.focus();
			return false;
		}
		
		
	}



</script>
</head>
<body>

		<h4 class="w3-font w3-wide w3-center">LOGIN</h4>
		<hr class="login">
		<form method="post" name="loginform" action="<%=request.getContextPath() %>/back/loginPro.jsp" >
			<div class="w3-container w3-center" style="margin-bottom: 10px">
				<input class="lgform" type="text" size="15" maxlength="12" name="id" value="ID" >
			</div>
			<div class="w3-container w3-center" style="margin-bottom: 10px">	
				<input class="lgform" type="password" size="15" maxlength="12" name="password" value="1111">		
			</div>
			<div class="w3-container w3-center" style="margin-bottom: 10px">	
				<input class="w3-button w3-gray w3-wide" type="submit" value="LOGIN" style="width:172px">
			</div>
		
			<div class="w3-container w3-center" >	
				<input class="w3-button w3-orange w3-wide" type="button" value="JOIN" style="width:172px"
				onclick="location.href='<%=request.getContextPath()%>/view/memberJoin.jsp'">
			</div>					
				<div class="w3-container w3-center w3-tiny" style="padding-bottom: 10px;padding-top: 10px">
			<a class="lgmenu" href="">아이디/비밀번호 찾기</a>  
			</div>
			
		</form>
	<%
		String msg=request.getParameter("msg");
		if(msg!=null&&msg.equals("0")){
			%>
			<p style="color: orange" align="center"><b>비밀번호를 확인해주세요</b></p>
			<%
		}else if(msg!=null&&msg.equals("-1")){
			%>
			<p style="color: orange" align="center"><b>아이디를 확인해주세요</b></p>
			<%
		}
		
	
	%>
			
	
	
</body>
</html>