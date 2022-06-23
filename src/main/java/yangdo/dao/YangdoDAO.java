package yangdo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import yangdo.bean.YangdoDTO;

@Repository
public class YangdoDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int yangdoWrite(YangdoDTO dto) {
		return sqlSession.insert("mybatis.YangdoMapper.yangdoWrite", dto);
	}

	// 5개씩 목록보기
	public List<YangdoDTO> yangdoList(int startNum, int endNum, String yangdo_kind) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("yangdo_kind", yangdo_kind);
		return sqlSession.selectList("mybatis.YangdoMapper.yangdoList", map);
	}

	// 5개씩 목록보기
	public List<YangdoDTO> yangdoWriteView(String id, int seq) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("seq", seq);
		return sqlSession.selectList("mybatis.YangdoMapper.yangdoWriteView", map);
	}

	// 상세보기
	public YangdoDTO yangdoView(int seq) {
		return sqlSession.selectOne("mybatis.YangdoMapper.yangdoView", seq);
	}

	// 수정목록 가져오기
	public YangdoDTO yangdoWriteView(String id) {
		return sqlSession.selectOne("mybatis.YangdoMapper.yangdoWriteView", id);
	}

	// 총 데이터수 구하기
	public int getTotalA(String yangdo_kind) {
		return sqlSession.selectOne("mybatis.YangdoMapper.getTotalA", yangdo_kind);
	}

	// 게시글 삭제하기
	public int yangdoDelete(int seq) {
		return sqlSession.delete("mybatis.YangdoMapper.yangdoDelete", seq);
	}

	// 글수정
	public int yangdoModify(YangdoDTO dto) {
		return sqlSession.update("mybatis.YangdoMapper.yangdoModify", dto);
	}

	// 총 데이터수 구하기
	public int getMyTotalA(String id) {
		return sqlSession.selectOne("mybatis.YangdoMapper.getMyTotalA", id);
	}

	// 5개씩 목록보기
	public List<YangdoDTO> myYangdoList(int startNum, int endNum, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("id", id);
		return sqlSession.selectList("mybatis.YangdoMapper.myYangdoList", map);
	}

	public int yangdoPayGive(int seq) {
		return sqlSession.update("mybatis.YangdoMapper.yangdoPayGive", seq);
	}

	public int yangdoPayTake(YangdoDTO dto) {
		return sqlSession.insert("mybatis.YangdoMapper.yangdoPayTake", dto);
	}
	
	public int ListRearrange() {
		return sqlSession.delete("mybatis.YangdoMapper.ListRearrange");
	}
}
