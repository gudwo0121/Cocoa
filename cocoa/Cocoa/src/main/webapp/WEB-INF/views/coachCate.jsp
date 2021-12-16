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
<script type="text/javascript">
	// 정렬 기준 동적으로 변경
	function selChange() {
		var sel = document.getElementById('coachOrder').value;
		location.href = "view_coachCate?cField=${cri.cField }&tool=${cri.tool }&coachOrder="
				+ sel;
	}
</script>
<title>CoCoa</title>
</head>
<body style="background-color: #FFEBCD">

	<!-- 상단바 -->
	<jsp:include page="header.jsp"></jsp:include>

	<!-- 카테고리 구간 -->
	<header class="py-5"
		style="background-color: #663333; text-align: center;">
		<div class="row">

			<!-- 분류 -->
			<div class="col-sm-4">
				<div id="class" class="d gap-3">
					<div style="color: #CFFFE5; font-size: 25px;">분류</div>
					<br> <input id="project" type="button"
						class="btn btn-primary btn-lg px-4"
						onClick="location.href='/cocoa/view_projectCate'" value="Project"><br>
					<br> <input id="project" type="button"
						class="btn btn-primary btn-lg px-4"
						onClick="location.href='/cocoa/view_coachCate'" value="Coaching">
				</div>
			</div>

			<!-- 영역 -->
			<div class="col-sm-4">
				<div id="cFields" class="d gap-3">
					<div style="color: #CFFFE5; font-size: 25px; text-align: center;">영역
					</div>
					<br> <input id="Web" type="button"
						class="btn btn-primary btn-lg px-4"
						onClick="location.href='/cocoa/view_coachCate?cField=cField1'"
						value="Web"> <br> <br> <input id="Mobile App"
						type="button" class="btn btn-primary btn-lg px-4"
						onClick="location.href='/cocoa/view_coachCate?cField=cField2'"
						value="Mobile App"> <br> <br> <input
						id="Embedded" type="button" class="btn btn-primary btn-lg px-4"
						onClick="location.href='/cocoa/view_coachCate?cField=cField3'"
						value="Embedded">
				</div>
			</div>

			<!-- 개발툴 -->
			<div class="col-sm-4">
				<div id="tools" class="d gap-3">
					<div style="color: #CFFFE5; font-size: 25px; text-align: center;">개발툴</div>
					<br> <input id="Spring" type="button"
						class="btn btn-primary btn-lg px-4"
						onClick="location.href='/cocoa/view_coachCate?tool=tool1'"
						value="Spring" />&nbsp;&nbsp;<input id="Django" type="button"
						class="btn btn-primary btn-lg px-4"
						onClick="location.href='/cocoa/view_coachCate?tool=tool2'"
						value="Django" /><br> <br> <input id="AndroidStudio"
						type="button" class="btn btn-primary btn-lg px-4"
						onClick="location.href='/cocoa/view_coachCate?tool=tool3'"
						value="Android Studio" />&nbsp;&nbsp;<input id="Xcode"
						type="button" class="btn btn-primary btn-lg px-4"
						onClick="location.href='/cocoa/view_coachCate?tool=tool4'"
						value="Xcode" /><br> <br> <input id="Arduino"
						type="button" class="btn btn-primary btn-lg px-4"
						onClick="location.href='/cocoa/view_coachCate?tool=tool5'"
						value="Arduino" />&nbsp;&nbsp;<input id="RaspberryPi"
						type="button" class="btn btn-primary btn-lg px-4"
						onClick="location.href='/cocoa/view_coachCate?tool=tool6'"
						value="Rasberry Pi" />
				</div>
			</div>

		</div>
	</header>

	<!-- 코칭 카탈로그 구간 -->
	<section class="py-5">

		<!-- 선택된 카테고리 표시 -->
		<div style="text-align: center;">
			<c:choose>
				<c:when test="${cri.cField == 'cField' && cri.tool == 'tool'}">
					<hr>
					<hr>
					<h3 style="color: black; font-weight: 1000; font-size: 40px;">COACHING</h3>
					<hr>
					<hr>
				</c:when>
				<c:when test="${cri.cField == 'cField1'}">
					<hr>
					<hr>
					<h3 style="color: black; font-weight: 1000; font-size: 40px;">WEB</h3>
					<hr>
					<hr>
				</c:when>
				<c:when test="${cri.cField == 'cField2'}">
					<hr>
					<hr>
					<h3 style="color: black; font-weight: 1000; font-size: 40px;">MOBILE
						APP</h3>
					<hr>
					<hr>
				</c:when>
				<c:when test="${cri.cField == 'cField3'}">
					<hr>
					<hr>
					<h3 style="color: black; font-weight: 1000; font-size: 40px;">EMBEDDED</h3>
					<hr>
					<hr>
				</c:when>
				<c:when test="${cri.tool == 'tool1'}">
					<hr>
					<hr>
					<h3 style="color: black; font-weight: 1000; font-size: 40px;">SPRING</h3>
					<hr>
					<hr>
				</c:when>
				<c:when test="${cri.tool == 'tool2'}">
					<hr>
					<hr>
					<h3 style="color: black; font-weight: 1000; font-size: 40px;">DJANGO</h3>
					<hr>
					<hr>
				</c:when>
				<c:when test="${cri.tool == 'tool3'}">
					<hr>
					<hr>
					<h3 style="color: black; font-weight: 1000; font-size: 40px;">ANDROID
						STUDIO</h3>
					<hr>
					<hr>
				</c:when>
				<c:when test="${cri.tool == 'tool4'}">
					<hr>
					<hr>
					<h3 style="color: black; font-weight: 1000; font-size: 40px;">XCODE</h3>
					<hr>
					<hr>
				</c:when>
				<c:when test="${cri.tool == 'tool5'}">
					<hr>
					<hr>
					<h3 style="color: black; font-weight: 1000; font-size: 40px;">ARDUINO</h3>
					<hr>
					<hr>
				</c:when>
				<c:when test="${cri.tool == 'tool6'}">
					<hr>
					<hr>
					<h3 style="color: black; font-weight: 1000; font-size: 40px;">RASPBERRY
						PI</h3>
					<hr>
					<hr>
				</c:when>
			</c:choose>
		</div>

		<div class="container px-4 px-lg-5 mt-5">

			<!-- 글 분류별 이동 -->
			<!-- 로그인 여부에따라 숨김 / 표시 -->
			<c:choose>
				<c:when test="${isLogOn == true && member != null}">
					<a id="cwrite_btn" class="btn btn-primary px-4 me-sm-3"
						href="/cocoa/view_coachWrite" style="float: right">코칭 등록</a>
				</c:when>
			</c:choose>

			<!-- 정렬 버튼 -->
			<select class="me-sm-3"
				style="float: right; text-align: center; width: 10%;"
				id="coachOrder" onchange="selChange()">
				<option value="reviewRate desc"
					<c:if test="${cri.coachOrder == 'reviewRate desc' }">selected</c:if>>평점높은순</option>
				<option value="coachNO desc"
					<c:if test="${cri.coachOrder == 'coachNO desc' }">selected</c:if>>최신순</option>
				<option value="coachNO"
					<c:if test="${cri.coachOrder == 'coachNO' }">selected</c:if>>오래된순</option>
				<option value="basicPrice desc"
					<c:if test="${cri.coachOrder == 'basicPrice desc' }">selected</c:if>>가격높은순</option>
				<option value="basicPrice"
					<c:if test="${cri.coachOrder == 'basicPrice' }">selected</c:if>>가격낮은순</option>
			</select><br> <br> <br> <br>

			<!-- 생성된 코칭 카탈로그 표시 -->
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

				<!-- 반복문 시작 컨트롤러에서 addObject한 coachList를 가져와서 coach라고 저장 -->
				<c:forEach var="coach" items="${coachesList}">

					<div class="col mb-5"
						style="padding-left: 30px; padding-right: 30px;">
						<div class="card h-100"
							style="width: 110%; border: 1px solid black;">

							<!-- 개발툴 표시 -->
							<div class="badge bg-dark text-white position-absolute"
								style="top: 0.5rem; right: 0.5rem; background-color: black;">
								<c:choose>
									<c:when test="${coach.tool == 'tool1'}">Spring</c:when>
									<c:when test="${coach.tool == 'tool2'}">Django</c:when>
									<c:when test="${coach.tool == 'tool3'}">Android Studio</c:when>
									<c:when test="${coach.tool == 'tool4'}">Xcode</c:when>
									<c:when test="${coach.tool == 'tool5'}">Arduino</c:when>
									<c:when test="${coach.tool == 'tool6'}">Raspberry Pi</c:when>
								</c:choose>
							</div>

							<!-- 간판 이미지 (src=경로) thumbnails로 보내면서 쿼리스트링을 사용 -->
							<img class="card-img-top" alt="" height=200
								onerror=" this.src='resources/image/sample.png'"
								src="${contextPath}/cthumbnails?coach=${coach.coach}&cImg=${coach.cImg}&coachNO=${coach.coachNO}" />

							<!-- 간판이미지 아래 정보 -->
							<div class="card-body" style="background-color: #FFCCCC;">
								<div class="text-center">

									<!-- 리더 -->
									<b style="font-size: 15px; float: left; color: grey;">${coach.coach}</b>

									<!-- 후기 개수 -->
									<div style="font-size: 13px; float: right;">
										<b>${reCount[coach.coach]}개의 후기</b>
									</div>

									<!-- 평점 평균 -->
									<div style="font-size: 13px; float: right;">
										<b
											style="text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black; color: yellow;">★&nbsp;</b><b>${reAvg[coach.coach]}</b>&nbsp;|&nbsp;
									</div>
									<br> <br>

									<!-- 제목 -->
									<b style="font-size: 15px; color: black;">${coach.cTitle}</b><br>
									<br>

									<!-- 기본 요금 -->
									<b style="font-size: 15px; color: #333333; float: right;">${coach.basicPrice}
										원</b>
								</div>
							</div>

							<!-- coachInfo 이동 -->
							<div class="card-footer border-top-0"
								style="background-color: #FFCCCC;">
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto"
										href="${contextPath}/view_coachInfo?coachNO=${coach.coachNO}">Get
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
				href='<c:url value="/view_coachCate?cField=${cri.cField }&tool=${cri.tool }&coachOrder=${cri.coachOrder}&page=${pageMaker.startPage-1 }"/>'><i
				class=""></i></a>
		</c:if>

		<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }"
			var="pageNum">
			<a
				href='<c:url value="/view_coachCate?cField=${cri.cField }&tool=${cri.tool }&coachOrder=${cri.coachOrder}&page=${pageNum }"/>'><i
				class="">${pageNum }</i></a>
		</c:forEach>

		<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
			<a
				href='<c:url value="/view_coachCate?cField=${cri.cField }&tool=${cri.tool }&coachOrder=${cri.coachOrder}&page=${pageMaker.endPage+1 }"/>'><i
				class=""></i></a>
		</c:if>

	</div>

	<!-- 하단바 -->
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>