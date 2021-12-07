<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link
	href='https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css'
	rel='stylesheet'>
<link href='https://use.fontawesome.com/releases/v5.7.2/css/all.css'
	rel='stylesheet'>
<script type='text/javascript'
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<script type='text/javascript'
	src='https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js'></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<link href="resources/css/join-styles.css" rel="stylesheet" />
<script type="text/javascript" src="resources/js/ajax.js"></script>
<script type="text/javascript">
	function yesOrNo(){
        if (confirm("탈퇴하시겠습니까?")) {
        	location.href='/cocoa/dropMember?id=${member.id }'// Yes click
        } else {
            // no click
		}
	}
</script>
<title>회원정보 수정</title>
</head>
<body>
	<div class="container">

		<div class="card mt-3 px-2 pt-3 pb-3 mb-3" style="width: 500px;">
			<h3 class="mb-2">회원정보 수정</h3>
			<form action="${contextPath}/updateInfo" method="post">
				<table style="width: 100%;">
					<tr>
						<td><div class="fone">
								<i class="fas fa-id-card"></i> <input type="text" name="id"
									id="id" class="form-control" value=${member.id } readonly>
							</div></td>
					</tr>
					<tr>
						<td><div class="fone mt-2">
								<i class="fas fa-lock"></i> <input type="password" name="pwd"
									class="form-control" id="pwd1" placeholder="비밀번호(Password)">
							</div></td>
					</tr>
					<tr>
						<td><div class="fone mt-2">
								<input type="password" class="form-control" id="pwd2"
									placeholder="비밀번호 확인(Password Check)">
							</div></td>
					</tr>
					<tr>
						<td>
							<div class="ml-3">
								<span id="alert-success" style="display: none;">비밀번호가일치합니다.</span>
								<span id="alert-danger"
									style="display: none; color: #d92742; font-weight: bold;">비밀번호가
									일치하지 않습니다.</span>
							</div>
						</td>
					</tr>
					<tr>
						<td><div class="fone mt-2">
								<i class="fas fa-user"></i> <input type="text" name="name"
									id="name" class="form-control"
									placeholder="이름(Name) 또는 별명(Nickname)">
							</div></td>
					</tr>
					<tr>
						<td><div class="fone mt-2">
								<i class="fas fa-phone"></i> <input type="text" name="phone"
									id="phone" class="form-control"
									placeholder="전화번호(Phone Number)">
							</div></td>
					</tr>
					<tr>
						<td align="center"><button type="submit"
								 class="btn btn-success mt-5">수정하기</button>
						<input type="button" id="" class="btn btn-success mt-5" value="탈퇴하기" onClick="yesOrNo()">
						</td>
						
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>