<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="service.BoardDao"%>
<%@ page import="service.Board"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("euc-kr");
		String Userid = request.getParameter("id");
			System.out.println(Userid);
		String Userpw = request.getParameter("pw");
			System.out.println(Userpw);
		
		BoardDao dao = new BoardDao();
		int rowCount = dao.LoginSession(Userid, Userpw);
		if (rowCount == 1) {
			session.setAttribute("Userid", Userid);
			session.setAttribute("Userpw", Userpw);
		}

		response.sendRedirect(request.getContextPath() + "/board/boardList.jsp");
	%>

	</form>
</body>
</html>