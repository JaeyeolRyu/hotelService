<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
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

<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Travel HTML-5 Template</title>

<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>


<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="manifest" href="site.webmanifest">
<link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">


<link rel="stylesheet" href="css/slick.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- 이미지 css -->
<link rel="stylesheet" href="css/nice-select.css">
<link rel="stylesheet" href="css/style.css">


<script type="text/javascript">
	var name;
	var tel;
	var email;
	var pro;

	function agree2(callback) {
		callback();
	}

	function pp() {
		name = document.getElementById("name").value;
		tel = document.getElementById("tel").value;
		email = document.getElementById("email").value;
		if (!name) {
			alert("이름 미입력")
			return false;
		} else if (!tel) {
			alert("전화번호 미입력")
			return false;
		} else if (!email) {
			alert("이메일  미입력")
			return false;
		}
		var chkbox = document.getElementsByName('check');
		var chk = false;
		for (var i = 0; i < chkbox.length; i++) {
			if (chkbox[i].checked) {
				chk = true;
			} else {
				chk = false;
			}
		}
		if (!chk) {
			alert("모든 약관에 동의해 주세요.");
			return false;

		} else {
			var div = pay();

		}

		//var div = pay();

	}

	//===================================================================================== 
	/* 
	 function agree(){
	
	
	 name = document.getElementById("name").value;
	 tel = document.getElementById("tel").value;
	 email = document.getElementById("email").value;
	 if(!name){
	 alert("이름 미입력")
	 return false;
	 }else if(!tel){
	 alert("전화번호 미입력")
	 return false;
	 }else if(!email){
	 alert("이메일  미입력")
	 return false;
	 }	
	 var chkbox = document.getElementsByName('check');
	 var chk = false;
	 for(var i=0 ; i<chkbox.length ; i++) {
	 if(chkbox[i].checked) { 
	 chk = true; 
	 }
	 else { 
	 chk = false; 
	 } 
	 } if(!chk) { 
	 alert("모든 약관에 동의해 주세요.");
	 return false;
	
	 } else {
	 alert("TTTD")
	 }
	
	 }
	
	 */
	//===================================================================================== 
	function pay() {
		name = document.getElementById("name").value;
		pro = document.getElementById("pro").value;
		tel = document.getElementById("tel").value;
		email = document.getElementById("email").value;

		var radioVal = $('input[name="payCode"]:checked').val();

		var payCode;

		if (radioVal == "0201") {
			payCode = 'kakaopay';
		} else if (radioVal == "0202") {
			payCode = 'phone';
		} else if (radioVal == "0203") {
			payCode = 'card';
		} else if (radioVal == "0204") {
			payCode = 'trans';
		}

		var IMP = window.IMP; // 생략가능
		IMP.init('imp35535343');
		// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
		IMP.request_pay({
			pg : 'kakaopay', // version 1.1.0부터 지원.
			/*
			 'kakao':카카오페이,
			 html5_inicis':이니시스(웹표준결제)
			 'nice':나이스페이
			 'jtnet':제이티넷
			 'uplus':LG유플러스
			 'danal':다날
			 'inicis': 기본
			 'payco':페이코
			 'syrup':시럽페이
			 'paypal':페이팔
			 */

			pay_method : payCode,

			merchant_uid : 'merchant_' + new Date().getTime(),

			name : pro,
			//결제창에서 보여질 이름
			amount : 1000,
			//가격
			buyer_email : email,
			buyer_name : name,
			buyer_tel : tel,
			buyer_addr : '---',
			buyer_postcode : '---',
			m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		/*
		 모바일 결제시,
		 결제가 끝나고 랜딩되는 URL을 지정
		 (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
		 */
		}, function(rsp) {
			console.log(rsp);

			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;
				document.form.submit();

			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;

				//document.form.submit();
			}

			alert(msg);

		});

		//	return true;

	}

	$(document).ready(function() {

		//전체동의 체크
		$('#checkAll').click(function() {

			if ($("input:checkbox[id='checkAll']").prop("checked")) {
				$("input[type=checkbox]").prop("checked", true);
			} else {

				$("input[type=checkbox]").prop("checked", false);
			}

		});

		//이메일 인증
		//==================================================================
		$("#emailBtn").click(function() {

			/* 이메일 중복 체크 후 메일 발송 비동기 처리 */
			var userEmail = $("#email").val();

			$.ajax({

				type : "get",
				url : "createEmailCheck.do",
				// url : "<c:url value='/login/createEmailCheck.do'/>", 원본

				data : {
					userEmail : userEmail,
				},
				success : function(data) {
					$("#hidden").val(data.AA);
					alert("해당 이메일로 인증번호를  보냈습니다. 인증번호를 입력해주세요.");

				},
				error : function(data) {
					alert("에러가 발생했습니다.");
					return false;
				}
			});

			$('#addDiv').show();
		});
		/*
		이메일 인증번호 입력 후 인증 버튼 클릭 이벤트
		 */
		$("#emailAuthBtn").click(function() {

			var email = $("#email").val();
			var random = $("#hidden").val();
			var random2 = $("#emailAuth").val();

			if (random != random2) {
				$('#emailmsg').text("잘못 입력하였습니다.");
				//alert("인증번호를 잘못 입력하였습니다.");
				return false;
			}

			$('#emailmsg').text("인증되었습니다.");

		});

		//=============================================

		//========================================

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



	<!-- slider Area Start-->
	<div class="slider-area ">
		<!-- Mobile Menu -->
		<div class="slider-active ">
			<div
				class="single-slider hero-overly  slider-height-resve d-flex align-items-center"
				data-background="img/background.jpg">
				<div class="container"></div>
			</div>
		</div>
	</div>
	<!-- Favourite Places Start -->
	<br>
	<br>
	<br>


	<div align="center">
		<table style="background-color:">
			<tr>
				<td>
					<h3>
						<input type="text" value="${ROOM.roomNm}" name="pro" id="pro"
							disabled="disabled"
							style="border: none; text-align: center; font-size: 50px; width: 800px">
					</h3>
					<form name="form" action="resveInsert" method="post" id="form"
						onsubmit="return pay()">
						<input type="hidden" name="custNo" value="${CUST.custNo}">
						<input type="hidden" value="${ROOM.roomNo}" name="rumNo">
						<table style="width: 800px; height: 150px;">
							<tr>
								<td style="font-size: 20px; font-weight: bold;" align="center">체크인
									<br>
								<input type="text" value="${CHECKIN }" name="checkIn"
									style="border: none; text-align: center" />
								</td>
								<td width="700px" align="center"><img
									src="<c:url value="/resources/img/화살표.jpg"/>" height="100px"
									width="100px" /></td>
								<td style="font-size: 20px; font-weight: bold;" align="center">체크아웃<br>
								<input type="text" value="${CHECKOUT }" name="checkOut"
									style="border: none; text-align: center" /></td>
							</tr>
						</table>
						<table style="width: 800px; height: 700px;">

							<tr>
								<td style="font-size: 15px; font-weight: bold;" width="150px">*예약자
									이름</td>
								<td colspan="2" style="border-bottom: 1px dotted black;"><input
									type="text" value="${CUST.custName }" name="custName" id="name"
									style="border: none; width: 500px" /></td>
							</tr>
							<tr>
								<td style="font-size: 15px; font-weight: bold;">*예약자 전화번호</td>
								<td colspan="2" style="border-bottom: 1px dotted;"><input
									type="text" value="${CUST.custTel }" name="custTel" id="tel"
									style="border: none; width: 500px" /></td>
							</tr>
							<tr>
								<td style="font-size: 15px; font-weight: bold;">*예약지 이메일</td>
								<td width="30px" style="border-bottom: 1px dotted black;"><input
									type="text" id="email" name="custEmail"
									value="${CUST.custEmail }" id="email"
									style="width: 200px; border: none" /></td>
								<td><input type="button" id="emailBtn" value="인증번호 전송" /></td>
							</tr>
							<tr>
								<td></td>
								<td style="border-bottom: 1px dotted black;"><input
									type="text" id="emailAuth" name="emailAuth"
									style="width: 200px; border-style: none" /></td>
								<td><div id="emailmsg" style="color: red"></div></td>
							</tr>
							<tr>
								<td colspan="3"><input type="button" id="emailAuthBtn"
									name="emailAuthBtn" value="확인"
									style="width: 800px; background-color: white; color: red; border-color: red; border: 2" /></td>
							</tr>
							<tr>
								<td colspan="3" style="font-size: 25px; font-weight: bold;">가격
									및 할인 정보</td>
							</tr>
							<tr>
								<td style="font-size: 15px; font-weight: bold;">예약금액</td>
								<td align="right" colspan="2"><input type="text"
									value="${ROOM.roomPc } "
									style="text-align: right; border-style: none;" /></td>
							</tr>
							<tr>
								<td style="font-size: 15px; font-weight: bold;">할인금액</td>
								<td align="right" colspan="2">----</td>
							</tr>
							<tr>
								<td colspan="2" style="font-size: 15px; font-weight: bold;">마일리지
									할인(보유P : ${CUST.custMilage} )</td>
								<td align="right">----</td>
							</tr>
							<tr>
								<td style="font-size: 15px; font-weight: bold;">최종 결제 금액</td>
								<td align="right" colspan="2"><input type="text"
									name="resvePc" value="${ROOM.roomPc } "
									style="text-align: right; border-style: none;" /></td>
							</tr>
							<tr>
								<td style="font-size: 15px; font-weight: bold;">결제수단 선택</td>
								<td align="right" colspan="2"></td>
							</tr>
							<tr>
								<td colspan="3">

									<div
										style="background-color: rgb(190, 190, 190); font-size: 20px">
										 <input type="hidden" id="hidden" value=""> 
										<table style="width: 800px">
											
											<tr align="center">
												<td width="200px"><input type="radio" name="payCode"
													value="0201" style="zoom: 1.5" />카카오/네이버페이</td>
												<td width="200px"><input type="radio" name="payCode"
													value="0202" checked="checked" style="zoom: 1.5" />휴대폰
												<td>
												<td width="200px"><input type="radio" name="payCode"
													value="0203" style="zoom: 1.5" />신용/체크카드</td>
												<td width="200px"><input type="radio" name="payCode"
													value="0204" style="zoom: 1.5" />계좌이체</td>
											</tr>
										</table>
									</div>
								</td>
							</tr>

						</table>

						<table style="width: 800px; font-size: 20px; font-weight: bold;">
							<tr>
								<td colspan="2">규정 및 약관 동의</td>
							</tr>
							<tr>
								<td width="10px"><input id="checkAll" type="checkbox"
									value="check1" style="zoom: 2.0" /></td>
								<td>전체 동의</td>
							</tr>
							<tr>
								<td><input id="check1" name="check" type="checkbox"
									value="check2" style="zoom: 2.0" /></td>
								<td>숙소이용규칙 및 취소/환불규정 동의(필수)</td>
							</tr>
							<tr>
								<td><input id="check2" name="check" type="checkbox"
									value="check3" style="zoom: 2.0" /></td>
								<td>개인정보 수집 및 이용 동의(필수)</td>
							</tr>
							<tr>
								<td><input id="check3" name="check" type="checkbox"
									value="check4" style="zoom: 2.0" /></td>
								<td>개인정보 제 3자 제공 동의(필수)</td>
							</tr>
							<tr>
								<td><input id="check4" name="check" type="checkbox"
									value="check5" style="zoom: 2.0" /></td>
								<td>만 14세 이상 확인(필수)</td>
							</tr>
						</table>

						<br> <input type="button" value="결제" onclick="agree2(pp())"
							style="width: 800px; border-radius: 5px; background-color: gray; color: white;">
						<!--  <input type="submit"   value = "결제하기"  style="width: 800px; border-radius: 5px; background-color: gray; color: white;"> -->

					</form>



				</td>
			</tr>
		</table>
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
								<script>document.write(new Date().getFullYear());</script>
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