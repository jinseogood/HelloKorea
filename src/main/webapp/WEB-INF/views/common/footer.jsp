<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
</head>
<body>
	<footer class="tm-black-bg">
		<div class="container">
		  <div id="google_translate_element"></div>
			<select id="currency" onChange="javascript:changeCUR();">
				<option value="NO">Currency</option>
				<option value="AED">UAE Dirham</option>
				<option value="AUD">Australia Dollars</option>
				<option value="BHD">Bahrain Dinar</option>
				<option value="CAD">Canada Dollars</option>
				<option value="CHF">Swiss Franc</option>
				<option value="CNH">China Yuan</option>
				<option value="DKK">Denmark Kroner</option>
				<option value="EUR">Euro</option>
				<option value="GBP">United Kingdom Pounds</option>
				<option value="HKD">Hong Kong Dollars</option>
				<option value="IDR(100)">Indonesia Rupiah</option>
				<option value="JPY(100)">Japan Yen</option>
				<option value="KRW">South Korea Won</option>
				<option value="KWD">Kuwait Dinar</option>
				<option value="MYR">Malaysia Ringgit</option>
				<option value="NOK">Norway Kroner</option>
				<option value="NZD">New Zealand Dollars</option>
				<option value="SAR">Saudi Arabia Riyal</option>
				<option value="SEK">Sweden Krona</option>
				<option value="SGD">Singapore Dollars</option>
				<option value="THB">Thailand Baht</option>
				<option value="USD">United States Dollars</option>
			</select>

			<a href="helpView" style="float:right; color:#FCDD44;">도움말 센터</a>
			<div class="row">
				<p class="tm-copyright-text">Copyright &copy; 2018 Hello Korea</p>
			</div>
		</div>
	</footer>

	<script>
	  function googleTranslateElementInit() {
		  new google.translate.TranslateElement({pageLanguage: 'ko'}, 'google_translate_element');
		  jQuery('.goog-logo-link').css('display', 'none');
		  jQuery('.goog-te-gadget').css('font-size', '0');
	  }
	
		function changeCUR(){
			var cur=$("#currency").val();
			
			if(cur == null || cur == "NO"){
				cur="KRW";
			}
			
			$.ajax({
				url:"currencyCheck.pay",
				type:"POST",
				data:{cur:cur},
				dataType:"json",
				success:function(data){
					
					var sCur;
					
					for(var i=0;i<data.length;i++){
						if(cur == data[i].cur_unit){
							sCur=data[i].kftc_bkpr;
						}
					}
					
					sCur=sCur.trim(",");
					
					$.ajax({
						url:"currencySetting.pay",
						type:"POST",
						data:{cur:cur, sCur:sCur},
						success:function(data){
							//console.log(data);
							
							/* if(data == 1){
								alert("통화 변경 성공");
							}
							else{
								alert("통화 변경 실패");
							} */
						},
						error:function(data){
							console.log(data);
						}
					});
					
				},
				error:function(data){
					console.log(data);
				}
			});
		}
	</script>

</body>
</html>