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
	#productTable{
		width:700px;
		border-collapse: collapse;
	    text-align: center;
	    line-height: 1.5;
	}
	#productTable tr{
		height:30px;
	}
	#productTable thead th{
		padding: 10px;
	    font-weight: bold;
	    text-align: center;
	    vertical-align: top;
	    color: #369;
	    border-bottom: 3px solid #036;
	}
	#productTable tbody th {
	    padding: 10px;
	    font-weight: bold;
	    text-align: center;
	    vertical-align: top;
	    border-bottom: 1px solid #ccc;
	    background: #f3f6f7;
	}
	#productTable td {
	    padding: 10px;
	    vertical-align: top;
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
                            <li class="active">상품 관리</li>
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
                                	<li><a href="#">상호명으로 조회</a></li>
                                    <li><a href="#">대표자로 조회</a></li>
                                    <li><a href="#">상태로 조회</a></li>
                                    <li class="divider"></li>
                                    <li><a href="#">기간으로 조회</a></li>
                                </ul>
                		</div>
            	</div>
			</div>	
		
			<table id="productTable" align="center">
				<thead>
					<tr>
						<th width="50px">No</th>
						<th width="150px">상호명</th>
						<th width="100px">대표자</th>
						<th width="200px">주소</th>
						<th width="100px">기간</th>
						<th width="100px">상태</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th></th>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th></th>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th></th>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
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
	
	<script>
		$(function(){
			$("#productTable td").click(function(){
				location.href="editCompanyView.sell";
			});
		});
	</script>
</body>
</html>