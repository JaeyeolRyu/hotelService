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

<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>

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

#ttt {
	font-family: Jua;
	font-size: 17px;
}

button {
	font-family: Jua;
	font-size: 15px;
} /* table{
				font-family: Jua;
				font-size:15px;	 */
}
/* 	tr {
				font-family: Jua;
				font-size:15px;	
			} */
/* td{
				font-family: Jua;
				font-size:15px;	
			} */
div {
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



<!--맵 API  -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d582d5bee1b97b37a82259e662e66d08&libraries=services"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">

<style>
.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

.map_wrap {
	position: absolute;
	width: 100%;
	height: 500px;
}

#menu_wrap {
	position: relative;;
	top: 0;
	left: 0;
	bottom: 0;
	width: 300px;
	margin: 10px 0 30px 10px;
	padding: 5px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 0.7);
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
}

.bg_white {
	background: #fff;
}

#menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 3px 0;
}

#menu_wrap .option {
	text-align: center;
}

#menu_wrap .option p {
	margin: 10px 0;
}

#menu_wrap .option button {
	margin-left: 5px;
}

#placesList li {
	list-style: none;
}

#placesList .item {
	position: relative;
	border-bottom: 1px solid #888;
	overflow: hidden;
	cursor: pointer;
	min-height: 65px;
}

#placesList .item span {
	display: block;
	margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#placesList .item .info {
	padding: 10px 0 10px 55px;
}

#placesList .info .gray {
	color: #8a8a8a;
}

#placesList .info .jibun {
	padding-left: 26px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
		no-repeat;
}

#placesList .info .tel {
	color: #009900;
}

#placesList .item .markerbg {
	float: left;
	position: absolute;
	width: 36px;
	height: 37px;
	margin: 10px 0 0 10px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
		no-repeat;
}

#placesList .item .marker_1 {
	background-position: 0 -10px;
}

#placesList .item .marker_2 {
	background-position: 0 -56px;
}

#placesList .item .marker_3 {
	background-position: 0 -102px
}

#placesList .item .marker_4 {
	background-position: 0 -148px;
}

#placesList .item .marker_5 {
	background-position: 0 -194px;
}

#placesList .item .marker_6 {
	background-position: 0 -240px;
}

#placesList .item .marker_7 {
	background-position: 0 -286px;
}

#placesList .item .marker_8 {
	background-position: 0 -332px;
}

#placesList .item .marker_9 {
	background-position: 0 -378px;
}

#placesList .item .marker_10 {
	background-position: 0 -423px;
}

#placesList .item .marker_11 {
	background-position: 0 -470px;
}

#placesList .item .marker_12 {
	background-position: 0 -516px;
}

#placesList .item .marker_13 {
	background-position: 0 -562px;
}

#placesList .item .marker_14 {
	background-position: 0 -608px;
}

#placesList .item .marker_15 {
	background-position: 0 -654px;
}

#pagination {
	margin: 10px auto;
	text-align: center;
}

#pagination a {
	display: inline-block;
	margin-right: 10px;
}

#pagination .on {
	font-weight: bold;
	cursor: default;
	color: #777;
}
</style>


<style>
.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 350px;
}

#category {
	position: absolute;
	top: 10px;
	left: 10px;
	border-radius: 5px;
	border: 1px solid #909090;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);
	background: #fff;
	overflow: hidden;
	z-index: 2;
}

#category li {
	float: left;
	list-style: none;
	width: 50px; px;
	border-right: 1px solid #acacac;
	padding: 6px 0;
	text-align: center;
	cursor: pointer;
}

#category li.on {
	background: #eee;
}

#category li:hover {
	background: #ffe6e6;
	border-left: 1px solid #acacac;
	margin-left: -1px;
}

#category li:last-child {
	margin-right: 0;
	border-right: 0;
}

#category li span {
	display: block;
	margin: 0 auto 3px;
	width: 27px;
	height: 28px;
}

#category li .category_bg {
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png)
		no-repeat;
}

#category li .bank {
	background-position: -10px 0;
}

#category li .mart {
	background-position: -10px -36px;
}

#category li .pharmacy {
	background-position: -10px -72px;
}

#category li .oil {
	background-position: -10px -108px;
}

#category li .cafe {
	background-position: -10px -144px;
}

#category li .store {
	background-position: -10px -180px;
}

#category li.on .category_bg {
	background-position-x: -46px;
}

.placeinfo_wrap {
	position: absolute;
	bottom: 28px;
	left: -150px;
	width: 300px;
}

