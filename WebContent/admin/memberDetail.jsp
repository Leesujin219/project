<%@page import="login.LoginDataBean"%>
<%@page import="login.LoginDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	.tableline{
		border: 1px gray dotted;
		padding: 5px;
		padding-left: 10px;
		padding-right:10px;
	}
</style>
</head>
<body>
<%
	String pageNum=request.getParameter("pageNum");
	
	if(pageNum==null||pageNum==""){
		pageNum="1";
	}
	String id=request.getParameter("id");
	try{
		LoginDBBean dbPro=LoginDBBean.getInstance();
		LoginDataBean member=dbPro.getMember(id);
	
%>
<form method="post" name="updateform" action="<%=request.getContextPath()%>/back/updatePro.jsp" >
<table style="margin-left: 10%">
	<tr><td><h5><b>�� ����</b></h5></td></tr>
	<tr>
		<td class="tableline">����ȣ</td><td class="tableline"><%=member.getNum() %></td>
		<td  class="tableline">ȸ�����</td><td  class="tableline"><%=member.getMemberlev()%>
			<input type="button" value="��ް���" onclick="document.location.href=''">
		</td>
	</tr>
	<tr>
		<td  class="tableline">ID</td><td  class="tableline"><input class="w3-border" type="text" size="30" maxlength="12" name="id" value="<%=member.getId() %>"
			readOnly style="background-color:lightgray"></td>
		<td  class="tableline">��й�ȣ</td><td  class="tableline"><input type="password" size="30" maxlength="12" name="password" value="<%=member.getPassword() %>"
			readOnly style="background-color:lightgray" ><input type="button" value="�ʱ�ȭ" onclick="document.location.href=''"></td>
	</tr>

	<tr>
		<td  class="tableline">�̸�</td><td  class="tableline"><input type="text" size="30" maxlength="12" name="name" value="<%=member.getName()%>" ></td>
		<td  class="tableline">�̸���</td><td  class="tableline"><input type="text" size="30" maxlength="12" name="email" value="<%=member.getEmail()%>"></td>
	</tr>
	<tr>
		<td  class="tableline">��ȭ��ȣ</td><td  class="tableline"><input type="text" size="30" maxlength="12" name="phone" value="<%=member.getPhone()%>"></td>
		<td  class="tableline">����</td><td  class="tableline"><input type="text" size="30" maxlength="1" name="gender" value="<%=member.getGender()%>"></td>
	</tr>
	<tr>
		<td  class="tableline">����</td><td  class="tableline"><input type="text" size="30" maxlength="12" name="birthday" value="<%=member.getBirthday()%>"></td>
		<td  class="tableline">����</td><td  class="tableline"><input type="text" size="30" maxlength="12" name="age" value="<%=member.getAge() %>"></td>
	</tr>
	<tr>
		<td  class="tableline">�����ȣ</td><td  class="tableline" colspan="3"><input type="text" size="30" maxlength="12" name="addrnum" value="<%=member.getAddrnum()%>">
</td>
	</tr>
	<tr>
		<td  class="tableline">�ּ�</td><td class="tableline">	<input type="text" size="50" maxlength="12" name="address1" value="<%=member.getAddress1()%>">
</td>
		<td  class="tableline"></td><td class="tableline"><input type="text" size="50" maxlength="12" name="address2" value="<%=member.getAddress2()%>">
</td>
	</tr>
	<tr>
		<td class="tableline">��������</td><td class="tableline" colspan="3"><%=member.getReg_date() %></td>
	</tr>
	<tr>
		<td class="tableline">�ֹ�Ƚ��</td><td class="tableline"><%=member.getBuynum() %></td>		
		<td class="tableline">���Ż�ǰ��</td><td class="tableline"><%=member.getProductnum() %></td>
	</tr>
	<tr>
		<td class="tableline">���� �ݾ�</td><td  class="tableline" colspan="3"></td>
	</tr>

	<tr><td style="padding-top: 10px"><h5><b>�ֹ� ����Ʈ</b></h5></td></tr>

<tr><td colspan="4" class="w3-center"><input type="submit" value="��������">
				&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" value="ȸ������"
				onclick="document.location.href='<%=request.getContextPath()%>/back/memberDeletePro.jsp?type=admin&id=<%=member.getId() %>&adminPw=<%=session.getAttribute("password")%>&pageNum=<%=pageNum%>'">
				&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" value="ȸ�����"
				onclick="document.location.href='memberList.jsp?pageNum=<%=pageNum%>'">	</td></tr>

</table>
</form>		

<% 	}catch(Exception e){} %>
</body>
</html>