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
<% request.setCharacterEncoding("euc-kr"); %>

<jsp:useBean id="member" class="login.LoginDataBean">
	<jsp:setProperty name="member" property="*"/>
</jsp:useBean>
<% System.out.println(member); %>
<%
	LoginDBBean dbPro=LoginDBBean.getInstance();
	dbPro.insertMember(member);
	%>
	<script>
		alert("회원가입이 완료되었습니다.");
	</script>
	<%
	response.sendRedirect(request.getContextPath()+"/view/login.jsp");


%>

</body>
</html>