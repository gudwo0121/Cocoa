<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

	$(document).ready(function() {
		$('#mod_profile').hide(); //페이지를 로드할 때 숨길 요소
		$('#cancel').hide();
		$('#proImgMod').hide()
		$('#mod_start').show();

		$('#mod_start').click(function() {
			$('#mod_start').hide(); //클릭 시 첫 번째 요소 숨김
			$('#mod_profile').show(); //클릭 시 두 번째 요소 표시
			$('#cancel').show();
			$('#proImgMod').show();
			$('#proContents').prop('disabled', false);
			return false;
		});
	});
</script>
<title>CoCoa</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link href="resources/css/styles.css" rel="stylesheet" />
</head>
<body>

	<!-- 본인 프로필 조회 및 수정 -->
	<form name="proFileInfo" method="post"
		action="${contextPath}/modProfile" enctype="multipart/form-data">
		<section class="py-5" style="">
			<div class="row" style="flex-wrap: unset;width:500px;">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<div class="col-md-4 col-sm-4" style="width: 100%;">

					<!-- 좌측 프로필 : proImg / name -->
					<div style="flex-wrap: unset; width: 80%;">
						<div
							style="text-align: center; width: 100%; height: 60%; border: 2px solid; background-color: #FFCCCC;">

							<!-- 프로필 이미지 -->
							<br> <br> <input type="hidden" name="originalFileName"
								value="${profileId.proImg }" /> <img id="preview"
								src="${contextPath}/downProfileImg?id=${profileId.id}"
								style="border: 1px solid;" width="70%" height="120px"
								onerror="this.src='resources/image/sample.png'" /> <br> <br>
							<label class="btn btn-outline-dark" for="proImg" id="proImgMod">대표
								이미지 변경 </label> <input type="file" id="proImg" name="proImg"
								onchange="readURL(this);" style="display: none;" />

							<!-- name -->
							<input type="hidden" name="id" value="${profileId.id}" /> <input
								type="text" name="nickName" value="${profileId.name}" disabled
								style="text-align: center; border: 0; font-weight: 700; background-color: #FFCCCC; color: black; width: 50%;"><br>
							<br>
						</div>
					</div>
				</div>

				<!-- 우측 내용 : pContents -->
				<div
					style="width: 600px; border: 1px solid; background-color: #FFCC99; color: black; border-radius: 5px;">
					<div class="proFile">

						<!-- pContents 입력 -->
						<!-- textarea 닫아주는거 붙여써야함 -->
						<br> <b>소개 및 경력 :</b> <br> <br>
						<textarea name="proContents" rows="20" cols="20" id="proContents"
							disabled
							style="border: 1px solid; background-color: #FFCC99; width: 100%; color: black; resize: none;">${profileId.proContents}</textarea>
						<hr>
					</div>

					<!-- 작성(submit) + 취소(버튼) -->
					<div class="card-body" style="text-align: center">
						<input type="submit" id="mod_profile" class="btn btn-outline-dark"
							value="수정 확인" /> <a href="/cocoa/" id="mod_start"
							class="btn btn-outline-dark">수정하기</a> &nbsp; <input type="button"
							id="cancel" value="취소" onclick="history.go(0)"
							class="btn btn-outline-dark">
					</div>
				</div>
			</div>
		</section>
	</form>
	
</body>
</html>