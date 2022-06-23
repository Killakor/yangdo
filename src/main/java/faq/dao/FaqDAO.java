package faq.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import faq.dto.FaqDTO;

@Repository
public class FaqDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 10개씩 목록보기
	public List<FaqDTO> faqListAndView() {
		return sqlSession.selectList("mybatis.FaqMapper.faqListAndView");
	}
	
	// 총 데이터수 구하기
	public int getTotalA() {
		return sqlSession.selectOne("mybatis.FaqMapper.getTotalA");
	}

	// 글쓰기
	public int faqWrite(FaqDTO dto) {
		return sqlSession.insert("mybatis.FaqMapper.faqWrite", dto);
	}
	
	// 게시글 삭제하기
	public int delete(int faq_num) {
		return sqlSession.delete("mybatis.FaqMapper.delete", faq_num);		
	}
		
	// 글 수정
	public int faqModify(FaqDTO dto) {
		return sqlSession.update("mybatis.FaqMapper.faqModify", dto);
	}
		
	// 상세보기
	public FaqDTO faqView(int faq_num) {
		return sqlSession.selectOne("mybatis.FaqMapper.faqView", faq_num);
	}
	
}
