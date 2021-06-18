<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
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
	function join_go() {
		location.href="${pageContext.request.contextPath }/MyController?cmd=join";
	}
</script>
</head>
<body>
<div style="text-align:right;margin-right:20%;">
<%
		request.getSession(true);
	%>
session - 
	id: ${id }
	pw: ${pw } &nbsp;
</div>
	<div>
	${fail }
	<br><br>
			<fieldset>
				<legend>로그인</legend>
			<c:choose>
				<c:when test="${empty id }">
					<form method="post" action="${pageContext.request.contextPath }/MyController?cmd=login_ok">
						<p>
							아이디 : <input type="text" id="id" name="id" placeholder="id를 입력하세요" required>
						</p>
						<p>
							패스워드 : <input type="password" name="pw" placeholder="pw를 입력하세요" required>
						</p>
						<input type="submit" value="로그인" onclick="login_go(this.form)">&nbsp;&nbsp;&nbsp;
						<button onclick="join_go()">회원가입</button>
					</form>
				</c:when>
				<c:otherwise>
					<script type="text/javascript">
					alert("이미 로그인 되어 있습니다.");
					location.href="${pageContext.request.contextPath }/MyController?cmd=list"
					</script>
				</c:otherwise>
			</c:choose>
		</fieldset>
	</div>
</body>
</html>