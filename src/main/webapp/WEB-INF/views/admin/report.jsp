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
    margin-bottom:5%;
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

.modal-body{
    width:90%;
    margin-left:auto;
    margin-right:auto;
    
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
                                <li><a href="#">일반회원 관리</a></li>
                                <li class="active">신고현황</li>
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
                                                          <li><a href="#">신고번호로 조회</a></li>
                                                          <li><a href="#">신고대상으로 조회</a></li>
                                                          <li><a href="#">미처리건만 조회</a></li>
                                                          <li class="divider"></li>
                                                          <li><a href="#">신고일로 조회</a></li>
                                                      </ul>
                                                  </div>
                                              </div>

</div>	
	
	<div class="tableArea" align="center">
<table class="type09">
    <thead>
    <tr>
        <th>신고번호</th>
        <th>구분</th>
        <th>신고대상</th>
        <th>신고일</th>
        <th>신고사유</th>
        <th>처리상황</th>
    </tr>
    </thead>
    <tbody>
    <% for(int i = 0; i < 10; i++){ %>
    <tr>
        <th scope="row">
        <a href="#myModal-1" data-toggle="modal">번호</a>
        </th>
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
	
	<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal-1" class="modal fade">
                                      <div class="modal-dialog">
                                          <div class="modal-content">
                                              <div class="modal-header">
                                                  <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                                                  <h4 class="modal-title" align="center" style="font-weight: bold;">블랙리스트 등록하기</h4>
                                              </div>
                                              <div class="modal-body">
                                                  <br>
                                                  <form class="form-horizontal" role="form">
                                                      <div class="form-group">
                                                          <label for="rRecordId" class="col-lg-2 col-sm-2 control-label">신고번호</label>
                                                          <div class="col-lg-10">
                                                              <input type="text" class="form-control" id="rRecordId" readonly>
                                                          </div>
                                                      </div>
                                                      <div class="form-group">
                                                          <label for="reportedId" class="col-lg-2 col-sm-2 control-label">신고대상</label>
                                                          <div class="col-lg-10">
                                                              <input type="text" class="form-control" id="reportedId" readonly>
                                                          </div>
                                                      </div>
                                                      <div class="form-group">
                                                          <label for="reportId" class="col-lg-2 col-sm-2 control-label">신고자</label>
                                                          <div class="col-lg-10">
                                                              <input type="text" class="form-control" id="reportId" readonly>
                                                          </div>
                                                      </div>
                                                      <div class="form-group">
                                                          <label for="rDate" class="col-lg-2 col-sm-2 control-label">신고일</label>
                                                          <div class="col-lg-10">
                                                              <input type="text" class="form-control" id="rDate" readonly>
                                                          </div>
                                                      </div>
                                                      <div class="form-group">
                                                          <label for="reason" class="col-lg-2 col-sm-2 control-label">신고사유</label>
                                                          <div class="col-lg-10">
                                                              <input type="text" class="form-control" id="reason" readonly>
                                                          </div>
                                                      </div>
                                                      <div class="form-group">
                                                          <label for="text" class="col-lg-2 col-sm-2 control-label">신고내용</label>
                                                          <div class="col-lg-10">
                                                              <textArea class="form-control" id="text" style="height:300px;" readonly>
                                                              </textArea>
                                                          </div>
                                                      </div>
                                                      <label class="col-lg-2 col-sm-2 control-label">기간</label>
                                                      <div class="radio" align="center">
                                                      
                                                  <label>
                                                      <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked="">
                                                      7일&nbsp;&nbsp;
                                                  </label>
                                              
                                                  <label>
                                                      <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
                                                      15일&nbsp;&nbsp;
                                                  </label>
                                                  <label>
                                                      <input type="radio" name="optionsRadios" id="optionsRadios3" value="option3">
                                                      30일&nbsp;&nbsp;
                                                  </label>
                                                  <label>
                                                      <input type="radio" name="optionsRadios" id="optionsRadios4" value="option4">
                                                      영구정지
                                                  </label>
                                              </div>
                                                      <br>
                                                      <div class="form-group" align="center">
                                                              <button type="submit" class="btn btn-info">블랙리스트 등록</button>
                                                              <button type="submit" class="btn btn-success">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;반려하기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
                                                          
                                                      </div>
                                                  </form>

                                              </div>

                                          </div>
                                      </div>
                                  </div>
	
	
	<script>
	
	</script>
</body>
</html>