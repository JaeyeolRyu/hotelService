
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<meta name="viewport" content="width=640, user-scalable=yes">

<script src="js/jquery-3.4.1.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="css/mypagestyle.css">

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

<!-- JS here -->


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


	$(document).ready(function() {

		$("#updateBtn").click(function() {
			
			if($.trim($('#custPw').val()) == ''){
				alert("비밀번호를 입력해 주세요.");
				$('#custPw').focus();
				return;
			}else if($('#custName').val() == ''){
				alert("이름을 입력해 주세요.");
				$('#custName').focus();
				return;
			}
			
			$('#updateFrm').submit();

		});
		
		$(document).on('click', '[name=changePwBtn]', function(event) {  	
			
			$('#addDiv').show();
		})
		
		$(document).on('click', '[name=updatePwBtn]', function(event) {
			
			var custEmail = $('#custEmail').val();
			var custPw = $('#custPw').val();			
			var oldPw = $('#oldPw').val();
			var newPw = $('#newPw').val();
			var newPwCheck = $('#newPwCheck').val();

			var pwSize = newPw.length;
			
			if ( pwSize < 5 ) {
				alert("비밀번호는 5자리 이상이어야 합니다.");
				return;
			}
			
			if( custPw != oldPw ) {
				alert("기존비밀번호가 일치하지 않습니다.");
				return;
			}
			
			if( newPw != newPwCheck ) { 
				alert("비밀번호가 일치하지 않습니다");
				return;
			} 
			
			
			$.ajax({
				
				type:"get",
				url:"custPwUpdate",
				data : {

					newPw    : newPw,
					
				},
				success:function(data){
					
					alert("정상 처리되었습니다.");
					$("#addDiv").hide();
					$("#custPw").val(newPw);
					$('#oldPw').val("");
					$('#newPw').val("");
					$('#newPwCheck').val("");
				},
				error:function(data){
					alert("에러가 발생했습니다.");
				}
			});	
			
			
		 	
		})
		
		$(document).on('click', '[name=cancelBtn]', function(event) {
			$('#addDiv').hide();	

		})
		
		$("#newPw").keyup(function() {
			
			var pw1 = $("#newPw").val();
			var pw2 = $("#newPwCheck").val();
			var pwSize = pw1.length;
			var pwSize2 = pw1.length;
			
			if ( pwSize == 0 ) {
				
				$("#passEqual1").hide();		
				$("#passEqual2").hide();
				$("#passEqual3").hide();
			}
			
			if ( pwSize > 0 && pwSize < 5 ) {
				$("#passEqual1").show();
				
			} else {
				$("#passEqual1").hide();
			}
			
		})
		
		
		$("#newPwCheck").keyup(function(){
			
			var pw1 = $("#newPw").val();
			var pw2 = $("#newPwCheck").val();
			var pwSize = pw1.length;
			var pwSize2 = pw1.length;
			
			if ( pwSize == 0 || pwSize2 == 0) {
				
				$("#passEqual2").hide();
				$("#passEqual3").hide();
				return;
			}
			
			
			if(pw1==pw2) {
				$("#passEqual1").hide();
				$("#passEqual3").hide();
				$("#passEqual2").show();
				
			} else{
				$("#passEqual1").hide();
				$("#passEqual2").hide();
				$("#passEqual3").show();
			}
			
			
		});
		
		$("#deleteBtn").click(function() {
					 
			var result;
			var custEmail = $('#custEmail').val();
			
			
			result = confirm("정말로 탈퇴 하시겠습니까?");
			
			if(result) {
			
				$.ajax ({
				
					type:"get",
					url:"custCancel",
					data : {
						custEmail : custEmail,
					},
					success:function(data){
						
						alert("정상 탈퇴 되었습니다.그동안 이용해 주셔서 감사합니다.");
	
					},
					error:function(data){
						alert("에러가 발생했습니다.");
					}
				});	
					
					
			}				
				
		})
	
		
	});	
		
</script>

