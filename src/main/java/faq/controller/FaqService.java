package faq.controller;

import java.util.List;
import faq.dto.FaqDTO;


public interface FaqService {
	// 10개씩 목록보기
	public List<FaqDTO> faqListAndView();
	
	// 총 데이터수 구하기
	public int getTotalA();
	
	// 글쓰기
	public int faqWrite(FaqDTO dto);
	
	// 게시글 삭제하기
	public int delete(int faq_num);
		
	// 글 수정
	public int faqModify(FaqDTO dto);
		
	// 상세보기
	public FaqDTO faqView(int faq_num);
}
