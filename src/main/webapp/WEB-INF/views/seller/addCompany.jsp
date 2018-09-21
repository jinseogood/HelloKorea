<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
	input{
		border-radius:5px;
	}
	.content{
		width:800px;
		height:800px;
		margin-left:auto;
		margin-right:auto;
	}
	.titleArea{
    	padding:3%;
    	width:650px;
    	margin-left:auto;
    	margin-right:auto;
	}
	.paging{
	    padding:1%;
	    margin-bottom:3%;
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
	#searchTable{
		width:330px;
		height:450px;
		line-height: 1.5;
		text-align:center;
	}
	#searchTable tr{
		height:30px;
	}
	#searchTable thead{
		padding: 10px;
	    text-align: center;
	    vertical-align: top;
	    border-bottom: 3px solid #036;
	    background: #f3f6f7;
	}
	#searchTable select{
		margin: 3px;
	}
	#searchTable tbody{
	    padding: 10px;
	    text-align: center;
	    vertical-align: top;
	    border: 1px solid #ccc;
	}
	#searchTable thead label{
		font-weight:normal;
	}
	#resultTable{
		width:100%;
		padding:5px;
	}
	#resultTable tr{
		border-bottom:1px solid lightgray;
		height:39px;
	}
	#resultTable td{
		text-align:left;
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
                            <li class="active">업체 등록</li>
                        </ul>
                    </div>
                </div>
			</div>
		
			<form action="" method="post">
				<table id="addTable" align="center">
					<tr>
						<th>구분</th>
						<td colspan="4" align="center">
							<input type="radio" name="sellerType" id="personal" checked><label for="personal">개인</label>
							&nbsp;&nbsp;
							<input type="radio" name="sellerType" id="company"><label for="company">법인</label>
						</td>
					</tr>
					<tr class="comType">
						<th>법인사업자등록번호</th>
						<td colspan="4"><input type="text" name="companyNum" size="25"></td>
					</tr>
					<tr class="comType">
						<th>법인사업자등록증</th>
						<td colspan="4"><input type="file" name="companyFile"></td>
					</tr>
					<tr>
						<th>사업자등록번호</th>
						<td colspan="4"><input type="text" name="personalNum" size="25"></td>
					</tr>
					<tr>
						<th>사업자등록증</th>
						<td colspan="4"><input type="file" name="personalFile"></td>
					</tr>
					<tr>
						<th>상호명</th>
						<td colspan="3"><input type="text" name="companyName" size="25"></td>
						<td><button type="button" class="btn btn-info" data-toggle="modal" data-target="#searchModal">검색</button></td>
					</tr>
					<tr>
						<th>대표자</th>
						<td colspan="4"><input type="text" name="companyMaster" size="25"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="4"><input type="text" name="companyAddress" size="25"></td>
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
							<input type="radio" name="term" id="1month" checked><label for="1month">1개월</label>&nbsp;
							<input type="radio" name="term" id="3month"><label for="3month">3개월</label>&nbsp;
							<input type="radio" name="term" id="6month"><label for="6month">6개월</label>&nbsp;
							<input type="radio" name="term" id="9month"><label for="9month">9개월</label>&nbsp;
							<input type="radio" name="term" id="12month"><label for="12month">12개월</label>
						</td>
					</tr>
					<tr>
						<td colspan="5" align="center">
							<button type="reset" class="btn btn-default">취소</button>&nbsp;&nbsp;
							<button type="submit" class="btn btn-success">등록</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	
	<!-- 상호 검색 -->
	<div class="modal fade" id="searchModal" role="dialog">
		<div class="modal-dialog" align="center">
	    
		  	<div class="modal-content" style="width:360px;">
		  		<div class="modal-header">
		  			<button type="button" class="close" data-dismiss="modal">&times;</button>
		  			<h4 class="modal-title">상호 검색</h4>
		  		</div>
		  		<div class="modal-body">
		  			<table id="searchTable">
		  				<thead>
			  				<tr>
			  					<td width="50%">
			  						<select id="area" style="width:90%;">
			  							<option value="0">지역</option>
			  							<option value="1">서울</option>
			  							<option value="2">인천</option>
			  							<option value="3">대전</option>
			  							<option value="4">대구</option>
			  							<option value="5">부산</option>
			  							<option value="6">울산</option>
			  						</select>
			  					</td>
			  					<td width="50%">
			  						<select id="roomType" style="width:90%;">
			  							<option value="no">유형</option>
			  							<option value="hotel">호텔</option>
			  							<option value="hanok">한옥</option>
			  							<option value="benekia">베네키아</option>
			  						</select>
			  					</td>
			  				</tr>
			  				<tr>
			  					<td colspan="2">
			  						<input type="text" id="searchText" name="searchText" size="30">&nbsp;&nbsp;
			  						<button type="button" class="btn btn-warning btn-sm" onclick="return searchCompany();">검색</button>
			  					</td>
			  				</tr>
		  				</thead>
			  			<tbody>
			  				<tr>
			  					<td colspan="2">
			  						<table id="resultTable">
			  							
			  						</table>
			  					</td>
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
                    		<li><a href="#">&raquo;</a></li>
                		</ul>
            		</div>
		  		</div>
		  		<div class="modal-footer" align="center">
		  		</div>
		  	</div>
	      
	  	</div>
	</div>
	
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
		$(function(){
			$(".comType").hide();
			
			$("#personal").click(function(){
				$(".comType").hide();
			});
			
			$("#company").click(function(){
				$(".comType").show();
			});
		});
		
		function searchCompany(){
			var area=$("#area").val();
			var rType=$("#roomType").val();
			var sText=$("#searchText").val();
			
			$.ajax({
				url:"searchCompany.sell",
				type:"get",
				data:{area:area, rType:rType, sText:sText},
				dataType:"json",
				success:function(data){
					console.log(data.response.body.items.item);
					
					$tableBody = $("#resultTable");
					$tableBody.html('');
					
					var company=data.response.body.items.item;
					
					for(var i=0;i<company.length;i++){
						var output="";
						output += "<tr><td><b>" + company[i].title + "</b><br>";
						output += "<font style='font-size:11px;'>" + company[i].addr1 + "</font></td></tr>";
						$tableBody.append(output);
					}
					
				}, error:function(data){
					console.log(data);
				}
			});
		}
	</script>
</body>
</html>