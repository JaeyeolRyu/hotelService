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
	font-size: 17px;
}

button {
	font-family: Jua;
	font-size: 17px;
}

table {
	font-family: Jua;
	font-size: 17px;
}

tr {
	font-family: Jua;
	font-size: 17px;
}

td {
	font-family: Jua;
	font-size: 17px;
}

div {
	font-family: Jua;
	font-size: 17px;
}

img {
	font-family: Jua;
	font-size: 17px;
}
</style>
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="js/calendar.js"></script>
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
<link rel="stylesheet" href="css/star.css">
<title>jquery-circle-progress - jQuery Plugin to draw animated
	circular progress bars</title>

<style type="text/css">
#evlContent {
	width: 400px;
	height: 100px;
	font-size: 20px;
}
/* 
#example-table-2 {

	width:100%;
	table-layout: fixed;

} */
h2 {
	font-size: 10px;
}

.star-rating {
	width: 138px;
}

.star-rating, .star-rating span {
	display: inline-block;
	height: 25px;
	overflow: hidden;
	background: url(img/star.png) no-repeat;
}

.star-rating span {
	background-position: left bottom;
	line-height: 0;
	vertical-align: top;
}

* {
	box-sizing: border-box;
}

body {
	margin: 0;
	background: #eaedf1;
	font-family: 'Lato', sans-serif;
}
</style>



<script type="text/javascript">
	var list = '<c:out value="${VALUE}"/>';
	var pageNo = parseInt('<c:out value="${PAGENO}"/>') + 1;
	var date = '<c:out value="${DATE}"/>';
	var checkin = '<c:out value="${CHECKIN}"/>';
	var checkout = '<c:out value="${CHECKOUT}"/>'

	$(document)
			.on(
					"click",
					".next",
					function() {

						var content;

						var table = "";
						var url = "jsondelete.do"

						$
								.ajax({
									url : 'jsondelete.do',
									type : 'post',
									dataType : 'json',
									data : {
										VALUE : list,
										PAGENO : pageNo,
									},
									success : function(data) {
										$('.next').hide();
										pageNo = pageNo + 1;
										$
												.each(
														data,
														function(index, entry) {

															table += "<table border='1' style='width: 1050px ; height:200px; border-style: groove ; border-color:rgb(149, 165, 166); border-top-color:rgb(76, 117, 177);border-top-width: 10px '>";
															table += "<tr>";
															table += "<td width='280' ><img src='<c:url value='/resources/img/"+entry.hotelPhoto+"'/>' height='200px' width='300px'/></td>";
															table += "<td width='260px' valign='top'><div style='font-size: 25px; font-style:inherit; '>"
																	+ entry.hotelNm
																	+ "</div><br>"
																	+ entry.hotelAddress
																	+ " <br>☎"
																	+ entry.hotelTel
																	+ " <br><a href='#' style='color: black''>"
																	+ entry.hotelHomepage
																	+ "</a></td>";

															table += " <td width='210px' style='font-size: 20px'>  <div class='wrap-star' ><table><tr><td><div class='star-rating'><span style ='width:"
																	+ entry.evlAvg
																	* 20
																	+ "%'></span></div></td>";
															table += "<td style='font-size: 15px'>"
																	+ entry.evlAvg
																	+ "</td></tr></table></div></td>";

															table += "<td  align='center' width='150px'>￦49,999</td>";
															table += "<td align='center' width=:'100px'><a href='roomListMbr?hotelNo="
																	+ entry.hotelNo
																	+ "&CHECKIN="
																	+ checkin
																	+ "&CHECKOUT="
																	+ checkout
																	+ "&DATE="
																	+ date
																	+ "'><div style='color:black'><input type='button' value='예약' style='width: 100px; background: rgb(76, 117, 177);color:white; border-radius:20px' /></div></a></td>";
															table += "</tr>";
															table += "</table><br>";

															if (index > 3) {
																table += '<input class="next" type="button"  value="더보기" style=" background: rgb(76, 117, 177);color:white; border-radius:20px ">';
															}

														});

										$('#show').append(table);

									}
								});

					});

	/*        
	 table += " <td style='font-size: 20px'>  <div class='wrap-star' ><table><tr><td><div class='star-rating'><span style ='width:${list.evlAvg*20}%' ></span>	</div></td>"
	 table += "<td style='font-size: 20px'>&nbsp;&nbsp;${list.evlAvg}</td></tr></table></div></td>" */
</script>

<!-- -------------------------------------------------------------------- -->



<!--  ------------------------------------------------------------------------>


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
										<li>win100488@naver.com</li>
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
									<input type="text" name="value" value="${VALUE }"
										placeholder="When Would you like to go ?">
								</div>
								<div>
									<input id="date" type="text" name="DATE" class="selector"
										value="${DATE}" placeholder="체크인/체크아웃" />
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
									<input class="search-button" type="submit" value="searchttt" />
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
	<br>
	<br>
	<br>








	<br>
	<br>


	<div align="center" style="font-weight: bold; font-family: inherit;">



		<c:forEach var="list" items="${HOTELLIST}">
			<input type="hidden" value="${VALUE}" id="value" />
			<table border="1"
				style="width: 1050px; height: 200px; border-style: groove; border-color: rgb(149, 165, 166); border-top-color: rgb(76, 117, 177); border-top-width: 10px; border-left: none; border-radius: 30px">

				<tr>
					<td width="280"><img
						src="<c:url value="/resources/img/${list.hotelPhoto}"/>"
						height="200px" width="300px" /></td>
					<td width="260px" valign="top"><br>
					<div style="font-size: 25px; font-style: inherit;">
							${list.hotelNm }</div> <br>${list.hotelAddress} <br>☎${list.hotelTel }
						<br>
					<a href="#" style="color: black">🏠${list.hotelHomepage }</a></td>
					<td style="font-size: 20px">

						<div class="wrap-star">
							<table>
								<tr>
									<td>
										<div class='star-rating'>
											<span style="width:${list.evlAvg*20}%"></span>
										</div>
									</td>
									<td style="font-size: 20px">&nbsp;&nbsp;${list.evlAvg}</td>
								</tr>
							</table>



						</div>

					</td>
					<td align="center" width="150px">￦49,999</td>
					<td align="center" width="130px"><input
						style="width: 100px; background: rgb(76, 117, 177); color: white; border-radius: 20px"
						type="button" value="예약"
						onclick="location='roomListMbr?hotelNo=${list.hotelNo}&CHECKIN=${CHECKIN}&CHECKOUT=${CHECKOUT}&DATE=${DATE}'" />
					</td>
				</tr>
			</table>

			<br>
		</c:forEach>
		<!--     <div id="show"></div> -->
		<input type="button" class="next" value="더보기"
			style="background: rgb(76, 117, 177); color: white; border-radius: 20px">
		<div id="show"></div>
	</div>


	<footer>
		<!-- Footer Start-->
		<div class="footer-area footer-padding footer-bg"
			data-background="assets/img/service/footer_bg.jpg">
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