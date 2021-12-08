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
	padding: 6px;
	color: black;
}
</style>
<title>CoCoa</title>
</head>
<body style="background-color: #FFEBCD">

	<!-- 보낸 요청 (대기) -->
	<div class="card rcol my-3"
		style="text-align: center; background-color: #FFEBCD; border: none; width: 80vw; height: 90vh;">
		<form action="" method="post">
			<table
				style="width: 80%; margin: 0 auto; border: 1px solid grey; background-color: #FFCC99; color: black;">
				<tr>
					<th colspan="2"
						style="vertical-align: middle; text-align: center; font-size: 20px;">요청서</th>
				</tr>
				<tr>
					<!-- rTitle -->
					<td style="text-align: center; width: 15%;"><b>제 목</b></td>
					<td style=""><input type="text" id="rTitle" name="rTitle"
						class="form-control"
						style="width: 95%; background-color: #FFCC99; border: 1px solid grey; color: black;"></td>
				</tr>
				<tr>
					<td style="text-align: center;"><b>개발환경</b></td>
					<td><input type="text" id="r" name="" class="form-control"
						style="width: 95%; background-color: #FFCC99; border: 1px solid grey; color: black;"></td>
				</tr>
				<tr>
					<td style="text-align: center; vertical-align: top;" class="pt-1"><br>
						<b>내 용</b></td>
					<td style="text-align: left; vertical-align: top;"><textarea
							rows="10" cols="20" class="form-control" id="" name=""
							style="width: 95%; resize: none; background-color: #FFCC99; border: 1px solid grey; color: black;"></textarea></td>
				</tr>
				<tr>
					<td style="text-align: center;"><b>파일첨부</b></td>
					<td style="text-align: left;"><label
						class="btn btn-outline-dark" for="file"> 찾아보기 </label><input
						type="file" id="file" name="" onchange="readURL(this);"
						style="display: none;" /></td>
				</tr>
				<tr>
					<!-- 사진 미리보기 -->
					<td style="text-align: center;"></td>
					<td style="text-align: left;"><img id="preview"
						src="resources/image/sample.png" width=95% height=200
						style="border: 1px solid;" /></td>
				</tr>
				<tr>
					<td align="center" colspan="2"><br> <input type="submit"
						id="" class="btn btn-outline-dark" value="요 청" />&nbsp;&nbsp;&nbsp;<input
						type="button" id="cancel" onclick="history.go(0)"
						class="btn btn-outline-dark" value="취 소" /><br> <br></td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>