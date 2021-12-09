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
<title>CoCoa</title>
</head>
<body>

	<!-- 상단바 -->
	<nav class="navbar navbar-expand-lg"
		style="background-color: #663333; height: 8vh;">

		<!-- 로고 -->
		<span style="margin: 0 auto;">
			<a class="navbar-brand" href="/cocoa/index"
				style="color: #CFFFE5; font-size: 30px;"
				onmouseover="this.style.color='black';"
				onmouseout="this.style.color='#CFFFE5';"><b>CoCoa</b></a>
		</span>

		<!-- 우측 상단 변경 -->
		<span>
			<c:choose>
				<c:when test="${isLogOn == true && member != null}">
					<form action="/cocoa/logout" method="get" class="d-flex">
						<input name="My Page" class="btn btn-outline-dark" type="button"
							value="My Page"
							onClick="location.href='/cocoa/view_myPageProfile'" />&nbsp;<input
							name="logout" class="btn btn-outline-dark" type="submit"
							value="logout" />
					</form>
				</c:when>
				<c:otherwise>
					<form action="/cocoa/view_login" method="get" class="d-flex">
						<input name="login" class="btn btn-outline-dark" type="submit"
							value="log in" />&nbsp; <input name="join"
							class="btn btn-outline-dark" type="button" value="Sign in"
							onClick="location.href='/cocoa/view_join'" />
					</form>
				</c:otherwise>
			</c:choose>
		</span>
	</nav>

</body>
</html>