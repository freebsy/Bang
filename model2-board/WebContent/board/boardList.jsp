<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<h1>BOARD LIST</h1>
 	<div class="container">
    <div>전체행의 수 : ${totalRowCount}/${list.size()}</div>
    <table class="table">
        <thead>
            <tr class="danger">
                <th>boardTitle</th>
                <th>boardUser</th>
                <th>boardDate</th>
            </tr>
        </thead>
        <tbody>
			<c:forEach var="b" items="${list}">
                <tr>
                    <td><a href="<c:url value='/board/BoardView?boardNo=${b.boardNo}'/>">${b.boardTitle}</a></td>
                    <td>${b.boardUser}</td>
                    <td>${b.boardDate}</td>
                </tr>
       		</c:forEach>
       		
        </tbody>
    </table>
 
  <div class="container">
    <ul class="pager">
       <li><a href="<%=request.getContextPath()%>/board/BoardAdd">게시글 입력</a></li>
    
	<div>
           <c:if test="${currentPage>1}">
            <li><a href="<c:url value='/board/BoardList?currentPage=${currentPage-1}'/>">이전</a></li>
            </c:if>
            
            <c:if test="${currentPage < lastPage}">
           <li><a href="<c:url value='/board/BoardList?currentPage=${currentPage+1}'/>">다음</a></li>
            </c:if>
            </ul>
    </div>
    </div>
</div>
</body>
</html>