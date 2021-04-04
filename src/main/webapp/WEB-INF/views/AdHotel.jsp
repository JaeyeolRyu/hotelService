<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<title>호텔관리</title>
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
	<link rel="stylesheet" type="text/css" href="css/main2.css">
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
		 
var no
$(document).ready(function(){
	
	$('.list').click(function(){
		var str=""
	 	var tdArr = new Array();
	 	
	 	var tr = $(this);
	 	var td = tr.children();
	 	
	 	td.each(function(i){
	 		tdArr.push(td.eq(i).text());
	 	});
	 	
	 	no      = td.eq(0).text();
	 	no = no.trim();
	 
	 	
 		
	 	
	 	var url = "jsonHotelOptn2";
 		$.getJSON(url, {
			 
			 "hotelNo" : no
	 	
		 }, function(json){
			 		
		var hotelOptn	= json.HOTEL_OPTN;


			$('#hotelOptn').val(hotelOptn);

		 });
 		
 		
 		
 		var url = "jsonHotelSlt";	
 		
 		 $.getJSON(url, { 
 			 
			 "hotelNo" : no			
	 	
		 }, function(json){
			 		
			 
		var no 		= json.NO;
		var nm 		= json.NM;
		
		var address = json.ADDRESS;
		var tel 	= json.TEL;
		var explain = json.EXPLAIN;
		var homepage= json.HOMEPAGE;
		var photo 	= json.PHOTO;
		 
			$('#hotelNo').val(no);
			$('#hotelNm').val(nm);
			$('#hotelAddress').val(address);
			$('#hotelTel').val(tel);
			$('#hotelExplain').val(explain);
			$('#hotelHomepage').val(homepage);
			$('#hotelPhoto').val(photo);
		
		
		    $('#hotelPhoto1').html(	
		    "<img src='${pageContext.request.contextPath}/resources/img/"+photo+"' style='width:300px; height:180px'/>"); 
		 });
 		 
 		 
	});
	
	//호텔옵션버튼 클릭시
	$('body').on('click', "#hotelOptnBtn", function(event) {

		if($('#hotelNo').val() == "")
			{
				alert("옵션을 관리할 호텔을 선택해주세요");
				return; 
			}
		var hotelNo = $('#hotelNo').val();
		var hotelOptn = $('#hotelOptn').val();
		
		window.open("adHotelOptn?value=0&PAGENO=1&hotelNo="+hotelNo+"&hotelOptn="+hotelOptn,"호텔옵션관리", 'top=200px, left=200px, height=340px, width=580px');
 	})  				 
 	
	// 객실목록버튼 클릭시
	$('body').on('click', "#roomInfoBtn", function(event) {

			if($('#hotelNo').val() == "")
				{
					alert("객실을 관리할 호텔을 선택해주세요");
					
					return;
				}
		
			var hotelNo = $('#hotelNo').val();
			window.open("jsonRoomAdSltMulti?div=0&value=0&PAGENO=1&hotelNo="+hotelNo,"객실관리","width=900px, height=780px, left=100px" );
			var url = "jsonRoomAdSltMulti";
			
			$.getJSON(url, {
				 
				 "hotelNo" : hotelNo			
		 	
			 }, function(json){
				 
			 });
			
	 	})  				
			
	
	$('#hotelDelete').click(function(){
		
		if($('#hotelNo').val() == "")
		{
			alert("삭제할 호텔을 선택해주세요");
			return;
		}
		
		var str=""
	 	var tdArr = new Array();
	 	
	 	var tr = $(this);
	 	var td = tr.children();
	 	
	 	td.each(function(i){
	 		tdArr.push(td.eq(i).text());
	 	});
	
	 	var url = "jsonHD";	
	 	
	 	
	 	 $.getJSON(url, {
 			 
			 "hotelNo" : no		
	 	
		 }, function(json){
			 		
		 });  
	});
	
});
	




</script>
</head>
<body>
	

	  <!-- Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="img/logo/logo.png" alt="">
                </div>
            </div>
        </div>
    </div>
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
<p>
 <div align="center" > 
<form method = "post" id="form1" action = "hotelAdSltMulti?PAGENO=1">

<table  style="width:900px"><tr>
<td width="30px">
	<select name = "div">
		<option value = "Nm">호텔명</option>
		<option value = "Address">주소</option>
	</select>
</td>
<td><input type = "text"  size ="60px"  name = "value">
<input type = "submit" value = "조회" >
<input type = "reset" value = "초기화" >
</td>

</tr></table>

<!-- <div align="center">
	<select name = "div" style="width: ">
		<option value = "Nm">호텔명</option>
		<option value = "Address">주소</option>
	</select>
