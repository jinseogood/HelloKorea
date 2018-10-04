<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	input{
		border-radius:5px;
	}
	.content{
		width:800px;
		height:1000px;
		margin-left:auto;
		margin-right:auto;
	}
	.titleArea{
    	padding:3%;
    	width:70%;
    	margin-left:auto;
    	margin-right:auto;
	}
	#detailTable{
		width:650px;
	}
	#detailTable tr{
		height:40px;
		border-top:1px solid lightgray;
		border-bottom:1px solid lightgray;
	}
	#detailTable th{
		width:200px;
		text-align:center;
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
                            <li class="active">업체 수정</li>
                        </ul>
                    </div>
                </div>
			</div>
		
			<form action="" method="post">
				<table id="detailTable" align="center">
					<tr>
						<th>상호명</th>
						<td colspan="4"><input type="text" id="companyName" name="companyName" size="25" readonly></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td colspan="4"><input type="text" id="companyPhone" name="companyPhone" size="25" readonly></td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="4"><input type="text" id="companyAddress" name="companyAddress" size="25" readonly></td>
					</tr>
					<tr>
						<th>객실타입</th>
						<td colspan="2"><input type="text" id="roomType1" name="roomType1" size="25" readonly></td>
						<th style="width:60px;">객실 수</th>
						<td><input type="number" id="roomCount1" name="roomCount1" value="1" min="1" readonly></td>
					</tr>
					<tr>
						<th>객실 가격</th>
						<td colspan="2"><input type="text" id="roomPrice1" name="roomPrice1" size="25" readonly></td>
						<th style="width:60px;">정원</th>
						<td><input type="number" id="roomPeople1" name="roomPeople1" value="1" min="1" readonly></td>
					</tr>
					<tr>
						<th>객실타입</th>
						<td colspan="2"><input type="text" id="roomType2" name="roomType2" size="25" readonly></td>
						<th style="width:60px;">객실 수</th>
						<td><input type="number" id="roomCount2" name="roomCount2" value="1" min="1" readonly></td>
					</tr>
					<tr>
						<th>객실 가격</th>
						<td colspan="2"><input type="text" id="roomPrice2" name="roomPrice2" size="25" readonly></td>
						<th style="width:60px;">정원</th>
						<td><input type="number" id="roomPeople2" name="roomPeople2" value="1" min="1" readonly></td>
					</tr>
					<tr>
						<th>객실타입</th>
						<td colspan="2"><input type="text" id="roomType3" name="roomType3" size="25" readonly></td>
						<th style="width:60px;">객실 수</th>
						<td><input type="number" id="roomCount3" name="roomCount3" value="1" min="1" readonly></td>
					</tr>
					<tr>
						<th>객실 가격</th>
						<td colspan="2"><input type="text" id="roomPrice3" name="roomPrice3" size="25" readonly></td>
						<th style="width:60px;">정원</th>
						<td><input type="number" id="roomPeople3" name="roomPeople3" value="1" min="1" readonly></td>
					</tr>
					<tr>
						<th>등록 기간</th>
						<td colspan="4">
							<input type="radio" name="term" id="1month" value="1" checked readonly><label for="1month">1개월</label>
							<input type="radio" name="term" id="3month" value="3" readonly><label for="3month">3개월</label>
							<input type="radio" name="term" id="6month" value="6" readonly><label for="6month">6개월</label>
							<input type="radio" name="term" id="9month" value="9" readonly><label for="9month">9개월</label>
							<input type="radio" name="term" id="12month" value="12" readonly><label for="12month">12개월</label>
						</td>
					</tr>
					<tr>
						<td colspan="5" align="center">
							<button type="reset" class="btn btn-default">취소</button>&nbsp;&nbsp;
							<button type="submit" class="btn btn-success">수정</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	
	<jsp:include page="../common/footer.jsp"/>
	
</body>
</html>