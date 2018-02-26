<%@page import="login.LoginDataBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" type="text/css" href="/ShopProject/css/style.css">
<link href="https://fonts.googleapis.com/css?family=Slabo+27px" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding" rel="stylesheet">
<title>::::Dear Room::::</title>
</head>
<body>
	<div class="w3-container w3-right-align w3-small w3-wide" style="padding-right:10%;padding-top:5px">
		<%
			if(session.getAttribute("member")==null){
				%><a class="lgmenu" href="/ShopProject/view/login.jsp">LOGIN</a>
				&nbsp;<%
			}else{
				%><a class="lgmenu" href="/ShopProject/back/logoutPro.jsp">LOGOUT</a>
				&nbsp;<%
			}
		%>
		
		<%
			if(session.getAttribute("member")==null){
				%><a class="lgmenu" href="login.jsp">MYPAGE</a>
				&nbsp;<%
			}else{
				%><a class="lgmenu" href="memberMypage.jsp">MYPAGE</a>
				&nbsp;<%
			}
		%>

		<a class="lgmenu" href="login.jsp">CART</a>
		&nbsp;

		<%
			if(session.getAttribute("member")!=null){
				LoginDataBean member=(LoginDataBean)session.getAttribute("member");
				
				if(member.getMemberlev().equals("1")){	//������ ������ �� ����
					%>
					<a class="lgmenu" href="/ShopProject/admin/memberList.jsp" style="color: red">ADMIN</a>
					&nbsp;		
					<%
				}
			}		
		%>

	
	</div><!-- �ΰ� -->
	<div class="w3-padding-48 w3-center">
	  <h1 class="w3-xxlarge w3-logofont">Dear Room:</h1>
	</div>
	<!-- �޴� --> 
	<div class="w3-container w3-center ">
	
		<a class="lgmenu w3-font w3-wide" href="productView.jsp">HOME</a>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a class="lgmenu w3-font w3-wide" href="productView.jsp">NEW</a>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a class="lgmenu w3-font" href="productView.jsp">���׸����ǰ</a>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a class="lgmenu w3-font" href="productView.jsp">����</a>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a class="lgmenu w3-font" href="productView.jsp">�ֹ��ǰ</a>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a class="lgmenu w3-font" href="productView.jsp">ħ����</a>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a class="lgmenu w3-font w3-wide" href="productView.jsp">SALE</a>
	</div>
	<div class="mainLine" style="">
		<hr style="border: dotted 1px grey;">	<!-- ������ �־�� center�� ��. ��� �е��� �ش�.... -->
	</div>
	</body>
</html>