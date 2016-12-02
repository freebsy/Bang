<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="service.BoardDao"%>
<%@ page import="service.Board"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>BOARD MODIFY FORM</title>
</head>
<body>
<h1>BOARD MODIFY</h1>
<%
if(request.getParameter("boardNo") == null) {
    response.sendRedirect(request.getContextPath()+"/board/boardList.jsp");
} else {
    int boardNo = Integer.parseInt(request.getParameter("boardNo"));
    	System.out.println("boardModify param boardNo:"+boardNo);
	BoardDao dao = new BoardDao();
	Board b = dao.selectBoardByKey(boardNo);
%>    
    <form action="<%=request.getContextPath()%>/board/boardModifyAction.jsp" method="post">
        <div>boardNo</div>
        <div><input name="boardNo" value="<%=b.getBoardNo()%>" type="text" readonly="readonly"/></div>
        <div>비밀번호확인: </div>
        <div><input name="boardPw" id="boardPw" type="password"/></div>
        <div>boardTitle : </div>
        <div><input name="boardTitle" value="<%=b.getBoardTitle()%>" id="boardTitle" type="text"/></div>
        <div>boardContent : </div>
        <div><textarea name="boardContent" id="boardContent" rows="5" cols="50"><%=b.getBoardContent()%></textarea></div>
        <div>
            <input type="submit" value="글수정"/>
            <input type="reset" value="초기화"/>
        </div>
    </form>
<%
}
%>
</body>
</html>
