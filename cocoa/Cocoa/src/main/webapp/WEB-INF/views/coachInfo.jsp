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

	$(document).ready(function() {
		$('#c_cImgMod').hide(); //페이지를 로드할 때 숨길 요소
		$('#c_modBtn').hide();
		$('#c_mod').show();
		$('#c_rmv').show();
		$('#requestForm').hide();

		$('#c_mod').click(function() {
			$('#c_mod').hide(); //클릭 시 첫 번째 요소 숨김
			$('#c_rmv').hide(); //클릭 시 첫 번째 요소 숨김
			$('#c_cImgMod').show(); //클릭 시 두 번째 요소 표시
			$('#c_modBtn').show();
			$('#c_cTitle').prop('disabled', false);
			$('#c_basicPrice').prop('disabled', false);
			$('#c_lang').prop('disabled', false);
			$('#c_cContents').prop('disabled', false);
			return false;
		});

	});

	function fn_modify_coach(obj) {
		obj.action = "${contextPath}/modCoach";
		obj.submit();
	}

	function fn_remove_coach(obj) {
		obj.action = "${contextPath}/removeCoach";
		obj.submit();
	}
</script>
<title>CoCoa</title>
</head>
<body style="background-color: #FFEBCD">

	<!-- 상단바 -->
	<nav class="navbar navbar-expand-lg" style="background-color: #663333;">

		<div class="container px-4 px-lg-5">

			<!-- 로고 -->
			<a class="navbar-brand" href="/cocoa/"
				style="color: #CFFFE5; font-size: 30px;"
				onmouseover="this.style.color='black';"
				onmouseout="this.style.color='#CFFFE5';"><b>CoCoa</b></a>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">

				<!-- 상단 가운데공간 지우면 안됌 -->
				<div class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4"></div>

				<!-- 우측 상단 변경 -->
				<c:choose>
					<c:when test="${isLogOn == true && member != null}">
						<form action="/cocoa/logout" method="get" class="d-flex">
							<input name="My Page" class="btn btn-outline-dark" type="button"
								value="My Page" onClick="location.href='/cocoa/myPage'" /> <input
								name="logout" class="btn btn-outline-dark" type="submit"
								value="logout" />
						</form>
					</c:when>
					<c:otherwise>
						<form action="/cocoa/view_login" method="get" class="d-flex">
							<input name="login" class="btn btn-outline-dark" type="submit"
								value="log in" /> <input name="join"
								class="btn btn-outline-dark" type="button" value="Sign in"
								onClick="location.href='/cocoa/view_join'" />
						</form>
					</c:otherwise>
				</c:choose>

			</div>
		</div>
	</nav>

	<!-- 코치 글 [조회, 수정, 삭제] 바 -->
	<form method="post" enctype="multipart/form-data" name="frmCoach"
		action="${contextPath}">
		<section class="py-5">
			<div class="container main-secction">
				<div class="row" style="flex-wrap: unset;">

					<!-- 좌측 프로필 : coach~proImg / coach~name-->
					<div class="col-md-3 col-sm-3 col-xs-12 user-profil-part pull-left">
						<div class="row">
							<div
								class="col-md-12 col-md-12-sm-12 col-xs-12 user-image text-center"
								style="width: 80%; height: 100%; border: 2px solid; background-color: #FFCCCC;">

								<!-- 후기 조회 이동 -->
								<br> <span style="float: right;"><a
									href="/cocoa/view_reviewInfo"> <input type="button"
										name="view_reviewInfo" value="후 기" class="btn btn-third-dark"
										style="font-size: 13px; border-radius: 12px;">
								</a> </span>

								<!-- 프로필 조회 이동 -->
								<br> <br> <a href="/cocoa/view_profileInfo"> <img
									name="proImg" src="resources/image/kakao.png"
									style="border: 1px solid;" width="50%" height="120px"><br>
									<br>
								</a>

								<!-- coach -->
								<input type="text" name="coach" value="${coach.coach}" readonly
									style="text-align: center; border: 0; font-weight: 700; background-color: #FFCCCC; width: 70%;">
								<input type="hidden" name="coachNO" value="${coach.coachNO}" />
								<br>

								<!-- 요청서 작성 -->
								<br>
								<c:if test="${isLogOn == true && member.id !=coach.coach}">
									<a href="/cocoa/view_reqWriteForm"> <input type="button"
										name="requestForm" value="   요청서 작성   "
										class="btn btn-third-dark"
										style="text-align: center; border: 1; border-radius: 12px; width: 70%;">
									</a>
								</c:if>
								<br> <br>

								<!-- 본인이면 수정(submit) / 삭제(버튼) 표시 -->
								<c:if test="${member.id == coach.coach}">
									<input type="button" class="btn btn-third-dark" value="수정"
										onClick="fn_enable(frmCoach)" id="c_mod"> &nbsp;
								<input type="button" class="btn btn-third-dark" value="삭제"
										onClick="fn_remove_coach(frmCoach)" id="c_rmv">
								</c:if>
								<br> <br>
							</div>
						</div>
					</div>

					<!-- 우측 내용 : cImg / cTitle / basicPrice / lang / cContents -->
					<div class="card"
						style="width: 50rem; border: 1px solid; background-color: #FFCC99">

						<!-- cImg -->
						<div align="center">
							<input type="hidden" name="originalFileName"
								value="${coach.cImg }" /> <br> <img id="preview"
								src="${contextPath}/coachImgDownload?coach=${coach.coach }&coachNO=${coach.coachNO}&cImg=${coach.cImg}"
								width=100% height=300 style="border: 1px solid;"
								onerror="this.src='resources/image/sample.png'" /> <br> <br>

							<!-- 수정 누르면 활성화 -->
							<label class="btn btn-outline-dark" for="c_cImg" id="c_cImgMod">
								대표 이미지 변경 </label><input type="file" id="c_cImg" name="cImg"
								onchange="readURL(this);" style="display: none;" /> <br>
						</div>

						<!-- cTitle / basicPrice / lang / cContents 조회 -->
						<div class="project">

							<!-- cTitle 표시 -->
							<hr>
							<input name="cTitle" type="text" value="${coach.cTitle}"
								id="c_cTitle" disabled
								style="border: 0; text-align: center; width: 100%; background-color: #FFCC99; font-weight: 700; color: black;">
							<hr>

							<!-- basicPrice 표시 -->
							기본요금 : <input name="basicPrice" type="text"
								value="${coach.basicPrice}" id="c_basicPrice" disabled
								style="border: 0; width: 10%; text-align: center; background-color: #FFCC99; font-weight: 700; color: black;">
							<b>원</b>
							<hr>

							<!-- lang 표시 -->
							언어 : <select
								style="border: 0; text-align: center; width: 15%; background-color: #FFCC99; font-weight: 700; color: black;"
								name="lang" disabled id="c_lang">
								<option id="empty">${coach.lang}</option>
								<option id="lang1">C/C++</option>
								<option id="lang2">Java</option>
								<option id="lang3">Python</option>
							</select>
							<hr>

							<!-- cContents 표시 -->
							<!-- textarea 닫아주는거 붙여써야함 -->
							세부 내용 : <br> <br>
							<textarea name="cContents" rows="10" cols="20" disabled
								id="c_cContents"
								style="border: 1; width: 100%; background-color: #FFCC99; font-weight: 700; color: black;">${coach.cContents}</textarea>
							<hr>

							<div align="center">
								<input type=button value="확 인"
									onClick="fn_modify_coach(frmCoach)" id="c_modBtn"><br>
								<br>
							</div>
						</div>
					</div>

				</div>
			</div>
		</section>
	</form>

	<!-- 하단바 (마지막에 추가) -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; CoCoa 2021</p>
		</div>
	</footer>
</body>
</html>