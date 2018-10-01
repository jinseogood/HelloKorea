<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<style>
#mainDiv {
	width: 500px;
	height: 350px;
	margin-left: auto;
	margin-right: auto;
	background: #FAFAFA;
}

#nickname {
	width: 300px;
	height: 50px;
}

#insertTable {
	margin-left: auto;
	margin-right: auto;
	margin-top: 30px;
}

#topDiv {
	margin-top: 40px;
	margin-left: auto;
	margin-right: auto;
}

button {
	width: 300px;
	height: 50px;
	margin-top: 30px;
	border: none;
}

#national {
	width: 300px;
	height: 50px;
}
#interest{
	width: 300px;
	height: 50px;
}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<h4 align="center">You can get more information by entering
		additional information!</h4>
	<div id="mainDiv">
		<form action="addUser.me" method="post">
			<table id="insertTable">

				<tr>
					<input type="hidden" name="mId" value="${mid}" />
					<th>NickName</th>
				</tr>
				<tr>
					<td><input type="text" name="nickname" id="nickname"></td>
				</tr>
				<tr>

					<th>National</th>
				</tr>
				<tr>
					<td><select name="national" id="national">
							<option>----</option>
							<option value="가나">Ghana</option>
							<option value="가봉">Gabon</option>
							<option value="가이아나">Guyana</option>
							<option value="감비아">Gambia</option>
							<option value="과테말라">Guatemala</option>
							<option value="그레나다">Grenada</option>
							<option value="그리스">Greece</option>
							<option value="기니">Guinea</option>
							<option value="기니비사우">Guinea-Bissau</option>
							<option value="나미비아">Namibia</option>
							<option value="나우루">Nauru</option>
							<option value="나이지리아">Nigeria</option>
							<option value="남아프리카">South Africa</option>
							<option value="네덜란드">Netherlands</option>
							<option value="네팔">Nepal</option>
							<option value="노르웨이">Norway</option>
							<option value="뉴질랜드">NewZealand</option>
							<option value="대한민국">Korea</option>
							<option value="덴마크">Denmark</option>
							<option value="도미니카">Dominica</option>
							<option value="독일">Germany</option>
							<option value="라오스">Laos</option>
							<option value="러시아">Russia</option>
							<option value="루마니아">Romania</option>
							<option value="룩셈부르크">Luxembourg</option>
							<option value="말레이시아">Malaysia</option>
							<option value="말리">Mali</option>
							<option value="멕시코">Mexico</option>
							<option value="모나코">Monaco</option>
							<option value="몰디브">MaldiveIslands</option>
							<option value="몰타">Malta</option>
							<option value="몽골">Mongolia</option>
							<option value="미국">USA</option>
							<option value="미얀마">Myanmar</option>
							<option value="바누아투">Vanuatu</option>
							<option value="바레인">Bahrain</option>
							<option value="바베이도스">Barbados</option>
							<option value="바티칸">Vatican</option>
							<option value="방글라데시">Bangladesh</option>
							<option value="베트남">Vietnam</option>
							<option value="벨기에">Belgium</option>
							<option value="불가리아">Bulgaria</option>
							<option value="브라질">Brazil</option>
							<option value="사우디아라비아">SaudiArabia</option>
							<option value="산마리노">San Marino</option>
							<option value="세네갈">Senegal</option>
							<option value="세르비아">Serbia</option>
							<option value="소말리아">Somalia</option>
							<option value="스리랑카">Sri Lanka</option>
							<option value="스웨덴">Sweden</option>
							<option value="스위스">Swiss</option>
							<option value="스페인">Spain</option>
							<option value="시리아">Syria</option>
							<option value="슬로바키아">Slovakia</option>
							<option value="슬로베니아">Slovenian</option>
							<option value="싱가포르">Singapore</option>
							<option value="아랍에미리트">United Arab Emirates</option>
							<option value="아르메니아">Armenia</option>
							<option value="아르헨티나">Argentina</option>
							<option value="아이슬란드">Iceland</option>
							<option value="아제르바이잔">Azerbaijan</option>
							<option value="인도">India</option>
							<option value="아프가니스탄">Afghanistan</option>
							<option value="알제리">Algeria</option>
							<option value="앙골라">Angola</option>
							<option value="에콰도르">Ecuador</option>
							<option value="영국">England</option>
							<option value="예멘">Yemen</option>
							<option value="오만">Oman</option>
							<option value="오스트렐리아">Australia</option>
							<option value="오스트리아">Austria</option>
							<option value="요르단">Jordan</option>
							<option value="우간다">Uganda</option>
							<option value="우즈베키스탄">Uzbekistan</option>
							<option value="우크라니아">Ukraine</option>
							<option value="이란">Iran</option>
							<option value="이스라엘">Israel</option>
							<option value="이탈리아">Italy</option>
							<option value="인도네시아">Indonesia</option>
							<option value="일본">Japan</option>
							<option value="자메이카">Jamaica</option>
							<option value="잠비아">Zambia</option>
							<option value="조지아">Georgia</option>
							<option value="중국">China</option>
							<option value="체코">Czech Republic</option>
							<option value="칠레">Chile</option>
							<option value="카메룬">Cameroon</option>
							<option value="카보베르데">Cape Verde</option>
							<option value="카자흐스탄">Kazakhstan</option>
							<option value="카타르">catarrh</option>
							<option value="캄보디아">Cambodia</option>
							<option value="캐나다">Canada</option>
							<option value="케냐">Kenya</option>
							<option value="코모로">Comoros</option>
							<option value="코스타리카">Costa Rica</option>
							<option value="코트디아부르">Cote d'Ivoire</option>
							<option value="콜롬비아">Columbia</option>
							<option value="콩고">Congo</option>
							<option value="쿠바">Cuba</option>
							<option value="쿠웨이트">Kuwait</option>
							<option value="크로아티아">Croatia</option>
							<option value="타지키스탄">Tajikistan</option>
							<option value="탄자니아">Tanzania</option>
							<option value="태국">Thailand</option>
							<option value="터키">Turkey</option>
							<option value="토고">Togo</option>
							<option value="파나마">Panama</option>
							<option value="파라과이">Paraguay</option>
							<option value="파기스탄">Pakistan</option>
							<option value="파푸아뉴기니">Papua New Guinea</option>
							<option value="팔라우">Palau</option>
							<option value="페루">Peru</option>
							<option value="포르투갈">Portugal</option>
							<option value="폴란드">Poland</option>
							<option value="프랑스">France</option>
							<option value="피지">sebum</option>
							<option value="필란드">Finland</option>
							<option value="필리핀">Philippines</option>
							<option value="헝가리">Hungary</option>
							<option value="아르차흐">Archach</option>
							<option value="소말리아">Somalia</option>
							<option value="타이완">Taiwan</option>
					</select></td>
					
				</tr>
				<tr>
					<th>Interest</th>
				</tr>
				<tr>
					<td><select name="interest" id="interest">
							<option>----</option>
							<option value="뷰티">beauty</option>
							<option value="관광">tourism</option>
							<option value="전통">tradition</option>
							<option value="레져">Leisure</option>
							<option value="한류">Korean wave</option>
					</select></td>
				</tr>
			</table>
			<div align="center">
				<button>JOIN</button>
			</div>
		</form>
	</div>
</body>
</html>