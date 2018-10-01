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
                                <li><a href="selectBlacklist.ad">블랙리스트 관리</a></li>
                            </ul>
                            <!--breadcrumbs end -->
                        </div>
                    </div>
	
	
	</div>
	<div class="searchArea" align="center">
 <form action="selectBlacklist.ad">
			<div class="col-xs-8 col-xs-offset-2">
		    <div class="input-group">
                <div class="input-group-btn search-panel">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    	<span id="search_concept">검색 카테고리</span> <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu">
                      <li><a href="#bRecordId">블랙리스트 번호</a></li>
                      <li><a href="#mId">대상</a></li>
                      <li><a href="#noT">미해지건</a></li>
                      <li class="divider"></li>
                      <li><a href="#datePick" onclick="showDatePicker()">등록일자</a></li>
                      <li><a href="#datePick2" onclick="showDatePicker2()">해지일자</a></li>
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
     
     function showDatePicker2(){
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
<table class="type09">
    <thead>
    <tr>
        <th>블랙리스트 번호</th>
        <th>신고대상</th>
        <th>신고사유</th>
        <th>구분</th>
        <th>일자</th>
    </tr>
    </thead>
    <tbody>
     <c:forEach var="b" items="${ list }">
    <tr>
        <th scope="row">${b.bRecordId}</th>
        <td>${b.mId}</td>
        <td>${b.reason}</td>
        <td>${b.bTypeText}</td>
        <td>${b.inDate}</td>
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
                <c:url var="blistBack" value="selectBlacklist.ad">
                    <c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
                </c:url>
                <li><a href="${ blistBack }">&laquo;</a></li>
            </c:if>
            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                <c:if test="${ p eq pi.currentPage }">
                <li><a href="#" style="background-color:#ddd;">${ p }</a></li>               
                </c:if>
                <c:if test="${ p ne pi.currentPage }">
                    <c:url var="blistCheck" value="selectBlacklist.ad">
                         <c:param name="currentPage" value="${ p }"/>
                    </c:url>
                    <li><a href="${ blistCheck }">${ p }</a></li>  
                </c:if>
            </c:forEach>
            <c:if test="${ pi.currentPage >= pi.maxPage }">
                <li><a>&raquo;</a></li>
            </c:if>
            <c:if test="${ pi.currentPage < pi.maxPage }">
                <c:url var="blistEnd" value="selectBlacklist.ad">
                    <c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
                </c:url>
                <li><a href="${ blistEnd }">&raquo;</a></li>
            </c:if>
            </ul>
    </div>


	</div> 
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
	
	</script>
</body>
</html>