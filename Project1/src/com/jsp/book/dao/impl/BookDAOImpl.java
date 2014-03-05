package com.jsp.book.dao.impl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.jsp.book.vo.BookVO;
import com.jsp.util.JDBCUtil;

public class BookDAOImpl {
	private final String BOOK_SELECT = "select * from book1 where book_code=?";
	
	public List<BookVO> getBookList(BookVO vo){
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
		ArrayList<BookVO> list = new ArrayList<BookVO>();
	
		try{
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOOK_SELECT);
			
			stmt.setString(1,vo.getBookCode());
			
			
			
		}catch(Exception e){
			
		}
		return null;
	}
	
}

