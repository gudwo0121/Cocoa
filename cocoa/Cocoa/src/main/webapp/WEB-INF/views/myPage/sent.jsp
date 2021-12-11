<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CoCoa</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link href="resources/css/styles.css" rel="stylesheet" />
</head>
<body>

	<!-- 보낸 요청 리스트 -->
	<div class="card rcol my-5"
		style="text-align: center; background-color: #FFEBCD; border: none; width: 80vw;">
		<div class="table-responsive" style="border: 1px solid grey;">
			<table class="table table-striped table-sm">
				<thead>
					<tr>
						<th colspan="4" style="text-align: center;"><b>보낸 요청 리스트</b></th>
					</tr>
					<tr>
						<th scope="col">코치</th>
						<th scope="col">요청 제목</th>
						<th scope="col">요청 날짜</th>
						<th scope="col">상태</th>
					</tr>
				</thead>
				<tbody>
					<!-- 리스트 한 줄 -->
					<c:forEach var="sentList" items="${reqSentList}">
						<tr>
							<td>${sentList.res }</td>
							<!-- sentReqWait로 이동 -->
							<td><a
								href="${contextPath}/view_sentReqWait?reqNO=${sentList.reqNO}">${sentList.rTitle }</a></td>
							<fmt:parseDate var="dateFmt" pattern="yyyy-MM-dd HH:mm:ss"
								value="${sentList.rDate}" />
							<fmt:formatDate var="dateTempParse" pattern="yyyy-MM-dd"
								value="${dateFmt}" />
							<td>${dateTempParse}</td>
							<td>${sentList.status }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>