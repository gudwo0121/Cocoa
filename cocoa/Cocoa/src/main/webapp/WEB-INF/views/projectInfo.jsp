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
				<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
				</ul>

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

	<!-- 프로젝트 글 [조회, 수정, 삭제] 바 -->
	<form method="post">
		<section class="py-5">
			<div class="container main-secction">
				<div class="row">

					<!-- 좌측 프로필 : leader~proImg / leader~name -->
					<div class="col-md-3 col-sm-3 col-xs-12 user-profil-part pull-left">
						<div class="row">
							<div
								class="col-md-12 col-md-12-sm-12 col-xs-12 user-image text-center"
								style="width: 80%; height: 100%; border: 2px solid; background-color: #FFCCCC;">

								<!-- 후기 조회 이동 -->
								<br> <span style="float: right;"> <a
									href="/cocoa/view_reviewInfo"> <input type="button"
										name="view_reviewInfo" value="후 기" class="btn btn-third-dark"
										style="font-size: 13px; border-radius: 12px;">
								</a>
								</span>

								<!-- 프로필 조회 이동 -->
								<br> <br> <a href="/cocoa/view_profileInfo"> <img
									name="proImg" src="resources/image/kakao.png"
									style="border: 1px solid;" width="120px" height="120px"><br>
									<br>
								</a>

								<!-- leader -->
								<input type="text" name="leader" value="${projectInfo.leader}"
									readonly
									style="text-align: center; border: 0; font-weight: 700; background-color: #FFCCCC;"><br>
								<br>

								<!-- kakao -->
								<a href="${projectInfo.kakao}"> <input type="button"
									name="kakaoLink" value="   대화하기   " class="btn btn-third-dark"
									style="text-align: center; border: 1; border-radius: 12px;">
								</a><br> <br>

								<!-- 본인이면 수정(submit) / 삭제(버튼) 표시 -->
								<!-- submit이 2개라서 formaction 사용 (post 방식) -->
								<c:choose>
									<c:when
										test="${isLogOn == true && member.id ==projectInfo.leader}">
										<input type="submit" class="btn btn-third-dark" value="수정"
											formaction="/cocoa/수정"> &nbsp;
								<input type="button" class="btn btn-third-dark" value="삭제"
											onClick="location.href='${contextPath}/removeProject?leader=${projectInfo.leader}&projectNO=${projectInfo.projectNO}'">
									</c:when>
								</c:choose>
								<br> <br>
							</div>
						</div>
					</div>

					<!-- 우측 내용 : pImg / pTitle / memberCount / level / pContents -->
					<div class="card"
						style="width: 50rem; border: 1px solid; background-color: #FFCC99">

						<!-- pImg -->
						<div align="center">
							<br> <img id="preview"
								src="${contextPath}/download?leader=${projectInfo.leader}&pImg=${projectInfo.pImg}&projectNO=${projectInfo.projectNO}"
								width=90% height=300 style="border: 1px solid;" /><br> <br>
						</div>

						<!-- pTitle / memberCount / level / pContents 조회 -->
						<div class="project">

							<!-- pTitle 표시 -->
							<hr>
							<input name="pTitle" type="text" value="${projectInfo.pTitle}"
								style="border: 0; text-align: center; width: 100%; background-color: #FFCC99;">
							<hr>

							<!-- memberCount 표시 -->
							인원 : <input name="memberCount" type="text"
								value="${projectInfo.memberCount}"
								style="border: 0; width: 5%; text-align: center; background-color: #FFCC99;">
							<b>명</b>
							<hr>

							<!-- level 표시 -->
							난이도 : <input name="level" type="text"
								value="${projectInfo.level}"
								style="border: 0; width: 7%; text-align: center; background-color: #FFCC99;">
							<hr>

							<!-- pContents 표시 -->
							<!-- textarea 닫아주는거 붙여써야함 -->
							세부 내용 : <br> <br>
							<textarea name="pContents" rows="10" cols="20"
								style="border: 1; width: 100%; background-color: #FFCC99;">${projectInfo.pContents}</textarea>
							<hr>

							<!-- map (일단비워둠) -->
							<div style="text-align: center;">이곳은 맵 공간입니다.</div>
							<hr>
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