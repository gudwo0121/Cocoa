<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	var cnt = 1;
	function fn_addFile() {
		$("#d_file")
				.append("<br>" + "<input type='file' name='file"+cnt+"' />");
		cnt++;
	}
	

</script>
<title>CoCoa</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
<link href="resources/css/styles.css" rel="stylesheet" />
</head>
<body>

	<!-- 보낸 요청 리스트바 -->
	<div class="card rcol my-5"
		style="text-align: center; background-color: #FFEBCD; border: none; width: 80vw;"
		>
		<div class="table-responsive" style="border: 1px solid grey;">
			<table class="table table-striped table-sm">
				<thead>
					<tr>
						<th colspan="4" style="text-align: center;"><b>받은 요청 리스트</b></th>
					</tr>
					<tr>
						<th scope="col">요청자</th>
						<th scope="col">요청 제목</th>
						<th scope="col">요청 날짜</th>
						<th scope="col">요청 상태</th>
					</tr>
				</thead>
				<tbody>
					<!-- 이부분에 조회 -->
					<c:forEach var="gotList" items="${reqGotList}">
					<tr>
						<td>${gotList.req}</td>
						<td><a href="#">${gotList.rTitle}</a></td>
						<fmt:parseDate var = "dateFmt" pattern="yyyy-MM-dd HH:mm:ss.SSS" value="${gotList.rDate}"/>
						<fmt:formatDate var = "dateTempParse" pattern = "yyyy-MM-dd" value = "${dateFmt}"/>
						<td>${dateTempParse }</td>
						<td>${gotList.status }</td>
					</tr>
					</c:forEach>
					
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>