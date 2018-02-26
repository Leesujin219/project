<%@page import="login.LoginDataBean"%>
<%@page import="login.LoginDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); 
	String id=request.getParameter("id");
	String pw=request.getParameter("password");
	
	LoginDBBean logbean=LoginDBBean.getInstance();
	int check=logbean.loginCheck(id, pw);
	
	String msg="";
	if(check==1){
		LoginDataBean member=logbean.getMember(id);
		session.setAttribute("member",member);
		msg="/ShopProject/view/productView.jsp";
	}else if(check==0){
		msg="/ShopProject/view/login.jsp?msg=0";
	}else{
		msg="/ShopProject/view/login.jsp?msg=-1";
	}
	response.sendRedirect(msg);

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