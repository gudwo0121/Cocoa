<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>


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

	var cnt = 1;
	function fn_addFile() {
		$("#d_file")
				.append("<br>" + "<input type='file' name='file"+cnt+"' />");
		cnt++;
	}

	$(document).ready(function() {
		$('#mod_profile').hide(); //페이지를 로드할 때 숨길 요소
		$('#p_modBtn').hide();
		$('#mod_kakaoLink').hide();
		$('#mod_start').show();
		$('#p_rmv').show();
		$('#p_mod').click(function() {
			$('#p_mod').hide(); //클릭 시 첫 번째 요소 숨김
			$('#p_rmv').hide(); //클릭 시 첫 번째 요소 숨김
			$('#p_pImgMod').show(); //클릭 시 두 번째 요소 표시
			$('#mod_kakaoLink').show();
			$('#kakaoLink').hide();
			$('#p_modBtn').show();
			$('#p_pTitle').prop('disabled', false);
			$('#p_pLevel').prop('disabled', false);
			$('#p_pMemberCount').prop('disabled', false);
			$('#p_pContents').prop('disabled', false);
			return false;
		});
	});
</script>
  <title>메인 내용</title>
  <script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
   

	<!-- proFileInfo -->
	<form name="proFileInfo" method="post"
		action="${contextPath}/proFileInfo" enctype="multipart/form-data">
		<section class="py-5">
			<div class="container main-secction">
				<div class="row">

					<!-- 좌측 프로필 : proFileImg / proFileName -->
					<div class="col-md-3 col-sm-3 col-xs-12 user-profil-part pull-left">
						<div class="row">
							<div
								class="col-md-12 col-md-12-sm-12 col-xs-12 user-image text-center"
								style="width: 80%; height: 100%; border: 2px solid; background-color: #FFCCCC;">

								<!-- 프로필 조회 이동 -->
								<br> <br>  <img
									name="proImg" src="resources/image/kakao.png"
									style="border: 1px solid;" width="120px" height="120px"><br>
									<br>
								

								<!-- nickName -->
								<input type="text" name="nickName" value="${member.name }" readonly
									style="text-align: center; border: 0; font-weight: 700; background-color: #FFCCCC;"><br>
								<br>
							</div>
						</div>
					</div>

					<!-- 우측 내용 : profileContents -->
					<div class="card"
						style="width: 50rem; border: 1px solid; background-color: #FFCC99">
						<div class="proFile">

							<!-- proFileContents 입력 -->
							<!-- textarea 닫아주는거 붙여써야함 -->
							소개 및 경력 : <br>
							<textarea name="proFile" rows="10" cols="20"
								placeholder="${member.proContents} "
								style="border: 1; width: 100%;"></textarea>
							<hr>
						</div>

						<!-- 작성(submit) + 취소(버튼) -->
						<div class="card-body" style="text-align: center">
							<input type="submit" id="mod_profile" class="btn btn-outline-dark" value="수정 확인" />
							<a href="/cocoa" class="btn btn-outline-dark">수정하기</a>
							&nbsp; <a href="/cocoa" class="btn btn-outline-dark">취소</a>
						</div>
					</div>

				</div>
			</div>
		</section>
	</form>

	
</body>
</html>