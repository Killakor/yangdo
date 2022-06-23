package qna.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import qna.dto.QnaDTO;

@Repository
public class QnaDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 10개씩 목록보기
	public List<QnaDTO> qnaListAndView(int startNum, int endNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		return sqlSession.selectList("mybatis.QnaMapper.qnaListAndView", map);
	}

	// 총 데이터수 구하기
	public int getTotalA() {
		return sqlSession.selectOne("mybatis.QnaMapper.getTotalA");
	}

	// 글쓰기
	public int qnaWrite(QnaDTO dto) {
		return sqlSession.insert("mybatis.QnaMapper.qnaWrite", dto);
	}

	// 게시글 삭제하기
	public int delete(int qna_num) {
		return sqlSession.delete("mybatis.QnaMapper.delete", qna_num);
	}
	
	// 답글쓰기
	public int QnaReply(QnaDTO dto) {
		return sqlSession.update("mybatis.QnaMapper.qnaReply", dto);
	}
		
	// 글 수정
	public int qnaModify(QnaDTO dto) {
		return sqlSession.update("mybatis.QnaMapper.qnaModify", dto);
	}

	// 상세보기
	public QnaDTO qnaView(int qna_num) {
		return sqlSession.selectOne("mybatis.QnaMapper.qnaView", qna_num);
	}
	
	// 내 문의내역 총 데이터 수 구하기
	public int getMyTotalA(String id) {
		return sqlSession.selectOne("mybatis.QnaMapper.getMyTotalA", id);
	}
	
	// 내 문의 내역 10개씩 목록보기
		public List<QnaDTO> myQnaListAndView(int startNum, int endNum, String id) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("startNum", startNum);
			map.put("endNum", endNum);
			map.put("id", id);
			return sqlSession.selectList("mybatis.QnaMapper.myQnaListAndView", map);
		}
}
