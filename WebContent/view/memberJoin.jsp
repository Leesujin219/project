<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript">
	function checkValue(){
		var form=document.joinform;		
		if(!form.id.value){
			alert("���̵� �Է��ϼ���.");
			return false;
		}
		if(form.idDuplication.value!="idCheck"){
			alert("���̵� �ߺ�üũ�� ���ּ���.");
			return false;
		}
		if(!form.password.value){
			alert("��й�ȣ�� �Է��ϼ���.");
			return false;
		}
		if(form.password.value!=form.passwordcheck.value){
			alert("��й�ȣ�� �����ϰ� �Է��ϼ���.");
			return false;
		}
		if(!form.name.value){
			alert("�̸��� �Է��ϼ���.");
			return false;
		}
		if(isNaN(form.birthday.value)){
			alert("���� ex)19900101 ���·� �Է��ϼ���");
			return false;
		}
		if(isNaN(form.phone.value)){
			alert("-�� ������ ���ڸ� �Է��ϼ���");
			return false;
		}
		if(!form.email.value){
			alert("���� �ּҸ� �Է��ϼ���.");
			return false;
		}
		if(!form.addrnum.value){
			alert("�����ȣ�� �Է��ϼ���");
			return false;
		}
		if(!form.address1.value){
			alert("�ּҸ� �Է��ϼ���");
			return false;
		}
		if(!form.address2.value){
			alert("�� �ּҸ� �Է��ϼ���")
			return false;
		}
		
		
	}
	function openIdChk(){
		window.name="parentForm";
		window.open("view/idCheckForm.jsp","chkForm","width=500,height=300,resizable=no,scrollbars=no");
	}
	function inputIdChk(){
		document.joinform.idDuplication.value="idUncheck";
	}
</script>
</head>
<body>
		<h4 class="w3-font w3-wide w3-center">JOIN</h4>
		<hr class="login">
	<form method="post" name="joinform" action="<%=request.getContextPath() %>/back/memberJoinPro.jsp" onsubmit="return checkValue()">
	<input type="hidden" name="memberlev" value="1">	
	
	
	<table class="jointable w3-table w3-bordered w3-small" style="width:500px">
	 <tr class="jointablesize">
		<td>���̵�</td>
		<td width="350px"><input type="text" size="30" maxlength="15" name="id" onkeydown="inputIdChk()">
		&nbsp;
		<input class="w3-button w3-orange" type="button" onclick="openIdChk()" value="�ߺ�Ȯ��" style="width:80px">
		<input type="hidden" name="idDuplication" value="idUncheck">
		</td>	
	 </tr>
	 <tr class="jointablesize">
		<td>��й�ȣ</td>
		<td><input type="password" size="30" maxlength="12" name="password" >
		</td>	
	 </tr>
	 <tr class="jointablesize">
		<td>��й�ȣȮ��</td>
		<td><input type="password" size="30" maxlength="12" name="password2">
	 	</td>
	 </tr>
	 <tr class="jointablesize">
		<td>�̸�</td>
		<td><input type="text" size="30" maxlength="12" name="name" >
		</td>	
	 </tr>
	 <tr class="jointablesize">
		<td>�̸���</td>
		<td><input type="text" size="30" maxlength="30" name="email" ></td>	
	 </tr>
	 <tr class="jointablesize">
		<td>�޴�����ȣ</td>
		<td><input type="text" size="30" maxlength="11" name="phone" ></td>	
	 </tr>
	  <tr class="jointablesize">
		<td>����</td>
		<td><input type="radio" name="gender" value="f">����&nbsp;
		<input type="radio" name="gender" value="m">����</td>	
	 </tr>
	  <tr class="jointablesize">
		<td>�������</td>
		<td><input type="text" size="30" maxlength="8" name="birthday" ></td>	
	 </tr>
	 <tr class="jointablesize" style="border-bottom:none">
		<td>�ּ�</td>
		<td><input type="text" size="30" maxlength="8" name="addrnum" >
		&nbsp;
		<input class="w3-button w3-orange " type="button" onclick="" value="�����ȣã��" style="width:110px">
		</td>	
	</tr>
	 <tr class="jointablesize" style="border-bottom:none"><td></td>
		 <td><input type="text" size="50" maxlength="50" name="address1" ></td>	
	 </tr>
	 <tr class="jointablesize" ><td></td>
		 <td><input type="text" size="50" maxlength="50" name="address2" ></td>	


	 </tr>
	</table>
	<div class="w3-container w3-center" style="padding: 20px">
		<input class="w3-button w3-gray" type="button" value="���" style="width:100px"
		onclick="location.href='<%=request.getContextPath()%>/view/productView.jsp'">&nbsp;
		<input class="w3-button w3-black" type="submit" value="ȸ������" style="width:100px">
	</div>	
	</form>
	
</body>
</html>