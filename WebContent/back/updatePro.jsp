<%@page import="login.LoginDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("euc-kr"); 
	String newPw=request.getParameter("password2");
	if(newPw==null||newPw==""){
		newPw="n";
	}
	%>
<jsp:useBean id="member" class="login.LoginDataBean">
	<jsp:setProperty name="member" property="*"/>
</jsp:useBean>
<% System.out.println(member); %>
<%
	LoginDBBean dbPro=LoginDBBean.getInstance();

	int chk=dbPro.updateMember(member,newPw);
	System.out.println("chk:"+chk);
	if(chk==1){
		%>
		<script>
		alert("정보를 수정했습니다.")
		history.go(-1); 
		</script>
		<%
	}else{
		%>
		<script>
		alert("현재 비밀번호가 맞지 않습니다.")
		history.go(-1); 
		</script>
		<%
	}
%>
</body>
</html>