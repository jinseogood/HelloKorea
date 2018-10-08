<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.submenubar{
		background:black;
		color:white;
	}
	.submenuTitle{
		width:1170px;
		margin-left:auto;
		margin-right:auto;
	}
	.searchSubMenu{cursor:pointer;}
</style>
</head>
<body>
	<div class="submenubar">
		<div class="submenuTitle">
			<nav class="tm-nav">
				<ul>
					<li><a class="searchSubMenu" onclick="areaAll();" style="padding:10px 34px 10px 34px;">지역의 모든 것</a></li>
					<li><a class="searchSubMenu" href="aboutAreaHotel" style="padding:10px 34px 10px 34px;">숙박</a></li>
					<li><a class="searchSubMenu" href="aboutAreaFood" style="padding:10px 34px 10px 34px;">음식점</a></li>
					<li><a class="searchSubMenu" href="aboutAreaGame" style="padding:10px 34px 10px 34px;">오락거리</a></li>
				</ul>
			</nav>	
		</div>
		<script>
			//var areaCode = ${request.areaCode};
			function areaAll(areaCode){
				//console.log("서치서브메뉴바 : " +areaCode);
				//location.href="${contextPath}/areaAllView.main?areaCode"+areaCode;
			}
		</script>
	</div>
</body>
</html>