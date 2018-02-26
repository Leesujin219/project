<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- 세로 메뉴 -->
	<div class="vertmenu">
			<table class="w3-center" style="font-size:9pt">
				<tr class="jointablesize" style="width:300px"><td><a class="lgmenu" 
					href="<%=request.getContextPath()%>/view/memberMypage.jsp">내 정보 수정</a></td></tr>
				<tr class="jointablesize"><td><a class="lgmenu" 
					href="<%=request.getContextPath()%>/view/memberMypage.jsp">쿠폰함</a></td></tr>		
				<tr class="jointablesize"><td><a class="lgmenu" 
					href="<%=request.getContextPath()%>/view/memberMypage.jsp">구매 목록</a></td></tr>
				<tr class="jointablesize"><td><a class="lgmenu" 
					href="<%=request.getContextPath()%>/view/memberMypage.jsp">찜한 상품</a></td></tr>
				<tr class="jointablesize"><td><a class="lgmenu" 
					href="<%=request.getContextPath()%>/view/memberDelete.jsp">회원 탈퇴</a></td></tr>
			</table>
	</div>