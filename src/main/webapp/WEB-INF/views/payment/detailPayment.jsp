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
	#itemTable{
		width:550px;
		height:300px;
	}
	#orderTable{
		width:550px;
		height:200px;
	}
	#priceTable{
		width:550px;
		height:150px;
	}
	#priceTable button{
		margin:1px;
	}
</style>
</head>
<body>
	<jsp:include page="../common/searchMenubar.jsp"/>
	<jsp:include page="../common/searchSubmenubar.jsp"/>
	
	<div class="main">
		<br><br>
		<div class="itemDetail" align="center">
			<table id="itemTable" border="1">
				<tr>
					<td rowspan="3" width="300px">이미지</td>
					<td>업체명</td>
					<td>ABC호텔</td>
				</tr>
				<tr>
					<td>기간</td>
					<td>2018/09/24 - 2018/10/24</td>
				</tr>
				<tr>
					<td>인원</td>
					<td>3 명</td>
				</tr>
			</table>
		</div>
		<br><br>
		<div class="orderDetail" align="center">
			<table id="orderTable" border="1">
				<tr>
					<td>이름</td>
					<td>성</td>
				</tr>
				<tr>
					<td><input type="text" name="firstName" size="20"></td>
					<td><input type="text" name="lastName" size="20"></td>
				</tr>
				<tr>
					<td colspan="2">연락처</td>
				</tr>
				<tr>
					<td colspan="2"><input type="tel" name="orderTel" size="25"></td>
				</tr>
				<tr>
					<td colspan="2">이메일</td>
				</tr>
				<tr>
					<td colspan="2"><input type="email" name="orderEmail" size="25"></td>
				</tr>
			</table>
		</div>
		<br><br>
		<div class="priceDetail" align="center">
			<table id="priceTable" border="1">
				<tr>
					<td width="80px">포인트</td>
					<td width="85px"><input type="text" name="point" size="5">P</td>
					<td><button style="width:50px; height:26px;">조회</button> (<span id="pointView">5000</span>P 보유)</td>
				</tr>
				<tr>
					<td>결제 금액</td>
					<td colspan="2">180,000 원</td>
				</tr>
				<tr>
					<td colspan="3" height="5px"><hr style="width:550px; border-style:dashed; border-width:2px; border-color:black;"></td>
				</tr>
				<tr>
					<td>총 금액</td>
					<td colspan="2">180,000 원</td>
				</tr>
				<tr style="text-align:center;">
					<td colspan="3"><button style="width:100px; height:30px;">이전으로</button>&nbsp;&nbsp;&nbsp;<button style="width:100px; height:30px;">결제하기</button></td>
				</tr>
			</table>
		</div>
		<br><br>
	</div>
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>