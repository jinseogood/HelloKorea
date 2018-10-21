<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#pointTable{
		margin-top:80px;
		width:700px;
		border-collapse: collapse;
	    text-align: center;
	    line-height: 1.5;
	    	margin-left:auto;
	margin-right:auto;
	}
 tr{
	height:30px;
	}
 thead th{
		padding: 10px;
	    font-weight: bold;
	    text-align: center;
	    vertical-align: top;
	    color: #369;
	    border-bottom: 3px solid #036;
	}
	 tbody th {
	    padding: 10px;
	    font-weight: bold;
	    text-align: center;
	    vertical-align: top;
	    border-bottom: 1px solid #ccc;
	    background: #f3f6f7;
	}
	 td {
	    padding: 10px;
	    vertical-align: top;
	    border-bottom: 1px solid #ccc;
	}
	.mainDiv{
		margin-left:auto;
		margin-right:auto;
		height:800px;
	
	}
	.tableDiv{
	margin-left:auto;
	margin-right:auto;
	
	
}

</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<div class="mainDiv">
		<jsp:include page="../common/userMenubar.jsp"/>
		<div class="tableDiv">
			<table id="pointTable">
			<thead>
				<tr>
					<th width="80px">No</th>
					<th width="150px">적립일</th>
					<th width="100px">amount</th>
					<th width="150px">적립요소</th>
					
				</tr>
			</thead>
			<c:forEach var="item" items="${pointList}">
					<tbody>
					<tr>
						<td>${item.pId }</td>
						<td>${item.pDate }</td>
						<td>${item.amount }</td>
						<td>${item.paType }</td>
					</tr>
					</tbody>
			</c:forEach>
			</table>
		</div>
		</div>
		<jsp:include page="../common/footer.jsp"/>
</body>
</html>