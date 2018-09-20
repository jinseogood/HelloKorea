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
                                <li><a href="reportView.ad">일반회원 관리</a></li>
                                <li class="active">문의현황</li>
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
                                                          <li><a href="#">문의번호로 조회</a></li>
                                                          <li><a href="#">문의자로 조회</a></li>
                                                          <li><a href="#">미처리건만 조회</a></li>
                                                          <li class="divider"></li>
                                                          <li><a href="#">문의일로 조회</a></li>
                                                      </ul>
                                                  </div>
                                              </div>



   
</div>	

	<div class="tableArea" align="center">
<table class="type09">
    <thead>
    <tr>
        <th>문의번호</th>
        <th>문의자</th>
        <th>문의내용</th>
        <th>문의일</th>
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
                                                  <h4 class="modal-title" align="center" style="font-weight: bold;">문의 답변하기</h4>
                                              </div>
                                              <div class="modal-body">
                                                  <br>
                                                  <form class="form-horizontal" role="form">
                                                      <div class="form-group">
                                                          <label for="msgId" class="col-lg-2 col-sm-2 control-label">문의번호</label>
                                                          <div class="col-lg-10">
                                                              <input type="text" class="form-control" id="msgId" readonly>
                                                          </div>
                                                      </div>
                                                      <div class="form-group">
                                                          <label for="sendId" class="col-lg-2 col-sm-2 control-label">문의자</label>
                                                          <div class="col-lg-10">
                                                              <input type="text" class="form-control" id="sendId" readonly>
                                                          </div>
                                                      </div>
                                                      <div class="form-group">
                                                          <label for="sendDate" class="col-lg-2 col-sm-2 control-label">문의일</label>
                                                          <div class="col-lg-10">
                                                              <input type="text" class="form-control" id="sendDate" readonly>
                                                          </div>
                                                      </div>
                                                      <div class="form-group">
                                                          <label for="content" class="col-lg-2 col-sm-2 control-label">문의내용</label>
                                                          <div class="col-lg-10">
                                                              <textArea class="form-control" id="content" style="height:300px;" readonly>
                                                              </textArea>
                                                          </div>
                                                      </div>
                                                      
                                                      <div class="input-group m-b-10">
                                                  <div class="input-group-btn" align="right">
                                                      <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">자주 묻는 질문에 답하기<span class="caret"></span></button>
                                                      <ul class="dropdown-menu pull-right">
                                                          <li><a href="#">ㅇㅇ관련답변</a></li>
                                                          <li><a href="#">xx관련답변</a></li>
                                                          <li><a href="#">**관련답변</a></li>
                                                          <li class="divider"></li>
                                                          <li><a href="#">%%관련답변</a></li>
                                                      </ul>
                                                  </div>
                                              </div>
                                                      <div class="form-group">
                                                          <label for="content2" class="col-lg-2 col-sm-2 control-label">답변내용</label>
                                                          <div class="col-lg-10">
                                                              <textArea class="form-control" id="content2" style="height:300px;">
                                                              </textArea>
                                                          </div>
                                                      </div>
                                                      
                                                      
                                              <br>
                                                      <div class="form-group" align="center">
                                                              <button type="submit" class="btn btn-info">문의답변 발송하기</button>
                                                          
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