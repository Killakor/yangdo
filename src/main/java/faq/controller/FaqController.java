package faq.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import faq.dto.FaqDTO;

@Controller
public class FaqController {
	@Autowired
	private FaqService faqService;
	
	@RequestMapping(value = "/faq/faqListAndView.do")
	public String faqListAndView(HttpServletRequest request) {
		// 데이터 처리
		int pg = 1;
		if (request.getParameter("pg") != null) {
			pg = Integer.parseInt(request.getParameter("pg"));
		}
		
		int category = 1;
		if (request.getParameter("category") != null) {
			category = Integer.parseInt(request.getParameter("category"));
		}		

		List<FaqDTO> list = faqService.faqListAndView();
		
		// 데이터 공유 & 화면 네비게이션
		if (list != null) {
			request.setAttribute("list", list);
			request.setAttribute("pg", pg);
			request.setAttribute("category", category);
			
			request.setAttribute("req","/faq/faqListAndView.jsp");

			return "../main/index.jsp";
		}
		return null;
	}
	
	@RequestMapping(value= "/faq/faqWriteForm.do")
	public String faqWriteForm(HttpServletRequest request) {
		request.setAttribute("req", "../faq/faqWriteForm.jsp");

		return "/main/index.jsp";
	}
	@RequestMapping(value="/faq/faqWrite.do")
	public String faqWrite(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String faq_subject = request.getParameter("faq_subject");
		int faq_category = Integer.parseInt(request.getParameter("faq_category"));
		String faq_content = request.getParameter("faq_content");
		String name = (String)session.getAttribute("memName");
		String id = (String)session.getAttribute("memId");
		int grade = (Integer)session.getAttribute("memGrade");
		
		// DB
		FaqDTO dto = new FaqDTO();
		dto.setFaq_subject(faq_subject);
		dto.setFaq_category(faq_category);
		dto.setFaq_content(faq_content);
		dto.setName(name);
		dto.setId(id);
		dto.setGrade(grade);
		
		int su = faqService.faqWrite(dto);
		request.setAttribute("su", su);
		request.setAttribute("faq_category", faq_category);
		request.setAttribute("req", "/faq/faqWrite.jsp");
		
		return "../main/index.jsp";
	}
	
	@RequestMapping(value = "/faq/faqModifyForm.do")
	public String faqModifyForm(HttpServletRequest request) {
		int faq_num = Integer.parseInt(request.getParameter("faq_num"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		FaqDTO dto = faqService.faqView(faq_num);
		
		request.setAttribute("dto", dto);
		request.setAttribute("pg", pg);
		
		request.setAttribute("req", "/faq/faqModifyForm.jsp");
		
		return "../main/index.jsp";
	}
	
	@RequestMapping(value = "/faq/faqModify.do")
	public String faqModify(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		int faq_num = Integer.parseInt(request.getParameter("faq_num"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		String faq_subject = request.getParameter("faq_subject");
		int faq_category = Integer.parseInt(request.getParameter("faq_category"));
		String faq_content = request.getParameter("faq_content");
		
		FaqDTO dto = new FaqDTO();
		dto.setFaq_subject(faq_subject);
		dto.setFaq_category(faq_category);
		dto.setFaq_content(faq_content);
		dto.setFaq_num(faq_num);

		int su = faqService.faqModify(dto);
		
		request.setAttribute("su", su);
		request.setAttribute("pg", pg);
		request.setAttribute("faq_category", faq_category);
		
		request.setAttribute("req","/faq/faqModify.jsp");
		
		return "../main/index.jsp";
		
	}
	
	@RequestMapping(value = "/faq/faqDelete.do")
	public ModelAndView faqDelete(HttpServletRequest request) {
		   int faq_num = Integer.parseInt(request.getParameter("faq_num"));
		   int pg = Integer.parseInt(request.getParameter("pg"));

		   int su = faqService.delete(faq_num);
		   
		   ModelAndView modelAndView = new ModelAndView();
		   modelAndView.addObject("su", su);
		   modelAndView.addObject("pg", pg);
		   modelAndView.addObject("req", "/faq/faqDelete.jsp");
		   modelAndView.setViewName("/main/index.do");
		   
		   return modelAndView;
	}
	
	@RequestMapping(value = "/faq/faqView.do")
	public String faqView(HttpServletRequest request) {
		int faq_num = Integer.parseInt(request.getParameter("faq_num"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		FaqDTO dto = faqService.faqView(faq_num);
		
		request.setAttribute("dto", dto);
		request.setAttribute("pg", pg);
		request.setAttribute("req", "/faq/faqView.jsp");
		
		return "../main/index.jsp";
		
	}
}
