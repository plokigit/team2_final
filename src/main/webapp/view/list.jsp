<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset=UTF-8>
<title>목록</title>
<style type="text/css">
#bbs table {
	width:700px;
	margin:0 auto;
	margin-top:20px;
	border: 1px solid black;
	border-collapse: collapse;
	font-size: 14px;
}

#bbs table caption {
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 10px;
}

#bbs table th, #bbs table td {
	text-align: center;
	border: 1px solid black;
	padding: 4px 10px;
}

a{
	text-decoration: none;
	color: black;
}

.no { width: 15% }
.subject { 	width: 30% }
.writer {	width: 20% }
.reg {	width: 20% }
.hit {	width: 15% }
.title {	background: lightsteelblue }
.odd {	background: silver }

/* paging */
table tfoot ol.paging {
	list-style: none;
}

table tfoot ol.paging li {
	float: left;
	margin-right: 8px;
}

table tfoot ol.paging li a {
	display: block;
	padding: 3px 7px;
	border: 1px solid #00B3DC;
	color: #2f313e;
	font-weight: bold;
}

table tfoot ol.paging li a:hover {
	background: #00B3DC;
	color: white;
	font-weight: bold;
}

.disable {
	padding: 3px 7px;
	border: 1px solid silver;
	color: silver;
}

.now {
	background: #ff4aa5;
	color: white;
	font-weight: bold;
}
</style>
<script type="text/javascript">
	function write_go() {
		location.href="${pageContext.request.contextPath }/MyController?cmd=write";
	}
	function logout() {
		location.href="${pageContext.request.contextPath }/MyController?cmd=logout";
	}
	function login() {
		location.href="${pageContext.request.contextPath }/MyController?cmd=login";
	}
</script>
</head>
<body>
	<%
		request.getSession(false);
	%>
	<div style="text-align:right;margin-right:20%;">
	id: ${id }&nbsp;
	<c:choose>
		<c:when test="${empty id }">
			<button onclick="login()">로그인</button>
		</c:when>
		<c:otherwise>
			<button onclick="logout()">로그아웃</button>
		</c:otherwise>
	</c:choose>
	</div>
	<div id="bbs" align="center">
		<table summary="게시판 목록">
			<caption>게시판 목록</caption>
			<thead>
				<tr class="title">
					<th class="no">번호</th>
					<th class="subject">제목</th>
					<th class="writer">글쓴이</th>
					<th class="reg">날짜</th>
					<th class="hit">조회수</th>
				</tr>
			</thead>
			
			<tbody>
				<c:choose>
						<c:when test="${empty list }">
							<tr>
								<td colspan="4">아무 글도 없다.</td>
							</tr>		
						</c:when>
						<c:otherwise>
						<c:forEach var="i" items="${list }" varStatus="vs">
							<tr>
								<td>${pvo.totalRecord-((pvo.nowPage-1)*pvo.numPerPage+vs.index) }</td>
								<%-- <td>${i.b_idx }</td> --%>
								<td><a href="${pageContext.request.contextPath }/MyController?cmd=onelist&b_idx=${i.b_idx }&cPage=${pvo.nowPage }">${i.subject }</a></td>
								<td>${i.writer }</td>
								<td>${i.write_date }</td>
								<td>${i.hit }</td>
							</tr>
						</c:forEach>
						</c:otherwise>
						</c:choose>
			</tbody>

			<!-- 페이지기법 -->
			<tfoot>
				<tr>
					<td colspan="4">
						<ol class="paging">
						<!-- 이전 -->
						    <c:choose>
						    	<c:when test="${pvo.beginBlock <= pvo.pagePerBlock }">
						    		<li class="disable">이전</li>
						    	</c:when>
						    	<c:otherwise>
						    		<li><a href="${pageContext.request.contextPath }/MyController?cmd=list&cPage=${pvo.beginBlock-pvo.pagePerBlock+1 }">이전</a></li>
						    	</c:otherwise>
						    </c:choose>
						    <!-- 블록안에 들어간 페이지번호들 -->
							<c:forEach begin="${pvo.beginBlock }" end="${pvo.endBlock }" step="1" var="i">
								<c:choose>
									<c:when test="${i==pvo.nowPage }">
										<li class="now"><a href="${pageContext.request.contextPath }/MyController?cmd=list&cPage=${i }">${i }</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="${pageContext.request.contextPath }/MyController?cmd=list&cPage=${i }">${i }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<!-- 다음 -->
							<c:choose>
						    	<c:when test="${pvo.endBlock >= pvo.totalPage }">
						    		<li class="disable">다음</li>
						    	</c:when>
						    	<c:otherwise>
						    		<li><a href="${pageContext.request.contextPath }/MyController?cmd=list&cPage=${pvo.beginBlock+pvo.pagePerBlock }">다음</a></li>
						    	</c:otherwise>
						    </c:choose>
						</ol>
					</td>
					<td>
						<button	onclick="write_go()">글쓰기</button>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</body>
</html>
