<%@page import="login.LoginDataBean"%>
<%@page import="login.LoginDBBean"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
	.tableline{
		border: 1px gray dotted;
		padding: 5px;
		padding-left: 10px;
		padding-right:10px;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("euc-kr"); %>
<%
	LoginDataBean memberTest=(LoginDataBean)session.getAttribute("member");

	int pageSize=20;
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	String pageNum=request.getParameter("pageNum");
	String memberfilter=request.getParameter("memberfilter");
	String searchfilter=request.getParameter("searchfilter");
	String searchtext=request.getParameter("searchtext");
	
	if(pageNum==null||pageNum==""){
		pageNum="1";
	}
	if(memberfilter==null||memberfilter==""){
		memberfilter="0";
	}
	if(searchfilter==null||searchfilter==""){
		searchfilter="0";
	}
	if(searchtext==null||searchtext==""){
		searchtext="0";
	}
	
	int currentPage=Integer.parseInt(pageNum);
	int startRow=(currentPage-1)*pageSize+1;
	int endRow=currentPage*pageSize;
	int count=0;
	int number=0;
	
	List memberList=null;
	LoginDBBean dbPro=LoginDBBean.getInstance();
	count=dbPro.getMemberCount(memberfilter);
	//System.out.println(count); count 개수 잘 찍힘

	if(count>0){
		memberList=dbPro.getMembers(startRow,endRow,memberfilter);
	}
	//System.out.println(memberList.size());
	number=count-(currentPage-1)*pageSize;

	if(count==0){
		%>
		<table>
			<tr>
				<td align="center">가입한 회원이 없습니다.</td>
			</tr>
		</table>
		<%
	}else{
	%>
<div style="margin-left: 10%">
	<h5 style="padding-top:20px;padding-botto:10px"><b>고객 정보 확인</b></h5>
	<form action="/ShopProject/admin/memberList.jsp">
		<select name="memberfilter">
			<option value="0">전체회원
			<option value="10">일반회원
			<option value="1">관리자
		</select>
		<select name="searchfilter">
			<option value="0">회원검색
			<option value="id">아이디
			<option value="name">이름
			<option value="buynum">구매횟수
		</select>
		<input type="text" name="searchtext">
		<input type="submit" value="검색">
	</form>
	
	<table>
		<tr>
			<td class="tableline w3-center">no</td>
			<td class="tableline w3-center">고객번호</td>
			<td class="tableline w3-center">ID</td>
			<td class="tableline w3-center">이름</td>
			<td class="tableline w3-center">등급</td>
			<td class="tableline w3-center">나이</td>
			<td class="tableline w3-center">성별</td>
			<td class="tableline w3-center">구매횟수</td>
			<td class="tableline w3-center">가입일자</td>
		</tr>
	<%
		for(int i=0;i<memberList.size();i++){
			LoginDataBean member=(LoginDataBean)memberList.get(i);
			//프린트
		%>
		<tr>
			<td class="tableline w3-center"><%=number-- %></td>
			<td class="tableline w3-center"><%=member.getNum() %></td>
			<td class="tableline w3-center"><a href="memberDetail.jsp?id=<%=member.getId() %>&pageNum=<%=currentPage %>"><%=member.getId() %></a></td>
			<td class="tableline"><%=member.getName() %></td>
			<td class="tableline"><%=member.getMemberlev() %></td>
			<td class="tableline"><%=member.getAge() %></td>
			<td class="tableline"><%=member.getGender()%></td>
			<td class="tableline"><%=member.getBuynum()%></td>
			<td class="tableline"><%=member.getReg_date() %></td>
		</tr>
		
		<%
		}
	%>
	<%
	}
%>
	<!--게시판 하단 페이지 이동-->
	<tr>
	<td colspan="9" class="w3-center" style="padding-top: 10px">
	<% int bottomLine=5;
		//노출되는 하단 페이지 수 
		if(count>0){	//count<전체 회원수
			int pageCount=count/pageSize+(count%pageSize==0?0:1);
			//pageSize<한 페이지에 보여줄 멤버 수
			//pageCount<총 페이지의 개수

			int startPage=1+(currentPage-1)/bottomLine*bottomLine;
			//1,6,11...
			int endPage=startPage+bottomLine-1;
			//5,10,15...
			if(endPage>pageCount)
				endPage=pageCount;
			//startPage로 계산된 endPage가 전체 페이지수 보다 크면 endPage=pageCount로 설정해줌
			if(startPage>bottomLine){
				//[이전] <- 표시되는 시점
				%>
					<a href="list.jsp?pageNum=<%=startPage-bottomLine %>"><b>&lt;</b></a>				
					<!-- [이전] 누르면 4,5,6 이면 > 1,2,3 으로 이동함 -->
					<!-- 페이지 번호를 pageNum(String)으로 넘겨줌>CurrentPage에 들어감-->
				<%}%>
				<% for(int i=startPage;i<=endPage;i++)
					{ 
					// 하단 [1][2][3] 프린트
					%>
					<a href="list.jsp?pageNum=<%=i %>">
					<!-- pageNum넘김 -->
					<%	//현재 페이지일 경우 붉은색 폰트
						if(i!=currentPage)
							out.print(i);
						else out.print("<font color='red'>"+i+"</font>");						
					%>
					</a>			
				<%}
				if(endPage<pageCount){%>
					<a href="memberList.jsp?pageNum=<%=startPage+bottomLine%>">&gt;</a>
				<%					
				}
					
				
			}
		
		%>
		</td>
</tr>
</table>
</div>

</body>
</html>