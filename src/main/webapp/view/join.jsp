<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
fieldset {
	width: 300px;
	margin: auto;
}

div {
	text-align: center;;
	margin: 100px;
	auto;
}
</style>
<script type="text/javascript">
	
	function list_go() {
		location.href="${pageContext.request.contextPath }/MyController?cmd=list"
	}
</script>
</head>
<body>
	<div id="bbs">
	<c:choose>
		<c:when test="${!empty fail }">
		<script type="text/javascript">
		alert("${fail }");
		location.href="${pageContext.request.contextPath }/MyController?cmd=login"
		</script>
		</c:when>
	</c:choose>
		<form method="post" action="${pageContext.request.contextPath }/MyController?cmd=join_ok">
			<fieldset>
				<legend>회원가입</legend>
				<p>
					아이디 : <input type="text" name="writer" placeholder="id를 입력하세요" required>
				</p>
				<p>
					패스워드 : <input type="password" name="pwd" placeholder="pw를 입력하세요" required>
				</p>
				<input type="submit" value="회원가입">
			</fieldset>
		</form>
	</div>
</body>
</html>

