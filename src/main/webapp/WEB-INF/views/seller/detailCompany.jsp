<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                        	<li><a href="manageProduct.sell">업체 관리</a></li>
                            <li class="active">업체 상세</li>
                        </ul>
                    </div>
                </div>
			</div>
		
			<form action="editCompanyView.sell" method="post">
				<table id="detailTable" align="center">
					<input type="hidden" name="cId" value="${ opList.get(0).cId }">
					<tr>
						<th>상호명</th>
						<td colspan="4"><input type="hidden" name="companyName" value="${ opList.get(0).companyName }">${ opList.get(0).companyName }</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td colspan="4"><input type="hidden" name="companyPhone" value="${ opList.get(0).companyPhone }">${ opList.get(0).companyPhone }</td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="4"><input type="hidden" name="companyAddress" value="${ opList.get(0).companyAddress }">${ opList.get(0).companyAddress }</td>
					</tr>
					<c:forEach var="op" items="${ opList }">
						<tr>
							<th>객실타입</th>
							<td colspan="2"><input type="hidden" name="roomType" value="${ op.roomType }">${ op.roomType }</td>
							<th style="width:60px;">객실 수</th>
							<td><input type="hidden" name="roomCount" value="${ op.roomCount }">${ op.roomCount }</td>
						</tr>
						<tr>
							<th>객실 가격</th>
							<td colspan="2"><input type="hidden" name="roomPrice" value="${ op.roomPrice }">${ op.roomPrice }</td>
							<th style="width:60px;">정원</th>
							<td><input type="hidden" name="roomPeople" value="${ op.roomPeople }">${ op.roomPeople }</td>
						</tr>
					</c:forEach>
					<tr>
						<th>등록 기간</th>
						<td colspan="4"><input type="hidden" name="term" value="${ opList.get(0).term }">${ opList.get(0).term }</td>
					</tr>
					<tr>
						<td colspan="5" align="center">
							<button type="button" onclick="return recvPage();" class="btn btn-default">이전</button>&nbsp;&nbsp;
							<button type="submit" class="btn btn-success">수정</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
		function recvPage(){
			location.href="manageProduct.sell";
		}
	</script>
	
</body>
</html>