<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/menuJsp/memberVertMenu.jsp"></jsp:include>
	
<div class="mpedit">
	<form method="post" name="delform" action="<%=request.getContextPath()%>/back/memberDeletePro.jsp">
		<input type="hidden" name="type" value="guest">
		<table class="jointable w3-table">
		<tr class="jointablesize">
			<td class="w3-center">
			<h4>������ Ż���Ͻðڽ��ϱ�?</h4>
			</td>
		</tr>
		<tr class="jointablesize">
			<td class="w3-center">��й�ȣ&nbsp;
			<input type="password" size="15" maxlength="12" name="password" >
			</td>	
		</tr>
		<tr class="jointablesize">
		<td class="w3-center">
		<input class="w3-button w3-gray" type="submit" value="ȸ��Ż��" style="width:172px"></td>
		</tr>
		</table>	
	</form>
</div>
	
		
</body>
</html>