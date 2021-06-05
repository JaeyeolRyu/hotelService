<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Travel HTML-5 Template</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="manifest" href="site.webmanifest">
<link rel="shortcut icon" type="image/x-icon"
	href="assets/img/favicon.ico">
<script src="js/jquery-3.4.1.min.js" type="text/javascript"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="js/calendar.js"></script>

<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<style>
/*다운로드한 글씨체 폰트 적용*/
@font-face {
	font-family: 'Jua', sans-serif;
}

body {
	font-family: Jua;
	font-size: 15px;
}

input {
	font-family: Jua;
	font-size: 15px;
}

button {
	font-family: Jua;
	font-size: 15px;
}

table {
	font-family: Jua;
	font-size: 15px;
}

tr {
	font-family: Jua;
	font-size: 15px;
}

td {
	font-family: Jua;
	font-size: 15px;
}

div {
	font-family: Jua;
	font-size: 15px;
}

a {
	font-family: Jua;
	font-size: 15px;
}

li {
	font-family: Jua;
	font-size: 15px;
}

ul {
	font-family: Jua;
	font-size: 15px;
}

#custlogin {
	font-family: Jua;
	font-size: 15px;
}

#custlogout {
	font-family: Jua;
	font-size: 15px;
}

#ingi {
	font-family: Jua;
}

nav {
	font-family: Jua;
	font-size: 15px;
}

{
font-family


:

 

Jua


;
font-size


:


15
px
;

	
			
			
			

}
span {
	font-family: Jua;
	font-size: 15px;
}
</style>
<!-- CSS here -->

<!--  <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/slicknav.css">
        <link rel="stylesheet" href="css/animate.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/fontawesome-all.min.css">
        <link rel="stylesheet" href="css/themify-icons.css">
        <link rel="stylesheet" href="css/slick.css">  -->
<link rel="stylesheet" href="css/slick.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- 이미지 css -->
<link rel="stylesheet" href="css/nice-select.css">
<link rel="stylesheet" href="css/style.css">

<script>
	$(document).ready(function() {

		$("#custLogin").click(function() {

		});

	});
</script>
</head>

