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
<title>CoCoa</title>
</head>
<body style="background-color: #FFEBCD">

	<!-- UI 조정 필요 -->
	<!-- 후기 작성 -->
	<div class="card rcol my-3"
		style="text-align: center; background-color: #FFEBCD; border: none; width: 80vw; height: 90vh;">
		<form action="${contextPath}/reviewWrite" method="post"
			enctype="multipart/form-data">
			<table
				style="width: 80%; margin: 0 auto; border: 1px solid grey; background-color: #FFCC99; color: black;">
				<tr>
					<th colspan="2"
						style="vertical-align: middle; text-align: center; font-size: 20px;">${target}
						에게 후기작성</th>
				</tr>

				<!-- rate -->
				<tr>
					<td style="text-align: center; width: 15%; vertical-align: top;"><br>
						<b>평 점</b></td>
					<td style="text-align: left; font-size: 30px;"><input
						type="radio" name="rate" value=5> ★ ★ ★ ★ ★ <br> <input
						type="radio" name="rate" value=4> ★ ★ ★ ★ <br> <input
						type="radio" name="rate" value=3> ★ ★ ★ <br> <input
						type="radio" name="rate" value=2> ★ ★ <br> <input
						type="radio" name="rate" value=1> ★ <br> <br></td>
				</tr>

				<!-- review -->
				<tr>
					<td style="text-align: center; vertical-align: top;" class="pt-1"><br>
						<b>한 줄 평</b></td>
					<td style="text-align: left; vertical-align: top;"><textarea
							rows="3" cols="20" class="form-control" id="rContents"
							name="review"
							style="width: 95%; resize: none; background-color: #FFCC99; border: 1px solid grey; color: black;">${requestInfo.rContents}</textarea></td>
				</tr>
				<tr>
					<td><input type="hidden" name="target" value="${target}">
						<input type="hidden" name="writer" value="${writer}"></td>
				</tr>
				<!-- 작성, 취소 -->
				<tr>
					<td align="center" colspan="2"><br> <input type="submit"
						id="del" class="btn btn-outline-dark"
						style="background-color: white; color: black;"
						onmouseover="this.style.color='white'; this.style.backgroundColor='black';"
						onmouseout="this.style.color='black'; this.style.backgroundColor='white';"
						value="작 성" />&nbsp;&nbsp;&nbsp; <input type="button"
						id="to_list" class="btn btn-outline-dark"
						style="background-color: white; color: black;"
						onmouseover="this.style.color='white'; this.style.backgroundColor='black';"
						onmouseout="this.style.color='black'; this.style.backgroundColor='white';"
						value="취 소" onclick="history.back(0)" /> <br> <br></td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>