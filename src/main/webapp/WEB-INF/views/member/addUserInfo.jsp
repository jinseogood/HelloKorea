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
							<option value="Ghana">Ghana</option>
							<option value="Gabon">Gabon</option>
							<option value="Guyana">Guyana</option>
							<option value="Gambia">Gambia</option>
							<option value="Guatemala">Guatemala</option>
							<option value="Grenada">Grenada</option>
							<option value="Greece">Greece</option>
							<option value="Guinea">Guinea</option>
							<option value="Guinea-Bissau">Guinea-Bissau</option>
							<option value="Namibia">Namibia</option>
							<option value="Nauru">Nauru</option>
							<option value="Nigeria">Nigeria</option>
							<option value="South Africa">South Africa</option>
							<option value="Netherlands">Netherlands</option>
							<option value="Nepal">Nepal</option>
							<option value="Norway">Norway</option>
							<option value="NewZealand">NewZealand</option>
							<option value="Korea">Korea</option>
							<option value="Denmark">Denmark</option>
							<option value="Dominica">Dominica</option>
							<option value="Germany">Germany</option>
							<option value="Laos">Laos</option>
							<option value="Russia">Russia</option>
							<option value="Romania">Romania</option>
							<option value="Luxembourg">Luxembourg</option>
							<option value="Malaysia">Malaysia</option>
							<option value="Mali">Mali</option>
							<option value="Mexico">Mexico</option>
							<option value="Monaco">Monaco</option>
							<option value="MaldiveIslands">MaldiveIslands</option>
							<option value="Malta">Malta</option>
							<option value="Mongolia">Mongolia</option>
							<option value="USA">USA</option>
							<option value="Myanmar">Myanmar</option>
							<option value="Vanuatu">Vanuatu</option>
							<option value="Bahrain">Bahrain</option>
							<option value="Barbados">Barbados</option>
							<option value="Vatican">Vatican</option>
							<option value="Bangladesh">Bangladesh</option>
							<option value="Vietnam">Vietnam</option>
							<option value="Belgium">Belgium</option>
							<option value="Bulgaria">Bulgaria</option>
							<option value="Brazil">Brazil</option>
							<option value="SaudiArabia">SaudiArabia</option>
							<option value="San Marino">San Marino</option>
							<option value="Senegal">Senegal</option>
							<option value="Serbia">Serbia</option>
							<option value="Somalia">Somalia</option>
							<option value="Sri Lanka">Sri Lanka</option>
							<option value="Sweden">Sweden</option>
							<option value="Swiss">Swiss</option>
							<option value="Spain">Spain</option>
							<option value="Syria">Syria</option>
							<option value="Slovakia">Slovakia</option>
							<option value="Slovenian">Slovenian</option>
							<option value="Singapore">Singapore</option>
							<option value="United Arab Emirates">United Arab Emirates</option>
							<option value="Armenia">Armenia</option>
							<option value="Argentina">Argentina</option>
							<option value="Iceland">Iceland</option>
							<option value="Azerbaijan">Azerbaijan</option>
							<option value="India">India</option>
							<option value="Afghanistan">Afghanistan</option>
							<option value="Algeria">Algeria</option>
							<option value="Angola">Angola</option>
							<option value="Ecuador">Ecuador</option>
							<option value="England">England</option>
							<option value="Yemen">Yemen</option>
							<option value="Oman">Oman</option>
							<option value="Australia">Australia</option>
							<option value="Austria">Austria</option>
							<option value="Jordan">Jordan</option>
							<option value="Uganda">Uganda</option>
							<option value="Uzbekistan">Uzbekistan</option>
							<option value="Ukraine">Ukraine</option>
							<option value="Iran">Iran</option>
							<option value="Israel">Israel</option>
							<option value="Italy">Italy</option>
							<option value="Indonesia">Indonesia</option>
							<option value="Japan">Japan</option>
							<option value="Jamaica">Jamaica</option>
							<option value="Zambia">Zambia</option>
							<option value="Georgia">Georgia</option>
							<option value="China">China</option>
							<option value="Czech Republic">Czech Republic</option>
							<option value="Chile">Chile</option>
							<option value="Cameroon">Cameroon</option>
							<option value="Cape Verde">Cape Verde</option>
							<option value="Kazakhstan">Kazakhstan</option>
							<option value="catarrh">catarrh</option>
							<option value="Cambodia">Cambodia</option>
							<option value="Canada">Canada</option>
							<option value="Kenya">Kenya</option>
							<option value="Comoros">Comoros</option>
							<option value="Costa Rica">Costa Rica</option>
							<option value="Cote d'Ivoire">Cote d'Ivoire</option>
							<option value="Columbia">Columbia</option>
							<option value="Congo">Congo</option>
							<option value="Cuba">Cuba</option>
							<option value="Kuwait">Kuwait</option>
							<option value="Croatia">Croatia</option>
							<option value="Tajikistan">Tajikistan</option>
							<option value="Tanzania">Tanzania</option>
							<option value="Thailand">Thailand</option>
							<option value="Turkey">Turkey</option>
							<option value="Togo">Togo</option>
							<option value="Panama">Panama</option>
							<option value="Paraguay">Paraguay</option>
							<option value="Pakistan">Pakistan</option>
							<option value="Papua New Guinea">Papua New Guinea</option>
							<option value="Palau">Palau</option>
							<option value="Peru">Peru</option>
							<option value="Portugal">Portugal</option>
							<option value="Poland">Poland</option>
							<option value="France">France</option>
							<option value="sebum">sebum</option>
							<option value="Finland">Finland</option>
							<option value="Philippines">Philippines</option>
							<option value="Hungary">Hungary</option>
							<option value="Archach">Archach</option>
							<option value="Somalia">Somalia</option>
							<option value="Taiwan">Taiwan</option>
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