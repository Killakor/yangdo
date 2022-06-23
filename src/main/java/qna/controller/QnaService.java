package qna.controller;

import java.util.List;

import qna.dto.QnaDTO;

public interface QnaService {
	// 10개씩 목록보기
	public List<QnaDTO> qnaListAndView(int startNum, int endNum);

	// 총 데이터수 구하기
	public int getTotalA();

	// 글쓰기
	public int qnaWrite(QnaDTO dto);
	
	// 답글쓰기
	public int qnaReply(QnaDTO dto);
		
	// 게시글 삭제하기
	public int delete(int qna_num);

	// 글수정
	public int qnaModify(QnaDTO dto);

	// 상세보기
	public QnaDTO qnaView(int qna_num);
	
	// 내 문의 내역 총 데이터 수 구하기
	public int getMyTotalA(String id);
	
	// 내 문의 내역 데이터 목록 구하기
	public List<QnaDTO> myQnaListAndView(int startNum, int endNum, String id);
}