<input type = "text"  size ="70"  name = "value">
<input type = "submit" value = "조회" >
<input type = "reset" value = "초기화" >
</div> -->

 	<div class="limiter" id="example-table-2" align="center" style="height: 400px;" >
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100 ver1 m-b-110">
					<div class="table100-head">
						<table>
							<thead>
								<tr class="row100 head">
									<th class="cell100 column1">호텔번호</th>
									<th class="cell100 column2">호텔명</th>
									<th class="cell100 column3">주소</th>
									<th class="cell100 column4">전화번호</th>
								</tr>
							</thead>
						</table>
					</div>

					<div class="table100-body js-pscroll">
						<table>
							<tbody>
								 <c:forEach var = "DTO" items="${LIST}" varStatus="status">	
									<tr id = "listId" class="list row100 body" <c:if test="${status.count % 2 == 0 }"> style="background-color: #f5d7d7"; </c:if>>
										<td id = no class="cell100 column1">${DTO.hotelNo}</td>
										<td class="cell100 column2">${DTO.hotelNm }</td>
										<td class="cell100 column3">${DTO.hotelAddress }</td>
										<td class="cell100 column4">${DTO.hotelTel }</td>
									</tr>
								</c:forEach>		
							</tbody>
						</table>
					</div>
				</div>
 			 </div>
  		</div>
  	</div>



<div >

<input style="margin-left: 30px" type="submit" value="이전" onclick="javascript: form.action='hotelAdSltMulti?PAGENO=${PAGENO-1}';">
<input style="margin-left: 20px" type="submit" value="다음" onclick="javascript: form.action='hotelAdSltMulti?PAGENO=${PAGENO+1}';">


</div>	
</form>
 
<br>

<form   method = "post" id="form2" action = "hotelInsert"  enctype="multipart/form-data">
<table  style="width:1000px " border="1" >
	<tr>	
		
		<td>
			<table width="300px" >
				<tr>
					<td height="52" width="150px">호텔번호</td>
					<td style="border-bottom: 1px solid #999;"><input size = "30" type = "text"  id = "hotelNo" name = "hotelNo" style="border-style:none ;background-color:transparent;
					border:0 solid black;" readonly></td>
					<td>호텔사진</td>
				</tr>
				<tr>
					<td height="52">호텔명</td>
					<td style="border-bottom: 1px solid #999;"><input align="left" size = "30" type = "text" id = "hotelNm" name = "hotelNm" style="border-style:none ;"></td>
					<TD><input type="file" id="hotelPhotoFile" name ="file" /> </TD>
				</tr>
				<tr>
				
					<td height="52">주소</td>
					<td style="border-bottom: 1px solid #999;"><input align = "left" size = "30" type = "text" id = "hotelAddress" name = "hotelAddress"  style="border-style:none ;"></td>
					<td><input type="text" id="hotelPhoto" name ="hotelPhoto"></td>
				</tr>
				<tr>
					<td height="52">전화번호</td>
					<td style="border-bottom: 1px solid #999;"><input size = "30" type = "text" id = "hotelTel" name = "hotelTel" style="border-style:none ;"></td>
					<td rowspan='6' width=""><div id ="hotelPhoto1" ></div></td>
				</tr>
				<tr>
					<td height="52">홈페이지</td>
					<td style="border-bottom: 1px solid #999;"><input size = "30" type = "text" id = "hotelHomepage" name = "hotelHomepage" style="border-style:none ;"></td>
				</tr>
				<tr>
					<td height="52">호텔옵션현황</td>
					<td style="border-bottom: 1px solid #999;"><input size = "30" type = "text" id = "hotelOptn" name = "hotelOptn" style="border-style:none ;" readonly>
					</td>
				</tr>
				
				<tr>
				<td colspan="2" align="right">
				<input type= "button" align="right" value= "호텔옵션관리" id = "hotelOptnBtn" name = "hotelOptnBtn">
				<input type= "button" value= "객실정보관리" id = "roomInfoBtn"  name = "roomInfoBtn"/>
				</td>
				</tr>
				
				<tr>
			
		
				<td class="sdms-font">호텔소개 </td>
					<td colspan="2"> <textarea   rows="3" cols="130" id="hotelExplain" name= "hotelExplain" style="font-size: 15px; width: 740px"></textarea> 
				</tr>		
				
			

			</table>
		</td>
		<!-- <td><input size = "60" type = "text" id = "hotelExplain" name = "hotelExplain"></td>
		<Td><input size="60" type="text" name="hotNm" id="nm" ></Td> -->
	
</table>	
<TABLE  style="width:1000px">
<tr>
<td  align="right">
<input style="margin-left: 100px" type = "submit" value = "등록" id = "hotelInsert">
<input style="margin-left: 10px" type = "submit" value = "수정" id = "hotelUpdate" onclick = "javascript: form.action='hotelUpdate';"/>
<input style="margin-left: 10px" type = "button" value = "삭제" id = "hotelDelete">	
</td></tr>
</TABLE>
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

<script> 
function setThumbnail(event) { 
	var reader = new FileReader(); 
	reader.onload = function(event) 
	{ var img = document.createElement("img"); 
	img.setAttribute("src", event.target.result); 
	document.querySelector("div#image_container").appendChild(img); 
	}; 
	reader.readAsDataURL(event.target.files[0]); 
	} 
</script>




</body>
</html>