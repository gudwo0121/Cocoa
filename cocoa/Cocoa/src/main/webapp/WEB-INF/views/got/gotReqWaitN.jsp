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
<script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#receiveReq').css('background-color', 'black');
	});
</script>
<title>CoCoa</title>
</head>
<body style="background-color: #FFEBCD; font-family: none;">

	<!-- 상단바 -->
	<jsp:include page="../header.jsp"></jsp:include>

	<!-- 받은 요청 클릭 (대기-거절전송) -->
	<div class="row" style="flex-wrap: unset; width: 80%;">

		<!-- 좌측 메뉴 -->
		<div class="col-sm-2">
			<div class="side"
				style="background-color: #333333; text-align: center;">
				<jsp:include page="../myPage/side.jsp"></jsp:include>
			</div>
		</div>

		<!-- 우측 내용 -->
		<div class="col-sm-10" style="min-height:80.7vh;">
			<div id="main"><jsp:include page="gotWaitNo.jsp"></jsp:include></div>
		</div>

	</div>

	<!-- 하단바 -->
	<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>