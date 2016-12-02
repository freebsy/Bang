package web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.Board;
import service.BoardDao;

/**
 * Servlet implementation class BoardView
 */
@WebServlet("/board/BoardView")
public class BoardView extends HttpServlet {
	private BoardDao boardDao;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("boardNo") == null) {
		    response.sendRedirect(request.getContextPath()+"/board/boardList");
		} else {
		    int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		    System.out.println("boardNo :"+boardNo);
		    BoardDao dao = new BoardDao();
		    Board b = dao.selectBoardByKey(boardNo);
		    
		    request.setAttribute("b",b);
		    request.getRequestDispatcher("/board/boardView.jsp").forward(request, response);
	}
	}

}