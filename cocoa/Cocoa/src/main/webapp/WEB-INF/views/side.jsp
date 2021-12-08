<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CoCoa</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
<link href="resources/css/styles.css" rel="stylesheet" />
</head>
<body>
	<br>
	<br>
	<br>
	<h2>
		<input type="button" class="btn btn-primary" name="side_profile"
			id="profile" value="프로필"
			style="text-align: center; color: white; background-color: #333333; font-size: 25px; border: 0; width: 90%;"
			onmouseover="this.style.color='white'; this.style.backgroundColor='black';"
			onmouseout="this.style.color='white'; this.style.backgroundColor='#333333';"><br>

		<br> <br> <input type="button" class="btn btn-primary"
			name="side_send" id="sendReq" value="보낸 요청"
			style="text-align: center; color: white; background-color: #333333; font-size: 25px; border: 0; width: 90%;"
			onmouseover="this.style.color='white'; this.style.backgroundColor='black';"
			onmouseout="this.style.color='white'; this.style.backgroundColor='#333333';"><br>

		<br> <br> <input type="button" class="btn btn-primary"
			name="side_get" id="receiveReq" value="받은 요청"
			style="text-align: center; color: white; background-color: #333333; font-size: 25px; border: 0; width: 90%;"
			onmouseover="this.style.color='white'; this.style.backgroundColor='black';"
			onmouseout="this.style.color='white'; this.style.backgroundColor='#333333';"><br>

		<br> <br> <input type="button" class="btn btn-primary"
			name="side_info" id="memberInfo" value="회원 정보"
			style="text-align: center; color: white; background-color: #333333; font-size: 25px; border: 0; width: 90%;"
			onmouseover="this.style.color='white'; this.style.backgroundColor='black';"
			onmouseout="this.style.color='white'; this.style.backgroundColor='#333333';"><br>
		<br> <br>
	</h2>

</body>
</html>