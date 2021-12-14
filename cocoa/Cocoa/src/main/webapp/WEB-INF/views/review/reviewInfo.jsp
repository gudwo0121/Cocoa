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
<script type="text/javascript">
	$(document).ready(function() {
		$('#r_modBtn').hide();
	});

	function fn_enable(obj) {
		$('#r_modBtn').show();
		$('#r_mod').hide;
		$('#r_rmv').hide;
		$('#r_rate').prop('disabled', false);
		$('#r_review').prop('disabled', false);
		return false;
	}
	function fn_update(obj) {
		obj.action = "${contextPath}/modReview";
		obj.submit();
	}
	function fn_delete(obj) {
		obj.action = "${contextPath}/removeReview"
		obj.submit();
	}
</script>
<title>[Cocoa] ${target }의 리뷰</title>
</head>
<body style="background-color: #FFEBCD">

	<!-- 상단바 -->
	<jsp:include page="../header.jsp"></jsp:include>

	<!-- 코치 글 구간 -->
	<section class="py-5">
		<div class="container main-secction">
			<div class="row" style="flex-wrap: unset;">

				<!-- 좌측 프로필 : coach~proImg / coach~name-->
				<div class="col-md-3 col-sm-3 col-xs-12 user-profil-part pull-left">
					<div class="row">
						<div
							class="col-md-12 col-md-12-sm-12 col-xs-12 user-image text-center"
							style="width: 80%; height: 100%; border: 2px solid; background-color: #FFCCCC;">

							<!-- 후기 조회 이동 -->
							<br> <span style="float: right;"><a
								href="/cocoa/view_reviewInfo"> <input type="button"
									name="view_reviewInfo" value="후 기" class="btn btn-third-dark"
									style="font-size: 13px; border-radius: 12px;">
							</a> </span>

							<!-- 프로필 조회 이동 -->
							<br> <br> <a
								href="/cocoa/view_profileInfo?profileId=${target}"> <img
								name="proImg" src="${contextPath}/downProfileImg?id=${target}"
								onerror="this.src='resources/image/kakao.png'"
								style="border: 1px solid black;" width="50%" height="120px"><br>
								<br>
							</a>

							<!-- coach -->
							<input type="text" name="coach" value="${target}" readonly
								style="text-align: center; border: 0; font-weight: 700; background-color: #FFCCCC; width: 70%;">
							<br>

							<!-- 요청서 작성 -->
							<br>
							<c:if test="${isLogOn == true && member.id !=target}">
								<a href="/cocoa/view_reqWriteForm?coachId=${target}"> <input
									type="button" name="requestForm" value="   요청서 작성   "
									class="btn btn-third-dark"
									style="text-align: center; border: 1; border-radius: 12px; width: 70%;">
								</a>
							</c:if>
							<br> <br>
						</div>
					</div>
				</div>

				<!-- 우측 내용 : writer, rate, review, 수정, 삭제 -->
				<div class="card"
					style="width: 50rem; border: 1px solid; background-color: #FFCC99">
					<div class="card rcol my-5"
						style="text-align: center; background-color: #FFEBCD; border: none; width: 100%; height: 100%;">
						<div style="border: 1px solid grey;">
							<form method="post" name="frmReview" action="${contextPath }">
								<table style="margin: 0px auto;">
									<tr>
										<th colspan="5" style="text-align: center;"><b>${target}의
												후기</b>
											<hr></th>
									</tr>
									
									<!-- 후기 한 줄 -->
									<c:forEach var="reviewInfo" items="${reviewList}">
										<tr style="width: 100%;">
											<td style="float: left;">작성자 : <input type="text"
												readonly id="writer" name="writer"
												value="${reviewInfo.writer}"
												style="vertical-align: top; text-align: center; border: none; background-color: #FFEBCD; color: black;">
												<input type="hidden" name="reviewNO"
												value="${reviewInfo.reviewNO }" />
											</td>
											<td colspan="3" style="float: left; width: 250px">평점 : <select
												style="border: 0; text-align: center; width: 80%; background-color: #FFCC99; font-weight: 700; color: black;"
												name="rate" disabled id="r_rate">
													<option id="present" value="">
														<c:choose>
															<c:when test="${reviewInfo.rate == 1}">★</c:when>
															<c:when test="${reviewInfo.rate == 2}">★★</c:when>
															<c:when test="${reviewInfo.rate == 3}">★★★</c:when>
															<c:when test="${reviewInfo.rate == 4}">★★★★</c:when>
															<c:when test="${reviewInfo.rate == 5}">★★★★★</c:when>
														</c:choose>
													</option>
													<option id="rate1" value=5>★★★★★</option>
													<option id="rate2" value=4>★★★★</option>
													<option id="rate3" value=3>★★★</option>
													<option id="rate4" value=2>★★</option>
													<option id="rate5" value=1>★</option>
											</select></td>
											<c:if
												test="${isLogOn == true && member.id == reviewInfo.writer}">
												<td style="float: right;"><input type="button"
													id="r_mod" value="수 정" onClick="fn_enable(frmReview)">&nbsp;&nbsp;<input
													type="button" id="r_rmv" value="삭 제"
													onClick="fn_delete(frmReview)"></td>
											</c:if>
										</tr>
										<tr>
											<td colspan="5"><textarea rows="2" cols="99" disabled
													name="review" id="r_review"
													style="border: 1px solid grey; margin: 0px auto; text-align: left; resize: none; color: black; background-color: #FFEBCD;">${reviewInfo.review }</textarea></td>
										</tr>
										<tr>
											<!-- 후기 한 줄 사이의 간격 -->
											<td colspan="5" style="float: right;"><input
												type="button" id="r_modBtn" value="확 인"
												onClick="fn_update(frmReview)"></td>
										</tr>
									</c:forEach>
								
								</table>
							</form>
						</div>

						<!-- 쪽 번호 구간 (수정필요) -->
						<div style="margin: 0 auto; font-size: 30px;">

							<c:if test="${pageMaker.prev }">
								<a
									href='<c:url value="/view_reviewInfo?target=${target}&page=${pageMaker.startPage-1 }"/>'><i
									class=""></i></a>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="pageNum">
								<a
									href='<c:url value="/view_reviewInfo?target=${target}&page=${pageNum }"/>'><i
									class="">${pageNum }</i></a>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
								<a
									href='<c:url value="/view_reviewInfo?target=${target}&page=${pageMaker.endPage+1 }"/>'><i
									class=""></i></a>
							</c:if>

						</div>
					
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- 하단바 -->
	<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>