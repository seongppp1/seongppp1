package com.jsp.board.dao.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.jsp.board.vo.BoardVO;
import com.jsp.util.JDBCUtil;

public class BoardDAOImpl {

	private final String BOARD_ADD = "insert into board(seq, title, writer, content) values((select nvl(max(seq), 0)+1 from board),?,?,?)";
	private final String BOARD_UPDATE = "update board set title=?, content=? where seq=?";
	private final String BOARD_DELETE = "delete board where seq=?";
	private final String BOARD_GET = "select * from board where seq=?";

	// 루씬 | Solr
	// title like '%안녕%'
	// 나는 자바를 좋아하는 이동훈입니다.
	// 나
	// 자바
	// 좋아하는
	// 이동훈
	// title like '이동훈%'
	// 컨트롤 + 2 => 콤보로 R 을 누른다.
	private final String BOARD_TITLE_LIST = "select * from board "
			+ " where TITLE like '%' || ? || '%' order by seq desc";
	// iBATIS
	// TITLE like '%' || #title# || '%' =? '%' || '이동훈' || '%'
	// seq = #seq:Numeric#
	// seq = $seq$

	// MyBatis
	// TITLE like '%' || ${title} || '%' =? '%'이동훈'%'

	// setString(1, "%이동훈%");
	// mysql => concat('%', ? , '%')

	private final String BOARD_CONTENT_LIST = "select * from board where CONTENT like '%' || ? || '%' order by seq desc";

	public int addBoard(BoardVO vo) {
		// ===============================
		// DB 관련 변수 선언
		// DB 컨텐션 획득
		// 쿼리 준비
		// 파라메터 할당
		// 쿼리 실행
		// 리소스 해제
		// 결과값 리턴
		// ===============================

		// DB 관련 변수 선언
		Connection conn = null;
		PreparedStatement stmt = null;
		int result = 0;

		try {

			// DB 컨넥션을 얻는다.
			conn = JDBCUtil.getConnection();

			// DB 컨넥션을 이용하여, 쿼리를 준비(set)하고, Statment를 얻는다.
			stmt = conn.prepareStatement(BOARD_ADD);

			// Statement에 파라메터를 할당한다. (? 할당)
			stmt.setString(1, vo.getTitle());
			stmt.setString(2, vo.getWriter());
			stmt.setString(3, vo.getContent());

			// 쿼리를 실행 한다.
			// create, update, delete 는 executeUpdate();
			// select : executeQuery() ;
			result = stmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 모든 리소스 해제
			JDBCUtil.close(stmt, conn);
		}

		// 등록된 수를 리턴한다.
		return result;
	}

	public int updateBoard(BoardVO vo) {

		// DB 관련 변수 선언
		Connection conn = null;
		PreparedStatement stmt = null;
		int result = 0;

		try {

			// DB 컨넥션을 얻는다.
			conn = JDBCUtil.getConnection();

			// 쿼리 준비
			stmt = conn.prepareStatement(BOARD_UPDATE);

			// 파라메터 할당
			int index = 1;
			stmt.setString(index++, vo.getTitle());
			stmt.setString(index++, vo.getContent());
			stmt.setInt(index++, vo.getSeq());

			// 쿼리 실행
			// create, update, delete 는 executeUpdate();
			// select 는 executeQuery();
			// result 는 처리 건수
			result = stmt.executeUpdate();
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
			// 리소스 해제
			JDBCUtil.close(stmt, conn);
		}
		// 결과값 리턴
		return result;
	}

	public int deleteBoard(BoardVO vo) {

		// DB 관련 변수 선언
		Connection conn = null;
		PreparedStatement stmt = null;
		int result = 0;

		try {

			// DB 컨넥션을 얻는다.
			conn = JDBCUtil.getConnection();

			// 쿼리 준비
			stmt = conn.prepareStatement(BOARD_DELETE);

			// 파라메터 할당
			int index = 1;
			stmt.setInt(index++, vo.getSeq());

			// 쿼리 실행
			// create, update, delete 는 executeUpdate();
			// select 는 executeQuery();
			// result 는 처리 건수
			result = stmt.executeUpdate();
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
			// 리소스 해제
			JDBCUtil.close(stmt, conn);
		}
		// 결과값 리턴
		return result;
	}

	public BoardVO getBoard(BoardVO vo) {
		// ===============================
		// DB 관련 변수 선언
		// DB 컨텐션 획득
		// 쿼리 준비
		// 파라메터 할당
		// 쿼리 실행
		// 리소스 해제
		// 결과값 리턴
		// ===============================

		// DB 관련 변수 선언
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		BoardVO board = null;

		try {

			// DB 컨넥션을 얻는다.
			conn = JDBCUtil.getConnection();

			// DB 컨넥션을 이용하여, 쿼리를 준비(set)하고, Statment를 얻는다.
			stmt = conn.prepareStatement(BOARD_GET);

			// Statement에 파라메터를 할당한다. (? 할당)
			stmt.setInt(1, vo.getSeq());

			// 쿼리를 실행 한다.
			rs = stmt.executeQuery();

			// 실행 결과를 VO에 Binding
			if (rs.next()) {
				board = new BoardVO();
				board.setSeq(rs.getInt("SEQ"));
				board.setTitle(rs.getString("TITLE"));
				board.setWriter(rs.getString("WRITER"));
				board.setContent(rs.getString("CONTENT"));
				board.setRegDate(rs.getDate("REGDATE"));
				board.setCnt(rs.getInt("CNT"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 모든 리소스 해제
			JDBCUtil.close(rs, stmt, conn);
		}
		return board;
	}

	public List<BoardVO> getBoardList(BoardVO vo) {
		// ===============================
		// DB 관련 변수 선언
		// DB 컨텐션 획득
		// 쿼리 준비
		// 파라메터 할당
		// 쿼리 실행
		// 리소스 해제
		// 결과값 리턴
		// ===============================

		// DB 관련 변수 선언
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<BoardVO> boardList = new ArrayList<BoardVO>();

		try {

			// DB 컨넥션을 얻는다.
			conn = JDBCUtil.getConnection();

			// TITLE / CONTENT
			String searchCondition = vo.getSearchCondition();

			// 입력한 검색어
			String searchKeyword = vo.getSearchKeyword();
			if (searchKeyword == null) {
				searchKeyword = ""; // '%%' // 전체 검색 (100% Best)
			}

			// DB 컨넥션을 이용하여, 쿼리를 준비(set)하고, Statment를 얻는다.
			if ("TITLE".equals(searchCondition)) {
				stmt = conn.prepareStatement(BOARD_TITLE_LIST);
			} else {
				stmt = conn.prepareStatement(BOARD_CONTENT_LIST);
			}

			// Statement에 파라메터를 할당한다. (? 할당)
			stmt.setString(1, searchKeyword);
			// '%null%'

			// 쿼리를 실행 한다.
			rs = stmt.executeQuery();

			// 실행 결과를 VO에 Binding
			while (rs.next()) {
				BoardVO board = new BoardVO();
				board.setSeq(rs.getInt("SEQ"));
				board.setTitle(rs.getString("TITLE"));
				board.setWriter(rs.getString("WRITER"));
				board.setContent(rs.getString("CONTENT"));
				board.setRegDate(rs.getDate("REGDATE"));
				board.setCnt(rs.getInt("CNT"));
				boardList.add(board);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 모든 리소스 해제
			JDBCUtil.close(rs, stmt, conn);
		}
		return boardList;

	}

}