</head>
<body>
 <!-- Preloader Start -->
    <header>
        <!-- Header Start -->
       <div class="header-area" >
            <div class="main-header ">
                <div class="header-top top-bg d-none d-lg-block">
                   <div class="container">
                    <div class="row justify-content-between align-items-center">
                        <div class="col-lg-8">
                            <div class="header-info-left">
                                <ul>                          
                                    <li>leedonggu1@naver.com</li>
                                    <li>010-7377-9128</li>
                                    <li>have a nice day</li>
                             
                                </ul>
                                
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="header-info-right f-right">
                                <ul class="header-social">    
                                    <li  style="color: white"> <c:if test="${CUSTNO != null }">${CUSTNAME }님, 환영합니다 .</c:if></li>
                                </ul>
                            </div>
                        </div>
                       </div>
                   </div>
                </div>
               <div class="header-bottom  header-sticky">
                    <div class="container">
                        <div class="row align-items-center">
                            <!-- Logo -->
                            <div class="col-xl-2 col-lg-2 col-md-1">
                                <div class="logo">
                                  <a href="main"><img width="200px" src="img/logo/hocance.png" alt=""></a>
                                </div>
                            </div>
                            <div class="col-xl-10 col-lg-10 col-md-10">
                                <!-- Main-menu -->
                                <div class="main-menu f-right d-none d-lg-block">
                                    <nav>          
                                    <!--목록-->     
                                        <ul id="navigation">
                                        	<c:if test="${CUSTNO == null }">                                                                                                                                     
                                            <li><a href="custMbrReg">회원가입</a></li>
                                            </c:if>
                                            <c:if test="${CUSTNO == null }">
