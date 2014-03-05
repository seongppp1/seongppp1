package com.jsp.user.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.jsp.user.vo.UserVO;
import com.jsp.util.JDBCUtil;

public class UserDAOImpl {

	// SQL 명령어들
	private final String USER_ADD = "insert into users(id, password, name, role) " + " values(?,?,?,?)";
	private final String USER_GET = "select * from users where id=? and password=?";
	private final String USER_LIST = "select * from users order by id desc";

	/**
	 * 회원을 등록한다.
	 * 
	 * @param vo
	 * @return
	 */
	public int addUser(UserVO vo) {
		Connection conn = null;
		PreparedStatement stmt = null;
		int result = 0;

		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(USER_ADD);
			int idx = 1;
			stmt.setString(idx++, vo.getId());
			stmt.setString(idx++, vo.getPassword());
			stmt.setString(idx++, vo.getName());
			stmt.setString(idx++, vo.getRole());
			result = stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
		return result;
	}

	/**
	 * 회원 ID와 회원 비밀번호를 이용하여 회원을 조회 한다.
	 * 
	 * @param vo
	 * @return
	 */
	public UserVO getUser(UserVO vo) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		UserVO user = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(USER_GET);
			stmt.setString(1, vo.getId());
			stmt.setString(2, vo.getPassword());
			rs = stmt.executeQuery();
			if (rs.next()) {
				user = new UserVO();
				user.setId(rs.getString("ID"));
				user.setPassword(rs.getString("PASSWORD"));
				user.setName(rs.getString("NAME"));
				user.setRole(rs.getString("ROLE"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return user;
	}

	/**
	 * 회원 전체 리스트를 조회 한다. <br>
	 * 이때, 회원 ID를 내림차순으로 정렬한다.
	 * 
	 * @param vo
	 * @return
	 */
	public List<UserVO> getUserList(UserVO vo) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<UserVO> userList = new ArrayList<UserVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(USER_LIST);
			rs = stmt.executeQuery();
			while (rs.next()) {
				UserVO user = new UserVO();
				user.setId(rs.getString("ID"));
				user.setPassword(rs.getString("PASSWORD"));
				user.setName(rs.getString("NAME"));
				user.setRole(rs.getString("ROLE"));
				userList.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return userList;
	}
}
