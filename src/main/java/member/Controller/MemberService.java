package member.Controller;

import java.util.List;

import member.dto.MemberDTO;

public interface MemberService {
	// 회원 가입
	public int join(MemberDTO dto);
	//로그인
	public MemberDTO login(String id, String pwd);
	// 아이디 유무 검사
	public boolean isExistId(String id);
	// 닉네임 유무 검사
	public boolean isExistNickname(String nickname);
	// 비밀번호 일치 여부 검사
	public boolean checkPassword(String id, String password);
	// 비밀번호 변경
	public int resetPassword(String id, String password);
	// 회원정보 보기
	public MemberDTO memberView(String id);
	// 회원정보 수정
	public int modify(MemberDTO dto);
	// 회원 등긊 수정
	public int adminModify(MemberDTO dto);
	// 총 회원수 구하기 (전체)
	public int getTotalMember();
	// 총 회원수 구하기 (등급별)
	public int getTotalMember(int grade);
	// 회원 리스트 구하기 (등급별)
	public List<MemberDTO> selectList(int startNum, int endNum, int grade);
	// 회원 리스트 구하기 (전체)
	public List<MemberDTO> selectList(int startNum, int endNum);
	// 회원 탈퇴하기
	public int delete(String id);

}
