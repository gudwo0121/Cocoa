<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/styles.css" rel="stylesheet" />
<script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>
<title>Welcome to CoCoa!</title>
</head>
<body style="background-color: #FFEBCD">

	<!-- 상단바 -->
	<jsp:include page="header.jsp"></jsp:include>

	<!-- 카테고리 구간 -->
	<header class="py-5" style="background-color: #663333">
		<div class="container px-4 px0lg05 my-5">

			<!-- topic -->
			<div style="text-align: center;" id="topic">
				<input id="project" type="button"
					class="btn btn-primary btn-lg px-4 me-sm-3"
					onClick="location.href='/cocoa/view_projectCate'" value="Project">
				<input id="coaching" type="button"
					class="btn btn-primary btn-lg px-4 me-sm-3"
					onClick="location.href='/cocoa/view_coachCate'" value="Coaching">
			</div>

		</div>
	</header>

	<!-- 임의로 넣어둔 카탈로그 공간 -->
	<div style="height: 500px;"></div>

	<!-- 하단바 -->
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>