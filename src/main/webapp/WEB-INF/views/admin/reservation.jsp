<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.tableArea{
    width:80%;
    margin-left:auto;
    margin-right:auto;
}
.titleArea{
    padding:3%;
    width:70%;
    margin-left:auto;
    margin-right:auto;
}
.paging{
    padding:2%;
    margin-bottom:5%;
}
.searchArea{
    width:30%; 
    margin-bottom:3%;
    margin-left:auto;
    margin-right:auto;
}


table.type09 {
    width:80%;
    border-collapse: collapse;
    text-align: center;
    line-height: 1.5;

}
table.type09 thead th {
    padding: 10px;
    font-weight: bold;
    text-align: center;
    vertical-align: top;
    color: #369;
    border-bottom: 3px solid #036;
}
table.type09 tbody th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    text-align: center;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #f3f6f7;
}
table.type09 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}


</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<jsp:include page="../common/adminMenubar.jsp"/>
	<div class="main">
	
	<div class="titleArea">
	<div class="row">
                        <div class="col-md-12">
                            <!--breadcrumbs start -->
                            <ul class="breadcrumb">
                                <li><a href="myPageView.ad"><i class="fa fa-home"></i> Home</a></li>
                                <li><a href="#">예약내역 관리</a></li>
                                <li class="active">예약내역 조회</li>
                            </ul>
                            <!--breadcrumbs end -->
                        </div>
                    </div>
	
	
	</div>
			<div class="searchArea" align="center">
 <div class="input-group m-b-10">
                                                  <input type="text" class="form-control">
                                                  <div class="input-group-btn">
                                                      <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;조회 선택하기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="caret"></span></button>
                                                      <ul class="dropdown-menu pull-right">
                                                          <li><a href="#">예약번호로 조회</a></li>
                                                          <li><a href="#">예약처로 조회</a></li>
                                                          <li><a href="#">예약자로 조회</a></li>
                                                          <li class="divider"></li>
                                                          <li><a href="#">숙박일로 조회</a></li>
                                                      </ul>
                                                  </div>
                                              </div>



   
</div>	

	<div class="tableArea" align="center">
<table class="type09">
    <thead>
    <tr>
        <th>예약번호</th>
        <th>예약처</th>
        <th>예약자</th>
        <th>숙박일</th>
        <th>예약일</th>
        <th>예약상황</th>
    </tr>
    </thead>
    <tbody>
    <% for(int i = 0; i < 10; i++){ %>
    <tr>
        <th scope="row">번호</th>
        <td>내용</td>
        <td>내용</td>
        <td>내용</td>
        <td>내용</td>
        <td>내용</td>
    </tr>
    <% } %>
    
    </tbody>
</table>
</div>
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
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
	
	</script>
</body>
</html>