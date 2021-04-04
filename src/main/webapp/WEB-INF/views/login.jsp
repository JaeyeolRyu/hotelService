
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="js/jquery-3.4.1.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="js/calendar.js"></script>
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
			}
						table{
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
	
	var res;
	
	$('#custLogin').click(function(){
		// 입력 값 체크
		if($('#email').val() == ''){
			alert("이메일을 입력해 주세요.");
			$('#email').focus();
			return false;
		
		}else if($('#pw').val() == ''){
			alert("패스워드를 입력해 주세요.");
			$('#pw').focus();
			return false;
		}
		var custEmail = $("#email").val();
		var custPw = $("#pw").val();
		
		$.ajax({
			
			type : "post",
			url  : "custLogin",
			data : {
				
				custEmail : custEmail,
				custPw : custPw,
				
			} ,
			success : function(data){
				
				res = data.RESULT;
				
 				if(!res.length == 0){
					alert(res);
					document.getElementById('login').reset();
					return false;
			} 
 				/* if(!res.equals(null)){
						alert("null로옴");
						document.getElementById('login').reset();
						return false;
				} 
				if( res != ""){
						alert("쌍따옴표");
						document.getElementById('login').reset();
						return false;
					}  */
				
				window.location.href = "main";

				
				
			},
			error:function(data){
				alert("에러가 발생했습니다.");
				return false;
			}
			
			
		});

	});
	
	
});
</script>


</head>
<body>

	<div class="wrap" style="background-image: url('img/background.jpg'); ">
	    <div class="form-wrap">
	        <form id="login" action="custLogin" class="input-group">
	       		<a href="main"><img width="270px" src="img/logo/hocance.png" alt=""></a>	       		
	          	<input type="text" 	   class="input-field" name="custEmail"  id="email" placeholder="이메일을 입력하세요" required>
	            <input type="password" class="input-field" name="custPw"	 id="pw"	placeholder="비밀번호를 입력하세요" required><br><br>
	           	<button type="button"  id="custLogin" class="mybtn">로그인</button><br>
	           	<button type="button"  class="mybtn" onclick="window.history.back();" >취소</button><br>
	           	<button type="button"  class="mybtn" onclick="location='emailFind'">이메일 찾기</button><br>
				<button type="button"  class="mybtn" onclick="location='sendEmail'">비밀번호 찾기</button>
	        </form>	        
	    </div>
	</div>
	
	<input type="text" class="selector" placeholder="날짜를 선택하세요." />
	
</body>
</html>