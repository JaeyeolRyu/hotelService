<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="js/jquery-3.4.1.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="css/loginstyle.css">
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

$(document).ready(function() {
	var res;
	
	$("#submit").click( function() { 
		
		
		if($('#name').val() == ''){
			alert("이름을 입력해 주세요.");
			$('#name').focus();
			return false;
		
		}else if($('#tel').val() == ''){
			alert("패스워드를 입력해 주세요.");
			$('#tel').focus();
			return false;
		}
		var custName = $("#name").val();
		var custTel = $("#tel").val();
	
		 $.ajax({
			
			type:"get",
			url:"custEmailFind",
			data : {

				custName    : custName,
				custTel		: custTel,
			},
			success:function(data){
					
				alert(data.RESULT);
				document.getElementById('emailfind').reset();
			},
			error:function(data){
				alert("에러가 발생했습니다.");
			} 
	
		 });
	});
});	
</script>
</head>
<body>

<div class="wrap" style="background-image: url('img/background.jpg'); ">
    <div class="form-wrap">
    
		<form id="emailfind" action="custEmailFind" class="input-group">
			<a href="main"><img width="270px" src="img/logo/hocance.png" alt=""></a><br><br><br> 
			<input  type="text"   id="name" name="custName" class="input-field" placeholder="이름을 입력해주세요." value="">
			<input  type="number" id="tel"  name="custTel"  class="input-field" placeholder="전화번호를 입력해주세요." maxlength="11" value=""><br><br><br>
			<button type="button" id="submit" class="mybtn">이메일 찾기</button><br>
			<button type="button" class="mybtn" onclick="window.history.back();">취소</button> 
		</form>
    </div>
</div>
</body>
</html>