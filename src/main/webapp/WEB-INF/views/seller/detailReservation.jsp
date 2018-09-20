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
			<h2 style="padding-top:20px;">ㅁㅁㅁ 님 예약내역</h2>
			<hr>
			<form action="" method="post">
				<table id="addTable" align="center">
					<tr>
						<th>기간</th>
						<td colspan="4">
							<input type="text" name="reservationSDate" size="25"> &nbsp;- &nbsp;
							<input type="text" name="reservationEDate" size="25">
						</td>
					</tr>
					<tr>
						<th>금액</th>
						<td colspan="4"><input type="text" name="reservationPrice" size="25"></td>
					</tr>
					<tr>
						<th>객실타입</th>
						<td colspan="2"><input type="text" name="roomType1" size="25"></td>
						<th style="width:60px;">객실 수</th>
						<td><input type="number" name="roomCount1" value="1"></td>
					</tr>
					<tr>
						<th>객실타입</th>
						<td colspan="2"><input type="text" name="roomType2" size="25"></td>
						<th style="width:60px;">객실 수</th>
						<td><input type="number" name="roomCount2" value="1"></td>
					</tr>
					<tr>
						<th>객실타입</th>
						<td colspan="2"><input type="text" name="roomType3" size="25"></td>
						<th style="width:60px;">객실 수</th>
						<td><input type="number" name="roomCount3" value="1"></td>
					</tr>
					<tr>
						<td colspan="5" align="center">
							<button type="reset">취소</button>
							<button type="submit">확인</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	
	<jsp:include page="../common/footer.jsp"/>
	
</body>
</html>