<!--                                              <li><a href="custLog" id="custLogin" onclick="window.open(this.href,'로그인','width=510, height=500, left=670, top=230'); return false;">로그인</a></li>
 -->                                            <li><a href="custLog" id="custLogin" >로그인</a></li> 
                                            </c:if>
                                            <c:if test="${CUSTNO != null }">
                                            <li><a href="custLogout" id="custLogout"  >로그아웃</a></li>
                                            </c:if>
                                            <c:if test="${CUSTNO != null }">
                                                <li><a href="#">마이페이지</a>                         
                                                <ul class="submenu">
                                                    <li><a href="custSltOne">내정보</a></li>
                                                    <li><a href="myResveList?CUSTNO=${CUSTNO}&PAGENO=1">주문내역</a></li>
                                                    <li><a href="myEvlList">후기내역</a></li>
                                                   
                                                    
                                                </ul>
                                            </li>
                                            </c:if>
                                            <c:if test="${CUSTADMIN}">
                                            <li><a href="#">관리자</a>                         
                                                <ul class="submenu">
                                                    <li><a href="hotelAdSltMulti?value=0&PAGENO=1">호텔관리</a></li>
                                                    <li><a href="custSltMulti?div=name&value=%&PAGENO=1">회원관리</a></li>
                                                    <li><a href="evlSltMulti?div=hotelName&value=%&PAGENO=1">후기관리</a></li>
                                               
                                                </ul>
                                            </li>
                                            </c:if>
                                    
                                           
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                            <!-- Mobile Menu -->
                            <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none"></div>
                            </div>
                        </div>
                    </div>
               </div>
            </div>
       </div>
        <!-- Header End -->
    </header>

    

    
    
    <div class="wrap" style="background-image: url('img/background3.jpg'); ">
	    <div class="form-wrap">
	        <form id="updateFrm" action="custUpdate" class="input-group">	  
	        <div style="left: 100">
	        <c:choose>
	        	<c:when test="${CUSTDTO.custGrade == 0101 }"><img width="50" src="img/bronze.png" /> 고객님의 등급은 BRONZE입니다.</c:when>
	        	<c:when test="${CUSTDTO.custGrade == 0102 }"><img width="50" src="img/silver.png">고객님의 등급은 SILVER입니다.</c:when>
	        	<c:when test="${CUSTDTO.custGrade == 0103 }"><img width="50" src="img/gold.png">고객님의 등급은 GOLD입니다.</c:when>
	        	<c:when test="${CUSTDTO.custGrade == 0104 }"><img width="50" src="img/platinum.png">고객님의 등급은 PLATINUM입니다.</c:when>
	        	<c:when test="${CUSTDTO.custGrade == 0105 }"><img width="50" src="img/diamond.png">고객님의 등급은  DIAMOND입니다.</c:when>
	        </c:choose>
	       		<br><br><img width="50" src="img/milage.png"> 고객님의 마일리지는 ${CUSTDTO.custMilage }원 입니다.
	        </div>
	        <table  style="width: 800px">
	        	<tr>
	        		<td>
	        			이메일
	        		</td>
	        		<td>
	        			<input type="text" class="input-field" id="custEmail" name="custEmail" value="${CUSTDTO.custEmail }" readonly>
	        		</td>
	        	</tr>				
	         	<tr>
	         		<td>
	         			이름 
	         		</td>
	         		<td>
	         			<input type="text" class="input-field" id="custName"  name="custName"  value="${CUSTDTO.custName }" >
	         		</td>
	         	</tr>
	         	<tr>
	         		<td>
	         			비밀번호
	         		</td>
	         		<td>
	         			<input type="password" class="input-field" id="custPw" name="custPw"  value="${CUSTDTO.custPw}"readonly>
	         			<input type="button" class="rightbtn" id="changePwBtn" style="color: white;" name="changePwBtn"value="비밀번호 변경">
	         		</td>     		
	         	</tr>
	       		<tr>
	       		<td>
	       		</td>
		         	<td>
		         		<table  id="addDiv" style= "font-size:12px; display: none;width: 300px" >
		         			<tr>
		         				<td> 
		         					<input type="password" class="input-field" id="oldPw" name="oldPw" placeholder="현재 비밀번호 " value="">
		         				</td>
		         			</tr>
		         			<tr>
		         				<td> 
		         					<input type="password" class="input-field" id="newPw" name="newPw" placeholder="새 비밀번호 " value="">
		         					<input type="text" id="passEqual1" class="input-field2" style= "color:red; display: none;" value="비밀번호는 5자리 이상이어야 합니다." disabled>
		         				</td>
		         			</tr>
   					        <tr>
		         				<td> 
		         					 <input type="password" class="input-field" id="newPwCheck" name="newPwCheck" placeholder="새 비밀번호 확인" value="">
		         					 <input type="text" id="passEqual2" class="input-field2" style= "color:black; display: none;" value="비밀번호가 일치합니다" disabled >
		         					 <input type="text" id="passEqual3" class="input-field2" style= "color:red; display: none;" value="비밀번호가 일치하지 않습니다" disabled >
		         				</td>
		         			</tr>
		         			<tr>
		         				<td> 
		         					<input type="button" class="leftbtn"  id="updatePwBtn" style="color: white;" name="updatePwBtn" value="변경하기"> 
		         					<input type="button" class="rightbtn" id="cancelBtn"   style="color: white;" name="cancelBtn"   value="취소">
		         				</td>
		         			</tr>
		         		</table>
		         	</td>
		        </tr>
		        <tr>
		        	<td>
		        		전화번호
		        	</td>
		         	<td>	
		         		<input type="text" class="input-field" id="custTel" name="custTel" value="${CUSTDTO.custTel }">
		         	</td> 
		        </tr>
		        <tr>
		        	<td>
		        		가입일 
		        	</td>
		        	<td>	
		       			<input type="text" class="input-field" id="regDate" name="regDate" value="${CUSTDTO.custRegDate}" readonly >
		       		</td>
		        </tr>
		        <tr>
		        	<td>   		
		        	</td> 
		        	<td>
		        		<input type="submit" class="leftbtn"  id="updateBtn" style="color: white;" value="수정하기">
		        		<input type="button" class="rightbtn" id="deleteBtn" style="color: white;" value="탈퇴하기" onclick="location='main'">
		        	</td> 
				</tr>	          
	        
	         </table>     
	         
	           	<%-- 이메일    <input type="text" class="input-field" id="custEmail" name="custEmail" value="${CUSTDTO.custEmail }" readonly>
	           	이름       <input type="text" class="input-field" id="custName"  name="custName"  value="${CUSTDTO.custName }" >
	          	비밀번호 <input type="password" class="input-field" id="custPw" name="custPw"  value="${CUSTDTO.custPw}"readonly>	 	 
	           	      <input type="button" class="mybtn" id="changePwBtn" name="changePwBtn"value="비밀번호 변경"><br>
	           
	           	<div id="addDiv" style= "display: none;"> 
				  <input type="password" class="input-field" id="oldPw" name="oldPw" placeholder="현재 비밀번호 " value=""><br>
				  <input type="password" class="input-field" id="newPw" name="newPw" placeholder="새 비밀번호 " value=""><span id="passEqual1" style= "color:red; display: none;">비밀번호는 5자리 이상이어야 합니다.</span><br>
				  <input type="password" class="input-field" id="newPwCheck" name="newPwCheck" placeholder="새 비밀번호 확인" value=""><span id="passEqual2">비밀번호를 한번 더 입력하세요</span><br>
				  <input type="button" class="leftbtn"  id="updatePwBtn" name="updatePwBtn" value="변경하기">
				  <input type="button" class="rightbtn" id="cancelBtn"   name="cancelBtn"   value="취소">
				</div>
	           	
	           	전화번호 <input type="text" class="input-field" id="custTel" name="custTel" value="${CUSTDTO.custTel }">
	           	가입일   <input type="text" class="input-field" id="regDate" name="regDate" value="${CUSTDTO.custRegDate}" readonly >
	           	
				<input type="submit" class="leftbtn"  id="updateBtn" value="수정하기">
				<input type="button" class="rightbtn" id="deleteBtn" value="탈퇴하기" onclick="location='main'">	 --%>           	
	        </form>	        
	    </div>
	</div>

</body>
</html>