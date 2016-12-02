<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
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
if(session.getAttribute("Userid")==null){	
%>

<form action="<%=request.getContextPath()%>/board/boardLoginAction.jsp" method="post">
	<div>
	ID<input name="id" id="id" type="text">
	PW<input name="pw" id="pw" type="password">
	<input type="submit" value="로그인">
	</div>
<%
}
else{
%>
	<div>
		<%=session.getAttribute("Userid")%>로그인
	</div>
	<a href="<%=request.getContextPath()%>/board/boardLogoutAction.jsp">로그아웃</a>
<%
}
%>
</form>
</body>
</html>