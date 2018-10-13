<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.content{
		width:800px;
		height:800px;
		margin-left:auto;
		margin-right:auto;
	}
	.titleArea{
    	padding:3%;
    	width:700px;
    	margin-left:auto;
    	margin-right:auto;
	}
	.searchArea{
	    width:300px;
	    margin-bottom:5%;
	    margin-left:auto;
	    margin-right:auto;
	}
	.paging{
	    padding:2%;
	    margin-bottom:5%;
	}
	#reservationTable{
		width:700px;
		border-collapse: collapse;
	    text-align: center;
	    line-height: 1.5;
	}
	#reservationTable tr{
		height:30px;
	}
	#reservationTable thead th{
		padding: 10px;
	    font-weight: bold;
	    text-align: center;
	    vertical-align: top;
	    color: #369;
	    border-bottom: 3px solid #036;
	}
	#reservationTable tbody th {
	    padding: 10px;
	    font-weight: bold;
	    text-align: center;
	    vertical-align: top;
	    border-bottom: 1px solid #ccc;
	    background: #f3f6f7;
	}
	#reservationTable td {
	    padding: 10px;
	    vertical-align: top;
	    border-bottom: 1px solid #ccc;
	}
	
	#reservationDetailTable{
		width:500px;
		line-height: 1.5;
	}
	#reservationDetailTable tr{
		height:30px;
	}
	#reservationDetailTable th{
		padding: 3px;
	    text-align: center;
	    vertical-align: middle;
	    border-right: 3px solid #036;
	    background: #f3f6f7;
	}
	#reservationDetailTable select{
		margin: 3px;
	}
	#reservationDetailTable td{
	    padding: 3px;
	    vertical-align: middle;
	    border: 1px solid #ccc;
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
                            <li class="active">예약 내역</li>
                        </ul>
                    </div>
                </div>
			</div>
			
			<div class="searchArea" align="center">
				<div class="input-group m-b-10">
            		<input type="text" class="form-control">
                    	<div class="input-group-btn">
                        	<button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;조회 선택하기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="caret"></span></button>
                            	<ul class="dropdown-menu pull-right">
                                	<li><a href="#">주문번호로 조회</a></li>
                                    <li><a href="#">주문자로 조회</a></li>
                                    <li><a href="#">상태로 조회</a></li>
                                </ul>
                		</div>
            	</div>
			</div>	
		
			<table id="reservationTable" align="center">
				<thead>
					<tr>
						<th width="50px">No</th>
						<th width="150px">주문번호</th>
						<th width="100px">주문자</th>
						<th width="200px">예약 시작일</th>
						<th width="200px">예약 종료일</th>
						<th width="100px">상태</th>
					</tr>
				</thead>
				<tbody>
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
                    <li><a href="#">6</a></li>
                    <li><a href="#">7</a></li>
                    <li><a href="#">8</a></li>
                    <li><a href="#">9</a></li>
                    <li><a href="#">10</a></li>
                    <li><a href="#">&raquo;</a></li>
                </ul>
            </div>

	</div> 
			
		</div>
	</div>
	
	<jsp:include page="../common/footer.jsp"/>
	
	<!-- 예약 디테일 -->
	<div class="modal fade" id="reservationDetailModal" role="dialog">
		<div class="modal-dialog" align="center">
	    
		  	<div class="modal-content" style="width:530px;">
		  		<div class="modal-header">
		  			<button type="button" class="close" data-dismiss="modal">&times;</button>
		  			<h4 class="modal-title">예약 내역</h4>
		  		</div>
		  		<div class="modal-body">
		  			<table id="reservationDetailTable">
		  				<tr>
		  					<th>예약자</th>
		  					<td colspan="3"><p>김진서</p></td>
		  				</tr>
		  				<tr>
		  					<th>기간</th>
		  					<td colspan="3">
		  						<p>2018/09/20 - 2018/10/20</p>
		  					</td>
		  				</tr>
		  				<tr>
		  					<th style="border-right:3px solid orangered;">객실 타입</th>
		  					<td><p>스위트룸</p></td>
		  					<th style="border-right:3px solid orangered;">객실 수</th>
		  					<td><p>1 개</p></td>
		  				</tr>
		  				<tr>
		  					<th style="border-right:3px solid orangered;">객실 타입</th>
		  					<td><p>일반실</p></td>
		  					<th style="border-right:3px solid orangered;">객실 수</th>
		  					<td><p>1 개</p></td>
		  				</tr>
		  				<tr>
		  					<th>인원 수</th>
		  					<td colspan="3"><p>5 명</p></td>
		  				</tr>
		  				<tr>
		  					<th>금액</th>
		  					<td><p>380,000 원</p></td>
		  					<th>상태</th>
		  					<td>
		  						<select name="rStatus">
		  							<option value="wait">결제 대기</option>
		  							<option value="ok">결제 완료</option>
		  						</select>
		  						&nbsp;
		  						<button type="button" class="btn btn-warning btn-sm">설정</button>
		  					</td>
		  				</tr>
		  			</table>
		  		</div>
		  		<div class="modal-footer" align="center">
		  		</div>
		  	</div>
	      
	  	</div>
	</div>
	
	<script>
		$(function(){
			$("#reservationTable td").click(function(){
				$(this).attr({"data-toggle":"modal", "data-target":"#reservationDetailModal"});
			});
		});
	</script>
</body>
</html>