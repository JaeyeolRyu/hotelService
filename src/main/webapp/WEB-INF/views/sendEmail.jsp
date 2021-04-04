<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/loginstyle.css">
<script src="js/jquery-3.4.1.min.js" type="text/javascript"></script>

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

	/*
	이메일 인증 버튼 클릭시 발생하는 이벤트
	*/
$(document).ready(function(){
	
	$("#emailBtn").click( function(){
		
		/* 이메일 중복 체크 후 메일 발송 비동기 처리 */
		var userEmail = $("#email").val();
		
		if( userEmail == "") {
			alert("이메일을 입력해 주세요.");
			return false;
		}
		
		
		$.ajax({

			type:"get",
			url : "createEmailCheck.do",
			// url : "<c:url value='/login/createEmailCheck.do'/>", 원본
			
			data : {
				userEmail :  userEmail,
			},
		 	success : function(data){
				$("#hidden").val(data.AA);
		 		alert("해당 이메일로 인증번호를  보냈습니다. 인증번호를 입력해주세요.");
				
			},
			error:function(data){
				alert("에러가 발생했습니다.");
				return false;
			}
		});
		
		 $('#addDiv').show();
	});
	/*
	이메일 인증번호 입력 후 인증 버튼 클릭 이벤트
	*/
	$("#emailAuthBtn").click( function(){
		
		var email   = $("#email").val();
		var random  = $("#hidden").val();
		var random2 = $("#emailAuth").val();
		
		if( random2 == "") {
			alert("인증번호를 입력해주세요.");
			return false;
			
		}
		if( random != random2 ) {
			alert("인증번호를 잘못 입력하였습니다.");
			return false;	
		}
			
			$.ajax ({
	
				type : "get",
				url :  "custPwFind",
				data : {
								
					custEmail : email,
					
				},
				
				success:function(data){
					alert("귀하의 비밀번호는 " + data.PW + "입니다");
					$("#login").show();
					$("#main").show();
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
    <div class="form-wrap" >  
		<form id="pwfind"  class="input-group">
			<a href="main"><img width="270px" style="left: 30%"  src="img/logo/hocance.png" alt=""></a><br><br><br>
			<input type="text"	id="email" name="email" placeholder="이메일을 입력하세요" class="input-field" /><br>
			<button type="button" id="emailBtn" class="mybtn">이메일 발송</button>
		    <div id="addDiv" style="display: none;" >
					<input type="text" id ="emailAuth" name="emailAuth" placeholder="인증번호 " value="" class="input-field"><br>
					<input type="button" id="emailAuthBtn" name="emailAuthBtn" value="이메일 인증" class="mybtn"><br>
					
			</div>
			<input type="button" id="login" style= "display: none;" value="로그인"    class="leftbtn" onclick="location='custLog'">
			<input type="button" id="main" style= "display: none;" value="메인화면 가기" class="rightbtn" onclick="location='main'"><br>
			<br><button type="button" class="mybtn" onclick="window.history.back();">취소</button> 
	
		</form>
	 </div>
	 
	 <input type="hidden" id="hidden" value="">
</div>
</body>
</html>