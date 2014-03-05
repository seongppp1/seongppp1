package com.jsp.user.dao.impl;

import java.util.List;

import com.jsp.user.vo.UserVO;


public class UserDAOTestApp {
	public static void main(String[] args) {

		// ===================================
		// 01) 등록
		// ===================================
		// 회원 정보를 담을 가방 생성
		UserVO vo = new UserVO();

		vo.setId("A" + genId(7)); // 회원 ID 세팅
		vo.setPassword("1"); // 회원 비밀번호 세팅
		vo.setName("이동훈"); // 회원 이름 세팅
		vo.setRole("User"); // 회원의 역할 세팅

		// 회원 정보 등록을 위한 DAO 객체 생성
		UserDAOImpl userDAO = new UserDAOImpl();

		// DAO를 이용하여, 회원정보 등록
		int addResult = userDAO.addUser(vo);
		System.out.println(":: 등록 : " + addResult);


		// ===================================
		// 02) 회원 목록 조회
		// ===================================
		List<UserVO> boardList = userDAO.getUserList(vo);

		// 회원 목록 출력
		for (UserVO userVO : boardList) {
			System.out.println(userVO);
		}
		System.out.println("\n===========================");

		// ===================================
		// 03) 회원 상세 조회
		// 조회된 회원 목록에서 첫 번째 회원의 ID/PW를 이용하여, 회원을 조회함.
		// ===================================

		// 031) 첫 번째 회원 ID 추출
		String firstUserId = boardList.get(0).getId();
		String firstUserPW = boardList.get(0).getPassword();

		// 032) 회원 상세 정보를 조회하기 위한 파라메터 VO 생성
		UserVO paramUser = new UserVO();

		// 033) 죄회한 첫 번째 회원의 ID/PW를 세팅
		paramUser.setId(firstUserId);
		paramUser.setPassword(firstUserPW);

		// 034) VO 를 이용하여 회원을 조회
		UserVO firstUser = userDAO.getUser(paramUser);

		// 035) DB에서 조회한 회원 상세 정보를 출력
		System.out.println(firstUser);

	}

	/**
	 * 겹치지 않는 숫자를 찾기 위해, 현재 시간의 끝자리를 잘라 낸다. <br/>
	 * 파라메터로 전달된 length 만큼의 값을 리턴한다.
	 * 
	 * @param length
	 * @return
	 */
	public static String genId(int length) {

		//
		String rdnVal = String.valueOf(System.currentTimeMillis());

		// 2 = 10 - 8
		int start = rdnVal.length() - length;
		return rdnVal.substring(start);
	}

}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
