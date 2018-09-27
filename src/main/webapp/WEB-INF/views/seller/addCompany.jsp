<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
	input{
		border-radius:5px;
	}
	.content{
		width:800px;
		height:800px;
		margin-left:auto;
		margin-right:auto;
	}
	.titleArea{
    	padding:3%;
    	width:650px;
    	margin-left:auto;
    	margin-right:auto;
	}
	.paging{
	    padding:1%;
	    margin-bottom:3%;
	}
	#addTable{
		width:650px;
	}
	#addTable tr{
		height:40px;
		border-top:1px solid lightgray;
		border-bottom:1px solid lightgray;
	}
	#addTable th{
		width:200px;
		text-align:center;
	}
	#searchTable{
		width:330px;
		height:450px;
		line-height: 1.5;
		text-align:center;
	}
	#searchTable tr{
		height:30px;
	}
	#searchTable thead{
		padding: 10px;
	    text-align: center;
	    vertical-align: top;
	    border-bottom: 3px solid #036;
	    background: #f3f6f7;
	}
	#searchTable select{
		margin: 3px;
	}
	#searchTable tbody{
	    padding: 10px;
	    text-align: center;
	    vertical-align: top;
	    border: 1px solid #ccc;
	}
	#searchTable thead label{
		font-weight:normal;
	}
	#resultTable{
		width:100%;
		padding:5px;
	}
	#resultTable tr{
		border-bottom:1px solid lightgray;
		height:39px;
	}
	#resultTable td{
		text-align:left;
	}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<div class="main">
		<jsp:include page="../common/sellerMenubar.jsp"/>
		<div class="content">
		
			<div class="titleArea">
				<div class="row">
                	<div class="col-md-12">
                    	<ul class="breadcrumb">
                        	<li><a href="myPageView.sell"><i class="fa fa-home"></i> Home</a></li>
                            <li class="active">업체 등록</li>
                        </ul>
                    </div>
                </div>
			</div>
		
			<form action="" method="post">
				<table id="addTable" align="center">
					<tr>
						<th>구분</th>
						<td colspan="4" align="center">
							<input type="radio" name="sellerType" id="personal" checked><label for="personal">개인</label>
							&nbsp;&nbsp;
							<input type="radio" name="sellerType" id="company"><label for="company">법인</label>
						</td>
					</tr>
					<tr class="comType">
						<th>법인사업자등록번호</th>
						<td colspan="4"><input type="text" name="companyNum" size="25"></td>
					</tr>
					<tr class="comType">
						<th>법인사업자등록증</th>
						<td colspan="4"><input type="file" name="companyFile"></td>
					</tr>
					<tr>
						<th>사업자등록번호</th>
						<td colspan="4"><input type="text" name="personalNum" size="25"></td>
					</tr>
					<tr>
						<th>사업자등록증</th>
						<td colspan="4"><input type="file" name="personalFile"></td>
					</tr>
					<tr>
						<th>상호명</th>
						<td colspan="3"><input type="text" name="companyName" size="25"></td>
						<td><button type="button" class="btn btn-info" data-toggle="modal" data-target="#searchModal">검색</button></td>
					</tr>
					<tr>
						<th>대표자</th>
						<td colspan="4"><input type="text" name="companyMaster" size="25"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="4"><input type="text" name="companyAddress" size="25"></td>
					</tr>
					<tr>
						<th>객실타입</th>
						<td colspan="2"><input type="text" name="roomType1" size="25"></td>
						<th style="width:60px;">객실 수</th>
						<td><input type="number" name="roomCount1" value="1"></td>
					</tr>
					<tr>
						<th>객실 가격</th>
						<td colspan="4"><input type="text" name="roomPrice1" size="25"></td>
					</tr>
					<tr>
						<th>객실타입</th>
						<td colspan="2"><input type="text" name="roomType2" size="25"></td>
						<th style="width:60px;">객실 수</th>
						<td><input type="number" name="roomCount2" value="1"></td>
					</tr>
					<tr>
						<th>객실 가격</th>
						<td colspan="4"><input type="text" name="roomPrice2" size="25"></td>
					</tr>
					<tr>
						<th>객실타입</th>
						<td colspan="2"><input type="text" name="roomType3" size="25"></td>
						<th style="width:60px;">객실 수</th>
						<td><input type="number" name="roomCount3" value="1"></td>
					</tr>
					<tr>
						<th>객실 가격</th>
						<td colspan="4"><input type="text" name="roomPrice3" size="25"></td>
					</tr>
					<tr>
						<th>등록 기간</th>
						<td colspan="4">
							<input type="radio" name="term" id="1month" checked><label for="1month">1개월</label>&nbsp;
							<input type="radio" name="term" id="3month"><label for="3month">3개월</label>&nbsp;
							<input type="radio" name="term" id="6month"><label for="6month">6개월</label>&nbsp;
							<input type="radio" name="term" id="9month"><label for="9month">9개월</label>&nbsp;
							<input type="radio" name="term" id="12month"><label for="12month">12개월</label>
						</td>
					</tr>
					<tr>
						<td colspan="5" align="center">
							<button type="reset" class="btn btn-default">취소</button>&nbsp;&nbsp;
							<button type="submit" class="btn btn-success">등록</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	
	<!-- 상호 검색 -->
	<div class="modal fade" id="searchModal" role="dialog">
		<div class="modal-dialog" align="center">
	    
		  	<div class="modal-content" style="width:360px;">
		  		<div class="modal-header">
		  			<button type="button" class="close" data-dismiss="modal">&times;</button>
		  			<h4 class="modal-title">상호 검색</h4>
		  		</div>
		  		<div class="modal-body">
		  			<table id="searchTable">
		  				<thead>
			  				<tr>
			  					<td width="50%">
			  						<select id="area" style="width:90%;">
			  							<option value="0">지역 선택</option>
			  							<option value="1">서울</option>
			  							<option value="2">인천</option>
			  							<option value="3">대전</option>
			  							<option value="4">대구</option>
			  							<option value="5">광주</option>
			  							<option value="6">부산</option>
			  							<option value="7">울산</option>
			  							<option value="8">세종특별자치시</option>
			  							<option value="9">경기도</option>
			  							<option value="10">강원도</option>
			  							<option value="11">충청북도</option>
			  							<option value="12">충청남도</option>
			  							<option value="13">경상북도</option>
			  							<option value="14">경상남도</option>
			  							<option value="15">전라북도</option>
			  							<option value="16">전라남도</option>
			  							<option value="17">제주도</option>
			  						</select>
			  					</td>
			  					<td width="50%">
			  						<select id="sigungu1" style="width:90%;">
			  							<option value="0">시군구 선택</option>
			  							<option value="1">강남구</option>
			  							<option value="2">강동구</option>
			  							<option value="3">강북구</option>
			  							<option value="4">강서구</option>
			  							<option value="5">관악구</option>
			  							<option value="6">광진구</option>
			  							<option value="7">구로구</option>
			  							<option value="8">금천구</option>
			  							<option value="9">노원구</option>
			  							<option value="10">도봉구</option>
			  							<option value="11">동대문구</option>
			  							<option value="12">동작구</option>
			  							<option value="13">마포구</option>
			  							<option value="14">서대문구</option>
			  							<option value="15">서초구</option>
			  							<option value="16">성동구</option>
			  							<option value="17">성북구</option>
			  							<option value="18">송파구</option>
			  							<option value="19">양천구</option>
			  							<option value="20">영등포구</option>
			  							<option value="21">용산구</option>
			  							<option value="22">은평구</option>
			  							<option value="23">종로구</option>
			  							<option value="24">중구</option>
			  							<option value="25">중랑구</option>
			  						</select>
			  						<select id="sigungu2" style="width:90%;">
			  							<option value="0">시군구 선택</option>
			  							<option value="1">강화군</option>
			  							<option value="2">계양구</option>
			  							<option value="3">남구</option>
			  							<option value="4">남동구</option>
			  							<option value="5">동구</option>
			  							<option value="6">부평구</option>
			  							<option value="7">서구</option>
			  							<option value="8">연수구</option>
			  							<option value="9">옹진군</option>
			  							<option value="10">중구</option>
			  						</select>
			  						<select id="sigungu3" style="width:90%;">
			  							<option value="0">시군구 선택</option>
			  							<option value="1">대덕구</option>
			  							<option value="2">동구</option>
			  							<option value="3">서구</option>
			  							<option value="4">유성구</option>
			  							<option value="5">중구</option>
			  						</select>
			  						<select id="sigungu4" style="width:90%;">
			  							<option value="0">시군구 선택</option>
			  							<option value="1">남구</option>
			  							<option value="2">달서구</option>
			  							<option value="3">달성군</option>
			  							<option value="4">동구</option>
			  							<option value="5">북구</option>
			  							<option value="6">서구</option>
			  							<option value="7">수성구</option>
			  							<option value="8">중구</option>
			  						</select>
			  						<select id="sigungu5" style="width:90%;">
			  							<option value="0">시군구 선택</option>
			  							<option value="1">광산구</option>
			  							<option value="2">남구</option>
			  							<option value="3">동군</option>
			  							<option value="4">북구</option>
			  							<option value="5">서구</option>
			  						</select>
			  						<select id="sigungu6" style="width:90%;">
			  							<option value="0">시군구 선택</option>
			  							<option value="1">강서구</option>
			  							<option value="2">금정구</option>
			  							<option value="3">기장군</option>
			  							<option value="4">남구</option>
			  							<option value="5">동구</option>
			  							<option value="6">동래구</option>
			  							<option value="7">부산진구</option>
			  							<option value="8">북구</option>
			  							<option value="9">사상구</option>
			  							<option value="10">사하구</option>
			  							<option value="11">서구</option>
			  							<option value="12">수영구</option>
			  							<option value="13">연제구</option>
			  							<option value="14">영도구</option>
			  							<option value="15">중구</option>
			  							<option value="16">해운대구</option>
			  						</select>
			  						<select id="sigungu7" style="width:90%;">
			  							<option value="0">시군구 선택</option>
			  							<option value="1">중구</option>
			  							<option value="2">남구</option>
			  							<option value="3">동군</option>
			  							<option value="4">북구</option>
			  							<option value="5">울주군</option>
			  						</select>
			  						<select id="sigungu8" style="width:90%;">
			  							<option value="0">시군구 선택</option>
			  							<option value="1">세종특별자치시</option>
			  						</select>
			  						<select id="sigungu9" style="width:90%;">
			  							<option value="0">시군구 선택</option>
			  							<option value="1">가평군</option>
			  							<option value="2">고양시</option>
			  							<option value="3">과천시</option>
			  							<option value="4">광명시</option>
			  							<option value="5">광주시</option>
			  							<option value="6">구리시</option>
			  							<option value="7">군포시</option>
			  							<option value="8">김포시</option>
			  							<option value="9">남양주시</option>
			  							<option value="10">동두천시</option>
			  							<option value="11">부천시</option>
			  							<option value="12">성남시</option>
			  							<option value="13">수원시</option>
			  							<option value="14">시흥시</option>
			  							<option value="15">안산시</option>
			  							<option value="16">안성시</option>
			  							<option value="17">안양시</option>
			  							<option value="18">양주시</option>
			  							<option value="19">양평군</option>
			  							<option value="20">여주시</option>
			  							<option value="21">연천군</option>
			  							<option value="22">오산시</option>
			  							<option value="23">용인시</option>
			  							<option value="24">의왕시</option>
			  							<option value="25">의정부시</option>
			  							<option value="26">이천시</option>
			  							<option value="27">파주시</option>
			  							<option value="28">평택시</option>
			  							<option value="29">포천시</option>
			  							<option value="30">하남시</option>
			  							<option value="31">화성시</option>
			  						</select>
			  						<select id="sigungu10" style="width:90%;">
			  							<option value="0">시군구 선택</option>
			  							<option value="1">강릉시</option>
			  							<option value="2">고성군</option>
			  							<option value="3">동해시</option>
			  							<option value="4">삼척시</option>
			  							<option value="5">속초시</option>
			  							<option value="6">양구군</option>
			  							<option value="7">양양군</option>
			  							<option value="8">영월군</option>
			  							<option value="9">원주시</option>
			  							<option value="10">인제군</option>
			  							<option value="11">정선군</option>
			  							<option value="12">철원군</option>
			  							<option value="13">춘천시</option>
			  							<option value="14">태백시</option>
			  							<option value="15">평창군</option>
			  							<option value="16">홍천군</option>
			  							<option value="17">화천군</option>
			  							<option value="18">횡성군</option>
			  						</select>
			  						<select id="sigungu11" style="width:90%;">
			  							<option value="0">시군구 선택</option>
			  							<option value="1">괴산군</option>
			  							<option value="2">단양군</option>
			  							<option value="3">보은군</option>
			  							<option value="4">영동군</option>
			  							<option value="5">옥천군</option>
			  							<option value="6">음성군</option>
			  							<option value="7">제천시</option>
			  							<option value="8">진천군</option>
			  							<option value="9">청원군</option>
			  							<option value="10">청주시</option>
			  							<option value="11">충주시</option>
			  							<option value="12">증평군</option>
			  						</select>
			  						<select id="sigungu12" style="width:90%;">
			  							<option value="0">시군구 선택</option>
			  							<option value="1">공주시</option>
			  							<option value="2">금산군</option>
			  							<option value="3">논산시</option>
			  							<option value="4">당진시</option>
			  							<option value="5">보령시</option>
			  							<option value="6">부여군</option>
			  							<option value="7">서산시</option>
			  							<option value="8">서천군</option>
			  							<option value="9">아산시</option>
			  							<option value="10">예산군</option>
			  							<option value="11">천안시</option>
			  							<option value="12">청양군</option>
			  							<option value="13">태안군</option>
			  							<option value="14">홍성군</option>
			  							<option value="15">계룡시</option>
			  						</select>
			  						<select id="sigungu13" style="width:90%;">
			  							<option value="0">시군구 선택</option>
			  							<option value="1">경산시</option>
			  							<option value="2">경주시</option>
			  							<option value="3">고령군</option>
			  							<option value="4">구미시</option>
			  							<option value="5">군위군</option>
			  							<option value="6">김천시</option>
			  							<option value="7">문경시</option>
			  							<option value="8">봉화군</option>
			  							<option value="9">상주시</option>
			  							<option value="10">성주군</option>
			  							<option value="11">안동시</option>
			  							<option value="12">영덕군</option>
			  							<option value="13">영양군</option>
			  							<option value="14">영주시</option>
			  							<option value="15">영천시</option>
			  							<option value="16">예천군</option>
			  							<option value="17">울릉군</option>
			  							<option value="18">울진군</option>
			  							<option value="19">의성군</option>
			  							<option value="20">청도군</option>
			  							<option value="21">청송군</option>
			  							<option value="22">칠곡군</option>
			  							<option value="23">포항시</option>
			  						</select>
			  						<select id="sigungu14" style="width:90%;">
			  							<option value="0">시군구 선택</option>
			  							<option value="1">거제시</option>
			  							<option value="2">고창군</option>
			  							<option value="3">김해시</option>
			  							<option value="4">남해군</option>
			  							<option value="5">마산시</option>
			  							<option value="6">밀양시</option>
			  							<option value="7">사천시</option>
			  							<option value="8">산청군</option>
			  							<option value="9">양산시</option>
			  							<option value="10">의령군</option>
			  							<option value="11">진주시</option>
			  							<option value="12">진해시</option>
			  							<option value="13">창녕군</option>
			  							<option value="14">창원시</option>
			  							<option value="15">통영시</option>
			  							<option value="16">하동군</option>
			  							<option value="17">함안군</option>
			  							<option value="18">함양군</option>
			  							<option value="19">합천군</option>
			  						</select>
			  						<select id="sigungu15" style="width:90%;">
			  							<option value="0">시군구 선택</option>
			  							<option value="1">고창군</option>
			  							<option value="2">군산시</option>
			  							<option value="3">김제시</option>
			  							<option value="4">남원시</option>
			  							<option value="5">무주군</option>
			  							<option value="6">부안군</option>
			  							<option value="7">순창군</option>
			  							<option value="8">완주군</option>
			  							<option value="9">익산시</option>
			  							<option value="10">임실군</option>
			  							<option value="11">장수군</option>
			  							<option value="12">전주시</option>
			  							<option value="13">정읍시</option>
			  							<option value="14">진안군</option>
			  						</select>
			  						<select id="sigungu16" style="width:90%;">
			  							<option value="0">시군구 선택</option>
			  							<option value="1">강진군</option>
			  							<option value="2">고흥군</option>
			  							<option value="3">곡성군</option>
			  							<option value="4">광양시</option>
			  							<option value="5">구례군</option>
			  							<option value="6">나주시</option>
			  							<option value="7">담양군</option>
			  							<option value="8">목포시</option>
			  							<option value="9">무안군</option>
			  							<option value="10">보성군</option>
			  							<option value="11">순천시</option>
			  							<option value="12">신안군</option>
			  							<option value="13">여수시</option>
			  							<option value="14">영광군</option>
			  							<option value="15">영암군</option>
			  							<option value="16">완도군</option>
			  							<option value="17">장성군</option>
			  							<option value="18">장흥군</option>
			  							<option value="19">진도군</option>
			  							<option value="20">함평군</option>
			  							<option value="21">해남군</option>
			  							<option value="22">화순군</option>
			  						</select>
			  						<select id="sigungu17" style="width:90%;">
			  							<option value="0">시군구 선택</option>
			  							<option value="1">남제주군</option>
			  							<option value="2">북제주군</option>
			  							<option value="3">서귀포시</option>
			  							<option value="4">제주시</option>
			  						</select>
			  					</td>
			  				</tr>
			  				<tr>
			  					<td colspan="2">
			  						<input type="text" id="searchText" name="searchText" size="30">&nbsp;&nbsp;
			  						<button type="button" class="btn btn-warning btn-sm" onclick="return searchCompany();">검색</button>
			  					</td>
			  				</tr>
		  				</thead>
			  			<tbody>
			  				<tr>
			  					<td colspan="2">
			  						<table id="resultTable">
			  							
			  						</table>
			  					</td>
			  				</tr>
			  			</tbody>
		  			</table>
		  			<div class="paging" align="center">
            			<ul class="pagination pagination-sm">
                			<li><a href="#">&laquo;</a></li>
                    		<li><a href="#">1</a></li>
                    		<li><a href="#">2</a></li>
                    		<li><a href="#">3</a></li>
                    		<li><a href="#">4</a></li>
                    		<li><a href="#">5</a></li>
                    		<li><a href="#">&raquo;</a></li>
                		</ul>
            		</div>
		  		</div>
		  		<div class="modal-footer" align="center">
		  		</div>
		  	</div>
	      
	  	</div>
	</div>
	
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
		$(function(){
			$(".comType").hide();
			
			$("#personal").click(function(){
				$(".comType").hide();
			});
			
			$("#company").click(function(){
				$(".comType").show();
			});
			
			var area=$("#area").click(function(){
				$("#area").val();
			});
			
			$("#sigungu1").hide();
			$("#sigungu2").hide();
			$("#sigungu3").hide();
			$("#sigungu4").hide();
			$("#sigungu5").hide();
			$("#sigungu6").hide();
			$("#sigungu7").hide();
			$("#sigungu8").hide();
			$("#sigungu9").hide();
			$("#sigungu10").hide();
			$("#sigungu11").hide();
			$("#sigungu12").hide();
			$("#sigungu13").hide();
			$("#sigungu14").hide();
			$("#sigungu15").hide();
			$("#sigungu16").hide();
			$("#sigungu17").hide();
		});
		
		function searchCompany(area){
			var sigungu;
			
			console.log(area);
			
			if(area == 1){
				$("#sigungu1").show();
				$("#sigungu2").hide();
				$("#sigungu3").hide();
				$("#sigungu4").hide();
				$("#sigungu5").hide();
				$("#sigungu6").hide();
				$("#sigungu7").hide();
				$("#sigungu8").hide();
				$("#sigungu9").hide();
				$("#sigungu10").hide();
				$("#sigungu11").hide();
				$("#sigungu12").hide();
				$("#sigungu13").hide();
				$("#sigungu14").hide();
				$("#sigungu15").hide();
				$("#sigungu16").hide();
				$("#sigungu17").hide();
			}
			else if(area == 2){
				$("#sigungu1").hide();
				$("#sigungu2").show();
				$("#sigungu3").hide();
				$("#sigungu4").hide();
				$("#sigungu5").hide();
				$("#sigungu6").hide();
				$("#sigungu7").hide();
				$("#sigungu8").hide();
				$("#sigungu9").hide();
				$("#sigungu10").hide();
				$("#sigungu11").hide();
				$("#sigungu12").hide();
				$("#sigungu13").hide();
				$("#sigungu14").hide();
				$("#sigungu15").hide();
				$("#sigungu16").hide();
				$("#sigungu17").hide();
			}
			else if(area == 3){
				$("#sigungu1").hide();
				$("#sigungu2").hide();
				$("#sigungu3").show();
				$("#sigungu4").hide();
				$("#sigungu5").hide();
				$("#sigungu6").hide();
				$("#sigungu7").hide();
				$("#sigungu8").hide();
				$("#sigungu9").hide();
				$("#sigungu10").hide();
				$("#sigungu11").hide();
				$("#sigungu12").hide();
				$("#sigungu13").hide();
				$("#sigungu14").hide();
				$("#sigungu15").hide();
				$("#sigungu16").hide();
				$("#sigungu17").hide();
			}
			else if(area == 4){
				$("#sigungu1").hide();
				$("#sigungu2").hide();
				$("#sigungu3").hide();
				$("#sigungu4").show();
				$("#sigungu5").hide();
				$("#sigungu6").hide();
				$("#sigungu7").hide();
				$("#sigungu8").hide();
				$("#sigungu9").hide();
				$("#sigungu10").hide();
				$("#sigungu11").hide();
				$("#sigungu12").hide();
				$("#sigungu13").hide();
				$("#sigungu14").hide();
				$("#sigungu15").hide();
				$("#sigungu16").hide();
				$("#sigungu17").hide();
			}
			else if(area == 5){
				$("#sigungu1").hide();
				$("#sigungu2").hide();
				$("#sigungu3").hide();
				$("#sigungu4").hide();
				$("#sigungu5").show();
				$("#sigungu6").hide();
				$("#sigungu7").hide();
				$("#sigungu8").hide();
				$("#sigungu9").hide();
				$("#sigungu10").hide();
				$("#sigungu11").hide();
				$("#sigungu12").hide();
				$("#sigungu13").hide();
				$("#sigungu14").hide();
				$("#sigungu15").hide();
				$("#sigungu16").hide();
				$("#sigungu17").hide();
			}
			else if(area == 6){
				$("#sigungu1").hide();
				$("#sigungu2").hide();
				$("#sigungu3").hide();
				$("#sigungu4").hide();
				$("#sigungu5").hide();
				$("#sigungu6").show();
				$("#sigungu7").hide();
				$("#sigungu8").hide();
				$("#sigungu9").hide();
				$("#sigungu10").hide();
				$("#sigungu11").hide();
				$("#sigungu12").hide();
				$("#sigungu13").hide();
				$("#sigungu14").hide();
				$("#sigungu15").hide();
				$("#sigungu16").hide();
				$("#sigungu17").hide();
			}
			else if(area == 7){
				$("#sigungu1").hide();
				$("#sigungu2").hide();
				$("#sigungu3").hide();
				$("#sigungu4").hide();
				$("#sigungu5").hide();
				$("#sigungu6").hide();
				$("#sigungu7").show();
				$("#sigungu8").hide();
				$("#sigungu9").hide();
				$("#sigungu10").hide();
				$("#sigungu11").hide();
				$("#sigungu12").hide();
				$("#sigungu13").hide();
				$("#sigungu14").hide();
				$("#sigungu15").hide();
				$("#sigungu16").hide();
				$("#sigungu17").hide();
			}
			else if(area == 8){
				$("#sigungu1").hide();
				$("#sigungu2").hide();
				$("#sigungu3").hide();
				$("#sigungu4").hide();
				$("#sigungu5").hide();
				$("#sigungu6").hide();
				$("#sigungu7").hide();
				$("#sigungu8").show();
				$("#sigungu9").hide();
				$("#sigungu10").hide();
				$("#sigungu11").hide();
				$("#sigungu12").hide();
				$("#sigungu13").hide();
				$("#sigungu14").hide();
				$("#sigungu15").hide();
				$("#sigungu16").hide();
				$("#sigungu17").hide();
			}
			else if(area == 9){
				$("#sigungu1").hide();
				$("#sigungu2").hide();
				$("#sigungu3").hide();
				$("#sigungu4").hide();
				$("#sigungu5").hide();
				$("#sigungu6").hide();
				$("#sigungu7").hide();
				$("#sigungu8").hide();
				$("#sigungu9").show();
				$("#sigungu10").hide();
				$("#sigungu11").hide();
				$("#sigungu12").hide();
				$("#sigungu13").hide();
				$("#sigungu14").hide();
				$("#sigungu15").hide();
				$("#sigungu16").hide();
				$("#sigungu17").hide();
			}
			else if(area == 10){
				$("#sigungu1").hide();
				$("#sigungu2").hide();
				$("#sigungu3").hide();
				$("#sigungu4").hide();
				$("#sigungu5").hide();
				$("#sigungu6").hide();
				$("#sigungu7").hide();
				$("#sigungu8").hide();
				$("#sigungu9").hide();
				$("#sigungu10").show();
				$("#sigungu11").hide();
				$("#sigungu12").hide();
				$("#sigungu13").hide();
				$("#sigungu14").hide();
				$("#sigungu15").hide();
				$("#sigungu16").hide();
				$("#sigungu17").hide();
			}
			else if(area == 11){
				$("#sigungu1").hide();
				$("#sigungu2").hide();
				$("#sigungu3").hide();
				$("#sigungu4").hide();
				$("#sigungu5").hide();
				$("#sigungu6").hide();
				$("#sigungu7").hide();
				$("#sigungu8").hide();
				$("#sigungu9").hide();
				$("#sigungu10").hide();
				$("#sigungu11").show();
				$("#sigungu12").hide();
				$("#sigungu13").hide();
				$("#sigungu14").hide();
				$("#sigungu15").hide();
				$("#sigungu16").hide();
				$("#sigungu17").hide();
			}
			else if(area == 12){
				$("#sigungu1").hide();
				$("#sigungu2").hide();
				$("#sigungu3").hide();
				$("#sigungu4").hide();
				$("#sigungu5").hide();
				$("#sigungu6").hide();
				$("#sigungu7").hide();
				$("#sigungu8").hide();
				$("#sigungu9").hide();
				$("#sigungu10").hide();
				$("#sigungu11").hide();
				$("#sigungu12").show();
				$("#sigungu13").hide();
				$("#sigungu14").hide();
				$("#sigungu15").hide();
				$("#sigungu16").hide();
				$("#sigungu17").hide();
			}
			else if(area == 13){
				$("#sigungu1").hide();
				$("#sigungu2").hide();
				$("#sigungu3").hide();
				$("#sigungu4").hide();
				$("#sigungu5").hide();
				$("#sigungu6").hide();
				$("#sigungu7").hide();
				$("#sigungu8").hide();
				$("#sigungu9").hide();
				$("#sigungu10").hide();
				$("#sigungu11").hide();
				$("#sigungu12").hide();
				$("#sigungu13").show();
				$("#sigungu14").hide();
				$("#sigungu15").hide();
				$("#sigungu16").hide();
				$("#sigungu17").hide();
			}
			else if(area == 14){
				$("#sigungu1").hide();
				$("#sigungu2").hide();
				$("#sigungu3").hide();
				$("#sigungu4").hide();
				$("#sigungu5").hide();
				$("#sigungu6").hide();
				$("#sigungu7").hide();
				$("#sigungu8").hide();
				$("#sigungu9").hide();
				$("#sigungu10").hide();
				$("#sigungu11").hide();
				$("#sigungu12").hide();
				$("#sigungu13").hide();
				$("#sigungu14").show();
				$("#sigungu15").hide();
				$("#sigungu16").hide();
				$("#sigungu17").hide();
			}
			else if(area == 15){
				$("#sigungu1").hide();
				$("#sigungu2").hide();
				$("#sigungu3").hide();
				$("#sigungu4").hide();
				$("#sigungu5").hide();
				$("#sigungu6").hide();
				$("#sigungu7").hide();
				$("#sigungu8").hide();
				$("#sigungu9").hide();
				$("#sigungu10").hide();
				$("#sigungu11").hide();
				$("#sigungu12").hide();
				$("#sigungu13").hide();
				$("#sigungu14").hide();
				$("#sigungu15").show();
				$("#sigungu16").hide();
				$("#sigungu17").hide();
			}
			else if(area == 16){
				$("#sigungu1").hide();
				$("#sigungu2").hide();
				$("#sigungu3").hide();
				$("#sigungu4").hide();
				$("#sigungu5").hide();
				$("#sigungu6").hide();
				$("#sigungu7").hide();
				$("#sigungu8").hide();
				$("#sigungu9").hide();
				$("#sigungu10").hide();
				$("#sigungu11").hide();
				$("#sigungu12").hide();
				$("#sigungu13").hide();
				$("#sigungu14").hide();
				$("#sigungu15").hide();
				$("#sigungu16").show();
				$("#sigungu17").hide();
			}
			else if(area == 17){
				$("#sigungu1").hide();
				$("#sigungu2").hide();
				$("#sigungu3").hide();
				$("#sigungu4").hide();
				$("#sigungu5").hide();
				$("#sigungu6").hide();
				$("#sigungu7").hide();
				$("#sigungu8").hide();
				$("#sigungu9").hide();
				$("#sigungu10").hide();
				$("#sigungu11").hide();
				$("#sigungu12").hide();
				$("#sigungu13").hide();
				$("#sigungu14").hide();
				$("#sigungu15").hide();
				$("#sigungu16").hide();
				$("#sigungu17").show();
			}
			
			$.ajax({
				url:"searchCompany.sell",
				type:"get",
				data:{area:area, sigungu:sigungu},
				dataType:"json",
				success:function(data){
					console.log(data);
					console.log(typeof(data));
					console.log(data.response.body.items.item);
					
					$tableBody = $("#resultTable");
					$tableBody.html('');
					
					var company=data.response.body.items.item;
					
					for(var i=0;i<company.length;i++){
						var output="";
						output += "<tr><td><b><font style='font-size:13px;'>" + company[i].title + "</font></b><br>";
						output += "<font style='font-size:11px;'>" + company[i].addr1 + "</font></td></tr>";
						$tableBody.append(output);
					}
					
				}, error:function(data){
					console.log(data);
				}
			});
		}
	</script>
</body>
</html>