<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="service.BoardDao"%>
<%@ page import="service.Board"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardView</title>
</head>
<body>
<h1>BOARD VIEW</h1>
			<div>board_no :</div>
			<div>${b.boardNo}</div>
			<div>board_title :</div>
			<div>${b.boardTitle}</div>
			<div>board_content :</div>
			<div>${b.boardContent}</div>
			<div>board_user :</div>
			<div>${b.boardUser}</div>
			<div>board_date :</div>
			<div>${b.boardDate}</div>
			<div>
				<a href="<c:url value='/board/BoardModify?boardNo=${b.boardNo}'/>">수정</a>
				<a href="<c:url value='/board/BoardRemove?boardNo=${b.boardNo}'/>">삭제</a>
				<a href="<c:url value='/board/BoardList??boardNo=${b.boardNo}'/>">목록</a>
			</div>

</body>
</html>
