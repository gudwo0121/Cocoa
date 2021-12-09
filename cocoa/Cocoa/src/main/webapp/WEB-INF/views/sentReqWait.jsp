<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
<link href="resources/css/styles.css" rel="stylesheet" />
<style type="text/css">
.side {
	float: left;
	width: 10%;
	height: 900px;
}
</style>
<script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#preview').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	var cnt = 1;
	function fn_addFile() {
		$("#d_file")
				.append("<br>" + "<input type='file' name='file"+cnt+"' />");
		cnt++;
	}
</script>
<title>CoCoa</title>
</head>
<body style="background-color: #FFEBCD; font-family: none;">

	<!-- 상단바 -->
	<nav class="navbar navbar-expand-lg" style="background-color: #663333;">

		<div class="container px-5 px-lg-5" style="max-width: 1830px;">

			<!-- 로고 -->
			<a class="navbar-brand" href="/cocoa/"
				style="color: #CFFFE5; font-size: 30px;"
				onmouseover="this.style.color='black';"
				onmouseout="this.style.color='#CFFFE5';"><b>CoCoa</b></a>

			<div class="collapse navbar-collapse">

				<!-- 상단 가운데공간 지우면 안됌 -->
				<div class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-6"></div>

				<!-- 우측 상단 변경 -->
				<form action="/cocoa/logout" method="get">
					<input name="My Page" class="btn btn-outline-dark" type="button"
						value="My Page" style="background-color: white; color: black;"
						onmouseover="this.style.color='white'; this.style.backgroundColor='black';"
						onmouseout="this.style.color='black'; this.style.backgroundColor='white';"
						onClick="location.href='/cocoa/view_myPageProfile'" /> <input
						name="logout" class="btn btn-outline-dark"
						style="background-color: white; color: black;"
						onmouseover="this.style.color='white'; this.style.backgroundColor='black';"
						onmouseout="this.style.color='black'; this.style.backgroundColor='white';"
						type="submit" value="logout" />
				</form>
			</div>
		</div>
	</nav>

	<div class="row" style="flex-wrap: unset; width: 15%;">
		<!-- 좌측 메뉴 jsp 호출 -->
		<div class="side"
			style="background-color: #333333; text-align: center;">
			<jsp:include page="side.jsp"></jsp:include>
		</div>
		<!-- 내용 jsp 호출 -->
		<div class="col-sm-9">
			<div id="main"><jsp:include page="sentWait.jsp"></jsp:include></div>
		</div>
	</div>

	<!-- 하단바 (마지막에 추가) -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; CoCoa 2021</p>
		</div>
	</footer>
</body>
</html>