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

		$('#project').click(function() {
			$('#pfield1').removeAttr('hidden');
		});

	});
</script>
<title>CoCoa</title>
</head>
<body style="background-color: #FFEBCD">

	<!-- 카테고리 구간 -->
	<header class="py-5" style="background-color: #663333">
		<div class="container px-4 px0lg05 my-5">

			<!-- topic -->
			<div style="text-align: center;" id="topic">
				<input id="project" type="button"
					class="btn btn-primary btn-lg px-4 me-sm-3"
					onClick="location.href='/cocoa/view_project1'" value="Project">
				<input id="coaching" type="button"
					class="btn btn-primary btn-lg px-4 me-sm-3"
					onClick="location.href='/cocoa/view_coachCate'" value="Coaching">
			</div>

			<!-- pfield -->
			<div style="text-align: center;" id="pfield">
				<input id="pfield1" type="button"
					class="btn btn-primary btn-lg px-4 me-sm-3"
					onClick="location.href='/cocoa/view_project2?pfield=Web'"
					value="Web"> <input id="pfield2" type="button"
					class="btn btn-primary btn-lg px-4 me-sm-3"
					onClick="location.href='/cocoa/view_project2?pfield=Mobile+App'"
					value="Mobile App"> <input id="pfield3" type="button"
					class="btn btn-primary btn-lg px-4 me-sm-3"
					onClick="location.href='/cocoa/view_project2?pfield=Embedded'"
					value="Embedded">
			</div>

			<!-- web-level -->
			<div style="text-align: center;" id="weblevel">
				<input id="weblevel1" type="button"
					class="btn btn-primary btn-lg px-4 me-sm-3"
					onClick="location.href='/cocoa/view_project3?pfield=Web&level=Beginner'"
					value="Beginner"> <input id="weblevel2" type="button"
					class="btn btn-primary btn-lg px-4 me-sm-3"
					onClick="location.href='/cocoa/view_project3?pfield=Web&level=Junior'"
					value="Junior"> <input id="weblevel3" type="button"
					class="btn btn-primary btn-lg px-4 me-sm-3"
					onClick="location.href='/cocoa/view_project3?pfield=Web&level=Senior'"
					value="Senior">
			</div>

			<!-- app-level -->
			<div style="text-align: center;" id="applevel">
				<input id="applevel1" type="button"
					class="btn btn-primary btn-lg px-4 me-sm-3"
					onClick="location.href='/cocoa/view_project3?pfield=Mobile+App&level=Beginner'"
					value="Beginner"> <input id="applevel2" type="button"
					class="btn btn-primary btn-lg px-4 me-sm-3"
					onClick="location.href='/cocoa/view_project3?pfield=Mobile+App&level=Junior'"
					value="Junior"> <input id="applevel3" type="button"
					class="btn btn-primary btn-lg px-4 me-sm-3"
					onClick="location.href='/cocoa/view_project3?pfield=Mobile+App&level=Senior'"
					value="Senior">
			</div>

			<!-- emb-level -->
			<div style="text-align: center;" id="emblevel">
				<input id="emblevel1" type="button"
					class="btn btn-primary btn-lg px-4 me-sm-3"
					onClick="location.href='/cocoa/view_project3?pfield=Embedded&level=Beginner'"
					value="Beginner"> <input id="emblevel2" type="button"
					class="btn btn-primary btn-lg px-4 me-sm-3"
					onClick="location.href='/cocoa/view_project3?pfield=Embedded&level=Junior'"
					value="Junior"> <input id="emblevel3" type="button"
					class="btn btn-primary btn-lg px-4 me-sm-3"
					onClick="location.href='/cocoa/view_project3?pfield=Embedded&level=Senior'"
					value="Senior">
			</div>

			<!-- cfield -->
			<div style="text-align: center;" id="cfield">
				<input id="cfield1" type="button"
					class="btn btn-primary btn-lg px-4 me-sm-3"
					onClick="location.href='/cocoa/view_coach2?cfield=Web'" value="Web">
				<input id="cfield2" type="button"
					class="btn btn-primary btn-lg px-4 me-sm-3"
					onClick="location.href='/cocoa/view_coach2?cfield=Mobile+App'"
					value="Mobile App"> <input id="cfield3" type="button"
					class="btn btn-primary btn-lg px-4 me-sm-3"
					onClick="location.href='/cocoa/view_coach2?cfield=Embedded'"
					value="Embedded">
			</div>

			<!-- web-tool -->
			<div style="text-align: center;" id="webtool">
				<input id="webtool1" type="button"
					class="btn btn-primary btn-lg px-4 me-sm-3"
					onClick="location.href='/cocoa/view_coach3?cfield=Web&tool=Spring'"
					value="Spring"> <input id="webtool2" type="button"
					class="btn btn-primary btn-lg px-4 me-sm-3"
					onClick="location.href='/cocoa/view_coach3?cfield=Web&tool=Django'"
					value="Django">
			</div>

			<!-- app-tool -->
			<div style="text-align: center;" id="apptool">
				<input id="apptool1" type="button"
					class="btn btn-primary btn-lg px-4 me-sm-3"
					onClick="location.href='/cocoa/view_coach3?cfield=Mobile+App&tool=Android+Studio'"
					value="Android Studio"> <input id="apptool2" type="button"
					class="btn btn-primary btn-lg px-4 me-sm-3"
					onClick="location.href='/cocoa/view_coach3?cfield=Mobile+App&tool=Xcode'"
					value="Xcode">
			</div>

			<!-- emb-tool -->
			<div style="text-align: center;" id="embtool">
				<input id="embtool1" type="button"
					class="btn btn-primary btn-lg px-4 me-sm-3"
					onClick="location.href='/cocoa/view_coach3?cfield=Embedded&tool=Arduino'"
					value="Arduino"> <input id="embtool2" type="button"
					class="btn btn-primary btn-lg px-4 me-sm-3"
					onClick="location.href='/cocoa/view_coach3?cfield=Embedded&tool=Raspberry+Pi'"
					value="Raspberry Pi">
			</div>

		</div>
	</header>

</body>
</html>