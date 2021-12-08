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
	function yesOrNo() {
		if (confirm("탈퇴하시겠습니까?")) {
			location.href = '/cocoa/dropMember?id=${member.id }'// Yes click
		} else {
			// no click
		}
	}
</script>
<title>CoCoa</title>
</head>
<body>

	<div class="row" style="width: 80vw;">
		<div class="card rcol my-5"
			style="background-color: #FFEBCD; border: none; padding-top: 5%;">
			<form action="${contextPath}/updateInfo" method="post"
				style="border: 1px solid black; background-color: #FFCC99;">
				<table
					style="width: 90%; background-color: #FFCC99; margin: 0 auto; color: black;">
					<tr>
						<th style="font-size: 20px; text-align: center;"><b>회 원 정
								보</b><br></th>
					</tr>
					<tr>
						<td>
							<div class="fone">
								<i class="fas fa-id-card"
									style="color: black; padding-left: 10px;"></i> <input
									type="text" name="id" id="id" class="form-control"
									style="border: 1px solid grey; padding-left: 30px; font-weight: 700; color: black;"
									value=${member.id } readonly>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="fone mt-2">
								<i class="fas fa-lock" style="color: black; padding-left: 10px;"></i>
								<input type="password" name="pwd" class="form-control" id="pwd1"
									style="border: 1px solid grey; padding-left: 30px; color: black;"
									placeholder="비밀번호(Password)">
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="fone mt-2">
								<i class="fas fa-lock" style="color: black; padding-left: 10px;"></i><input
									type="password" class="form-control" id="pwd2"
									style="border: 1px solid grey; padding-left: 30px; color: black;"
									placeholder="비밀번호 확인(Password Check)">
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="ml-3" style="float: left;">
								<span id="alert-success" style="display: none; font-size: 13px;"><b>비밀번호가
										일치합니다.</b></span> <span id="alert-danger"
									style="display: none; color: #d92742; font-size: 13px;"><b>비밀번호가
										일치하지 않습니다.</b></span>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="fone mt-2">
								<i class="fas fa-user" style="color: black; padding-left: 10px;"></i>
								<input type="text" name="name" id="name" class="form-control"
									style="border: 1px solid grey; padding-left: 30px; color: black;"
									placeholder="이름(Name) 또는 닉네임(Nickname)">
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="fone mt-2">
								<i class="fas fa-phone"
									style="color: black; padding-left: 10px;"></i> <input
									type="text" name="phone" id="phone" class="form-control"
									style="border: 1px solid grey; padding-left: 30px; color: black;"
									placeholder="전화번호(Phone Number)">
							</div>
						</td>
					</tr>
					<tr>
						<td align="center"
							style="padding-top: 20px; padding-bottom: 20px;">
							<button type="submit" id="modInfo" class="btn btn-success">수정하기</button>
							<input type="button" id="delInfo" class="btn btn-success"
							value="탈퇴하기" onClick="yesOrNo()">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>

</body>
</html>