package notice.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import notice.dto.NoticeDTO;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping(value = "/notice/noticeListAndView.do")
	public String noticeListAndView(HttpServletRequest request) {
		// 데이터 처리
		int pg = 1;
		if (request.getParameter("pg") != null) {
			pg = Integer.parseInt(request.getParameter("pg"));
		}

		// DB
		int totalA = noticeService.getTotalA();
		int totalPage = (totalA + 9) / 10;
		if (pg > totalPage)
			pg = totalPage;

		int startPage = (pg - 1) / 5 * 5 + 1;
		int endPage = startPage + 4;
		if (endPage > totalPage) {
			endPage = totalPage;
		}

		int endNum = pg * 10;
		int startNum = endNum - 9;

		List<NoticeDTO> list = noticeService.noticeListAndView(startNum, endNum);
		
		
		// 데이터 공유 & 화면 네비게이션
		if (list != null) {
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("list", list);
			request.setAttribute("pg", pg);
			
			request.setAttribute("req","/notice/noticeListAndView.jsp");

			return "../main/index.jsp";
		}
		return null;
	}
	
	@RequestMapping(value= "/notice/noticeWriteForm.do")
	public String noticeList(HttpServletRequest request) {
		request.setAttribute("req", "../notice/noticeWriteForm.jsp");

		return "/main/index.jsp";
	}
	
	@RequestMapping(value="/notice/noticeWrite.do")
	public String noticeWrite(HttpServletRequest request) {
		HttpSession session = request.getSession();
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String notice_subject = request.getParameter("notice_subject");
		String notice_content = request.getParameter("notice_content");
		String name = (String)session.getAttribute("memName");
		String id = (String)session.getAttribute("memId");
		int grade = (Integer)session.getAttribute("memGrade");
		
		// DB
		NoticeDTO dto = new NoticeDTO();
		dto.setNotice_subject(notice_subject);
		dto.setNotice_content(notice_content);
		dto.setName(name);
		dto.setId(id);
		dto.setGrade(grade);
		
		int su = noticeService.noticeWrite(dto);
		request.setAttribute("su", su);
		request.setAttribute("req", "/notice/noticeWrite.jsp");
		
		return "../main/index.jsp";
	}
	
	@RequestMapping(value = "/notice/noticeModifyForm.do")
	public String noticeModifyForm(HttpServletRequest request) {
		int notice_num = Integer.parseInt(request.getParameter("notice_num"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		NoticeDTO dto = noticeService.noticeView(notice_num);
		
		request.setAttribute("dto", dto);
		request.setAttribute("pg", pg);
		
		request.setAttribute("req", "/notice/noticeModifyForm.jsp");
		
		return "../main/index.jsp";
	}
	
	@RequestMapping(value = "/notice/noticeModify.do")
	public String noticeModify(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		int notice_num = Integer.parseInt(request.getParameter("notice_num"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		String notice_subject = request.getParameter("notice_subject");
		String notice_content = request.getParameter("notice_content");

		NoticeDTO dto = new NoticeDTO();
		dto.setNotice_subject(notice_subject);
		dto.setNotice_content(notice_content);
		dto.setNotice_num(notice_num);

		int su = noticeService.noticeModify(dto);
		
		request.setAttribute("su", su);
		request.setAttribute("notice_num", notice_num);
		request.setAttribute("pg", pg);
		
		request.setAttribute("req","/notice/noticeModify.jsp");
		
		return "../main/index.jsp";
		
	}
	
	@RequestMapping(value = "/notice/noticeDelete.do")
	public ModelAndView noticeDelete(HttpServletRequest request) {
		   int notice_num = Integer.parseInt(request.getParameter("notice_num"));
		   int pg = Integer.parseInt(request.getParameter("pg"));

		   int su = noticeService.delete(notice_num);
		   
		   ModelAndView modelAndView = new ModelAndView();
		   modelAndView.addObject("su", su);
		   modelAndView.addObject("pg", pg);
		   modelAndView.addObject("req", "/notice/noticeDelete.jsp");
		   modelAndView.setViewName("/main/index.do");
		   
		   return modelAndView;
	}
	
	@RequestMapping(value = "/notice/noticeView.do")
	public String noticeView(HttpServletRequest request) {
		int notice_num = Integer.parseInt(request.getParameter("notice_num"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		NoticeDTO dto = noticeService.noticeView(notice_num);
		
		request.setAttribute("dto", dto);
		request.setAttribute("pg", pg);
		request.setAttribute("req", "/notice/noticeView.jsp");
		
		return "../main/index.jsp";
		
	}
}
