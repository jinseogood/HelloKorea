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
	#extendsTable th {
	    padding: 10px;
	    font-weight: bold;
	    text-align: center;
	    border-top: 1px solid #ccc;
	    border-bottom: 1px solid #ccc;
	    background: #f3f6f7;
	}
	#extendsTable td {
	    padding: 10px;
	    border-top: 1px solid #ccc;
	    border-bottom: 1px solid #ccc;
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
                            <li class="active">${ opList.get(0).companyName }</li>
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
						<td colspan="3"><input type="hidden" name="term" value="${ opList.get(0).term }">${ opList.get(0).term }</td>
						<td><button type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#extendsModal">연장하기</button></td>
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
	
	<!-- 기간 연장 모달 -->
	<div class="modal fade" id="extendsModal" role="dialog">
		<div class="modal-dialog" align="center">
	    
		  	<div class="modal-content" style="width:280px;">
		  		<div class="modal-header">
		  			<button type="button" class="close" data-dismiss="modal">&times;</button>
		  			<h4 class="modal-title">기간 연장</h4>
		  		</div>
		  		<div class="modal-body">
		  			<table id="extendsTable" align="center">
		  				<tr>
		  					<th>등록 기간</th>
		  					<td>
								<select id="term">
									<option value="1">1개월</option>
									<option value="3">3개월</option>
									<option value="6">6개월</option>
									<option value="9">9개월</option>
									<option value="12">12개월</option>
								</select>
		  					</td>
		  					<td><button type="button" onclick="extendsPeriod();" class="btn btn-info btn-sm">연장</button></td>
		  				</tr>
		  			</table>
		  		</div>
		  		<div class="modal-footer" align="center">
		  		</div>
		  	</div>
	      
	  	</div>
	</div>
	
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
		function recvPage(){
			location.href="manageProduct.sell";
		}
		
		function extendsPeriod(){
			var term=$("#term").val();
			var cId=$("#detailTable").children().eq(0).val();
			location.href="extendsPeriod.sell?cId=" + cId + "&term=" + term;
		}
	</script>
	
</body>
</html>