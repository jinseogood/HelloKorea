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
				<table id="addTable" align="center">
					<tr>
						<th>상호명</th>
						<td colspan="4"><input type="text" name="companyName" size="25" readonly></td>
					</tr>
					<tr>
						<th>대표자</th>
						<td colspan="4"><input type="text" name="companyMaster" size="25" readonly></td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="4"><input type="text" name="companyAddress" size="25" readonly></td>
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
							<input type="radio" name="term" id="1month" checked><label for="1month">1개월</label>
							<input type="radio" name="term" id="3month"><label for="3month">3개월</label>
							<input type="radio" name="term" id="6month"><label for="6month">6개월</label>
							<input type="radio" name="term" id="9month"><label for="9month">9개월</label>
							<input type="radio" name="term" id="12month"><label for="12month">12개월</label>
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