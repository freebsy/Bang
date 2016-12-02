<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="service.BoardDao"%>
<%@ page import="service.Board"%>
<%@ page import="java.util.ArrayList"%>
<%@ include file="/board/boardLoginForm.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>BOARD LIST</title>
</head>
<body>
	<h1>BOARD LIST</h1>
	<%
		int currentPage = 1;
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		/* Board b = new Board(); */
		BoardDao dao = new BoardDao();
		int totalRowCount = dao.selectTotalBoardCount();
		int pagePerRow = 10;
	%>

	<table border="1">
		<thead>
			<tr>
				<th>boardNo</th>
				<th>boardTitle</th>
				<th>boardUser</th>
				<th>boardDate</th>
			</tr>
		</thead>
		<tbody>
			<%
				ArrayList<Board> getalm= dao.selectBoardListPerPage(currentPage, pagePerRow);
				for(int i=0;i<getalm.size();i++) {
					Board b= getalm.get(i);
			%>
			<tr>
				<td><%=b.getBoardNo()%></td>
				<td><a href="<%=request.getContextPath()%>/board/boardView.jsp?boardNo=<%=b.getBoardNo()%>"><%=b.getBoardTitle()%></a></td>
				<td><%=b.getBoardUser()%></td>
				<td><%=b.getBoardDate()%></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
	<div>
		<a href="<%=request.getContextPath()%>/board/boardAddForm.jsp">게시글
			입력</a>
	</div>
	<%
		int lastPage = totalRowCount / pagePerRow;
		if (totalRowCount % pagePerRow != 0) {
			lastPage++;
		}
	%>
	<div>
		<%
			if (currentPage > 1) {
		%>
		<ahref="<%=request.getContextPath()%>/board/boardList.jsp?currentPage=<%=currentPage - 1%>">이전</a>
		<%
			}
			if (currentPage < lastPage) {
		%>
		<ahref="<%=request.getContextPath()%>/board/boardList.jsp?currentPage=<%=currentPage + 1%>">다음</a>
		<%
			}
		%>
	</div>

</body>
</html>
