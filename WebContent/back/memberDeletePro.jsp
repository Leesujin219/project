<%@page import="login.LoginDBBean"%>
<%@page import="login.LoginDataBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%	
	request.setCharacterEncoding("euc-kr");
	String type=request.getParameter("type");	//관리자 계정인지 체크
	String inputPw;
	String id;
	String pageNum=request.getParameter("pageNum");


	if(type.equals("admin")){
		id=request.getParameter("id");
		inputPw=request.getParameter("adminPw");
		System.out.println(type+"\n"+id+"\n"+inputPw);

	}else{
		System.out.println("타입: "+type+"\n");

		LoginDataBean member=(LoginDataBean)session.getAttribute("member");
		id=member.getId();
		inputPw=request.getParameter("password");

	}
	
	
	LoginDBBean dbPro=LoginDBBean.getInstance();
	int check=dbPro.deleteMember(id,inputPw,type);
	if(check==1){
		 if(type.equals("admin")){
			%>
			<script language="JavaScript">
			alert("정상적으로 탈퇴 되었습니다.");
			</script>
			<% response.sendRedirect(request.getContextPath()+"/admin/memberList.jsp?pageNum="+pageNum); %>
			
<%-- 		<meta http-equiv="Refresh" content="<%=request.getContextPath()%>/admin/memberList.jsp?pageNum=<%=pageNum %>">		
 --%>			<%
		}else{%>
			<script language="JavaScript">
			alert("정상적으로 탈퇴 되었습니다.");
			</script>
			<% response.sendRedirect(request.getContextPath()+"/back/logoutPro.jsp"); %>
		<%-- 	<meta http-equiv="Refresh" content="<%=request.getContextPath()%>/view/login.jsp">		
		 --%><%} %>
	<%
	}else{
		%>
		<script language="JavaScript">
			alert("비밀번호가 맞지 않습니다.");
			history.go(-1);
		</script>			
	<%
	}
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>