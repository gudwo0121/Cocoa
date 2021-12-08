<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link
	href='https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css'
	rel='stylesheet'>
<link href='https://use.fontawesome.com/releases/v5.7.2/css/all.css'
	rel='stylesheet'>
<script type='text/javascript'
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<script type='text/javascript'
	src='https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js'></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<link href="resources/css/join-styles.css" rel="stylesheet" />
<script type="text/javascript" src="resources/js/ajax.js"></script>
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
<title>코칭 요청</title>
</head>
<body style="background-color: #FFEBCD">

	<!-- 상단바 -->
	<nav class="navbar navbar-expand-lg" style="background-color: #663333;">

		<div class="row" style="width: 100%;">
			<div class="col-sm-2 m-auto" style="text-align: center;">
				<!-- 로고 -->
				<a class="navbar-brand" href="/cocoa/"
					style="color: #CFFFE5; font-size: 30px;"
					onmouseover="this.style.color='black';"
					onmouseout="this.style.color='#CFFFE5';"><b>CoCoa</b></a>
			</div>

			<div class="col-sm-8"></div>

			<div class="col-sm-2 m-auto">
				<!-- 우측 상단 변경 -->
				<form action="/cocoa/logout" method="get" class="d-flex">
					<input name="My Page" class="btn btn-outline-dark" type="button"
						value="My Page"
						onClick="location.href='/cocoa/view_myPageProfile'" /> <input
						name="logout" class="btn btn-outline-dark" type="submit"
						value="logout" />
				</form>
			</div>


		</div>
	</nav>

	<div class="row" style="width: 100%; height: 100%;">

		<div class="card rcol my-5" style="width: 70%; height: auto;">
			<!-- 요청성 작성할 때 코치의 id가 있으면 좋을거 같아서 to.${res}로 나타냄 -->
			<h3 class="mb-2" style="text-align : center;">요청서 작성 - To.${res }</h3>
			<form name="coachWriteForm" method="post"
				action="${contextPath}/requestWrite" enctype="multipart/form-data">
				<table style="width: 100%;">
				
				<!-- form을 submit 할 때 요청자의 아이디(${member.id})와 
					응답하는 코치(${res})의 아이디가 있어야해서 hidden으로 함 -->
					<tr><td><input type="hidden" name="res" value="${res}" />
					<input type="hidden" name="req" value="${member.id}" /></td></tr>
				
				<!-- rTitle -->
					<tr>
						<td style="text-align: right;">제목 :</td>
						<td style="width: 85%;"><input type="text" id="" name="rTitle"
							class="form-control" placeholder="코치 받고 싶은 내용의 제목을 적어주세요."></td>
					</tr>
				
				<!-- rContents -->
					<tr>
						<td style="text-align: right; vertical-align: top;" class="pt-1">내용
							:</td>
						<td style="text-align: left; vertical-align: top;"><textarea
								rows="10" cols="20" class="form-control" id="" name="rContents"
								placeholder="코칭 받고 싶은 내용을 자세하게 적어주세요.(개발환경 포함 필수!)"
								style="width: 100%; resize: none;"></textarea></td>
					</tr>
				
				<!-- rImg -->
					<tr>
						<td style="text-align: right;">사진 첨부 :</td>
						<td><label class="btn btn-outline-dark" for="errorCapture">
								찾아보기 </label><input type="file" id="errorCapture" name="rImg"
							onchange="readURL(this);" style="display: none;" /></td>
					</tr>
					<tr>
						<td style="text-align: right; vertical-align:top;">미리보기 :</td>
						<td><img id="preview" src="resources/image/sample.png"
							width=100% height=300 style="border: 1px solid;" /></td>
					</tr>
				
				<!-- submit,취소 -->	
					<tr>
						<td align="center" colspan="2"><input type="submit" id=""
							class="btn btn-success mt-5" value="신청하기" /> <input
							type="button" id="cancel" onclick="history.go(0)"
							class="btn btn-success mt-5" value="취소" /></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>