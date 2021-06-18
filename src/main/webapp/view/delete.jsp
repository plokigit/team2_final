<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${bvo.subject }</title>
<style type="text/css">
	#bbs table {
	    width:700px;
	    margin:0 auto;
	    margin-top:20px;
	    border:1px solid black;
	    border-collapse:collapse;
	    font-size:14px;
	    
	}
	
	#bbs table caption {
	    font-size:20px;
	    font-weight:bold;
	    margin-bottom:10px;
	}
	
	#bbs table th {
	    text-align:center;
	    border:1px solid black;
	    padding:4px 10px;
	}
	
	#bbs table td {
	    text-align:left;
	    border:1px solid black;
	    padding:4px 10px;
	}
	
	.no {width:15%}
	.subject {width:30%}
	.writer {width:20%}
	.reg {width:20%}
	.hit {width:15%}
	.title{background:lightsteelblue}
	.odd {background:silver}
</style>
<script type="text/javascript">
	
	function list_go() {
		location.href="${pageContext.request.contextPath }/MyController?cmd=list&cPage=${cPage}"
	}
	function delete_ok(f) {
		/* alert("${bvo.pwd }"+"|"+f.pwd.value); */
		if ("${bvo.pwd }" == f.pwd.value) {
			var chk = confirm("real?");
			if (chk) {
				f.action = "${pageContext.request.contextPath }/MyController?cmd=delete_ok"
				f.submit();
			}else{
				history.go(-1);
			}
		}else{
			alert("wrong pw");
			f.pwd.value="";
			f.pwd.focus();
			return;
		}
	}
</script>
</head>
<body>
	<div id="bbs">
	<form method="post">
		<table summary="글 삭제">
			<caption>글 삭제</caption>
			<tbody>
				
				<tr>
					<th>비밀번호:</th>
					<td><input type="password" name="pwd" size="12"/></td>
				</tr>
				<tr>
					<td colspan="1" style="text-align: left">
						<input type="button" value="목록" onclick="list_go()">
					<td colspan="2" style="text-align: right">
						<input type="button" value="삭제 확인" onclick="delete_ok(this.form)">
						<input type="hidden" name="cPage" value="${cPage }">
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	</div>
</body>
</html>

