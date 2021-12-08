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
<style type="text/css">
th, td {
	padding: 10px;
}
</style>
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
				<form action="/cocoa/logout" method="get" class="d-flex">
					<input name="My Page" class="btn btn-outline-dark" type="button"
						value="My Page"
						onClick="location.href='/cocoa/view_myPageProfile'" />&nbsp; <input
						name="logout" class="btn btn-outline-dark" type="submit"
						value="logout" />
				</form>
			</div>
		</div>
	</nav>

	<!-- 요청서 작성바 -->
	<div class="card rcol my-4"
		style="margin: 0 auto; width: 60%; background-color: #FFEBCD; border: none;">
		<form action="" method="post">
			<table style="width: 80%; margin: 0 auto; border: 1px solid grey;">
				<tr>
					<th colspan="2" style="text-align: center; font-size: 20px;">요청서
						작성</th>
				</tr>
				<tr>
					<td style="text-align: center; width: 15%;"><b>제 목</b></td>
					<td style=""><input type="text" id="" name=""
						class="form-control" style="width:95%;" placeholder="코칭 받고 싶은 내용의 제목을 적어주세요."></td>
				</tr>
				<tr>
					<td style="text-align: center;"><b>개발환경</b></td>
					<td><input type="text" id="" name="" class="form-control" style="width:95%;"
						placeholder="현재 사용하고 있는 개발 환경을 적어주세요.(예 : Eclipse, STS, Oracle 등)"></td>
				</tr>
				<tr>
					<td style="text-align: center; vertical-align: top;" class="pt-1"><br>
						<b>내 용</b></td>
					<td style="text-align: left; vertical-align: top;"><textarea
							rows="10" cols="20" class="form-control"  id="" name=""
							placeholder="코칭 받고 싶은 내용을 최대한 자세하게 적어주세요."
							style="width: 95%; resize: none;"></textarea></td>
				</tr>
				<tr>
					<td style="text-align: center;"><b>파일첨부</b></td>
					<td><label class="btn btn-outline-dark" for="file">
							찾아보기 </label><input type="file" id="file" name=""
						onchange="readURL(this);" style="display: none;" /></td>
				</tr>
				<tr>
					<!-- 사진 미리보기 -->
					<td style="text-align: center;"></td>
					<td><img id="preview" src="resources/image/sample.png"
						width=95% height=300 style="border: 1px solid;" /></td>
				</tr>
				<tr>
					<td align="center" colspan="2"><br> <input type="submit"
						id="" class="btn btn-outline-dark" value="요 청" />&nbsp;&nbsp;&nbsp;<input
						type="button" id="cancel" onclick="history.go(0)"
						class="btn btn-outline-dark" value="취 소" /><br><br></td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>