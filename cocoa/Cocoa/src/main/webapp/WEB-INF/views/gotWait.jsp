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
<style type="text/css">
th, td {
	padding: 6px;
	color: black;
}
</style>
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

	<!-- UI 조정 필요 -->
	<!-- 받은 요청 (대기) -->
	<div class="card rcol my-3"
		style="text-align: center; background-color: #FFEBCD; border: none; width: 80vw; height: 90vh;">
		<form action="" method="post">
			<table
				style="width: 80%; margin: 0 auto; border: 1px solid grey; background-color: #FFCC99; color: black;">
				<tr>
					<th colspan="2"
						style="vertical-align: middle; text-align: center; font-size: 20px;">${req}의
						요청서</th>
				</tr>

				<!-- rTitle -->
				<tr>
					<td style="text-align: center; width: 15%;"><b>제 목</b></td>
					<td style=""><input type="text" id="" name="rTitle"
						class="form-control"
						style="width: 95%; background-color: #FFCC99; border: 1px solid grey; color: black;"></td>
				</tr>

				<!-- rContents -->
				<tr>
					<td style="text-align: center; vertical-align: top;" class="pt-1"><br>
						<b>내 용</b></td>
					<td style="text-align: left; vertical-align: top;"><textarea
							rows="10" cols="20" class="form-control" id="" name="rContents"
							style="width: 95%; resize: none; background-color: #FFCC99; border: 1px solid grey; color: black;"></textarea></td>
				</tr>

				<!-- rImg -->
				<tr>
					<td style="text-align: center;"><b>첨부파일</b></td>
					<td style="text-align: left;"><a href="#"
						style="border: 1px solid black;">에러.jpg</a></td>
				</tr>

				<!-- 수락, 거절, 목록으로 -->
				<tr>
					<td align="center" colspan="2"><br> <input type="button"
						id="" class="btn btn-outline-dark"
						style="background-color: white; color: black;"
						onmouseover="this.style.color='white'; this.style.backgroundColor='black';"
						onmouseout="this.style.color='black'; this.style.backgroundColor='white';"
						value="수 락" />&nbsp;&nbsp;&nbsp; <input type="button" id=""
						class="btn btn-outline-dark"
						style="background-color: white; color: black;"
						onmouseover="this.style.color='white'; this.style.backgroundColor='black';"
						onmouseout="this.style.color='black'; this.style.backgroundColor='white';"
						value="거 절" />&nbsp;&nbsp;&nbsp; <input type="button" id=""
						class="btn btn-outline-dark"
						style="background-color: white; color: black;"
						onmouseover="this.style.color='white'; this.style.backgroundColor='black';"
						onmouseout="this.style.color='black'; this.style.backgroundColor='white';"
						value="목록으로" onclick="history.go(0)" /> <br> <br></td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>