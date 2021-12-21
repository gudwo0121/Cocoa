<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/styles.css" rel="stylesheet" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/home.css" rel="stylesheet" />
<script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>
<title>Welcome to CoCoa!</title>
</head>
<body style="background-color: #FFEBCD">

	<!-- 상단바 -->
	<jsp:include page="header.jsp"></jsp:include>

	<!-- 카테고리 구간 -->
	<header class="py-5" style="background-color: #663333">
		<div class="container px-5">
			<div class="row gx-5 justify-content-center">
				<div class="col-lg-6">
					<div class="text-center my-5">
						<h1 class="display-5 fw-bolder text-white mb-2">Welcome to
							Cocoa!</h1>
						<p class="lead text-white-50 mb-4">다양한 코딩 경험을 쌓고 싶은 사람들의 커뮤니티</p>
					</div>
				</div>
			</div>
		</div>
	</header>

	<section class="py-5 border-bottom" id="categories"
		style="height: 70vh;">
		<div class="container px-5 my-5">
			<div class="row gx-5 justify-content-center">
				<div class="mb-5 mx-3 px-2 py-2"
					style="width: 300px; height: 200px;">
					<div class="mb-3">
						<i class="bi bi-laptop" style='font-size: 50px;'></i>
					</div>
					<h2 class="h4 fw-bolder">Project</h2>
					<p>
						다양한 주제의 프로젝트들이 <br> 여러분을 기다리고 있습니다!<br>원하는 프로젝트에 참여하거나 <br>
						직접 만들어 팀원을 모아보세요!
					</p>
					<a class="text-decoration-none" href="/cocoa/view_projectCate">
						살펴보기 <i class="bi bi-arrow-right"></i>
					</a>
				</div>
				<div class="mb-5 mx-3 px-2 py-2 round"
					style="width: 300px; height: 200px;">
					<div class="mb-3">
						<i class="bi bi-person-video3" style='font-size: 50px;'></i>
					</div>
					<h2 class="h4 fw-bolder">Coaching</h2>
					<p>
						코딩 공부가 어렵나요?<br>그렇다면 코치의 도움을 받아보세요!<br>디버깅부터 맞춤 지도까지!<br>뛰어난
						코치들이 기다리고 있습니다!
					</p>
					<a class="text-decoration-none" href="/cocoa/view_coachCate">
						살펴보기 <i class="bi bi-arrow-right"></i>
					</a>
				</div>
			</div>
		</div>
	</section>

	<!-- 하단바 -->
	<footer class="py-5 bg-dark mb-0"
		style="background-color: #212429; color: white;">
		<p class="m-0 text-center text-white">Copyright &copy; CoCoa 2021</p>
	</footer>

</body>
</html>