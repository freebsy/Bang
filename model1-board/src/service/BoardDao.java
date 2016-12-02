package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class BoardDao {
	private final String driverClassName = "com.mysql.jdbc.Driver";
	private final String url = "jdbc:mysql://127.0.0.1:3306/jjdev?useUnicode=true&characterEncoding=euckr";
	private final String username = "root";
	private final String password = "java0000";
	Connection conn = null;	
	PreparedStatement stmt = null;
	ResultSet rs = null;
	Board b = new Board();
	
	
	public int LoginSession(String Userid, String UserPw) {
		int rowCount = 0;
		
		try{
			conn = this.getConnection();
			String sql = "SELECT * FROM board WHERE board_user=? AND board_pw=?";
			
			stmt = conn.prepareStatement(sql);
			stmt.setString(1,Userid);
			stmt.setString(2,UserPw);
			
			rs = stmt.executeQuery();
			if(rs.next()){
				rowCount = 1;
			}
			
			} catch(Exception e) {
				e.printStackTrace();
			}finally {
				this.close(conn, stmt, rs);
			}
			return rowCount;
		}

	
	
	// 테이블 : board , 기능 : 데이터 수정
	public int updateBoard(Board board) {
		int rowCount = 0;
		
		try{
		conn = this.getConnection();
		String sql = "UPDATE board SET board_title=?, board_content=? WHERE board_no=? AND board_pw=?";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1,board.getBoardTitle());
		stmt.setString(2,board.getBoardContent());
		stmt.setInt(3,board.getBoardNo());
		stmt.setString(4,board.getBoardPw());
		rowCount = stmt.executeUpdate();
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close(conn, stmt, rs);
		}
		
		return rowCount;	
	}
	// 테이블 : board , 기능 :  데이터 삭제
	public int deleteBoard(int boardNo , String boardPw) {
		int rowCount = 0;
		
		try{
		conn = this.getConnection();
		String sql = "DELETE FROM board WHERE board_no=? AND board_pw=?";
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1,boardNo);
		stmt.setString(2,boardPw);
		rowCount = stmt.executeUpdate();
		} catch (Exception e) {
			 e.printStackTrace();
		} finally {
			this.close(conn, stmt, rs);
		}
		return rowCount;
	}
	// 테이블 : board , 기능 : 하나의 데이터 하나 가져오기
	public Board selectBoardByKey(int boardNo) {
		
		try {
			conn = this.getConnection();
			String sql = "SELECT * FROM board WHERE board_no=?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1,boardNo);
			System.out.println(boardNo+"글번호가 왔냐?");
			rs = stmt.executeQuery();
			if(rs.next()){
				b = new Board();
				b.setBoardNo(rs.getInt("board_no"));
					System.out.println(rs.getInt("board_no"));
				b.setBoardTitle(rs.getString("board_Title"));
				b.setBoardContent(rs.getString("board_content"));
				b.setBoardUser(rs.getString("board_user"));
				b.setBoardDate(rs.getString("board_date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close(conn, stmt, rs);
		}
		return b;
	}
	// 테이블 : board , 기능 : 한페이지의 데이터 가져오기
	public ArrayList<Board> selectBoardListPerPage(int beginRow, int pagePerRow) {
		ResultSet listResultSet = null;
		PreparedStatement listStatement = null;
		ArrayList<Board> alm = new ArrayList<Board>();			
		try{
			conn = this.getConnection();
			String listSql = "SELECT board_no, board_title, board_user, board_date FROM board ORDER BY board_no DESC LIMIT ?, ?";
		    listStatement = conn.prepareStatement(listSql);
		    listStatement.setInt(1, (beginRow-1)*pagePerRow); 
		    listStatement.setInt(2, pagePerRow); 
		    listResultSet = listStatement.executeQuery();
		    while(listResultSet.next()) {
		    	b = new Board();
		    	b.setBoardNo(listResultSet.getInt("board_no"));
		    	b.setBoardTitle(listResultSet.getString("board_title"));
		    	b.setBoardUser(listResultSet.getString("board_user"));
		    	b.setBoardDate(listResultSet.getString("board_date"));
		    	alm.add(b);
		    }
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.close(conn, stmt, null);
		}
		return alm;
		
	}
	// 테이블 : board , 기능 : 전체 로우 카운터 가져오기
	public int selectTotalBoardCount() {
		int RowCount = 0;	
		
		try{
		conn = this.getConnection();
		String totalSql = "SELECT COUNT(*) FROM board";
		stmt = conn.prepareStatement(totalSql);
		rs = stmt.executeQuery();
		 if(rs.next()) 
			 RowCount = rs.getInt(1);
		    } catch (Exception e) {
		    	e.printStackTrace();
		    }finally {
		    	this.close(conn, stmt, rs);
		    }
		return RowCount;
	}
	// 테이블 : board , 기능 : 데이터 입력하기
	public int insertBoard(Board board) {
		int rowCount = 0;
		try {
			conn = this.getConnection();
			String sql = "INSERT INTO board(board_pw, board_title, board_content, board_user, board_date) values(?,?,?,?,now())";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1,board.getBoardPw());
			stmt.setString(2,board.getBoardTitle());
			stmt.setString(3,board.getBoardContent());
			stmt.setString(4,board.getBoardUser());
			rowCount = stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.close(conn, stmt, null);
		}
		return rowCount;
	}
	
	private Connection getConnection() throws ClassNotFoundException, SQLException{
		Class.forName(driverClassName);
		conn = DriverManager.getConnection(url, username,password);
		
		return conn;
		
	}
	
	private void close(Connection conn, Statement stmt, ResultSet rs) {
		if(rs != null) {
			try{
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(stmt != null) {
			try{
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(conn != null) {
			try{
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
