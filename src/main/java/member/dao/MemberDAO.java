package member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import member.dto.MemberDTO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int join(MemberDTO dto) {
		return sqlSession.insert("mybatis.MemberMapper.join", dto);
	}
	
	public MemberDTO login(String id, String pwd) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pwd", pwd);
		return sqlSession.selectOne("mybatis.MemberMapper.login", map);
	}
	
	public boolean isExistId(String id) {
		return sqlSession.selectOne("mybatis.MemberMapper.isExistId", id);
	}
	
	public boolean isExistNickname(String nickname) {
		return sqlSession.selectOne("mybatis.MemberMapper.isExistNickname", nickname);
	}
	
	public boolean checkPassword(String id, String pwd) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pwd", pwd);
		return sqlSession.selectOne("mybatis.MemberMapper.checkPassword", map);
	}
	
	public int resetPassword(String id, String pwd) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pwd", pwd);
		return sqlSession.update("mybatis.MemberMapper.resetPassword", map);
	}
	
	public MemberDTO memberView(String id) {
		return sqlSession.selectOne("mybatis.MemberMapper.memberView", id);
	}
	
	public int modify(MemberDTO dto) {
		return sqlSession.update("mybatis.MemberMapper.modify", dto);
	}
	
	public int adminModify(MemberDTO dto) {
		return sqlSession.update("mybatis.MemberMapper.adminModify", dto);
	}
	
	public int getTotalMember() {
		return sqlSession.selectOne("mybatis.MemberMapper.getTotalAllMember");
	}
	
	public int getTotalMember(int grade) {
		return sqlSession.selectOne("mybatis.MemberMapper.getTotalMember", grade);
	}
	
	public List<MemberDTO> selectList(int startNum, int endNum, int grade) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("grade", grade);
		return sqlSession.selectList("mybatis.MemberMapper.selectList", map);
	}
	
	public List<MemberDTO> selectList(int startNum, int endNum) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		return sqlSession.selectList("mybatis.MemberMapper.selectAllList", map);
	}
	
	public int delete(String id) {
		return sqlSession.delete("mybatis.MemberMapper.delete", id);
	}
}
