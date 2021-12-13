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
	$(document)
			.ready(
					function() {

						var topic;
						var field;
						var level;
						var tool;

						$('#topic').change(function() {
							topic = $('#topic option:selected').val();
							$('#field').val("");

							// 코칭이면 개발툴, 플젝이면 수준 select 표시
							if (topic == 'coaching') {
								$('#level').attr('hidden', "");
								$('#tool').removeAttr('hidden');
							} else if (topic == 'project') {
								$('#level').removeAttr('hidden');
								$('#tool').attr('hidden', "");
							}
						});

						$('#field').change(
								function() {
									field = $('#field option:selected').val();
									$('#tool').val("");
									$('#level').val("");

									// 코칭 선택 후 [웹, 앱, 임베디드] 분야 선택에 따른 select 내용 변화
									if (topic == 'coaching' && field == 'Web') {
										$('#spring').removeAttr('hidden');
										$('#django').removeAttr('hidden');
										$('#android').attr('hidden', "");
										$('#xcode').attr('hidden', "");
										$('#arduino').attr('hidden', "");
										$('#pi').attr('hidden', "");
									} else if (topic == 'coaching'
											&& field == 'Mobile App') {
										$('#android').removeAttr('hidden');
										$('#xcode').removeAttr('hidden');
										$('#spring').attr('hidden', "");
										$('#django').attr('hidden', "");
										$('#arduino').attr('hidden', "");
										$('#pi').attr('hidden', "");
									} else if (topic == 'coaching'
											&& field == 'Embedded') {
										$('#arduino').removeAttr('hidden');
										$('#pi').removeAttr('hidden');
										$('#android').attr('hidden', "");
										$('#xcode').attr('hidden', "");
										$('#spring').attr('hidden', "");
										$('#django').attr('hidden', "");
									}
								});

						$('#level').change(function() {
							level = $('#level option:selected').val();
						});

						$('#tool').change(function() {
							tool = $('#tool option:selected').val();
						});

						$('#search')
								.click(
										function() {
											if (topic == 'coaching') {
												window.location.href = '/cocoa/view_coachCate?cfield='
														+ field
														+ '&tool='
														+ tool;
											} else if (topic == 'project') {
												window.location.href = '/cocoa/view_projectCate?pfield='
														+ field
														+ '&level='
														+ level;
											}
										});
					});
</script>
<title>CoCoa</title>
</head>
<body style="background-color: #FFEBCD">

	<!-- 상단바 -->
	<jsp:include page="header.jsp"></jsp:include>

	<!-- 카테고리 구간 -->
	<header class="py-5" style="background-color: #663333">
		<div class="container px-4 px0lg05 my-5">

			<!-- Coaching & Project -->
			<div class="d-grid gap-3 d-sm-flex justify-content-sm-center">
				<select id="topic" name="topic">
					<option value="" selected disabled hidden>--주제선택--</option>
					<option value="coaching">코드 코칭</option>
					<option value="project">프로젝트 모집</option>
				</select>
			</div>
			<br>

			<!-- field -->
			<div class="d-grid gap-3 d-sm-flex justify-content-sm-center">
				<select id="field" name="field">
					<option value="" selected disabled hidden>--분야선택--</option>
					<option value="Web">웹 개발</option>
					<option value="Mobile App">앱 개발</option>
					<option value="Embedded">임베디드 시스템</option>
				</select>
			</div>
			<br>

			<!-- level / tool -->
			<div class="d-grid gap-3 d-sm-flex justify-content-sm-center">

				<!-- level -->
				<select id="level" name="level" hidden>
					<option value="" selected disabled hidden>--수준선택--</option>
					<option value="Beginner">초심자</option>
					<option value="Junior">주니어</option>
					<option value="Senior">시니어</option>
				</select>

				<!-- tool -->
				<select id="tool" name="tool" hidden>
					<option id="default" value="" selected disabled hidden>--개발툴선택--</option>
					<!-- 웹 -->
					<option id="spring" value="Spring" hidden>Spring</option>
					<option id="django" value="Django" hidden>Django</option>
					<!-- 앱 -->
					<option id="android" value="Android Studio" hidden>Android
						Studio</option>
					<option id="xcode" value="Xcode" hidden>Xcode</option>
					<!-- 임베디드 -->
					<option id="arduino" value="Arduino" hidden>Arduino</option>
					<option id="pi" value="Raspberry Pi" hidden>Raspberry Pi</option>
				</select>

			</div>
			<br>

			<!-- 조건 조회 -->
			<div class="d-grid gap-3 d-sm-flex justify-content-sm-center">
				<input type="button" id="search"
					class="btn btn-primary px-4 me-sm-3" value="검 색">
			</div>

		</div>
	</header>

	<!-- 프로젝트 카탈로그 구간 -->
	<section class="py-5">
		<div class="container px-4 px-lg-5 mt-5">

			<!-- 글 주제별 이동 -->
			<!-- 로그인 여부에따라 숨김 / 표시 -->
			<c:choose>
				<c:when test="${isLogOn == true && member != null}">
					<a id="pwrite_btn" class="btn btn-primary px-4 me-sm-3"
						href="/cocoa/view_projectWrite" style="float: right">p글작성</a>
				</c:when>
			</c:choose>
			<br> <br> <br>

			<!-- 생성된 프로젝트 카탈로그 표시 -->
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

				<!-- 반복문 시작 컨트롤러에서 addObject한 projectList를 가져와서 project라고 저장 -->
				<c:forEach var="project" items="${projectList}">

					<!-- 카탈로그 틀 -->
					<div class="col mb-5" id="proCate">
						<div class="card h-100">

							<!-- 난이도 표시 -->
							<div class="badge bg-dark text-white position-absolute"
								style="top: 0.5rem; right: 0.5rem">${project.level}</div>

							<!-- 간판 이미지 (src=경로) thumbnails로 보내면서 쿼리스트링을 사용 -->
							<img class="card-img-top" alt="" height=200
								onerror=" this.src='resources/image/sample.png'"
								src="${contextPath}/thumbnails?leader=${project.leader}&pImg=${project.pImg}&projectNO=${project.projectNO}" />

							<!-- 간판이미지 아래 정보 -->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- 제목 -->
									<h5 class="fw-bolder">${project.pTitle}</h5>
									<!-- 리더 -->
									${project.leader}<br>
									<!-- 인원수 -->
									${project.memberCount} 명
								</div>
							</div>

							<!-- coachInfo / projectInfo 이동 -->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto"
										href="${contextPath}/view_projectInfo?id=${project.leader}&projectNO=${project.projectNO}">Get
										in</a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				<!-- Project 반복문 끝 -->

			</div>
		</div>
		<!-- 위의 카탈로그 틀이 반복 생성 및 표시 -->
	</section>

	<!-- 하단바 -->
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>