<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<title>${hotelNo }번 호텔옵션관리</title>
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
	
	$('#hotelOptnInsert').click(function(){
		 if($("input[name=check]").is(":checked")==false)
			 {
			 	alert("등록할 호텔옵션을 체크해주십시오.")
			 	return false;
			 }
		 else
			 {
				 alert("정상 등록되었습니다.");
			 	document.form1.submit();
			 }
		 
	})
	
	$("form1").submit(function(){ 
		self.close();
		window.close(); 
		
		window.opener.location.reload(); 
		
		return this.some_flag_variable; 
		
	});
	
	$('#hotelOptnDelete').click(function(){
		
		if($("input[name=check]").is(":checked")==false)
		 {
		 	alert("삭제할 호텔옵션을 체크해주십시오.")
		 	return false;
		 }

	var no = $('#hotelNo').val();
		
	$("input[name=check]:checked").each(function(){ 
	var test = $(this).val();
	$.ajax({
		
		type:"get",
		url :"hotelOptnDelete",
		data : {

			hotelNo     : no,
			hotelOptnNo : test,
		
		},
		
		success:function(data){
			
			window.opener.location.reload();    //부모창 reload

			window.close(); 
		},
		
	 });
})
})

})


</script>
</head>
<body>
<h1 >호텔옵션관리</h1>
<form method = "post" id = "form1" action = "hotelOptnInsert?hotelNo=${hotelNo }">
<table border = "1">
<tr>
	<td>현재 선택된 옵션 :  ${hotelOptn }</td>
</tr>
<tr>
	<td>
		<table border = "1" width="100%">
			<tr>
				<td><input type = checkbox name = "check" value = "0301" >WIFI<br></td>
				<td><input type = checkbox name = "check" value = "0302" >헬스클럽<br></td>
				<td><input type = checkbox name = "check" value = "0303" >주차장<br></td>
				<td><input type = checkbox name = "check" value = "0304" >수영장<br></td>
				<td><input type = checkbox name = "check" value = "0305" >CCTV<br></td>
			</tr>
			<tr>
				<td><input type = checkbox name = "check" value = "0306">에어컨 <br></td>
				<td><input type = checkbox name = "check" value = "0307">소화기<br></td>
				<td><input type = checkbox name = "check" value = "0308">스파<br></td>
				<td><input type = checkbox name = "check" value = "0309">호텔 바<br></td>
				<td><input type = checkbox name = "check" value = "0310">안내서비스<br></td>
			</tr>
			<tr>
				<td><input type = checkbox name = "check" value = "0311">세탁 서비스<br></td>
				<td><input type = checkbox name = "check" value = "0312">미용실<br></td>
				<td><input type = checkbox name = "check" value = "0313">금연실<br></td>
				<td><input type = checkbox name = "check" value = "0314">공항 셔틀<br></td>
				<td><input type = checkbox name = "check" value = "0315">엘리베이터<br></td>
			</tr>
			<tr>
				<td><input type = checkbox name = "check" value = "0316">짐 운반 서비스<br></td>
				<td><input type = checkbox name = "check" value = "0317">편의점<br></td>
				<td><input type = checkbox name = "check" value = "0318">호텔 보관금고<br></td>
				<td><input type = checkbox name = "check" value = "0319">회의/미팅실<br></td>
			</tr>		
		</table>
	</td>
</tr>
</table>
<div align="right" style="margin-right: 100px">
<input type = "submit" value = "등록" id = "hotelOptnInsert" >
<input type = "button" value = "삭제" id = "hotelOptnDelete">	
<input type = "hidden" id="hotelNo" value = ${hotelNo }>
<input type = "button" value = "창닫기" onclick="window.close()">
</div>
</form>
</body>
</html>