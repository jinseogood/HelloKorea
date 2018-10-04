<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.main{
    margin-bottom:10%;
}
.tableArea{
    width:80%;
    margin-left:auto;
    margin-right:auto;
    min-height:480px;
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
                                <li><a href="selectCompanyList.ad">제휴업체 관리</a></li>
                                <li><a href="selectCompanyList.ad">업체 승인·관리</a></li>
                                <li><a href="selectOneCompany.ad">${list.get(0).cName}</a></li>
                            </ul>
                            <!--breadcrumbs end -->
                        </div>
                    </div>
	
	
	</div>
		
			<form action="" method="post">
				<table id="detailTable" align="center">
					<tr>
						<th>상호명</th>
						<td colspan="4">${list.get(0).cName}</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td colspan="4">${list.get(0).cPhone}</td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="4">${list.get(0).cAddress}</td>
					</tr>
					<tr>
						<th>신청일</th>
						<td colspan="4">${list.get(0).crDate}</td>
					</tr>
					<tr>
						<th>승인일</th>
						<td colspan="4">${list.get(0).apDate}</td>
					</tr>
					<c:forEach var="r" items="${list}">
						<tr>
							<th>객실타입</th>
							<td colspan="2">${r.rType}</td>
							<th style="width:60px;">객실 수</th>
							<td>${r.rCount}실</td>
						</tr>
						<tr>
							<th>객실 가격</th>
							<td colspan="2">${r.rPrice}원</td>
							<th style="width:60px;">정원</th>
							<td>${r.rLimit}명</td>
						</tr>
					</c:forEach>
					<tr>
						<th>등록 기간</th>
						<td colspan="4">
						${list.get(0).crOpenTerm}
						</td>
					</tr>
					<tr>
						<th>첨부 파일</th>
						<td colspan="4">
						
						</td>
					</tr>
					<tr>
						<td colspan="5" align="center">
							<button type="button" class="btn btn-default" onclick="selectCompanyList()">목록으로</button>&nbsp;&nbsp;
							<c:when test="${list.get(0).apDate} == null">
							<button type="button" class="btn btn-success">제휴승인</button>
							</c:when>
							<button type="button" class="btn btn-success">제휴해지</button>
						</td>
					</tr>
				</table>
			</form>
		</div>

	<script>
	    function selectCompanyList(){
	    	location.href="selectCompanyList.ad";
	    }
	</script>
	<jsp:include page="../common/footer.jsp"/>
	
</body>
</html>