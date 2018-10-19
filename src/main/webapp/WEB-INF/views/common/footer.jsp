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
	</script>
</body>
</html>