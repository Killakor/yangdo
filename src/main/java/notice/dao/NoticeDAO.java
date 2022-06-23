package notice.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import notice.dto.NoticeDTO;

@Repository
public class NoticeDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 10개씩 목록보기
	public List<NoticeDTO> noticeListAndView(int startNum, int endNum) {
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		return sqlSession.selectList("mybatis.NoticeMapper.noticeListAndView",map);
	}
	
	// 총 데이터수 구하기
	public int getTotalA() {
		return sqlSession.selectOne("mybatis.NoticeMapper.getTotalA");
	}
	
	// 글쓰기
	public int noticeWrite(NoticeDTO dto) {
		return sqlSession.insert("mybatis.NoticeMapper.noticeWrite", dto);
	}
	
	// 게시글 삭제하기
	public int delete(int notice_num) {
		return sqlSession.delete("mybatis.NoticeMapper.delete", notice_num);
	}
	
	// 글 수정
	public int noticeModify(NoticeDTO dto) {
		return sqlSession.update("mybatis.NoticeMapper.noticeModify", dto);
	}
	
	// 상세보기
	public NoticeDTO noticeView(int notice_num) {
		return sqlSession.selectOne("mybatis.NoticeMapper.noticeView", notice_num);
	}
}