.placeinfo {
	position: relative;
	width: 100%;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	padding-bottom: 10px;
	background: #fff;
}

.placeinfo:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.placeinfo_wrap .after {
	content: '';
	position: relative;
	margin-left: -12px;
	left: 50%;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.placeinfo a, .placeinfo a:hover, .placeinfo a:active {
	color: #fff;
	text-decoration: none;
}

.placeinfo a, .placeinfo span {
	display: block;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

.placeinfo span {
	margin: 5px 5px 0 5px;
	cursor: default;
	font-size: 13px;
}

.placeinfo .title {
	font-weight: bold;
	font-size: 14px;
	border-radius: 6px 6px 0 0;
	margin: -1px -1px 0 -1px;
	padding: 10px;
	color: #fff;
	background: #d95050;
	background: #d95050
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
		no-repeat right 14px center;
}

.placeinfo .tel {
	color: #0f7833;
}

.placeinfo .jibun {
	color: #999;
	font-size: 11px;
	margin-top: 0;
}
</style>











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
										<li>leedonggu1@naver.com</li>
										<li>010-7377-9128</li>
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



	<!--================Blog Area =================-->
	<section class="blog_area section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 mb-5 mb-lg-0">
					<div class="blog_left_sidebar">


						<!-- =========================================================== -->


						<div style="font-weight: bold; font-family: inherit;">
							<br>
							<table border="1"
								style="width: 780px; height: 200px; border: 4px solid rgb(76, 117, 177); border-radius: 20px">

								<tr>
									<td rowspan="2" width="200px"><img
										src="<c:url value="/resources/img/${HOTEL.hotelPhoto}"/>"
										height="200px" width="300px" /></td>
									<td id="ttt" style="font-size: 50px">${HOTEL.hotelNm}</td>
								</tr>
								<tr>
									<td id="ttt">${HOTEL.hotelAddress}</td>
								</tr>

								<tr>
									<td rowspan="2">

										<table>
											<tr>
												<td valign="top" width="140px"><c:forEach var="hoho"
														items="${hotelOptn}" varStatus="status">
														<c:if test="${status.index<5 }">✔ &nbsp<span
																id="ttt"> ${hoho }</span>
															<br>
														</c:if>
													</c:forEach></td>
												<td valign="top"><c:forEach var="hoho"
														items="${hotelOptn}" varStatus="status">
														<c:if test="${status.index>4 }">✔ &nbsp<span
																id="ttt"> ${hoho }</span>
															<br>
														</c:if>
													</c:forEach></td>
											</tr>
										</table>
									</td>
								</tr>
								<tr height="100px">
									<td colspan="2" id="ttt">${HOTEL.hotelExplain}</td>
								</tr>
							</table>

							<br>

							<c:forEach var="list" items="${ROOMLIST}" varStatus="status">
								<table border="1"
									style="width: 780px; height: 200px; border: 1px solid #999; border-color: rgb(76, 117, 177); border-left: 1px dotted #999; border-top-color: rgb(76, 117, 177); border-top-width: 20px; border-radius: 30px">
									<tr id="ttt">
										<td colspan="">${list.roomNm}</td>
										<td align="center">객실옵션</td>
										<td align="center">인원</td>
										<td colspan="" align="center">가격</td>
										<td rowspan="2" align="center"><input id="ttt"
											type="button" value="예약"
											onclick="location='resvePage?ROOMNO=${list.roomNo}&CUSTNO=${CUSTNO}&CHECKIN=${CHECKIN}&CHECKOUT=${CHECKOUT}'"
											style="width: 80px; color: white; border: none; background: rgb(76, 117, 177); font-size: 20px; border-radius: 2px" /></td>
									</tr>
									<tr>
										<td width="200px"><img
											src="<c:url value="/resources/img/${list.roomPhoto}"/>"
											height="200px" width="300px" /></td>
										<td><c:forEach var="list2" items="${gogo }"
												begin="${status.index}" end="${status.index}">
												<c:forEach var="list3" items="${list2 }" varStatus="status">
  		 ✔<span id="ttt">${list3}</span>
													<br>
												</c:forEach>
											</c:forEach></td>
										<td align="center" width="60px"><img
											src="<c:url value="/resources/img/사람.jpg"/>" height="40px"
											width="40	px" /></td>
										<td id="ttt" align="center" width="100px">￦
											${list.roomPc}</td>
										<%--  <td  align="center" width="100px">
    <input type="button" value="예약" onclick="location='resvePage?ROOMNO=${list.roomNo}&CUSTNO=${CUSTNO}&CHECKIN=${CHECKIN}&CHECKOUT=${CHECKOUT}'"
    style="width: 80px;color:white ; border:none ;background: rgb(76, 117, 177);font-size: 20px;border-radius: 2px "/>
    </td> --%>
									</tr>
								</table>
								<br>
							</c:forEach>

						</div>


						<!-- =============================================================== -->


					</div>
				</div>
				<div class="col-lg-4">
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget search_widget">

							<table border="1">
								<tr>
									<td><div id="map" style="width: 350px; height: 300px;"></div></td>
								</tr>
								<tr>
									<td>
										<div class="map_wrap" style="height: 80px;">
											<div id="map"
												style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
											<ul id="category">
												<li id="AT4" data-order="0"><span
													class="category_bg  ta" style="width: 40px"></span> 관광명소</li>
												<li id="FD6" data-order="1"><span
													class="category_bg mart"></span> 음식점</li>
												<li id="PM9" data-order="2"><span
													class="category_bg pharmacy"></span> 약국</li>
												<li id="OL7" data-order="3"><span
													class="category_bg oil"></span> 주유소</li>
												<li id="CE7" data-order="4"><span
													class="category_bg cafe"></span> 카페</li>
												<li id="CS2" data-order="5"><span
													class="category_bg store"></span> 편의점</li>
											</ul>
										</div>

									</td>
								</tr>

								<tr>
									<td>

										<div id="map"
											style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

									</td>
								</tr>
							</table>
							<!-- <div id="map" style="width: 300px; height: 300px;"></div> -->

							<script>
								var mapContainer = document
										.getElementById('map'), // 지도를 표시할 div 
								mapOption = {
									center : new kakao.maps.LatLng(33.450701,
											126.570667), // 지도의 중심좌표
									level : 3
								// 지도의 확대 레벨
								};

								// 지도를 생성합니다    
								var map = new kakao.maps.Map(mapContainer,
										mapOption);

								// 주소-좌표 변환 객체를 생성합니다
								var geocoder = new kakao.maps.services.Geocoder();

								// 주소로 좌표를 검색합니다
								geocoder
										.addressSearch(
												"<c:url value='${HOTEL.hotelAddress}'/>",
												function(result, status) {

													// 정상적으로 검색이 완료됐으면
													if (status === kakao.maps.services.Status.OK) {

														var coords = new kakao.maps.LatLng(
																result[0].y,
																result[0].x);

														// 결과값으로 받은 위치를 마커로 표시합니다
														var marker = new kakao.maps.Marker(
																{
																	map : map,
																	position : coords
																});

														// 인포윈도우로 장소에 대한 설명을 표시합니다
														var infowindow = new kakao.maps.InfoWindow(
																{
																	content : '<div style="width:150px;text-align:center;padding:6px 0;">"<c:url value='${HOTEL.hotelNm	}'/>"</div>'
																});
														infowindow.open(map,
																marker);

														// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
														map.setCenter(coords);
													}
												});
							</script>
						</aside>
						<aside>
							<p style="margin-top: -12px"></p>

							<script>
								// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
								var placeOverlay = new kakao.maps.CustomOverlay(
										{
											zIndex : 1
										}), contentNode = document
										.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
								markers = [], // 마커를 담을 배열입니다
								currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다

								var mapContainer = document
										.getElementById('map'), // 지도를 표시할 div 
								mapOption = {
									center : new kakao.maps.LatLng(37.566826,
											126.9786567), // 지도의 중심좌표
									level : 5
								// 지도의 확대 레벨
								};

								// 지도를 생성합니다    
								var map = new kakao.maps.Map(mapContainer,
										mapOption);

								// 장소 검색 객체를 생성합니다
								var ps = new kakao.maps.services.Places(map);

								// 지도에 idle 이벤트를 등록합니다
								kakao.maps.event.addListener(map, 'idle',
										searchPlaces);

								// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
								contentNode.className = 'placeinfo_wrap';

								// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
								// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
								addEventHandle(contentNode, 'mousedown',
										kakao.maps.event.preventMap);
								addEventHandle(contentNode, 'touchstart',
										kakao.maps.event.preventMap);

								// 커스텀 오버레이 컨텐츠를 설정합니다
								placeOverlay.setContent(contentNode);

								// 각 카테고리에 클릭 이벤트를 등록합니다
								addCategoryClickEvent();

								// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
								function addEventHandle(target, type, callback) {
									if (target.addEventListener) {
										target.addEventListener(type, callback);
									} else {
										target.attachEvent('on' + type,
												callback);
									}
								}

								// 카테고리 검색을 요청하는 함수입니다
								function searchPlaces() {
									if (!currCategory) {
										return;
									}

									// 커스텀 오버레이를 숨깁니다 
									placeOverlay.setMap(null);

									// 지도에 표시되고 있는 마커를 제거합니다
									removeMarker();

									ps.categorySearch(currCategory,
											placesSearchCB, {
												useMapBounds : true
											});
								}

								// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
								function placesSearchCB(data, status,
										pagination) {
									if (status === kakao.maps.services.Status.OK) {

										// 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
										displayPlaces(data);
									} else if (status === kakao.maps.services.Status.ZERO_RESULT) {
										// 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

									} else if (status === kakao.maps.services.Status.ERROR) {
										// 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요

									}
								}

								// 지도에 마커를 표출하는 함수입니다
								function displayPlaces(places) {

									// 몇번째 카테고리가 선택되어 있는지 얻어옵니다
									// 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
									var order = document.getElementById(
											currCategory).getAttribute(
											'data-order');

									for (var i = 0; i < places.length; i++) {

										// 마커를 생성하고 지도에 표시합니다
										var marker = addMarker(
												new kakao.maps.LatLng(
														places[i].y,
														places[i].x), order);

										// 마커와 검색결과 항목을 클릭 했을 때
										// 장소정보를 표출하도록 클릭 이벤트를 등록합니다
										(function(marker, place) {
											kakao.maps.event
													.addListener(
															marker,
															'click',
															function() {
																displayPlaceInfo(place);
															});
										})(marker, places[i]);
									}
								}

								// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
								function addMarker(position, order) {
									var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
									imageSize = new kakao.maps.Size(27, 28), // 마커 이미지의 크기
									imgOptions = {
										spriteSize : new kakao.maps.Size(72,
												208), // 스프라이트 이미지의 크기
										spriteOrigin : new kakao.maps.Point(46,
												(order * 36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
										offset : new kakao.maps.Point(11, 28)
									// 마커 좌표에 일치시킬 이미지 내에서의 좌표
									}, markerImage = new kakao.maps.MarkerImage(
											imageSrc, imageSize, imgOptions), marker = new kakao.maps.Marker(
											{
												position : position, // 마커의 위치
												image : markerImage
											});

									marker.setMap(map); // 지도 위에 마커를 표출합니다
									markers.push(marker); // 배열에 생성된 마커를 추가합니다

									return marker;
								}

								//--------

								// 지도 위에 표시되고 있는 마커를 모두 제거합니다
								function removeMarker() {
									for (var i = 0; i < markers.length; i++) {
										markers[i].setMap(null);
									}
									markers = [];
								}

								// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
								function displayPlaceInfo(place) {
									var content = '<div class="placeinfo">'
											+ '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">'
											+ place.place_name + '</a>';

									if (place.road_address_name) {
										content += '    <span title="' + place.road_address_name + '">'
												+ place.road_address_name
												+ '</span>'
												+ '  <span class="jibun" title="' + place.address_name + '">(지번 : '
												+ place.address_name
												+ ')</span>';
									} else {
										content += '    <span title="' + place.address_name + '">'
												+ place.address_name
												+ '</span>';
									}

									content += '    <span class="tel">'
											+ place.phone + '</span>'
											+ '</div>'
											+ '<div class="after"></div>';

									contentNode.innerHTML = content;
									placeOverlay
											.setPosition(new kakao.maps.LatLng(
													place.y, place.x));
									placeOverlay.setMap(map);
								}

								// 각 카테고리에 클릭 이벤트를 등록합니다
								function addCategoryClickEvent() {
									var category = document
											.getElementById('category'), children = category.children;

									for (var i = 0; i < children.length; i++) {
										children[i].onclick = onClickCategory;
									}
								}

								// 카테고리를 클릭했을 때 호출되는 함수입니다
								function onClickCategory() {
									var id = this.id, className = this.className;

									placeOverlay.setMap(null);

									if (className === 'on') {
										currCategory = '';
										changeCategoryClass();
										removeMarker();
									} else {
										currCategory = id;
										changeCategoryClass(this);
										searchPlaces();
									}
								}

								// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
								function changeCategoryClass(el) {
									var category = document
											.getElementById('category'), children = category.children, i;

									for (i = 0; i < children.length; i++) {
										children[i].className = '';
									}

									if (el) {
										el.className = 'on';
									}
								}
							</script>



							<!-- 카카오맵 목록 출력 -->




						</aside>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!--================Blog Area =================-->

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