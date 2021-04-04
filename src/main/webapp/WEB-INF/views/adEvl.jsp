<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<title>관리자 평가</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>

<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css"> 
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main3.css">
<!--===============================================================================================-->

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
	
	$('.list').click(function(){
		var str=""
	 	var tdArr = new Array();
	 	
	 	var tr = $(this);
	 	var td = tr.children();
	 	
	 	td.each(function(i){
	 		tdArr.push(td.eq(i).text());
	 	});
	 	
	 	no = td.eq(0).text();
	 	no = no.trim();
 		var url = "sltEvlDetail";	

 		
 		 $.getJSON(url, {
 			 
			 "evlNo" : no			
	 	
		 }, function(json){
			 		
		var evlNo 		 = json.EVLNO;
		var hotelName	 = json.HOTELNAME;
		var custName     = json.CUSTNAME;
		var evlScore	 = json.EVLSCORE;
		var evlContent   = json.EVLCONTENT;

		 
			$('#evlNo').val(evlNo);
			$('#hotelName').val(hotelName);
			$('#custName').val(custName);
			$('#evlScore').val(evlScore);
			$('#evlContent').val(evlContent);


		 });

	});

	
	$('#evlDelete').click(function(){
		
		var str=""
	 	var tdArr = new Array();
	 	
	 	var tr = $(this);
	 	var td = tr.children();
	 	
	 	td.each(function(i){
	 		tdArr.push(td.eq(i).text());
	 	});
	
	 	var url = "evlDelete";	
	 	
	 	
	 	 $.getJSON(url, {
 			 
			 "evlNo" : no		
	 	
		 }, function(json){
			
			 var msg = json.MSG;
			alert(msg);
			document.getElementById('form2').reset();
			window.location.reload();
		 });  
	});
	
});
	




</script>
<style type="text/css">
#evlContent {
  width:600px;
  height:100px;
  font-size:20px;
}
/* 
#example-table-2 {

	width:100%;
	table-layout: fixed;

} */


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


    

        <!-- slider Area Start-->
   
        <!-- Favourite Places Start -->

	<div align="center">
		<form method="post" id="form1" action="evlSltMulti?PAGENO=${PAGENO}">

			<table style="width: 900px">
				<tr>
					<td width="30px"><select name="div">
							<option value="hotelName" selected>호텔명</option>
							<option value="custName">고객명</option>
					</select></td>
					<td><input type="text" width="70 %" name="value"> <input
						type="submit" value="조회"> <input type="reset" value="초기화">
					</td>
				</tr>
			</table>


			<div class="limiter" id="example-table-2" align="center"
				style="height: 400px;">
				<div class="container-table100">
					<div class="wrap-table100">
						<div class="table100 ver1 m-b-110">
							<div class="table100-head">
								<table id="example-table-2" width="800px" border="1"
									class="table table-bordered table-hover text-center">
									<thead>
										<tr align="center" class="row100 head">
											<th class="cell100 column1" width="70">평가번호</th>
											<th class="cell100 column2">호텔명</th>
											<th class="cell100 column3">고객명</th>
											<th class="cell100 column4">평가점수</th>
											<th class="cell100 column5">평가내용</th>
										</tr>
									</thead>
								</table>
							</div>

							<div class="table100-body js-pscroll">
								<table>
									<tbody>
										<c:forEach var="DTO" items="${LIST}" varStatus="status">
											<tr id="listId" class="list row100 body" height="30"
												<c:if test="${status.count % 2 == 0 }"> style="background-color: #f5d7d7"; </c:if>>
												<td id=no class="cell100 column1" align="center" width="20">
													${DTO.evlNo}<br>
												</td>
												<td align="left" class="cell100 column2" width="150">
													${DTO.hotelName }</td>
												<td align="left" class="cell100 column3" width="10">
													${DTO.custName }</td>
												<td align="center" class="cell100 column4" width="10">
													${DTO.evlScore }</td>
												<td align="left" class="cell100 column5" width="300"
													style="text-overflow: ellipsis; overflow: hidden">
													${DTO.evlContent }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div>
				<input type="submit" value="이전"
					onclick="javascript: form.action='evlSltMulti?PAGENO=${PAGENO-1}';">
				<input type="submit" value="다음"
					onclick="javascript: form.action='evlSltMulti?PAGENO=${PAGENO+1}';">
			</div>
		</form>

		<form method="post" id="form2" action="evlDelete">
			<table border="1" style="width: 90%">
				<tr>
					<td>평가번호</td>
					<td><input type="text" width="777px" id="evlNo" name="evlNo"  style="border-style:none ;" readonly></td>
				</tr>
				<tr>
					<td>호텔명</td>
					<td><input type="text" width="777px" id="hotelName" name="hotelName"  style="border-style:none ;" readonly></td>
				</tr>
				<tr>
					<td>고객명</td>
					<td><input type="text" width="777px" id="custName" name="custName"  style="border-style:none ;" readonly></td>
				</tr>
				<tr>
					<td>평가점수</td>
					<td><input type="text" width="777px" id="evlScore" name="evlScore"  style="border-style:none ;" readonly></td>
				</tr>
				<tr>
					<td>평가내용</td>
					<td><textarea rows="150" cols="50" id="evlContent"
							name="evlContent" style="font-size: 15px; border-style:none ;"  readonly></textarea> <!-- <input type = "text" id = "evlContent" name = "evlContent" style="font-size: 15px; word-break:break-all;" readonly> --></td>
				</tr>
			</table>

			<input type="submit" value="삭제" id="evlDelete">
		</form>
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

</body>
</html>