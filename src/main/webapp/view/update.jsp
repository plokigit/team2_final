<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	function update_ok(f) {
		f.action="${pageContext.request.contextPath }/MyController?cmd=update_ok&cPage=${cPage}";
		f.submit();
	}
	function remove(f) {
		f.old_file_name.value="";
		f.file_name.value="";
	}
</script>
</head>
<body>
	<div id="bbs">
	<form method="post" encType="multipart/form-data">
		<table summary="게시판 글쓰기">
			<caption>게시판 글쓰기</caption>
			<tbody>
				<tr>
					<th>제목:</th>
					<td><input type="text" name="subject" size="45" value="${bvo.subject }"></td>
				</tr>
				<tr>
					<td><input type="hidden" name="writer" size="12" value="${id }"></td>
				</tr>
				<tr>
					<th>내용:</th>
					<td><script src="//cdn.ckeditor.com/4.16.1/standard/ckeditor.js"></script>
					<textarea name="content" cols="50" rows="8">${bvo.content }</textarea>
					<script type="text/javascript">
					CKEDITOR.replace('content');
					</script>
					</td>
				</tr>
				<tr>
					<th>첨부파일:</th>
					<td><input type="file" name="file_name"/>
					이전 파일: <input type="text" name="old_file_name" value="${bvo.file_name }" readonly>
							<input type="button" value="X" onclick="remove(this.form)">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="목록" onclick="list_go()"/>
						<input type="button" value="수정" onclick="update_ok(this.form)"/>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	</div>
</body>
</html>

