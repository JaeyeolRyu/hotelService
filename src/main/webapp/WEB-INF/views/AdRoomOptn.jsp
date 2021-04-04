<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<title>${roomNo }번 객실옵션관리</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<style>
	/*다운로드한 글씨체 폰트 적용*/
	@font-face{
		font-family: 'Jua', sans-serif;
	}

	body{
		font-family: Jua;
		font-size:15px;
	}
				input{
				font-family: Jua;
				font-size:15px;
			}
			
			button{
				font-family: Jua;
				font-size:15px;	
			}			table{
				font-family: Jua;
				font-size:15px;	
			}
			tr {
				font-family: Jua;
				font-size:15px;	
			}
			td{
				font-family: Jua;
				font-size:15px;	
			}
			div{
				font-family: Jua;
				font-size:15px;	
			}
</style>

<script type="text/javascript">

$(document).ready(function(){
	
	$('#roomOptnInsert').click(function(){
		 if($("input[name=check]").is(":checked")==false)
			 {
			 	alert("등록할 객실옵션을 체크해주십시오.")
			 	return false;
			 }
		 else
			 {
				 alert("정상 등록되었습니다.");
			 	document.form1.submit();
			 }
		 
	})
	
	$("form1").submit(function(){ 
		alert("정상 등록되었습니다.");
		self.close();
		window.close(); 
		
		window.opener.location.reload(); 
		
		return this.some_flag_variable; 
		
	});



	$('#roomOptnDelete').click(function(){
		if($("input[name=check]").is(":checked")==false)
			 {
			 	alert("삭제할 객실옵션을 체크해주십시오.")
			 	return;
			 }
		 
		
		var no = $('#roomNo').val();
		
		$("input[name=check]:checked").each(function(){ 
		var test = $(this).val(); 
		
		$.ajax({
			
			type:"get",
			url:"roomOptnDelete",
			data : {
	
				roomNo     : no,
				roomOptnNo : test,
			
			},
			
			success:function(data){
				
					
				alert(data.RESULT);
				
				window.opener.location.reload();    //부모창 reload
	
				window.close(); 
			},
			
			error:function(data){
				alert("에러가 발생했습니다.");
			} 
	
		 });
	})
})

})

</script>
</head>
<body>
<h1 > 객실옵션관리</h1>
<form method = "post" id = "form1" action = "roomOptnInsert?roomNo=${roomNo }">
<table border = "1">
<tr>
	<td>현재 선택된 옵션 : ${roomOptn }</td>
</tr>
<tr>
	<td>
		<table border = "1" width="100%">
			<tr>
				<td><input type = checkbox name = "check" value = "0401" >세면도구<br></td>
				<td><input type = checkbox name = "check" value = "0402" >목욕가운<br></td>
				<td><input type = checkbox name = "check" value = "0403" >안전금고<br></td>
				<td><input type = checkbox name = "check" value = "0404" >비데<br></td>
				<td><input type = checkbox name = "check" value = "0405" >화장실<br></td>
			</tr>
			<tr>
				<td><input type = checkbox name = "check" value = "0406">소파<br></td>
				<td><input type = checkbox name = "check" value = "0407">욕조<br></td>
				<td><input type = checkbox name = "check" value = "0408">타월<br></td>
				<td><input type = checkbox name = "check" value = "0409">업무용책상<br></td>
				<td><input type = checkbox name = "check" value = "0410">TV<br></td>
			</tr>
			<tr>
				<td><input type = checkbox name = "check" value = "0411">슬리퍼<br></td>
				<td><input type = checkbox name = "check" value = "0412">냉장고<br></td>
				<td><input type = checkbox name = "check" value = "0413">전화기<br></td>
				<td><input type = checkbox name = "check" value = "0414">커피메이커<br></td>
				<td><input type = checkbox name = "check" value = "0415">다리미<br></td>
			</tr>
			<tr>
				<td><input type = checkbox name = "check" value = "0416">난방시설<br></td>
				<td><input type = checkbox name = "check" value = "0417">헤어드라이어<br></td>
				<td><input type = checkbox name = "check" value = "0418">전기주전자<br></td>
				<td><input type = checkbox name = "check" value = "0419">알람시계<br></td>
				<td><input type = checkbox name = "check" value = "0420">옷장<br></td>
			</tr>
			<tr>
				<td><input type = checkbox name = "check" value = "0421">에어컨<br></td>
				<td><input type = checkbox name = "check" value = "0422">식탁<br></td>
				<td><input type = checkbox name = "check" value = "0423">보드게임<br></td>
				<td><input type = checkbox name = "check" value = "0424">공기청정기<br></td>
				<td><input type = checkbox name = "check" value = "0425">화장지<br></td>
			</tr>		
		</table>
	</td>
</tr>
</table>
<div align="right" style="margin-right: 21px">
	<input type = "submit" value = "등록" id = "roomOptnInsert" >
	<input type = "button" value = "삭제" id = "roomOptnDelete">	
	<input type = "hidden" id="roomNo" value = ${roomNo }>
	<input type = "button" value = "창닫기" onclick="window.close()">
</div>

</form>
</body>
</html>