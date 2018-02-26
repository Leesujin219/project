<%@page import="product.ProductDBBean"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
	.pul{
		text-align: center;  list-style:none; 
	}
	.plist{
		display:inline-block;
		padding-left: 5px;
		padding-right: 5px;
	}
	.ptext{
		text-align: left;
		padding-top: 5px;
		padding-bottom: 10px;
		font-size: 12px;
	}
	a.plist:link{
		text-decoration:none;
	}
	a.plist:visited{
		text-decoration:none;
	}
	a.plist:active{
		color: tomato;
		text_decoration:none;
	}
	a.plist:hover{
		color: tomato;
		text_decoration:none;
	}

</style>
</head>
<body>
<%
	LoginDataBean memberTest=(LoginDataBean)session.getAttribute("member");

	String categoryid;
	int pageSize=20;
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	String pageNum=request.getParameter("pageNum");
	
	if(pageNum==null||pageNum==""){
		pageNum="1";
	}
	int currentPage=Integer.parseInt(pageNum);
	int startRow=(currentPage-1)*pageSize+1;
	int endRow=currentPage*pageSize;
	int count=0;
	int number=0;
	List ProductList=null;
	ProductDBBean dbPro=ProductDBBean.getInstance(); 
	/* count=dbPro.getProductCount(categoryid); 
	if(count>0){
		ProductList=dbPro.getProducts(startRow,endRow,categoryid);
	} */
	number=count-(currentPage-1)*pageSize;
	//테스트 용으로 우선 바꿔놓음
	if(count!=0){
		%>		
			<h4 class="w3-center w3 container">등록된 상품이 없습니다.</h4>	
		<% }
	else{ 
			%>

<div class="producttable">		
<%
	int i=0;
	for(int k=0;k<(pageSize/4);k++){%>
		<ul class="pul">
			
	<%
		//이미지 찍기
		for(int j=0;j<4;j++){%>
		<li class="plist">
		<a href="productDetail.jsp" class="plist">
		<img src="http://via.placeholder.com/300x300">
		<div class="ptext">상품명<br><b>10,000</b></div></li>
		</a>
		<%}%>
		</ul>
		<%}%>
</div>
	<%
	}
	%>

</body>
</html>