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
				// DB ���� ���� ����
				// DB ���ټ� ȹ��
				// ���� �غ�
				// �Ķ���� �Ҵ�
				// ���� ����
				// ���ҽ� ����
				// ����� ����
				// ===============================

				// DB ���� ���� ����
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

