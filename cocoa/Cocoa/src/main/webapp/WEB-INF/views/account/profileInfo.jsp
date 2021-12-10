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
	<jsp:include page="../header.jsp"></jsp:include>

	<!-- 타인 프로필 -->
	<form name="proFileInfo" method="post"
		action="${contextPath}/proFileInfo" enctype="multipart/form-data">
		<section class="py-5">
			<div class="container main-secction">
				<div class="row" style="flex-wrap: unset;">

					<!-- 좌측 프로필 : 프로필 이미지 / 글 작성자 -->
					<div class="col-md-3 col-sm-3 col-xs-12 user-profil-part pull-left">
						<div class="row">
							<div
								class="col-md-12 col-md-12-sm-12 col-xs-12 user-image text-center"
								style="width: 80%; height: 100%; border: 2px solid; background-color: #FFCCCC;">

								<!-- proImg -->
								<br> <br> <img name="proImg"
									src="${contextPath}/downProfileImg?id=${profileId.id }"
									onerror="this.src='resources/image/kakao.png'"
									style="border: 1px solid;" width="50%" height="120px"><br>
								<br>

								<!-- 글 작성자 -->
								<input type="text" name="id" value="${profileId.id }" readonly
									style="text-align: center; border: 0; font-weight: 700; background-color: #FFCCCC; width: 70%;"><br>
								<br>
							</div>
						</div>
					</div>

					<!-- 우측 내용 : pContents -->
					<div class="card"
						style="width: 50rem; border: 1px solid; background-color: #FFCC99;">
						<div class="proFile">

							<!-- pContents 입력 -->
							<!-- textarea 닫아주는거 붙여써야함 -->
							<br> <b> 소개 및 경력 : </b><br> <br>
							<textarea name="proFile" rows="15" cols="20"
								style="border: 1; width: 100%; background-color: #FFCC99; resize: none;">${profileId.proContents}</textarea>
							<br> <br>
						</div>
					</div>
				</div>
			</div>
		</section>
	</form>

	<!-- 하단바 -->
	<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>