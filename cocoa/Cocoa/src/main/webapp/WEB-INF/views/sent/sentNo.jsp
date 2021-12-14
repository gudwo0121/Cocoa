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
	function yesOrNo() {
		if (confirm("철회하시겠습니까?")) {
			location.href = '/cocoa/removeRequest?reqNO=${requestInfo.reqNO}'// Yes click
		} else {
			// no click
		}
	}
</script>
<title>CoCoa</title>
</head>
<body style="background-color: #FFEBCD">

	<!-- UI 조정 필요 -->
	<!-- 보낸 요청 (대기) -->
	<div class="card rcol my-3"
		style="text-align: center; background-color: #FFEBCD; border: none; width: 80vw; height: 90vh;">
		<form action="${contextPath}/modRequest" method="post"
			enctype="multipart/form-data">
			<table
				style="width: 80%; margin: 0 auto; border: 1px solid grey; background-color: #FFCC99; color: black;">
				<tr>
					<th colspan="2"
						style="vertical-align: middle; text-align: center; font-size: 20px;">거절된
						나의 요청서</th>
				</tr>

				<!-- rTitle -->
				<tr>
					<td style="text-align: center; width: 15%;"><b>제 목</b></td>
					<td style=""><input type="text" id="rTitle" name="rTitle"
						class="form-control" value="${requestInfo.rTitle}" disabled
						style="width: 95%; background-color: #FFCC99; border: 1px solid grey; color: black;">
						<input type="hidden" name="req" value="${requestInfo.req}">
						<input type="hidden" name="res" value="${requestInfo.res}">
						<input type="hidden" name="reqNO" value="${requestInfo.reqNO}">
					</td>
				</tr>

				<!-- rContents -->
				<tr>
					<td style="text-align: center; vertical-align: top;" class="pt-1"><br>
						<b>내 용</b></td>
					<td style="text-align: left; vertical-align: top;"><textarea
							rows="10" cols="20" class="form-control" id="rContents"
							name="rContents" disabled
							style="width: 95%; resize: none; background-color: #FFCC99; border: 1px solid grey; color: black;">${requestInfo.rContents}</textarea></td>
				</tr>

				<!-- 첨부된 파일 표시 -->
				<tr>
					<td style="text-align: center;"><b>첨부파일</b></td>
					<td style="text-align: left;">${requestInfo.rImg}</td>
				</tr>

				<!-- reason -->
				<tr>
					<td style="text-align: center; width: 15%;"><b>거절사유</b></td>
					<td style=""><input type="text" id="" name="reason"
						class="form-control" value="${requestInfo.reason}" readonly
						style="width: 95%; background-color: #FFCC99; border: 1px solid grey; color: black;">
						<input type="hidden" name="reqNO" value="${reqNO}" /> <input
						type="hidden" name="status" value="거절"></td>
				</tr>

				<!-- 철회, 목록으로 -->
				<tr>
					<td align="center" colspan="2"><br> <input type="button"
						onclick="yesOrNo()" id="del" class="btn btn-outline-dark"
						style="background-color: white; color: black;"
						onmouseover="this.style.color='white'; this.style.backgroundColor='black';"
						onmouseout="this.style.color='black'; this.style.backgroundColor='white';"
						value="철 회" />&nbsp;&nbsp;&nbsp; <input type="button"
						id="to_list" class="btn btn-outline-dark"
						style="background-color: white; color: black;"
						onmouseover="this.style.color='white'; this.style.backgroundColor='black';"
						onmouseout="this.style.color='black'; this.style.backgroundColor='white';"
						value="목록으로" onclick="location.href='/cocoa/view_sendReq'" /> <br>
						<br></td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>