<body>





	<!-- Preloader Start -->
	<header>
		<!-- Header Start -->
		<div class="header-area">
			<div class="main-header ">
				<div class="header-top top-bg d-none d-lg-block">
					<div class="container">
						<div class="row justify-content-between align-items-center">
							<div class="col-lg-8">
								<div class="header-info-left">
									<ul>
										<li>win100477@naver.com</li>
										<li>010-2787-9127</li>
										<li>have a nice day</li>

									</ul>

								</div>
							</div>
							<div class="col-lg-4">
								<div class="header-info-right f-right">
									<ul class="header-social">
										<li style="color: white"><c:if test="${CUSTNO != null }">${CUSTNAME }님, 환영합니다 .</c:if></li>
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
									<a href="main"><img width="200px"
										src="img/logo/hocance.png" alt=""></a>
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
 -->
												<li><a href="custLog" id="custLogin">로그인</a></li>
											</c:if>
											<c:if test="${CUSTNO != null }">
												<li><a href="custLogout" id="custLogout">로그아웃</a></li>
											</c:if>
											<c:if test="${CUSTNO != null }">
												<li><a href="#">마이페이지</a>
													<ul class="submenu">
														<li><a href="custSltOne">내정보</a></li>
														<li><a href="myResveList?CUSTNO=${CUSTNO}&PAGENO=1">주문내역</a></li>
														<li><a href="myEvlList">후기내역</a></li>


													</ul></li>
											</c:if>
											<c:if test="${CUSTADMIN}">
												<li><a href="#">관리자</a>
													<ul class="submenu">
														<li><a href="hotelAdSltMulti?value=0&PAGENO=1">호텔관리</a></li>
														<li><a href="custSltMulti?div=name&value=%&PAGENO=1">회원관리</a></li>
														<li><a
															href="evlSltMulti?div=hotelName&value=%&PAGENO=1">후기관리</a></li>

													</ul></li>
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



	<!-- slider Area Start-->
	<div class="slider-area ">
		<!-- Mobile Menu -->
		<div class="slider-active" style="height:">
			<div
				class="single-slider hero-overly  slider-height d-flex align-items-center"
				data-background="img/hero/mainimg.jpg">
				<div class="container">
					<div class="row">
						<div class="col-xl-9 col-lg-9 col-md-9">
							<div class="hero__caption">
								<h1>
									Welcome&nbsp;&nbsp;<span>To&nbsp;&nbsp;</span><span>Hocance!</span>
								</h1>
								<p>Reserve and Enjoy , Wherever you want</p>
							</div>
						</div>
					</div>
					<!-- Search Box -->
					<div class="row">
						<div class="col-xl-12">
							<!-- form -->
							<form action="hotelListMbr?PAGENO=1" class="search-box">
								<div class="input-form mb-30">
									<input type="text" name="value"
										placeholder="When Would you like to go ?">
								</div>
								<div>
									<input id="date" type="text" name="DATE" class="selector"
										value="" placeholder="체크인/체크아웃" />
									<script>
										$(".selector").flatpickr({

											mode : "range",

											dateFormat : "Y-m-d",

											minDate : "today",

											maxDate : new Date().fp_incr(90)

										});
									</script>


								</div>

								<div class="search-form mb-30">
									<input class="search-button" type="submit" value="호텔 검색" />
									<!-- <a href="">Search</a>  -->
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Favourite Places Start -->
	<div class="favourite-place place-padding">
		<div class="container">

			<div style="font-size: 30px;">인기 호텔</div>

			<div class="row">

				<c:forEach var="list" items="${HOTELLIST}">

					<div class="col-xl-3 col-lg-4 col-md-6">
						<div class="single-place mb-30">
							<div class="place-img">
								<a href="roomListMbr?hotelNo=${list.hotelNo }&PAGENO=1"> <img
									src="<c:url value="/resources/img/${list.hotelPhoto}"/>"
									style="width: 250px; height: 250px" />
								</a>
							</div>
							<div class="place-cap">
								<div class="place-cap-top">

									<h3>
										<a href="roomListMbr?hotelNo=${list.hotelNo }&PAGENO=1">${list.hotelNm }</a>
									</h3>
									<p class="dolor">
										<span></span>
									</p>
								</div>
								<!--   <div class="place-cap-bottom">
                                    <ul>
                                        <li><i class="far fa-clock"></i>3 Days</li>
                                        <li><i class="fas fa-map-marker-alt"></i>Los Angeles</li>
                                    </ul>
                                </div> -->
							</div>
						</div>
					</div>


				</c:forEach>



			</div>


		</div>

	</div>

	<!-- Favourite Places End -->



	<!-- Blog Area Start -->
	<div class="home-blog-area section-padding2">
		<div class="container">
			<!-- Section Tittle -->
			<div class="row">
				<div class="col-lg-12">
					<div class="section-tittle text-center">
						<span style="font-size: 25px; margin-right: 60px">이 도시는
							어때요?</span>
						<h2 id="ingi" style="margin-right: 60px">인기여행지</h2>
					</div>
				</div>
			</div>

			<div class="row">
				<table>
					<tr align="center">
						<td><a href="hotelListMbr?value=서울&PAGENO=1"><img
								width="200" src="img/서울.jpg"></a>
							<div align="center" style="font-size: 35px">서울</div></td>
						<td style="width: 100px">
						<td>
						<td><a href="hotelListMbr?value=부산&PAGENO=1"><img
								width="200" src="img/부산.jpg"></a>
							<div align="center" style="font-size: 35px">부산</div></td>
						<td style="width: 100px">
						<td>
						<td><a href="hotelListMbr?value=제주&PAGENO=1"><img
								width="200" src="img/제주.jpg"></a>
							<div align="center" style="font-size: 35px">제주</div></td>
						<td style="width: 100px">
						<td>
						<td><a href="hotelListMbr?value=강원&PAGENO=1"><img
								width="200" src="img/강원.jpg"></a>
							<div align="center" style="font-size: 35px">강원</div></td>
					</tr>



				</table>

			</div>
		</div>

	</div>
	<!-- Blog Area End -->


	<footer>
		<!-- Footer Start-->
		<div class="footer-area footer-padding footer-bg"
			data-background="img/service/footer_bg.jpg">
			<div class="container">
				<div class="row d-flex justify-content-between">
					<div class="col-xl-3 col-lg-3 col-md-5 col-sm-6">
						<div class="single-footer-caption mb-50">
							<div class="single-footer-caption mb-30">
								<!-- logo -->
								<div class="footer-logo">
									<a href="index.html"><img src="img/logo/logo2_footer.png"
										alt=""></a>
								</div>
								<div class="footer-tittle">
									<div class="footer-pera">
										<p>Lorem iaspsum doldfor sit amvset, consectetur
											adipisicing cvelit csed do eiusmod tempor incididucvccnt ut
											labovre.</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-2 col-lg-3 col-md-3 col-sm-5">
						<div class="single-footer-caption mb-50">
							<div class="footer-tittle">

								<h4>Quick Links</h4>
								<ul>
									<li><a href="#">About</a></li>
									<li><a href="#"> Offers Discounts</a></li>
									<li><a href="#"> Get Coupon</a></li>
									<li><a href="#"> Contact Us</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-lg-3 col-md-4 col-sm-7">
						<div class="single-footer-caption mb-50">
							<div class="footer-tittle">
								<h4>New Products</h4>
								<ul>
									<li><a href="#">Woman Cloth</a></li>
									<li><a href="#">Fashion Accessories</a></li>
									<li><a href="#"> Man Accessories</a></li>
									<li><a href="#"> Rubber made Toys</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-lg-3 col-md-5 col-sm-7">
						<div class="single-footer-caption mb-50">
							<div class="footer-tittle">
								<h4>Support</h4>
								<ul>
									<li><a href="#">Frequently Asked Questions</a></li>
									<li><a href="#">Terms Conditions</a></li>
									<li><a href="#">Privacy Policy</a></li>
									<li><a href="#">Privacy Policy</a></li>
									<li><a href="#">Report a Payment Issue</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<!-- Footer bottom -->
				<div class="row pt-padding">
					<div class="col-xl-7 col-lg-7 col-md-7">
						<div class="footer-copy-right">
							<p>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;
								<script>
									document.write(new Date().getFullYear());
								</script>
								All rights reserved | This template is made with <i
									class="ti-heart" aria-hidden="true"></i> by <a
									href="https://colorlib.com" target="_blank">Colorlib</a>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</p>
						</div>
					</div>
					<div class="col-xl-5 col-lg-5 col-md-5">
						<!-- social -->
						<div class="footer-social f-right">
							<a href="#"><i class="fab fa-twitter"></i></a> <a href="#"><i
								class="fab fa-facebook-f"></i></a> <a href="#"><i
								class="fab fa-behance"></i></a> <a href="#"><i
								class="fas fa-globe"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Footer End-->
	</footer>

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

</body>
</html>