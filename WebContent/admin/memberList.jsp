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
	//System.out.println(count); count ���� �� ����

	if(count>0){
		memberList=dbPro.getMembers(startRow,endRow,memberfilter);
	}
	//System.out.println(memberList.size());
	number=count-(currentPage-1)*pageSize;

	if(count==0){
		%>
		<table>
			<tr>
				<td align="center">������ ȸ���� �����ϴ�.</td>
			</tr>
		</table>
		<%
	}else{
	%>
<div style="margin-left: 10%">
	<h5 style="padding-top:20px;padding-botto:10px"><b>�� ���� Ȯ��</b></h5>
	<form action="/ShopProject/admin/memberList.jsp">
		<select name="memberfilter">
			<option value="0">��üȸ��
			<option value="10">�Ϲ�ȸ��
			<option value="1">������
		</select>
		<select name="searchfilter">
			<option value="0">ȸ���˻�
			<option value="id">���̵�
			<option value="name">�̸�
			<option value="buynum">����Ƚ��
		</select>
		<input type="text" name="searchtext">
		<input type="submit" value="�˻�">
	</form>
	
	<table>
		<tr>
			<td class="tableline w3-center">no</td>
			<td class="tableline w3-center">����ȣ</td>
			<td class="tableline w3-center">ID</td>
			<td class="tableline w3-center">�̸�</td>
			<td class="tableline w3-center">���</td>
			<td class="tableline w3-center">����</td>
			<td class="tableline w3-center">����</td>
			<td class="tableline w3-center">����Ƚ��</td>
			<td class="tableline w3-center">��������</td>
		</tr>
	<%
		for(int i=0;i<memberList.size();i++){
			LoginDataBean member=(LoginDataBean)memberList.get(i);
			//����Ʈ
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
	<!--�Խ��� �ϴ� ������ �̵�-->
	<tr>
	<td colspan="9" class="w3-center" style="padding-top: 10px">
	<% int bottomLine=5;
		//����Ǵ� �ϴ� ������ �� 
		if(count>0){	//count<��ü ȸ����
			int pageCount=count/pageSize+(count%pageSize==0?0:1);
			//pageSize<�� �������� ������ ��� ��
			//pageCount<�� �������� ����

			int startPage=1+(currentPage-1)/bottomLine*bottomLine;
			//1,6,11...
			int endPage=startPage+bottomLine-1;
			//5,10,15...
			if(endPage>pageCount)
				endPage=pageCount;
			//startPage�� ���� endPage�� ��ü �������� ���� ũ�� endPage=pageCount�� ��������
			if(startPage>bottomLine){
				//[����] <- ǥ�õǴ� ����
				%>
					<a href="list.jsp?pageNum=<%=startPage-bottomLine %>"><b>&lt;</b></a>				
					<!-- [����] ������ 4,5,6 �̸� > 1,2,3 ���� �̵��� -->
					<!-- ������ ��ȣ�� pageNum(String)���� �Ѱ���>CurrentPage�� ��-->
				<%}%>
				<% for(int i=startPage;i<=endPage;i++)
					{ 
					// �ϴ� [1][2][3] ����Ʈ
					%>
					<a href="list.jsp?pageNum=<%=i %>">
					<!-- pageNum�ѱ� -->
					<%	//���� �������� ��� ������ ��Ʈ
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