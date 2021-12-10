<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<link
	href='https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css'
	rel='stylesheet'>
<link href='https://use.fontawesome.com/releases/v5.7.2/css/all.css'
	rel='stylesheet'>
<link href="resources/css/login-styles.css" rel="stylesheet" />
<!-- 로그인 실패시 알림 -->
<c:choose>
	<c:when test="${result=='loginFailed'}">
		<script>
			window.onload = function() {
				alert("아이디나 비밀번호가 틀립니다. 다시 로그인하세요!");
			}
		</script>
	</c:when>
</c:choose>
<title>CoCoa</title>
</head>
<body>

	<!-- 로그인 -->
	<form action="/cocoa/login" method="post">
		<div class="container">
			<div class="card rcol py">
				<h2 class="heading mt-5 mb-4" align="center">
					<a href="/cocoa/">CoCoa</a>
				</h2>
				<h5 class="mb-2">
					<b>로그인</b>
				</h5>

				<div class="fone mt-3">
					<i class="fas fa-id-card"
						style="color: black; padding-left: 10px; padding-top: 4px;"></i> <input
						type="text" name="id" class="form-control"
						style="padding-left: 50px;" placeholder="ID">
				</div>
				<div class="fone mt-5">
					<i class="fas fa-lock"
						style="color: black; padding-left: 10px; padding-top: 4px;"></i> <input
						type="password" name="pwd" class="form-control"
						style="padding-left: 50px;" placeholder="Password">
				</div>
				<button type="submit" class="btn btn-success mt-5"
					style="margin: 0 auto; width: 50%;">Log In</button>

				<br>
				<p class="exist mt-2">
					Don't have an account? <a class="warning" href="view_join">Register</a>
				</p>
			</div>
		</div>
	</form>

</body>
</html>