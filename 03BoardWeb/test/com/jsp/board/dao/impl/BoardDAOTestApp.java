package com.jsp.board.dao.impl;

import java.util.List;

import com.jsp.board.vo.BoardVO;

public class BoardDAOTestApp {
	public static void main(String[] args) {

		// 등록에 필요한 BoardVO 정의
		BoardVO vo = new BoardVO();
		// vo.setSeq(1); // 자동 생성 ( max + 1 )
		vo.setTitle("두번째 등록글");
		vo.setWriter("이동훈");
		vo.setContent("입력 성공.....");

		BoardDAOImpl boardDAO = new BoardDAOImpl();
		int addResult = boardDAO.addBoard(vo);
		System.out.println(":: 등록 : " + addResult);

		List<BoardVO> boardList = boardDAO.getBoardList(vo);

		for (BoardVO board : boardList) {
			System.out.println(board);
		}

/*
		// ========================================
		// seq가 내림차순으로 정렬 되므로, 0 번째 글을 조회 하면
		// 최근 등록된 글을 조회 하게 된다.
		BoardVO selectBoard = boardList.get(0);

		// 검색용 VO 생성
		BoardVO conditionVO = new BoardVO();
		conditionVO.setSeq(selectBoard.getSeq());

		// 단건 조회
		BoardVO oneBoardVO = boardDAO.getBoard(conditionVO);

		// 조회된 데이터 출력
		System.out.println("단건 조회된 글 : " + oneBoardVO);

		System.out.println("수정 전 : " + selectBoard);

		// 수정
		selectBoard.setTitle("수정된 제목");
		selectBoard.setContent("수정된 내용");
		int updateResult = boardDAO.updateBoard(selectBoard);
		System.out.println("수정된 결과 : " + updateResult);

		// 결과 확인
		System.out.println("수정 후 : " + boardDAO.getBoard(selectBoard));

		// ===================================================
		// 마지막 데이터 삭제
		int deleteResult = boardDAO.deleteBoard(selectBoard);
		System.out.println("삭제된 결과 : " + deleteResult);

		// 전체 목록 조회
		boardList = boardDAO.getBoardList(vo);
		for (int k = 0; k < boardList.size(); k++) {
			BoardVO boardVO = boardList.get(k);
			System.out.println(boardVO);
		}// for
*/
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
