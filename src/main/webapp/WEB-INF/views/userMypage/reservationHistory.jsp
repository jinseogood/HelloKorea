<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<div class="mainDiv">
		<jsp:include page="../common/userMenubar.jsp"/>
				<div class="row">
                        <div class="col-md-12">
                            <!--breadcrumbs start -->
                            <ul class="breadcrumb">
                                <li><a href="index.jsp"><i class="fa fa-home"></i> Home</a></li>
                                <li><a>활동내역</a></li>
                            </ul>
                            <!--breadcrumbs end -->
                        </div>
                    </div>
		<div class="tableDiv">
			<table id="reservationTable">
			<thead>
				<tr>
					<th width="60px">예약번호</th>
					<th width="150px">글제목</th>
					<th width="100px">글 종류</th>
					<th width="100px">좋아요</th>
					<th width="60px">댓글수</th>
					
				</tr>
			</thead>
			<c:forEach var="item" items="${reservationList}">
					<tbody>
					<tr>
						<td></td>
					</tr>
					</tbody>
			</c:forEach>
			</table>
		</div>
		</div>
		<jsp:include page="../common/footer.jsp"/>
</body>
</html>