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

	<!-- 받은 요청 대기 (수락 전송) -->
	<div class="card rcol my-5"
		style="text-align: center; background-color: #FFEBCD; border: none; width: 80vw; height: 90vh;">
		<form action="${contextPath}/submitReqYes" method="post">
			<table
				style="width: 80%; margin: 0 auto; border: 1px solid black; background-color: #FFCC99; color: black;">
				<tr>
					<td colspan="2"
						style="text-align: center; border: 1px solid black; background-color: #CFFFE5;"><b>요청서
							수락</b></td>
				</tr>

				<!-- contact -->
				<tr>
					<td style="text-align: center; width: 15%;"><br> <b>연결수단</b></td>
					<td style=""><br> <input type="text" id="" name="contact"
						class="form-control" value="" placeholder="연결수단의 링크를 입력하세요."
						style="width: 95%; background-color: #FFCC99; border: 1px solid black; color: black;">
					</td>
				</tr>

				<!-- realPrice -->
				<tr>
					<td style="text-align: center; width: 15%;"><b>요 금</b></td>
					<td style=""><input type="number" id="" name="realPrice"
						class="form-control" value="" placeholder="측정된 요금을 입력하세요."
						style="width: 95%; background-color: #FFCC99; border: 1px solid black; color: black;">
					</td>
				</tr>

				<!-- pay (아임포트) -->
				<tr>
					<td style="text-align: center; width: 15%;"><b>결제수단</b></td>
					<td style=""><input type="text" id="" name="pay"
						class="form-control" value="" placeholder="결제 수단을 입력하세요." readonly
						style="width: 95%; background-color: #FFCC99; border: 1px solid black; color: black;">
					</td>
				</tr>

				<!-- pay (아임포트) -->
				<tr>
					<td style="text-align: center; vertical-align: top;" class="pt-1"><b>QR
							코드</b></td>
					<td style="text-align: left;"><img id="qr" src="..." width=120
						height=120 style="border: 1px solid;"
						onerror="this.src='resources/image/qr.png'" />
						<div style="padding-left: 3px; padding-top: 5px;">
							<input type="button" value="QR 코드 생성" style="width: 100;">
							<input type="hidden" name="reqNO" value="${reqNO}" /> <input
								type="hidden" name="status" value="수락">
						</div></td>
				</tr>

				<!-- 공지사항 -->
				<tr>
					<td style="text-align: center; width: 15%;"><b>공지사항</b></td>
					<td style=""><textarea id="" name="reason" rows=3
							class="form-control" placeholder="요청자에게 알릴 공지사항을 입력하세요."
							style="width: 95%; background-color: #FFCC99; border: 1px solid black; color: black; resize: none;"></textarea>
					</td>
				</tr>

				<!-- 전송, 취소 -->
				<tr>
					<td align="center" colspan="2"><input type="submit" id=""
						class="btn btn-outline-dark mt-1"
						style="background-color: white; color: black;"
						onmouseover="this.style.color='white'; this.style.backgroundColor='black';"
						onmouseout="this.style.color='black'; this.style.backgroundColor='white';"
						value="전 송" />&nbsp;&nbsp;&nbsp; <input type="button" id=""
						class="btn btn-outline-dark mt-1"
						style="background-color: white; color: black;"
						onmouseover="this.style.color='white'; this.style.backgroundColor='black';"
						onmouseout="this.style.color='black'; this.style.backgroundColor='white';"
						onclick="history.back()" value="취 소" />
				</tr>
			</table>
		</form>
	</div>

</body>
</html>