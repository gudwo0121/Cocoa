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

	<!-- 프로젝트 글 작성 -->
	<form action="${contextPath}/projectWrite" method="post"
		enctype="multipart/form-data">
		<section class="py-5">
			<div class="container main-secction">
				<div class="row" style="flex-wrap: unset;">

					<!-- 좌측 프로필 : leader~proImg / leader~name -->
					<div class="col-md-3 col-sm-3 col-xs-12 user-profil-part pull-left">
						<div class="row">
							<div
								class="col-md-12 col-md-12-sm-12 col-xs-12 user-image text-center"
								style="width: 80%; height: 100%; border: 2px solid; background-color: #FFCCCC;">

								<!-- 프로필 조회 이동 -->
								<br> <br> <img name="proImg"
									src="resources/image/kakao.png" style="border: 1px solid;"
									width="50%" height="120px"><br> <br>

								<!-- leader -->
								<input type="text" name="leader" value="${member.id}" readonly
									style="text-align: center; border: 0; font-weight: 700; background-color: #FFCCCC; width: 70%;"><br>
								<br>

								<!-- kakao -->
								<b>카카오톡 오픈채팅 :</b><br> <br> <input type="text"
									name="kakao" placeholder="링크 입력"
									style="text-align: center; border: 1; background-color: #FFCCCC; width: 80%;"><br>
								<br>
							</div>
						</div>
					</div>

					<!-- 우측 내용 : pImg / pTitle / memberCount / pContents -->
					<div class="card"
						style="width: 50rem; border: 1px solid; background-color: #FFCC99">

						<!-- pImg -->
						<div align="center">
							<br> <img id="preview" src="resources/image/sample.png"
								width=100% height=300 style="border: 1px solid;" /><br> <br>
							<label class="btn btn-outline-dark" for="pImg"> 대표 이미지 변경
							</label><input type="file" id="pImg" name="pImg"
								onchange="readURL(this);" style="display: none;" />
						</div>

						<!-- pTitle / memberCount / pContents 입력 -->
						<div class="project">

							<!-- pTitle 입력 -->
							<hr>
							<input name="pTitle" type="text" placeholder="프로젝트명을 입력하세요."
								style="border: 1; text-align: center; width: 100%;">
							<hr>

							<!-- memberCount 입력 -->
							인원 : <input name="memberCount" type="number"
								placeholder="인원수를 입력하세요." style="border: 1; width: 30%;">&nbsp;<b>명</b>
							<hr>

							<!-- level 선택 -->
							난이도 : <select style="text-align: center; width: 30%;"
								name="level">
								<option id="empty">-- 선택 --</option>
								<option id="level1">하수</option>
								<option id="level2">중수</option>
								<option id="level3">고수</option>
							</select>
							<hr>

							<!-- pContents 입력 -->
							<!-- textarea 닫아주는거 붙여써야함 -->
							세부 내용 : <br>
							<textarea name="pContents" rows="10" cols="20"
								placeholder="프로젝트 개요 및 포지션 별 자격요건을 써주세요."
								style="border: 1; width: 100%; resize: none;"></textarea>
							<hr>

							<!-- map (일단비워둠) -->
							<div>
								<center>이곳은 맵 공간입니다.</center>
							</div>
							<hr>
						</div>

						<!-- 작성(submit) + 취소(버튼) -->
						<div class="card-body" style="text-align: center">
							<button type="submit" class="btn btn-outline-dark">작성</button>
							&nbsp; <a href="/cocoa/" class="btn btn-outline-dark">취소</a>
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