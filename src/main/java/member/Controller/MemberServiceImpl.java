package member.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.dao.MemberDAO;
import member.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public int join(MemberDTO dto) {
		return memberDAO.join(dto);
	}

	@Override
	public MemberDTO login(String id, String pwd) {
		return memberDAO.login(id, pwd);
	}

	@Override
	public boolean isExistId(String id) {
		return memberDAO.isExistId(id);
	}

	@Override
	public boolean isExistNickname(String nickname) {
		return memberDAO.isExistNickname(nickname);
	}

	@Override
	public MemberDTO memberView(String id) {
		return memberDAO.memberView(id);
	}

	@Override
	public int modify(MemberDTO dto) {
		return memberDAO.modify(dto);
	}

	@Override
	public int adminModify(MemberDTO dto) {
		return memberDAO.adminModify(dto);
	}		
	@Override
	public int getTotalMember() {
		return memberDAO.getTotalMember();
	}
	
	@Override
	public int getTotalMember(int grade) {
		return memberDAO.getTotalMember(grade);
	}

	@Override
	public List<MemberDTO> selectList(int startNum, int endNum, int grade) {
		return memberDAO.selectList(startNum, endNum, grade);
	}
	
	@Override
	public List<MemberDTO> selectList(int startNum, int endNum) {
		return memberDAO.selectList(startNum, endNum);
	}
	
	@Override
	public int delete(String id) {
		return memberDAO.delete(id);
	}

	@Override
	public boolean checkPassword(String id, String password) {
		return memberDAO.checkPassword(id, password);
	}

	@Override
	public int resetPassword(String id, String password) {
		return memberDAO.resetPassword(id, password);
	}
}
