<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="service.BoardDao"%>
<%@ page import="service.Board"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>BOARD MODIFY ACTION</title>
</head>
<body>
<%
request.setCharacterEncoding("euc-kr");
if(request.getParameter("boardNo") == null || request.getParameter("boardPw") == null) {
    response.sendRedirect(request.getContextPath()+"/board/boardList.jsp");
} else {
    int boardNo = Integer.parseInt(request.getParameter("boardNo"));
    	System.out.println("boardModifyAction param boardNo :"+boardNo);
    String boardPw = request.getParameter("boardPw");
    	System.out.println("boardModifyAction param boardPw :"+boardPw);
    String boardTitle = request.getParameter("boardTitle");
    	System.out.println("boardModifyAction param boardTitle :"+boardTitle);
    String boardContent = request.getParameter("boardContent");
    	System.out.println("boardModifyAction param boardContent :"+boardContent);
    	
    Board board = new Board();
    
    board.setBoardNo(boardNo);
  	board.setBoardPw(boardPw);
  	board.setBoardTitle(boardTitle);
  	board.setBoardContent(boardContent);
    
    BoardDao Dao = new BoardDao();
    Dao.updateBoard(board);
    response.sendRedirect(request.getContextPath()+"/board/boardView.jsp?boardNo="+boardNo);
}
%>
</body>
</html>
