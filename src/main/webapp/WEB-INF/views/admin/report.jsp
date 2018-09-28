<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    width:60%; 
    margin-bottom:6%;
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
                                <li><a href="selectReportList.ad">일반회원 관리</a></li>
                                <li class="active">신고현황</li>
                            </ul>
                            <!--breadcrumbs end -->
                        </div>
                    </div>
	
	
	</div>
	<div class="searchArea" align="center">
 <form action="selectReservationList.ad">
			<div class="col-xs-8 col-xs-offset-2">
		    <div class="input-group">
                <div class="input-group-btn search-panel">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    	<span id="search_concept">검색 카테고리</span> <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu">
                      <li><a href="#oId">신고 번호</a></li>
                      <li><a href="#cName">신고 대상</a></li>
                      <li><a href="#paName">미 처리건</a></li>
                      <li class="divider"></li>
                      <li><a href="#datePick" onclick="showDatePicker()">신고일</a></li>
                    </ul>
                </div>
                <input type="hidden" name="searchParam" value="all" id="searchParam">         
                <input type="text" class="form-control" name="searchWord" placeholder="검색어를 입력하세요">
                <span class="input-group-btn">
                    <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span></button>
                </span>
                </form>
            </div>
            
            
            <div id="datePicker">
            <br>
            <jsp:include page="../common/datePicker.jsp"/>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <button class="btn btn-white" type="submit">&nbsp;조회&nbsp;</button>
            <br>
            </div>
            
                </div>
                </div>
        </div>


	
	<script>
	 $(function(){
    	 $("#datePicker").hide();
    	 
     });
     function showDatePicker(){
    	 $("#datePicker").show();
    	 
     }
	$(document).ready(function(e){
	    $('.search-panel .dropdown-menu').find('a').click(function(e) {
			e.preventDefault();
			var param = $(this).attr("href").replace("#","");
			var concept = $(this).text();
			$('.search-panel span#search_concept').text(concept);
			$('.input-group #searchParam').val(param);
		});
	});
	
	</script>
	
	<div class="tableArea" align="center">
<table class="type09" id="reportTable">
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
    <c:forEach var="r" items="${ list }">
    <tr>
        <th scope="row">${r.rRecordId}</th>
        <td>${r.rLevelText}</td>
        <td>${r.rTarget}</td>
        <td>${r.rDate}</td>
        <td>${r.reason}</td>
        <td>${r.resultText}</td>
    </tr>
    </c:forEach>
    
    </tbody>
</table>
</div>
<div class="paging" align="center">
<ul class="pagination pagination-sm">
<c:if test="${ pi.currentPage <= 1 }">
<li><a>&laquo;</a></li>
            </c:if>
            <c:if test="${ pi.currentPage > 1 }">
                <c:url var="rlistBack" value="/selectReportList.ad">
                    <c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
                </c:url>
                <li><a href="${ rlistBack }">&laquo;</a></li>
            </c:if>
            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                <c:if test="${ p eq pi.currentPage }">
                <li><a href="#">${ p }</a></li>               
                </c:if>
                <c:if test="${ p ne pi.currentPage }">
                    <c:url var="rlistCheck" value="selectReportList.ad">
                         <c:param name="currentPage" value="${ p }"/>
                    </c:url>
                    <li><a href="${ rlistCheck }">${ p }</a></li>  
                </c:if>
            </c:forEach>
            <c:if test="${ pi.currentPage >= pi.maxPage }">
                <li><a>&raquo;</a></li>
            </c:if>
            <c:if test="${ pi.currentPage < pi.maxPage }">
                <c:url var="rlistEnd" value="selectReportList.ad">
                    <c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
                </c:url>
                <li><a href="${ rlistEnd }">&raquo;</a></li>
            </c:if>
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
	$(function(){
		$("#reportTable tr").click(function(){
			
			$(this).attr({"data-toggle":"modal", "data-target":"#myModal-1"});
		});
	});
</script>
</body>
</html>