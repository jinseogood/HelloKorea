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
		height:1100px;
		margin-left:auto;
		margin-right:auto;
	}
	.titleArea{
    	padding:3%;
    	width:70%;
    	margin-left:auto;
    	margin-right:auto;
	}
	#editTable{
		width:650px;
	}
	#editTable tr{
		height:40px;
		border-top:1px solid lightgray;
		border-bottom:1px solid lightgray;
	}
	#editTable th{
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
                        	<li><a onclick="productDetail();">${ eOP.get(0).companyName }</a>
                            <li class="active">업체 수정</li>
                        </ul>
                    </div>
                </div>
			</div>
		
			<form action="editCompany.sell" method="post">
				<table id="editTable" align="center">
					<input type="hidden" id="cId" name="cId" value="${ eOP.get(0).cId }">
					<tr>
						<th>상호명</th>
						<td colspan="4"><input type="hidden" name="companyName" value="${ eOP.get(0).companyName }">${ eOP.get(0).companyName }</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td colspan="4"><input type="hidden" name="companyPhone" value="${ eOP.get(0).companyPhone }">${ eOP.get(0).companyPhone }</td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="4"><input type="hidden" name="companyAddress" value="${ eOP.get(0).companyAddress }">${ eOP.get(0).companyAddress }</td>
					</tr>
					<c:set var="i" value="1"/>
					<c:forEach var="eOP" items="${ eOP }">
						<tr>
							<th>객실타입</th>
							<td colspan="2"><input type="text" name="roomType${ i }" value="${ eOP.roomType }" readonly></td>
							<th style="width:60px;">객실 수</th>
							<td><input type="number" name="roomCount${ i }" value="${ eOP.roomCount }" required></td>
						</tr>
						<tr>
							<th>객실 가격</th>
							<td colspan="2"><input type="text" name="roomPrice${ i }" value="${ eOP.roomPrice }" required></td>
							<th style="width:60px;">정원</th>
							<td><input type="text" name="roomPeople${ i }" value="${ eOP.roomPeople }" readonly></td>
						</tr>
						<c:set var="i" value="${ i+1 }"/>
					</c:forEach>
					<tr>
						<th>등록 기간</th>
						<td colspan="4"><input type="hidden" name="term" value="${ eOP.get(0).term }">${ eOP.get(0).term }</td>
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
	
	<script>
		function productDetail(){
			location.href="detailCompany.sell?cId=" + $("#cId").val();
		}
	</script>
	
</body>
</html>