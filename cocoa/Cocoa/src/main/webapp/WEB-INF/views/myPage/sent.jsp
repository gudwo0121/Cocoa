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
<script type="text/javascript">
	// 정렬 기준 동적으로 변경
	function selChange() {
		var sel = document.getElementById('requestStatus').value;
		location.href = "view_sendReq?status=" + sel;
	}
</script>
<link href="resources/css/styles.css" rel="stylesheet" />
</head>
<body>

	<!-- 보낸 요청 리스트 -->
	<div style="text-align: center; padding: 50px; padding-left: 130px;">
		<div class="table-responsive" style="border: 1px solid grey;">
			<table class="table table-striped table-sm">
				<thead>
					<tr>
						<th colspan="4" style="text-align: center;"><b>${member.id }님이
								보내신 요청 리스트</b></th>
					</tr>
					<tr>
						<td colspan="4" style="align: right;">
							<!-- 조건 조회 버튼 --> <select class="me-sm-3"
							style="float: right; text-align: center; width: 20%;"
							id="requestStatus" onchange="selChange()">
								<option value="status"
									<c:if test="${cri.status == 'status' }">selected</c:if>>전체
									요청글</option>
								<option value="status1"
									<c:if test="${cri.status == 'status1' }">selected</c:if>>대기중인
									요청</option>
								<option value="status2"
									<c:if test="${cri.status == 'status2' }">selected</c:if>>수락된
									요청</option>
								<option value="status3"
									<c:if test="${cri.status == 'status3' }">selected</c:if>>거절된
									요청</option>
								<option value="status4"
									<c:if test="${cri.status == 'status4' }">selected</c:if>>코칭
									완료된 요청</option>
						</select>

						</td>
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
								style="text-decoration-line: none; color: dark; font-weight: 700; float: left;"
								href="${contextPath}/view_sentReqWait?reqNO=${sentList.reqNO}">${sentList.rTitle }</a></td>
							<fmt:parseDate var="dateFmt" pattern="yyyy-MM-dd HH:mm:ss"
								value="${sentList.rDate}" />
							<fmt:formatDate var="dateTempParse" pattern="yyyy-MM-dd"
								value="${dateFmt}" />
							<td>${dateTempParse}</td>
							<td><c:choose>
									<c:when test="${sentList.status == 'status1'}">대기</c:when>
									<c:when test="${sentList.status == 'status2'}">수락</c:when>
									<c:when test="${sentList.status == 'status3'}">거절</c:when>
									<c:when test="${sentList.status == 'status4'}">완료</c:when>
								</c:choose></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<!-- 쪽 번호 구간 -->
		<div style="margin: 0 auto; font-size: 30px;">

			<c:if test="${pageMaker.prev }">
				<a
					href='<c:url value="/view_sendReq?status=${cri.status }&page=${pageMaker.startPage-1 }"/>'><i
					class=""></i></a>
			</c:if>

			<c:forEach begin="${pageMaker.startPage }"
				end="${pageMaker.endPage }" var="pageNum">
				<a
					href='<c:url value="/view_sendReq?status=${cri.status }&page=${pageNum }"/>'><i
					class="">${pageNum }</i></a>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
				<a
					href='<c:url value="/view_sendReq?status=${cri.status }&page=${pageMaker.endPage+1 }"/>'><i
					class=""></i></a>
			</c:if>

		</div>
	</div>

</body>
</html>