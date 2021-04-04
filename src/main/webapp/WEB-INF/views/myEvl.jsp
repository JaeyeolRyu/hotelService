<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<title>관리자 평가</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
	
	var no;

	
$('.evlDelete').click(function(evl){
	
	 	
	
	
	});
	
	
/* 		$("[id^='evlUpdate']").click(function() {
			
			var res = "<c:out value='${LIST}'/>"
			
			var btn = $(this).val();
			
			
			var aa =$("#no").val();
			
			 alert(res);
			
			window.open('evlUpdateView', '수정창','width=510, height=620, scrollbars=yes'); return false;
			
			
		})
 
	 */
	
	
	
	
	
	
	
});
	
	function evlDelete(evlNo) {

	 	
		var url = "evlDelete";	
	 		
	 	var res = confirm("정말 삭제 하시겠습니까?");
	 	
	 	if(res) {
	 		
	 	
	 	 $.getJSON(url, {
 			 
			 "evlNo" : evlNo
	 	
		 }, function(json){
			var msg = json.MSG;
			alert(msg);
			window.location.reload();

		 });  
	 	
	 	}else {
	 		return false;
	 	}
	 	
	}

/* 	function evlUpdate(evlNo) {
		
		
		window.open('evlUpdateView', '수정창','width=510, height=620, scrollbars=yes'); return false;
		
		
		
	} */


</script>
<style type="text/css">
#evlContent {
  width:300px;
  height:100px;
  font-size:20px;
}
/* 
#example-table-2 {

	width:100%;
	table-layout: fixed;

} */

h2{font-size:10px;}
.star-rating {width:138px;}
.star-rating,.star-rating span {display:inline-block; height:25px; overflow:hidden; background:url(img/star.png)no-repeat; }
.star-rating span {background-position:left bottom; line-height:0; vertical-align:top; }
 
