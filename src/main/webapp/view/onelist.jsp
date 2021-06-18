<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${bvo.subject }</title>
<style type="text/css">
	.bbs table {
	    width:700px;
	    margin:0 auto;
	    margin-top:20px;
	    border:1px solid black;
	    border-collapse:collapse;
	    font-size:14px;
	}
	
	.bbs table caption {
	    font-size:20px;
	    font-weight:bold;
	    margin-bottom:10px;
	}
	
	.bbs table th {
	    text-align:center;
	    border:1px solid black;
	    padding:4px 10px;
	}
	
	.bbs table td {
	    text-align:left;
	    border:1px solid black;
	    padding:4px 10px;
	}
	
	.reply {
		width: 700px;
	    margin: 0px auto;
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
	window.onload = function(){
		if(${id==bvo.writer}){
			for (var i = 0; i < document.getElementsByClassName("editbtn").length; i++) {
				document.getElementsByClassName("editbtn")[i].style.display="inline-block";				
			}
		}
	}
	
	function list_go() {
		location.href="${pageContext.request.contextPath }/MyController?cmd=list&cPage=${cPage}"
	}
	function update_go() {
		if(${id==bvo.writer}) {
		location.href="${pageContext.request.contextPath }/MyController?cmd=update&cPage=${cPage}"
		}
	}
	function delete_go() {
		var del_ok = confirm("정말 삭제하시겠습니까?");
		if(del_ok && ${id==bvo.writer}) {
			location.href="${pageContext.request.contextPath }/MyController?cmd=delete&cPage=${cPage}"
		}
	}
	function comment_write(f) {
		f.action="${pageContext.request.contextPath }/MyController?cmd=comment_write"
		f.submit();
	}
	function comment_del(f) {
		f.action = "${pageContext.request.contextPath }/MyController?cmd=comment_delete"
		f.submit();
	}
	
</script>
</head>
<body>
	id: ${id }
	pw: ${pw }
	<div class="bbs">
	<form method="post">
		<table summary="글 보기">
			<caption>글 보기</caption>
			<tbody>
				<tr>
					<th style="width:100px;">제목:</th>
					<td>${bvo.subject }</td>
					<td style="width:50px;">${bvo.hit }</td>
				</tr>
				<tr>
					<th>이름:</th>
					<td colspan="2">${bvo.writer }</td>
				</tr>
				<tr>
					<th>내용:</th>
					<td colspan="2">
					<pre>${bvo.content }</pre>
					</td>
				</tr>
				<tr>
					<th>첨부파일:</th>
					<c:choose>
							<c:when test="${empty bvo.file_name}">
								<td colspan="2">첨부파일 없음</td>
							</c:when>
							<c:otherwise>
								<td colspan="2" class="content" style="text-align: center;"><a href="view/download.jsp?path=upload&file_name=${bvo.file_name }">
								<img alt="" src="upload/${bvo.file_name }" style="width: 100px"> <br>${bvo.file_name }</a></td>
							</c:otherwise>
					</c:choose>
				</tr>
				<tr>
					<td colspan="1" style="text-align: left">
						<input type="button" value="목록" onclick="list_go()">
					<td colspan="2" style="text-align: right">
						<input type="button" class="editbtn" value="수정" onclick="update_go()" style="display:none;">
						<input type="button" class="editbtn" value="삭제" onclick="delete_go()" style="display:none;">
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	</div>
	<br>
	<br>
	<div class="reply" style="border-top: 1px solid black;">
		<br>

		<c:choose>
			<c:when test="${empty c_list}">
				<tr>
					<td>댓글 없음</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="i" items="${c_list }">
					<form method="post">
						<table>
							<tbody>
								<tr>
									<td><textarea rows="4" cols="70" name="content" readonly>${i.content }</textarea></td>
									<c:choose>
										<c:when test="${id!=i.writer}">
										<td><input type="button" value="삭제" onclick="comment_del(this.form)" style="display:none;"></td>
										</c:when>
										<c:otherwise>
										<td><input type="button" value="삭제" onclick="comment_del(this.form)"></td>
										</c:otherwise>
									</c:choose>
									<td><input type="hidden" name="c_idx" value="${i.c_idx }"></td>
									<td><input type="hidden" name="b_idx" value="${i.b_idx }"></td>
								</tr>
							</tbody>
						</table>
					</form>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
	<br>
	<div class="reply">
		<form method="post">
			<table>
				<tbody>
					<tr>
						<td><textarea rows="4" cols="70" name="content"></textarea></td>
						<td><input type="button" value="댓글" onclick="comment_write(this.form)"></td>
						<td><input type="hidden" name="id" value="${id }"></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>

