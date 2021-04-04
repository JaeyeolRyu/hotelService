<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 회원 가입 </title>
<script src="js/jquery-3.4.1.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="css/mbrregstyle.css">

<style type="text/css">
.s1{color: red;}
</style>

<!-- CSS here -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/slicknav.css">
<link rel="stylesheet" href="css/animate.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/fontawesome-all.min.css">
<link rel="stylesheet" href="css/themify-icons.css">
<link rel="stylesheet" href="css/slick.css">
<link rel="stylesheet" href="css/nice-select.css">
<link rel="stylesheet" href="css/style.css">
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

<!-- JS here -->

<!-- All JS Custom Plugins Link Here here -->
<script src="js/vendor/modernizr-3.5.0.min.js"></script>

<!-- Jquery, Popper, Bootstrap -->
<script src="  js/vendor/jquery-1.12.4.min.js"></script>
<script src="  js/popper.min.js"></script>
<script src="  js/bootstrap.min.js"></script>
<!-- Jquery Mobile Menu -->
<script src="  js/jquery.slicknav.min.js"></script>

<!-- Jquery Slick , Owl-Carousel Plugins -->
<script src="  js/owl.carousel.min.js"></script>
<script src="  js/slick.min.js"></script>
<!-- One Page, Animated-HeadLin -->
<script src="  js/wow.min.js"></script>
<script src="  js/animated.headline.js"></script>
<script src="  js/jquery.magnific-popup.js"></script>

<!-- Scrollup, nice-select, sticky -->
<script src="  js/jquery.scrollUp.min.js"></script>
<script src="  js/jquery.nice-select.min.js"></script>
<script src="  js/jquery.sticky.js"></script>

<!-- contact js -->
<script src="js/contact.js"></script>
<script src="js/jquery.form.js"></script>
<script src="  js/jquery.validate.min.js"></script>
<script src="  js/mail-script.js"></script>
<script src="  js/jquery.ajaxchimp.min.js"></script>

<!-- Jquery Plugins, main Jquery -->
<script src="  js/plugins.js"></script>
<script src="  js/main.js"></script>


<script type="text/javascript">


	$(document).ready(function(){

	$("#custPw").keyup(function() {
		
		
		var pw1 = $("#custPw").val();
		var pw2 = $("#custPw2").val();
		var pwSize = pw1.length;
		
		if ( pwSize == 0 ) {
			
			$("#passEqual1").hide();		
			$("#passEqual2").hide();	
		}
		
		if ( pwSize > 0 && pwSize < 5 ) {
			
			$("#passEqual1").show();		
			
		} else {
			$("#passEqual1").hide();
		}
		
	})	
	
	$("#custPw2").keyup(function(){
		var pw1 = $("#custPw").val();
		var pw2 = $("#custPw2").val();
		var pwSize  = pw1.length;
		var pwSize2 = pw2.length;
		
		if ( pwSize == 0 || pwSize2 == 0) {
			
			$("#passEqual2").hide();
			$("#passEqual3").hide();
			return;
		}
		
		if ( pwSize > 0 && pwSize < 5 ) {
			return false;
		} 
		
		if(pw1==pw2) {
			$("#passEqual3").hide();
			$("#passEqual2").show();
			
		} else{
			$("#passEqual2").hide();
			$("#passEqual3").show();
			
		 }
	});
		
	$("#emailCheckBtn").click(function() {
		//이메일 값 얻어오기
		var input_value = $("input[name='custEmail']").val();
		
		// 입력여부 검사
		if(!input_value) {
			alert("이메일을 입력하세요.");
			$("input[name='custEmail']").focus();
			return false;
		}
		
		var url = "emailCheck.do";
		
		//get방식 ajax 연동
		$.getJSON(url, {
			"custEmail" : input_value
		}, function(json) {
			
			var result_text = json.result;
		
			var result = eval(result_text);
			
			// 결과 출력
			if(result) {
				alert("사용할 수 있는 이메일입니다.");
			} else {
				alert("이미 존재하는 이메일입니다.");
			}
	
		});
		
	
	});	
	
	$('#submitBtn').click(function () {
		
		var pw1 = $("#custPw").val();
		var pw2 = $("#custPw2").val();
		var pwSize = pw1.length;

		if($('#custEmail').val() == ''){
			alert("이메일 입력해 주세요.");
			$('#custPw').focus();
			return false;
		} 
		if($('#custPw').val() == ''){
			alert("비밀번호를 입력해 주세요.");
			$('#custName').focus();
			return false; 
		} 
		if($('#custPw2').val() == ''){
			alert("비밀번호 확인란을 입력해 주세요.");
			$('#custName').focus();
			return false; 
		}
		if($('#custName').val() == ''){
			alert("이름을 입력해 주세요.");
			$('#custName').focus();
			return false;
		}
		if($('#custTel').val() == ''){
			alert("전화번호를 입력해 주세요.");
			$('#custName').focus();
			return false; 
		}
		if ( pwSize < 5 ) {
			alert("비밀번호는 5자리 이상이어야 합니다.");
			return false;
		} 
		if ( pw1 != pw2 ) {
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		} 
		
		if(true) {
		$('#insertFrm').submit();

		alert("정상 가입 되었습니다.");
		}
	});
	
	
});
</script>
</head>
<body>

 
<div class="wrap" style="background-image: url('img/background2.jpg'); ">
    <div class="form-wrap" >    
		<form method = "post" id ="insertFrm" class="input-group"  action = "custInsert?div=mbr" >
			<a href="main"><img width="400px" style="left: 30px" src="img/logo/hocance.png" alt=""></a><br><br><br><br>
			<!-- 이메일<br><br> -->
			<input type="text" id="custEmail" name="custEmail" placeholder="이메일을 입력해주세요."  class="input-field">
			<input id="emailCheckBtn" type="button"  value="이메일 중복확인" class="rightbtn" style="color: white;"><br><br>
			<!-- <br>비밀번호 -->
			<input type="password" id="custPw" name="custPw" class="input-field" placeholder="비밀번호"><br><br>
			<input type="text" id="passEqual1" class="input-field2" style= "color: red; display: none;" value="비밀번호는 5자리 이상으로 입력해주세요" disabled>
			<!-- 비밀번호확인<br> --> 
			<input type="password" id="custPw2" class="input-field" placeholder="비밀번호 확인"><br><br>
			<input type="text" id="passEqual2" style="color: black; display: none;" class="input-field2" value="비밀번호가 일치합니다" disabled>
			<input type="text" id="passEqual3" style="color: red; display: none;" class="input-field2" value="비밀번호가 일치하지 않습니다" disabled>
			<!-- 이름<br> --> 
			<input type="text" id="custName" name="custName" class="input-field" placeholder="이름"><br><br>
			<!-- 전화번호<br> --> 
			<input type="text" id="custTel" name="custTel" class="input-field" placeholder="전화번호"><br><br>
				<table>
					<tr>
						<td width="800px" height="30px"></td>
					</tr>
					<tr>
						<td><input type="button" style="right: 20px; color: white;" id="submitBtn" value="가입하기" class="mybtn" ><br>
						
						</td>
					</tr>
					<tr>
						<td><input type="button" style="right: 20px; color: white; " id="cancelBtn"	value="취소" class="mybtn" onclick="location='main'">
						</td>
					</tr>
				</table>
			</form>
	</div>
</div>

</body>
</html>