* {
	box-sizing: border-box;
}
body {
	margin: 0;
	background: #eaedf1;
	font-family: 'Lato', sans-serif;
}
/* .header1 {
	background: white;
	padding: 30px;
	text-align: center;
}
.header1 h1 {
	font-weight: 300;
	display: inline;
} */
h2 {
	color: #89867e;
	text-align: center;
	font-weight: 300;
}
.color {
	width: 350px;
	margin: 0 auto;
}
.color li {
	margin: 0 15px 0 0;
	width: 30px;
	height: 30px;
	display: inline-block;
	border-radius: 100%;
}
.color .red    {background: #fa5a5a;}
.color .yellow {background: #f0d264;}
.color .green  {background: #82c8a0;}
.color .cyan   {background: #7fccde;}
.color .blue   {background: #6698cb;}
.color .purple {background: #cb99c5;}

.content, 
.content-gradient, 
.content-3d {
  margin: 40px auto;
}
.content {
  width: 80%;
  max-width: 700px;
}
.content-3d {
  width: 50%;
  max-width: 300px;
}
pre {
	width: 100%;
	padding: 30px;
	background-color: rgba(0, 0, 0, 0.72);
	color: #f8f8f2;
	border-radius: 0 0 4px 4px;
	margin-top: 20px;
  white-space: pre-wrap; /* css-3 */
  white-space: -moz-pre-wrap; /* Mozilla, since 1999 */
  white-space: -pre-wrap; /* Opera 4-6 */
  white-space: -o-pre-wrap; /* Opera 7 */
  word-wrap: break-word; /* Internet Explorer 5.5+ */
}
pre .bt  {color: #f8f8f2;} /* <> */
pre .anc {color: #f92672;} /* anchor tag */
pre .att {color: #a6a926;} /* attribute */
pre .val {color: #e6db74;} /* value */

.btn-container, .container1 {
	background-color: white;
	border-radius: 4px;
	text-align: center;
	margin-bottom: 40px;
}
.container1 h2 {
	padding-top: 30px;
	font-weight: 300;
}
.btn, .btn-two {
	margin: 9px;
}
.btn-gradient {
	margin: 5px;
}
a[class*="btn"] {text-decoration: none;}
input[class*="btn"], 
button[class*="btn"] {border: 0;}

/* Here you can change the button sizes */
.btn.large, 
.btn-two.large, 
.btn-effect.large {
  padding: 20px 40px; 
  font-size: 22px;
}
.btn.small, 
.btn-two.small, 
.btn-gradient.small, 
.btn-effect.small {
  padding: 8px 18px;  
  font-size: 14px;
}
.btn.mini, 
.btn-two.mini, 
.btn-gradient.mini, 
.btn-effect.mini {
  padding: 4px 12px;  
  font-size: 12px;
}
.btn.block, 
.btn-two.block, 
.btn-gradient.block, 
.btn-effect.block {
  display: block;
  width: 60%;
  margin-left: auto;
  margin-right: auto;
  text-align: center;
}
.btn-gradient.large {
  padding: 15px 45px; 
  font-size: 22px;
}

/* Colors for .btn and .btn-two */
.btn.blue, .btn-two.blue     {background-color: #7fb1bf;}
.btn.green, .btn-two.green   {background-color: #9abf7f;}
.btn.red, .btn-two.red       {background-color: #fa5a5a;}
.btn.purple, .btn-two.purple {background-color: #cb99c5;}
.btn.cyan, .btn-two.cyan     {background-color: #7fccde;}
.btn.yellow, .btn-two.yellow {background-color: #f0d264;}

.rounded {
  border-radius: 10px;
}

/* default button style */
.btn {
	position: relative;
	border: 0;
	padding: 15px 25px;
	display: inline-block;
	text-align: center;
	color: white;
}
.btn:active {
	top: 4px;	
}

/* color classes for .btn */
.btn.blue {box-shadow: 0px 4px #74a3b0;}
.btn.blue:active {box-shadow: 0 0 #74a3b0; background-color: #709CA8;}

.btn.green {box-shadow: 0px 4px 0px #87a86f;}
.btn.green:active {box-shadow: 0 0 #87a86f; background-color: #87a86f;}

.btn.red {box-shadow:0px 4px 0px #E04342;}
.btn.red:active {box-shadow: 0 0 #ff4c4b; background-color: #ff4c4b;}

.btn.purple {box-shadow:0px 4px 0px #AD83A8;}
.btn.purple:active {box-shadow: 0 0 #BA8CB5; background-color: #BA8CB5;}

.btn.cyan {box-shadow:0px 4px 0px #73B9C9;}
.btn.cyan:active {box-shadow: 0 0 #73B9C9; background-color: #70B4C4;}

.btn.yellow {box-shadow:0px 4px 0px #D1B757;}
.btn.yellow:active {box-shadow: 0 0 #ff4c4b; background-color: #D6BB59;}

/* Button two - I have no creativity for names */
.btn-two {
	color: white;	
	padding: 15px 25px;
	display: inline-block;
	border: 1px solid rgba(0,0,0,0.21);
	border-bottom-color: rgba(0,0,0,0.34);
	text-shadow:0 1px 0 rgba(0,0,0,0.15);
	box-shadow: 0 1px 0 rgba(255,255,255,0.34) inset, 
				      0 2px 0 -1px rgba(0,0,0,0.13), 
				      0 3px 0 -1px rgba(0,0,0,0.08), 
				      0 3px 13px -1px rgba(0,0,0,0.21);
}
.btn-two:active {
	top: 1px;
	border-color: rgba(0,0,0,0.34) rgba(0,0,0,0.21) rgba(0,0,0,0.21);
	box-shadow: 0 1px 0 rgba(255,255,255,0.89),0 1px rgba(0,0,0,0.05) inset;
	position: relative;
}
/* 3D Button */
.btn-3d {
	position: relative;
	display: inline-block;
	font-size: 22px;
	padding: 20px 60px;
	color: white;
	margin: 20px 10px 10px;
	border-radius: 6px;
	text-align: center;
	transition: top .01s linear;
	text-shadow: 0 1px 0 rgba(0,0,0,0.15);
}
.btn-3d.red:hover    {background-color: #e74c3c;}
.btn-3d.blue:hover   {background-color: #699DD1;}
.btn-3d.green:hover  {background-color: #80C49D;}
.btn-3d.purple:hover {background-color: #D19ECB;}
.btn-3d.yellow:hover {background-color: #F0D264;}
.btn-3d.cyan:hover   {background-color: #82D1E3;}

.btn-3d:active {
	top: 9px;
}

/* 3D button colors */
.btn-3d.red {
	background-color: #e74c3c;
	box-shadow: 0 0 0 1px #c63702 inset,
        0 0 0 2px rgba(255,255,255,0.15) inset,
        0 8px 0 0 #C24032,
        0 8px 0 1px rgba(0,0,0,0.4),
				0 8px 8px 1px rgba(0,0,0,0.5);
}
.btn-3d.red:active {
	box-shadow: 0 0 0 1px #c63702 inset,
				0 0 0 2px rgba(255,255,255,0.15) inset,
				0 0 0 1px rgba(0,0,0,0.4);
}

.btn-3d.blue {
	background-color: #6DA2D9;
	box-shadow: 0 0 0 1px #6698cb inset,
				0 0 0 2px rgba(255,255,255,0.15) inset,
				0 8px 0 0 rgba(110, 164, 219, .7),
				0 8px 0 1px rgba(0,0,0,.4),
				0 8px 8px 1px rgba(0,0,0,0.5);
}
.btn-3d.blue:active {
	box-shadow: 0 0 0 1px #6191C2 inset,
				0 0 0 2px rgba(255,255,255,0.15) inset,
				0 0 0 1px rgba(0,0,0,0.4);
}

.btn-3d.green {
	background-color: #82c8a0;
	box-shadow: 0 0 0 1px #82c8a0 inset,
				0 0 0 2px rgba(255,255,255,0.15) inset,
				0 8px 0 0 rgba(126, 194, 155, .7),
				0 8px 0 1px rgba(0,0,0,.4),
				0 8px 8px 1px rgba(0,0,0,0.5);
}
.btn-3d.green:active {
	box-shadow: 0 0 0 1px #82c8a0 inset,
				0 0 0 2px rgba(255,255,255,0.15) inset,
				0 0 0 1px rgba(0,0,0,0.4);
}

.btn-3d.purple {
	background-color: #cb99c5;
	box-shadow: 0 0 0 1px #cb99c5 inset,
				0 0 0 2px rgba(255,255,255,0.15) inset,
				0 8px 0 0 rgba(189, 142, 183, .7),
				0 8px 0 1px rgba(0,0,0,.4),
				0 8px 8px 1px rgba(0,0,0,0.5);
}
.btn-3d.purple:active {
	box-shadow: 0 0 0 1px #cb99c5 inset,
				0 0 0 2px rgba(255,255,255,0.15) inset,
				0 0 0 1px rgba(0,0,0,0.4);
}

.btn-3d.cyan {
	background-color: #7fccde;
	box-shadow: 0 0 0 1px #7fccde inset,
				0 0 0 2px rgba(255,255,255,0.15) inset,
				0 8px 0 0 rgba(102, 164, 178, .6),
				0 8px 0 1px rgba(0,0,0,.4),
				0 8px 8px 1px rgba(0,0,0,0.5);
}
.btn-3d.cyan:active {
	box-shadow: 0 0 0 1px #7fccde inset,
				0 0 0 2px rgba(255,255,255,0.15) inset,
				0 0 0 1px rgba(0,0,0,0.4);
}

.btn-3d.yellow {
	background-color: #F0D264;
	box-shadow: 0 0 0 1px #F0D264 inset,
				0 0 0 2px rgba(255,255,255,0.15) inset,
				0 8px 0 0 rgba(196, 172, 83, .7),
				0 8px 0 1px rgba(0,0,0,.4),
				0 8px 8px 1px rgba(0,0,0,0.5);
}
.btn-3d.yellow:active {
	box-shadow: 0 0 0 1px #F0D264 inset,
				0 0 0 2px rgba(255,255,255,0.15) inset,
				0 0 0 1px rgba(0,0,0,0.4);
}

/* Gradient buttons */
.btn-gradient {
	text-decoration: none;
	color: white;
	padding: 10px 30px;
	display: inline-block;
	position: relative;
	border: 1px solid rgba(0,0,0,0.21);
	border-bottom: 4px solid rgba(0,0,0,0.21);
	border-radius: 4px;
	text-shadow: 0 1px 0 rgba(0,0,0,0.15);
}
/* Gradient - ugly css is ugly */
.btn-gradient.cyan {
	background: rgba(27,188,194,1);
	background: -webkit-gradient(linear, 0 0, 0 100%, from(rgba(27,188,194,1)), to(rgba(24,163,168,1)));
	background: -webkit-linear-gradient(rgba(27,188,194,1) 0%, rgba(24,163,168,1) 100%);
	background: -moz-linear-gradient(rgba(27,188,194,1) 0%, rgba(24,163,168,1) 100%);
	background: -o-linear-gradient(rgba(27,188,194,1) 0%, rgba(24,163,168,1) 100%);
	background: linear-gradient(rgba(27,188,194,1) 0%, rgba(24,163,168,1) 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#1bbcc2', endColorstr='#18a3a8', GradientType=0);
}

.btn-gradient.red{ 
	background: rgba(250,90,90,1);
	background: -webkit-gradient(linear, 0 0, 0 100%, from(rgba(250,90,90,1)), to(rgba(232,81,81,1)));
	background: -webkit-linear-gradient(rgba(250,90,90,1) 0%, rgba(232,81,81,1) 100%);
	background: -moz-linear-gradient(rgba(250,90,90,1) 0%, rgba(232,81,81,1) 100%);
	background: -o-linear-gradient(rgba(250,90,90,1) 0%, rgba(232,81,81,1) 100%);
	background: linear-gradient(rgba(250,90,90,1) 0%, rgba(232,81,81,1) 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#fa5a5a', endColorstr='#e85151', GradientType=0 );
}
.btn-gradient.orange {
	background: rgba(255,105,30,1);
	background: -webkit-gradient(linear, 0 0, 0 100%, from(rgba(255,105,30,1)), to(rgba(230,95,28,1)));
	background: -webkit-linear-gradient(rgba(255,105,30,1) 0%, rgba(230,95,28,1) 100%);
	background: -moz-linear-gradient(rgba(255,105,30,1) 0%, rgba(230,95,28,1) 100%);
	background: -o-linear-gradient(rgba(255,105,30,1) 0%, rgba(230,95,28,1) 100%);
	background: linear-gradient(rgba(255,105,30,1) 0%, rgba(230,95,28,1) 100%);
}
.btn-gradient.blue {
	background: rgba(102,152,203,1);
	background: -moz-linear-gradient(top, rgba(102,152,203,1) 0%, rgba(92,138,184,1) 100%);
	background: -webkit-gradient(left top, left bottom, color-stop(0%, rgba(102,152,203,1)), color-stop(100%, rgba(92,138,184,1)));
	background: -webkit-linear-gradient(top, rgba(102,152,203,1) 0%, rgba(92,138,184,1) 100%);
	background: -o-linear-gradient(top, rgba(102,152,203,1) 0%, rgba(92,138,184,1) 100%);
	background: -ms-linear-gradient(top, rgba(102,152,203,1) 0%, rgba(92,138,184,1) 100%);
	background: linear-gradient(to bottom, rgba(102,152,203,1) 0%, rgba(92,138,184,1) 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#6698cb', endColorstr='#5c8ab8', GradientType=0 );
}
.btn-gradient.purple { 
	background: rgba(203,153,197,1);
	background: -moz-linear-gradient(top, rgba(203,153,197,1) 0%, rgba(181,134,176,1) 100%);
	background: -webkit-gradient(left top, left bottom, color-stop(0%, rgba(203,153,197,1)), color-stop(100%, rgba(181,134,176,1)));
	background: -webkit-linear-gradient(top, rgba(203,153,197,1) 0%, rgba(181,134,176,1) 100%);
	background: -o-linear-gradient(top, rgba(203,153,197,1) 0%, rgba(181,134,176,1) 100%);
	background: -ms-linear-gradient(top, rgba(203,153,197,1) 0%, rgba(181,134,176,1) 100%);
	background: linear-gradient(to bottom, rgba(203,153,197,1) 0%, rgba(181,134,176,1) 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#cb99c5', endColorstr='#b586b0', GradientType=0 );
}
.btn-gradient.yellow {
	background: rgba(240,210,100,1);
	background: -webkit-gradient(linear, 0 0, 0 100%, from(rgba(240,210,100,1)), to(rgba(229,201,96,1)));
	background: -webkit-linear-gradient(rgba(240,210,100,1) 0%, rgba(229,201,96,1) 100%);
	background: -moz-linear-gradient(rgba(240,210,100,1) 0%, rgba(229,201,96,1) 100%);
	background: -o-linear-gradient(rgba(240,210,100,1) 0%, rgba(229,201,96,1) 100%);
	background: linear-gradient(rgba(240,210,100,1) 0%, rgba(229,201,96,1) 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f0d264', endColorstr='#e5c960', GradientType=0 );
}
.btn-gradient.green {
	background: rgba(130,200,160,1);
	background: -moz-linear-gradient(top, rgba(130,200,160,1) 0%, rgba(130,199,158,1) 100%);
	background: -webkit-gradient(left top, left bottom, color-stop(0%, rgba(130,200,160,1)), color-stop(100%, rgba(130,199,158,1)));
	background: -webkit-linear-gradient(top, rgba(130,200,160,1) 0%, rgba(130,199,158,1) 100%);
	background: -o-linear-gradient(top, rgba(130,200,160,1) 0%, rgba(130,199,158,1) 100%);
	background: -ms-linear-gradient(top, rgba(130,200,160,1) 0%, rgba(130,199,158,1) 100%);
	background: linear-gradient(to bottom, rgba(130,200,160,1) 0%, rgba(124, 185, 149, 1) 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#82c8a0', endColorstr='#82c79e', GradientType=0 );
}

.btn-gradient.red:active 	  {background: #E35252;}
.btn-gradient.orange:active {background: #E8601B;}
.btn-gradient.cyan:active 	{background: #169499;}
.btn-gradient.blue:active 	{background: #608FBF;}
.btn-gradient.purple:active {background: #BD8EB7;}
.btn-gradient.yellow:active {background: #DBC05B;}
.btn-gradient.green:active  {background: #72B08E;}
 
</style>
</head>
<body>




    <!-- Preloader Start -->


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
   

<p>
<div style="width: 1000px; margin-left: 10%;" >
<form method = "post" id="form1" action = "evlSltMulti?PAGENO=${PAGENO}">


<!-- <div class="wrap-star">
	<h2>width="30%"</h2>
	<div class='star-rating'>
		<span style ="width:30%"></span>	
	</div>
</div>

<div class="wrap-star">
	<h2>width="50%"</h2>
	<div class='star-rating'>
		<span style ="width:50%"></span>	
	</div>
</div>

<div class="wrap-star">
	<h2>width="75%"</h2>
	<div class='star-rating'>
		<span style ="width:75%"></span>	
	</div>
</div>
 -->
 <div >
<c:forEach var = "DTO" items="${LIST}">
<table id="example-table-2" width="80%;" style="background-color: #eee4f7; border-radius: 20px;" >
	
		<tr id = "listId" class="list" height = "80" >
			
			<td align = "left" style="" height="30px;" width="150;" >
				<div style="margin-left: 20px">
					${DTO.hotelName}
				</div>
			</td>
			
			<td></td>
		</tr>
		<tr>
			<td>
				<div class="wrap-star" style="margin-left: 20px" >
					<div class='star-rating'>
						<span style ="width:${DTO.evlScore}%" ></span>	
					</div>
				</div>
			</td>
			<td align="right">
			
				<input type="submit" value="수정" class="btn-gradient blue mini" onclick="window.open('evlUpdateView?evlNo=${DTO.evlNo}', '후기등록', 'width=510, height=350, left= 250 top= 100'); return false;">
				<input type="hidden" id="evlNo" value="${DTO.evlNo}">	
				<input type="button" style="margin-right: 20px" class="evlDelete btn-gradient blue mini" value="삭제" onclick="evlDelete('${DTO.evlNo}')" >
			</td>
		</tr>
		<tr>
			<td align = "left"  height="100px" style="text-overflow:ellipsis; overflow:hidden;"  colspan="2" >
				<div style="margin-left: 20px">
					${DTO.evlContent}
				</div>
			</td>	
		</tr>
</table>

<br><br><br>
</c:forEach>
</div>	
</form>


</div>
</body>
</html>