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
		location.href="${pageContext.request.contextPath }/MyController?cmd=list"
	}
	function send_go(f) {
		for (var i = 5; i < f.elements.length; i++) {
			if(f.elements[i].value==""){
				if(i==1||i==2||i==3||i==4) {continue;}
				alert(f.elements[i].name+" is null");
				f.elements[i].focus();
				return;
			}
		}
		f.action="${pageContext.request.contextPath }/MyController?cmd=write_ok"
		f.submit();
	}
</script>
</head>
<body>
session - 
	id: ${id }
	pw: ${pw } &nbsp;
	<div id="bbs">
	<form method="post" encType="multipart/form-data">
		<table summary="게시판 글쓰기">
			<caption>게시판 글쓰기</caption>
			<tbody>
				<tr>
					<th>제목:</th>
					<td><input type="text" name="subject" size="45"/></td>
				</tr>
				<tr>
					<td><input type="hidden" name="writer" value="${id }"/></td>
				</tr>
				<tr>
					<th>내용:</th>
					<td><script src="//cdn.ckeditor.com/4.16.1/standard/ckeditor.js"></script>
					<textarea name="content" cols="50" rows="8"></textarea>
					<script type="text/javascript">
					CKEDITOR.replace('content');
					</script>
					</td>
				</tr>
				<tr>
					<th>첨부파일:</th>
					<td><input type="file" name="file_name"/></td>
				</tr>
				<tr>
					<td><input type="hidden" name="pwd" value="${pw }" /></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="목록" onclick="list_go()"/>
						<input type="reset" value="지우기"/>
						<input type="button" value="글쓰기" onclick="send_go(this.form)"/>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	</div>
</body>
</html>

