package event.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import event.dto.EventDTO;

@Repository
public class EventDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 10개씩 목록보기
	public List<EventDTO> eventList(int startNum, int endNum) {
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		return sqlSession.selectList("mybatis.EventMapper.eventList",map);
	}
	
	// 총 데이터수 구하기
	public int getTotalA() {
		return sqlSession.selectOne("mybatis.EventMapper.getTotalA");
	}
	
	// 상세보기
	public EventDTO eventView(int event_num) {
		return sqlSession.selectOne("mybatis.EventMapper.eventView", event_num);
	}
	// 글쓰기
	public int eventWrite(EventDTO dto) {
		return sqlSession.insert("mybatis.EventMapper.eventWrite", dto);
	}
	
	// 게시글 삭제하기
	public int delete(int event_num) {
		return sqlSession.delete("mybatis.EventMapper.delete", event_num);
	}
	
	// 글 수정
	public int eventModify(EventDTO dto) {
		return sqlSession.update("mybatis.EventMapper.eventModify", dto);
	}
}
