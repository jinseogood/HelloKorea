<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.main{
		height:800px;
	}
	.title{
		width:800px;
		height:30px;
		text-align:left;
		font-size:18px;
		margin-top:5px;
	}
	#payOKTitle{
		width:800px;
		height:150px;
		text-align:center;
	}
	#airplaneIcon{
		width:150px;
		height:150px;
	}
	#orderInfo{
		width:800px;
	}
	#orderInfo tr{
		height:45px;
	}
	#orderInfo th{
		background:lightgray;
	}
	#productInfo{
		width:800px;
	}
	#productInfo tr{
		height:45px;
	}
	#productInfo th{
		text-align:center;
		background:lightgray;
	}
	#payInfo{
		width:800px;
	}
	#payInfo tr{
		height:45px;
	}
	#payInfo th{
		background:lightgray;
	}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<div class="main">
		<div class="notice" align="center">
			<br><br>
			<table id="payOKTitle" border="1">
				<tr>
					<td width="150px"><img id="airplaneIcon" src="${ contextPath }/resources/img/airplaneIcon.png"></td>
					<td colspan="3"><font>예약이 완료되었습니다.</font></td>
				</tr>
			</table>
			<br>
			<div class="title">주문정보</div>
			<table id="orderInfo" border="1">
				<tr>
					<th>주문번호</th>
					<td width="250px">1</td>
					<th width="150px">주문일자</th>
					<td width="250px">1</td>
				</tr>
				<tr>
					<th>주문자명</th>
					<td>1</td>
					<th>전화번호</th>
					<td>1</td>
				</tr>
			</table>
			<br>
			<div class="title">예약정보</div>
			<table id="productInfo" border="1">
				<tr>
					<th width="250px">업체명</th>
					<th width="250px">객실명</th>
					<th width="100px">가격</th>
					<th width="200px">예약 일자</th>
				</tr>
				<tr>
					<td>abc</td>
					<td>abc</td>
					<td style="text-align:center;">$198,000</td>
					<td style="text-align:center;">2018-10-08 - 2018-10-20</td>
				</tr>
			</table>
			<br>
			<div class="title">결제정보</div>
			<table id="payInfo" border="1">
				<tr>
					<th width="150px">결제 수단</th>
					<td>신용 카드 / 포인트</td>
				</tr>
				<tr>
					<td colspan="4" style="text-align:center;"><button type="button" onclick="goMyPage();">마이페이지</button></td>
				</tr>
			</table>
		</div>
	</div>
	
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
		function goMyPage(){
			location.href="myPageView.sell";
		}
	</script>
	
</body>
</html>