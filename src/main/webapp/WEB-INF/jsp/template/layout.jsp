<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Digital Lib.</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="/static/css/style.css">
</head>
<body>
<%-- <jsp:include page="../include/header.jsp" /> --%>
<div class="container">
	<div id="wrap" class="bg-light">
		<header class="d-flex bgTemp">
			<jsp:include page="../include/header.jsp" />
		</header>

		<div id="menu1" class="bgTemp d-flex justify-content-center">
			<jsp:include page="../include/nav.jsp" />
		</div>

			<jsp:include page="../main/main.jsp" />

		<footer class="bgTemp">
			<jsp:include page="../include/footer.jsp" />
		</footer>
	</div>
</div>
</body>

<!-- 단위 테스트
JUnit

TDD 테스트 주도 개발


String a = null;
a.isEmpty();

=>
npe -->

<script>
	$(document).ready(function() {
		$('input[name=searchType]').change(function() {
			alert($(this).val());
		});
	});
</script>
</html>