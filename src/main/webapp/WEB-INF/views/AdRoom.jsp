<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<title>객실관리</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

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

<script type="text/javascript">


			 
var no;
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
	 	
	 	
	 	
	 	
		var url = "jsonRoomOptn1";	

 		
		 $.getJSON(url, {
			 
			 "roomNo" : no
	 	
		 }, function(json){
			
			var roomOptn 			= json.ROOM_OPTN;
			
			$('#roomOptn').val(roomOptn);
			
		 });
	 	
 		var url = "jsonR";	

 		
 		 $.getJSON(url, {
 			 
			 "roomNo" : no
	 	
		 }, function(json){
			
			
			var no 			= json.ROOM_NO;
			var hotelNo 	= json.HOTEL_NO;
			var roomNm 		= json.ROOM_NM;
			var roomPc 		= json.ROOM_PC;
			var rHeadCount 	= json.R_HEADCOUNT;
			var roomPhoto	= json.ROOM_PHOTO;
			var roomSize 	= json.ROOM_SIZE;
			var sCount 		= json.S_COUNT;
			
			
			$('#roomNo').val(no);
			$('#hotelNo').val(hotelNo);
			$('#roomNm').val(roomNm);
			$('#roomPc').val(roomPc);
			$('#rHeadCount').val(rHeadCount);
			$('#roomPhoto2').val(roomPhoto);
			
			$('#roomPhoto1').html(	
			"<img src='${pageContext.request.contextPath}/resources/img/"+roomPhoto+"' style='width:300px; height:180px'/>"); 
			$('#roomSize').val(roomSize);
			$('#sCount').val(sCount);
			
			
			
			
		
		 });  
 		 
 		 

	});
	
	$('body').on('click', "#roomOptnBtn", function(event) {

		if($('#roomNo').val() == "")
			{
				alert("옵션을 관리할 객실을 선택해주세요");
				return; 
			}
		var roomNo = no;
		var roomOptn = $('#roomOptn').val();
		window.open("adRoomOptn?roomNo="+roomNo+"&roomOptn="+roomOptn,"객실옵션관리","width=550, height=320, left= 250, top= 150");return false;
 	})  	
	
$('#roomDelete').click(function(){
		
		var str=""
	 	var tdArr = new Array();
	 	
	 	var tr = $(this);
	 	var td = tr.children();
	 	
	 	td.each(function(i){
	 		tdArr.push(td.eq(i).text());
	 	});
	 	
	 	var a = $('#roomNo').val();
	 	
	 	var url = "jsonRoomDele";	
	 	
	 	$.getJSON(url, {
 			 
			 "roomNo" : no		
	 	
		}, function(json){
			 		
		});  
	 	
	});
	
	
});



</script>
</head>
<body>
<h1>호텔 객실관리</h1>
<form method = "post" action = "adSltMulti?PAGENO=1&hotelNo=${hotelNo }">

<select name = "div">
	<option value = "Name">객실명</option>
	<option value = "All">전체</option>
	
</select>

<input type = "text" size ="70" name = "value">
<input type = "submit" value = "조회">
<input type = "reset" value = "초기화">


<table border="1"  width="740">
	<tr>
		<td>객실번호</td>
		<td>객실이름</td>
		<td>객실가격</td>
		<td>객실인원</td>
		<td>예약횟수</td>
	</tr>
	<c:forEach var = "DTO" items="${ROOM}" >
		<tr id = "listId" class="list" height = "30"  >
			<td align = "center" width="10"  >
				${DTO.roomNo }
			</td>
			<td>
				${DTO.roomNm }
			</td>
			<td>
				${DTO.roomPc }
			</td>
			<td>
				${DTO.rHeadCount }
			</td>
			<td>
				${DTO.sCount }
			</td>
	</c:forEach>		
</table>



<div>
<table width="740">
<tr>
<td align="center">
<input type="submit" value="이전" onclick="javascript: form.action='adSltMulti?PAGENO=${PAGENO-1}&hotelNo=${hotelNo }';">
<input type="submit" value="다음" onclick="javascript: form.action='adSltMulti?PAGENO=${PAGENO+1}&hotelNo=${hotelNo }';">
</td>
</tr>
</table>
</div>

</form>
<div style = "width : 50%; ">																												
<form method = "post" action = "roomInsert?hotelNo=${hotelNo }" enctype="multipart/form-data">
<table border = "1" >
<tr>
		<td>
			<table border="1" style="width: 70%">
				<tr >
					<td style="border-bottom:1px solid #999;">객실번호<input type = "text" width="50%" id = "roomNo" name = "roomNo" style="border-style:none;" readonly></td>
					<td>객실사진</td>
				</tr>
				<tr>
					<td style="border-bottom:1px solid #999;">호텔번호<input type = "text" width="300px" id = "hotelNo" name = "hotelNo" value = "${hotelNo }" style="border-style:none;" readonly></td>
					<td><input type="text" id="roomPhoto2" name ="roomPhoto2"></td>
				</tr>
				<tr>
					<td style="border-bottom:1px solid #999;">객실이름<input type = "text" width="500px" id = "roomNm" name = "roomNm" style="border-style:none;"  ></td>
					<td><input type="file" id="roomPhoto" name ="file" ></td>
				</tr>
				<tr>
					<td style="border-bottom:1px solid #999;">객실가격<input type = "text" width="500px" id = "roomPc" name = "roomPc" style="border-style:none;" ></td>
					<td rowspan='6' width="320px"><div id ="roomPhoto1" ></div></td>
				</tr> 
				<tr>
					<td style="border-bottom:1px solid #999;">객실인원<input type = "text" width="500px" id = "rHeadCount" name = "rHeadCount" style="border-style:none;" ></td>
				</tr>
				<tr>
					<td style="border-bottom:1px solid #999;">객실크기<input type = "text" width="500px" id = "roomSize" name = "roomSize" style="border-style:none;" ></td>
				</tr>
				<tr>
					<td style="border-bottom:1px solid #999;">예약횟수<input type = "text" width="500px" id = "sCount" name = "sCount" style="border-style:none;" ></td>
				</tr>
				<tr>
					<td height="80" style="border-bottom:1px solid #999;">객실옵션현황  <textarea rows="3" cols="30.5" id="roomOptn" name= "roomOptn" style="border-style:none;"  readonly ></textarea>
				</tr>
				<tr><td>
				<table style="width:500px">
				<tr>
				<td align="center">
				<input type= "button" value= "객실옵션관리" id = "roomOptnBtn" name = "roomOptnBtn">
				</td>
				</tr>
				</table>
				</td></tr>
			</table>
		</td>
</table>
<table style="width: 777px">
	<tr>
		<td>
			<div align="right">
				<input type = "submit" value = "등록">
				<input type = "submit" value = "수정" onclick = "javascript: form.action='roomUpdate';"/>
				<input type = "button" value = "삭제" id = "roomDelete">
				<input type = "button" value = "창닫기" onclick="window.close()">
			</div>
		</td>
	</tr>
</table>

</form>
</div>
<!-- <div style = "float:left;">
<table>
	<tr>
		<td>객실사진</td>
	</tr>
	<tr>
		<td><input type="text" id="roomPhoto2" name ="roomPhoto2"></td>
		<tr><td><input type="file" id="roomPhoto" name ="file" ></td></tr>
	<Tr><td><div id ="roomPhoto1" ></div></td></tr>
	</tr>
</table>
</div> -->

</body>
</html>