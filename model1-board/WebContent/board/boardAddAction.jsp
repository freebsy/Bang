<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="service.BoardDao" %>
<%@ page import="service.Board" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");
		
		String boardPw = request.getParameter("boardPw");
			System.out.println("param boardPw:"+boardPw);
		String boardTitle = request.getParameter("boardTitle");
			System.out.println("param boardTitle:"+boardTitle);
		String boardContent = request.getParameter("boardContent");
			System.out.println("param boardContent:"+boardContent);
		String boardUser = request.getParameter("boardUser");
			System.out.println("param boardUser:"+boardUser);
	
Board b  = new Board();
b.setBoardPw(boardPw);
b.setBoardTitle(boardTitle);
b.setBoardContent(boardContent);
b.setBoardUser(boardUser);

BoardDao dao = new BoardDao();

dao.insertBoard(b);
response.sendRedirect(request.getContextPath()+"/board/boardList.jsp");
%>
</body>
</html>
