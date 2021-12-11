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
	function readURL(input) {

		if (input.files && input.files[0]) {

			var reader = new FileReader();
			reader.onload = function(e) {
				$('#preview').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>
<title>CoCoa</title>
</head>
<body style="background-color: #FFEBCD">

	<!-- 상단바 -->
	<jsp:include page="../header.jsp"></jsp:include>

	<!-- 코칭 글 작성 -->
	<form name="coachWriteForm" method="post"
		action="${contextPath}/coachWrite" enctype="multipart/form-data">
		<section class="py-5">
			<div class="container main-secction">
				<div class="row" style="flex-wrap: unset;">

					<!-- 좌측 프로필 : coach~proImg / coach~name -->
					<div class="col-md-3 col-sm-3 col-xs-12 user-profil-part pull-left">
						<div class="row">
							<div
								class="col-md-12 col-md-12-sm-12 col-xs-12 user-image text-center"
								style="width: 80%; height: 100%; border: 2px solid; background-color: #FFCCCC;">

								<!-- 프로필 조회 이동 -->
								<br> <br> <img name="proImg"
									src="resources/image/kakao.png" style="border: 1px solid;"
									width="50%" height="120px"><br> <br>

								<!-- coach -->
								<input type="text" name="coach" value="${member.id}" readonly
									style="text-align: center; border: 0; font-weight: 700; background-color: #FFCCCC; width: 70%;"><br>
								<br>
							</div>
						</div>
					</div>

					<!-- 우측 내용 : cImg / cTitle / basicPrice / cContents -->
					<div class="card"
						style="width: 50rem; border: 1px solid; background-color: #FFCC99">

						<!-- cImg -->
						<div align="center">
							<br> <img id="preview" src="resources/image/sample.png"
								width=100% height=300 style="border: 1px solid;" /><br> <br>
							<label class="btn btn-outline-dark" for="cImg"> 대표 이미지 변경
							</label><input type="file" id="cImg" name="cImg"
								onchange="readURL(this);" style="display: none;" />
						</div>

						<!-- cTitle / basicPrice / cContents 입력 -->
						<div class="coach">

							<!-- cTitle 입력 -->
							<hr>
							<input name="cTitle" type="text" placeholder="제목을 입력하세요."
								style="border: 1; text-align: center; width: 100%;">
							<hr>

							<!-- basicPrice 입력 -->
							요금 : <input name="basicPrice" type="number"
								placeholder="요금을 입력하세요." style="border: 1; width: 30%;">&nbsp;<b>원</b>
							<hr>

							<!-- lang 선택 -->
							언어 : <select style="text-align: center; width: 30%;" name="lang">
								<option id="empty">-- 선택 --</option>
								<option id="lang1">C</option>
								<option id="lang2">Java</option>
								<option id="lang3">Python</option>
							</select>
							<hr>

							<!-- cContents 입력 -->
							<!-- textarea 닫아주는거 붙여써야함 -->
							세부 내용 : <br>
							<textarea name="cContents" rows="10" cols="20"
								placeholder="요금 측정 기준 및 본인 PR을 해주세요."
								style="border: 1; width: 100%; resize: none;"></textarea>
							<hr>
						</div>

						<!-- 작성(submit) + 취소(버튼) -->
						<div class="card-body" style="text-align: center">
							<input type="submit" class="btn btn-outline-dark" value="등록" />
							&nbsp; <a href="/cocoa/view_coachCate" class="btn btn-outline-dark">취소</a>
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