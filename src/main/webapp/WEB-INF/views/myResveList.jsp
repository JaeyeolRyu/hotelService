
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html lang="en">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>예약 내역 조회</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>

<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet"
	 type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->

<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

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
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="manifest" href="site.webmanifest">
<link rel="shortcut icon" type="image/x-icon"
	href="assets/img/favicon.ico">


<link rel="stylesheet" href="css/slick.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- 이미지 css -->
<link rel="stylesheet" href="css/nice-select.css">
<link rel="stylesheet" href="css/style.css">


<script type="text/javascript">



	


function test(resveno, custno){

	var no = confirm("결제를 취소 하시겠습니까?");
	if(no){
	location.href="resveCancel?RESVENO="+resveno+"&CUSTNO="+custno;
	}

}


$(document).ready(function(){

	
})

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
            <div >
                <div  class="single-slider hero-overly  slider-height-resve d-flex align-items-center"  data-background="img/hero/mainimg.jpg">
                    <div class="container">
                      
                   
                    </div>
                </div>
            </div>
        </div>
        <!-- Favourite Places Start -->

  
  	<div class="limiter" align="center" >
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100 ver1 m-b-110">
					<div class="table100-head">
						<table>
							<thead>
								<tr class="row100 head">
									<th class="cell100 column1">주문번호</th>
									<th class="cell100 column2">이용기간</th>
									<th class="cell100 column3">호텔명</th>
									<th class="cell100 column4">가격</th>
									<th class="cell100 column5">결제일</th>
 									<th class="cell100 column6">결제수단</th>
									<th class="cell100 column7">주문상태</th>
									<th class="cell100 column8">취소여부</th> 
								</tr>
							</thead>
						</table>
					</div>

					<div class="table100-body js-pscroll">
						<table>
							<tbody>
								 <c:forEach var="list" items="${RESVELIST}" varStatus="status" >
									<tr class="row100 body" <c:if test="${status.count % 2 == 0 }"> style="background-color: #f5d7d7"; </c:if>>
										<td class="cell100 column1">${list.resveNo}</td>
										<td class="cell100 column2">${list.checkIn} - ${list.checkOut }</td>
										<td class="cell100 column3">${list.hotelNm }</td>
										<td align="right" class="cell100 column4">${list.resvePc }</td>
										<td class="cell100 column5">${list.payDate }</td>
 										<td class="cell100 column6">${list.payNm }</td>
										<td align="center" class="cell100 column7">
											<c:if test="${list.cancelAt == 'Y'}">
									     	 결제취소
									         </c:if>
									       <c:if test="${list.cancelAt == 'N'}">
									     	 결제완료
									       </c:if>
										</td>
										
										<td align="center">
										 <c:if test="${list.checkOut> TIME}"> 
											 <c:if test="${list.cancelAt == 'N'}">
												<input type="button" value="취소"  onclick= 'test("${list.resveNo}","${ CUSTNO}")' style=" width:50px; background: rgb(76, 117, 177);color:white; border-radius:10px"/>
								      		 </c:if>
								      	</c:if>
								        </td>
								        
								          <td align="center">
										 <c:if test="${list.cancelAt == 'N'}"> 
										 <c:set var="test" value="${TIME }"/>
											 <c:if test="${list.checkOut < test }">
												<input type="submit" value="리뷰" class="btn-gradient blue mini" style=" width:50px; background: rgb(76, 117, 177);color:white; border-radius:10px" onclick="window.open('evlInsertView?hotelNo=${list.hotelNo}&CUSTNO=${CUSTNO}&hotelName=${list.hotelNm}', '후기등록', 'width=510, height=350, left= 250 top= 100'); return false;">
								      	     </c:if> 
								      	 </c:if>
								        </td>
								        
								      
									</tr>
								</c:forEach>		
							</tbody>
						</table>
					</div>
				</div>
 			 </div>
  		</div>
  	</div>

    
    <!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			var ps = new PerfectScrollbar(this);

			$(window).on('resize', function(){
				ps.update();
			})
		});
			
	</script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>
    
    
    
    <footer>
        <!-- Footer Start-->
        <div class="footer-area footer-padding footer-bg" data-background="assets/img/service/footer_bg.jpg">
            <div class="container">
                <div class="row d-flex justify-content-between">
                    <div class="col-xl-3 col-lg-3 col-md-5 col-sm-6">
                       <div class="single-footer-caption mb-50">
                         <div class="single-footer-caption mb-30">
                              <!-- logo -->
                             <div class="footer-logo">
                                 <a href="index.html"><img src="img/logo/logo2_footer.png" alt=""></a>
                             </div>
                             <div class="footer-tittle">
                                 <div class="footer-pera">
                                     <p>Lorem iaspsum doldfor sit amvset, consectetur adipisicing cvelit csed do eiusmod tempor incididucvccnt ut labovre.</p>
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
                                    <li><a href="#"> Offers  Discounts</a></li>
                                    <li><a href="#"> Get Coupon</a></li>
                                    <li><a href="#">  Contact Us</a></li>
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
                                 <li><a href="#">Terms  Conditions</a></li>
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
                         <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="ti-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                    </div>
                 </div>
                  <div class="col-xl-5 col-lg-5 col-md-5">
                        <!-- social -->
                        <div class="footer-social f-right">
                            <a href="#"><i class="fab fa-twitter"></i></a>
                            <a href="#"><i class="fab fa-facebook-f"></i></a>
                            <a href="#"><i class="fab fa-behance"></i></a>
                            <a href="#"><i class="fas fa-globe"></i></a>
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