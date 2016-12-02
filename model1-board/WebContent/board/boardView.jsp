<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="service.BoardDao"%>
<%@ page import="service.Board"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardView</title>
</head>
<body>
<h1>BOARD VIEW</h1>
<%
if(request.getParameter("boardNo") == null) {
    response.sendRedirect(request.getContextPath()+"/board/boardList.jsp");
} else {
    int boardNo = Integer.parseInt(request.getParameter("boardNo"));
    System.out.println("boardNo :"+boardNo);
    BoardDao dao = new BoardDao();
    Board b= dao.selectBoardByKey(boardNo);
    

 %>
 		<div>board_no :</div>
			<div><%=b.getBoardNo()%></div>
			<div>board_title :</div>
			<div><%=b.getBoardTitle()%></div>
			<div>board_content :</div>
			<div><%=b.getBoardContent()%></div>
			<div>board_user :</div>
			<div><%=b.getBoardUser()%></div>
			<div>board_date :</div>
			<div><%=b.getBoardDate()%></div>
			<div>
				<a href="<%=request.getContextPath()%>/board/boardModifyForm.jsp?boardNo=<%=boardNo%>">수정</a>
				<a href="<%=request.getContextPath()%>/board/boardRemoveForm.jsp?boardNo=<%=boardNo%>">삭제</a>
				<a href="<%=request.getContextPath()%>/board/boardList.jsp">목록</a>
			</div>
<% 
	}
%>
</body>
</html>
