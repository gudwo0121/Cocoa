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
<title>CoCoa</title>
</head>
<body style="background-color: #FFEBCD">

	<!-- 상단바 -->
	<jsp:include page="header.jsp"></jsp:include>

	<!-- 카테고리 구간 -->
	<header class="py-5" style="background-color: #663333">
		<div class="container px-4 px0lg05 my-5">

			<!-- 코칭 / 프로젝트 cate -->
			<div class="d-grid gap-3 d-sm-flex justify-content-sm-center">
				<input id="project" type="button"
					class="btn btn-primary btn-lg px-4 me-sm-3"
					onClick="location.href='/cocoa/'" value="Project"> <input
					id="project" type="button"
					class="btn btn-primary btn-lg px-4 me-sm-3"
					onClick="location.href='/cocoa/view_coachCate'" value="Coaching">
			</div>
			<br>

			<!-- 코칭 langs cate -->
			<div id="langs"
				class="d-grid gap-3 d-sm-flex justify-content-sm-center">
				<input id="C/C++" type="button"
					class="btn btn-primary btn-lg px-4 me-sm-3"
					onClick="location.href='/cocoa/view_coachCate?lang=C'" value="C/C++"> 
				<input id="Java" type="button"
					class="btn btn-primary btn-lg px-4 me-sm-3"
					onClick="location.href='/cocoa/view_coachCate?lang=Java'" value="Java">
				 <input id="Python" type="button"
					class="btn btn-primary btn-lg px-4 me-sm-3"
					onClick="location.href='/cocoa/view_coachCate?lang=Python'" value="Python">
			</div>

		</div>
	</header>

	<!-- 코칭 카탈로그 구간 -->
	<section class="py-5">
		<div class="container px-4 px-lg-5 mt-5">

			<!-- 글 주제별 이동 -->
			<!-- 로그인 여부에따라 숨김 / 표시 -->
			<c:choose>
				<c:when test="${isLogOn == true && member != null}">
					<a id="cwrite_btn" class="btn btn-primary px-4 me-sm-3"
						href="/cocoa/view_coachWrite" style="float: right">c글작성</a>
				</c:when>
			</c:choose>
			<br> <br> <br>

			<!-- 생성된 코칭 카탈로그 표시 -->
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

				<!-- 반복문 시작 컨트롤러에서 addObject한 coachesList를 가져와서 coach라고 저장 -->
				<c:forEach var="coach" items="${coachesList}">

					<!-- 카탈로그 틀 -->
					<div class="col mb-5" id="coachCate">
						<div class="card h-100">

							<!-- 언어 표시 -->
							<div class="badge bg-dark text-white position-absolute"
								style="top: 0.5rem; right: 0.5rem">${coach.lang}</div>

							<!-- 간판 이미지 (src=경로) -->
							<img class="card-img-top"
								src="${contextPath}/coachImgDownload?coach=${coach.coach }&coachNO=${coach.coachNO}&cImg=${coach.cImg}"
								height="200px" alt="..."
								onerror="this.src='resources/image/sample.png'" />

							<!-- 간판이미지 아래 정보 -->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- 제목 -->
									<h5 class="fw-bolder">${coach.cTitle }</h5>
									<!-- 코치 -->
									${coach.coach}<br>
									<!-- 기본요금 -->
									${coach.basicPrice} 원
								</div>
							</div>

							<!-- coachInfo / projectInfo 이동 -->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto"
										href="${contextPath}/viewCoach?coachNO=${coach.coachNO}">Get
										in</a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				<!-- Coach 반복문 끝 -->

			</div>
		</div>
		<!-- 위의 카탈로그 틀이 반복 생성 및 표시 -->
	</section>

	<!-- 쪽 번호 구간 -->
	<div style="margin: 0 auto; font-size: 30px;">

		<c:if test="${pageMaker.prev }">
			<a
				href='<c:url value="/view_coachCate?lang=${cri.lang }&page=${pageMaker.startPage-1 }"/>'><i
				class=""></i></a>
		</c:if>

		<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }"
			var="pageNum">
			<a href='<c:url value="/view_coachCate?lang=${cri.lang }&page=${pageNum }"/>'><i
				class="">${pageNum }</i></a>
		</c:forEach>

		<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
			<a
				href='<c:url value="/view_coachCate?lang=${cri.lang }&page=${pageMaker.endPage+1 }"/>'><i
				class=""></i></a>
		</c:if>

	</div>

	<!-- 하단바 -->
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>