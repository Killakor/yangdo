package member.Controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import member.dto.MemberDTO;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/member/loginForm.do")
	public String loginForm() {
		return "../member/loginForm.jsp";
	}
	
	@RequestMapping(value="/member/login.do")
	public String login(HttpServletRequest request) {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		// DB
		MemberDTO dto = memberService.login(id, pwd);
		
		// 페이지 이동
		HttpSession session = request.getSession();
		if(dto != null) {
			// 공유데이터를 세션에 저장하고 페이지 이동
			session.setAttribute("memName", dto.getName());
			session.setAttribute("memNickname", dto.getNickname());
			session.setAttribute("memGrade", dto.getGrade());
			session.setAttribute("memId", id);
			
			return "redirect:/main/index.do";
		} else {
			return "../member/loginFail.jsp";
		}
	}
	
	@RequestMapping(value="/member/logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("memName");
		session.removeAttribute("memId");
		session.removeAttribute("memNickname");
		session.removeAttribute("memGrade");
		
		// 무효화 : 모두 지우기
		session.invalidate();
		
		return "../member/logout.jsp";		
	}
	
	@RequestMapping(value="/member/resetPwdForm.do")
	public String resetPwdForm() {
		return "../member/resetPwdForm.jsp";
	}
	
	@RequestMapping(value="/member/joinForm.do")
	public String joinForm() {
		//request.setAttribute("req", "../member/joinForm.jsp");
		return "../member/joinForm.jsp";
	}
	
	@RequestMapping(value="/member/join.do")
	public String join(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String nickname = request.getParameter("nickname");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String tel = request.getParameter("tel");
		String post = request.getParameter("post");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");		
		
		MemberDTO dto = new MemberDTO();
		dto.setName(name);
		dto.setId(id);
		dto.setPwd(pwd);
		dto.setNickname(nickname);
		dto.setEmail1(email1);
		dto.setEmail2(email2);
		dto.setTel(tel);
		dto.setPost(post);
		dto.setAddr1(addr1);
		dto.setAddr2(addr2);
		
		int su = memberService.join(dto);
		
		request.setAttribute("su", su);
		//request.setAttribute("req", "/member/write.jsp");
		
		return "../member/join.jsp";
	}
	
	@ResponseBody
	@RequestMapping(value="/member/idCheck.do")
	public String idCheck(HttpServletRequest request) {
		String user_id = request.getParameter("user_id");
		
		boolean flag = memberService.isExistId(user_id);

		if(flag) return "exist";
		else return "none";
	}
	
	@ResponseBody
	@RequestMapping(value="/member/nicknameCheck.do")
	public String nicknameCheck(HttpServletRequest request) {
		String user_nickname = request.getParameter("user_nickname");

		boolean flag = memberService.isExistNickname(user_nickname);
	
		if(flag) return "exist";
		else return "none";
	}
	
	@ResponseBody
	@RequestMapping(value="/member/pwCheck.do")
	public String pwCheck(HttpServletRequest request) {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		boolean flag = memberService.checkPassword(id, pwd);

		if(flag) return "success";
		else return "fail";
	}
	
	@RequestMapping(value="/member/resetPwd.do")
	public String resetPwd(HttpServletRequest request) {	
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd_new");
		
		int su = memberService.resetPassword(id, pwd);

		request.setAttribute("su", su);
		
		return "../member/resetPwd.jsp";
	}
	
	@ResponseBody
	@RequestMapping(value="/member/adminModify.do")
	public String adminModify(HttpServletRequest request) {
		String id = request.getParameter("id");
		String grade_str = request.getParameter("grade");
		int grade = -1;
		
		if (grade_str.equals("일반회원")) grade = 1;
		else if (grade_str.equals("정지회원")) grade = 99;
		else grade = 0;
		
		MemberDTO dto = new MemberDTO();
		dto.setId(id);
		dto.setGrade(grade);
		
		int su = memberService.adminModify(dto);
		if(su > 0) return "success";
		else return "fail";
	}
	
	@RequestMapping(value="/member/memberDeleteInfo.do")
	public String memberDeleteInfo(HttpServletRequest request) {
		request.setAttribute("req", "../member/memberDeleteInfo.jsp");
		
		return "../main/index.jsp";
	}
	
	@RequestMapping(value="/member/memberDelete.do")
	public String memberDelete(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("memId");
		session.removeAttribute("memName");
		session.removeAttribute("memId");
		session.removeAttribute("memNickname");
		session.removeAttribute("memGrade");
		
		// 무효화 : 모두 지우기
		session.invalidate();
		
		int su = memberService.delete(id);
		request.setAttribute("su", su);
		
		return "../member/memberDelete.jsp";
	}
	
	@RequestMapping(value="/member/memberList.do")
	public String memberList(HttpServletRequest request) {
		int pg = 1;
		int grade = -1;
		
		if(request.getParameter("pg") != null) {
			pg = Integer.parseInt(request.getParameter("pg"));
		}
		if(request.getParameter("grade") != null) {
			grade = Integer.parseInt(request.getParameter("grade"));
		}
		
		// 목록 : 10개씩
		int listSize = 10;
		int listSizeM1 = listSize - 1;

		int totalA;
		if(grade != -1) totalA = memberService.getTotalMember(grade);
		else totalA = memberService.getTotalMember();
		
		int totalP = (totalA + listSizeM1) / listSize;
		
		int blockSize = 5;
		int blockSizeM1 = blockSize - 1;
		
		int startPage = (pg -1) / blockSize * blockSize + 1;
		int endPage = startPage + blockSizeM1;
		if (endPage > totalP) endPage = totalP;
		

		request.setAttribute("totalP", totalP);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pg", pg);
		request.setAttribute("grade", grade);
		
		request.setAttribute("req", "../member/memberList.jsp");
		
		return "../main/index.jsp";

	}
	
	@RequestMapping(value="/member/memberListJson.do")
	public String memberListJson(HttpServletRequest request) {
		int pg = Integer.parseInt(request.getParameter("pg"));
		int grade = Integer.parseInt(request.getParameter("grade"));
		
		// 목록 : 10개씩
		int listSize = 10;
		int listSizeM1 = listSize - 1;
		
		int endNum = pg * listSize;
		int startNum = endNum - listSizeM1;
		
		List<MemberDTO> list;
		if(grade != -1) list = memberService.selectList(startNum, endNum, grade);
		else list = memberService.selectList(startNum, endNum);
		
		// Json으로 결과값 반환
		String rt = null;
		int total = list.size();
		
		if(total > 0) rt = "OK";
		else rt = "FAIL";
		
		// Json 객체 생성
		JSONObject json = new JSONObject();
		json.put("rt", rt);
		json.put("total", total);
		
		if(total > 0) {
			// json 배열 객체 생성
			JSONArray items = new JSONArray();
			
			for (int i=0; i<list.size(); i++) {
				MemberDTO dto = list.get(i);
				
				// json 객체 생성
				JSONObject temp = new JSONObject();
				temp.put("id", dto.getId());
				temp.put("name", dto.getName());
				temp.put("nickname", dto.getNickname());
				
				String email = dto.getEmail1() + "@" + dto.getEmail2();
				temp.put("email", email);
				temp.put("tel", dto.getTel());
				
				String addr = dto.getAddr1() + "\n" + dto.getAddr2();
				temp.put("addr", addr);
				
				String str_grade = "";
				if (dto.getGrade() == 0) str_grade = "관리자";
				else if (dto.getGrade() == 99) str_grade = "정지회원";
				else str_grade = "일반회원";
				temp.put("grade", str_grade);
				
				String date = dto.getLogtime().split(" ")[0];
				temp.put("logtime", date);
				
				// json 배열에 추가
				items.put(i, temp);
			}
			// 제일 상위의 json 객체에 json 배열 추가
			json.put("items", items);
		}
		// json 확인
		//System.out.println("json : " + json);
		
		request.setAttribute("json", json);
		//request.setAttribute("req", "../member/memberListJson.jsp");
		
		return "../member/memberListJson.jsp";
	}
	
	@RequestMapping(value="/member/memberModifyForm.do")
	public String modifyForm(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("memId");
		
		MemberDTO dto = memberService.memberView(id);
		
		request.setAttribute("dto", dto);
		request.setAttribute("req", "/member/modifyForm.jsp");
		
		return "../main/index.jsp";
	}
	
	@RequestMapping(value="/member/modify.do")
	public String modify(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String nickname = request.getParameter("nickname");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String tel = request.getParameter("tel");
		String post = request.getParameter("post");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");		
		
		MemberDTO dto = new MemberDTO();
		dto.setId(id);
		dto.setPwd(pwd);
		dto.setNickname(nickname);
		dto.setEmail1(email1);
		dto.setEmail2(email2);
		dto.setTel(tel);
		dto.setPost(post);
		dto.setAddr1(addr1);
		dto.setAddr2(addr2);
		
		int su = memberService.modify(dto);
		
		request.setAttribute("su", su);
		//request.setAttribute("req", "/member/write.jsp");
		
		return "../member/modify.jsp";
	}
}
