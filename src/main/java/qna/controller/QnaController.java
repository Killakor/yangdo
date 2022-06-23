package qna.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import qna.dto.QnaDTO;

@Controller
public class QnaController {
	@Autowired
	private QnaService qnaService;
	
	@RequestMapping(value= "/qna/qnaWriteForm.do")
	public String qnaWriteForm(HttpServletRequest request) {
		request.setAttribute("req", "../qna/qnaWriteForm.jsp");

		return "/main/index.jsp";
	}
	
	@RequestMapping(value = "/qna/qnaListAndView.do")
	public String qnaListAndView(HttpServletRequest request) {
		// 데이터 처리
		int pg = 1;
		if (request.getParameter("pg") != null) {
			pg = Integer.parseInt(request.getParameter("pg"));
		}
		int my = 0;
		String id = "";
		if (request.getParameter("my") != null) {
			my = Integer.parseInt(request.getParameter("my"));
			HttpSession session = request.getSession();
			id = (String) session.getAttribute("memId");
		}

		// DB
		int totalA = 0;
		if (my == 1) totalA = qnaService.getMyTotalA(id);
		else totalA = qnaService.getTotalA();
		
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
		
		List<QnaDTO> list = null;
		if (my == 1) list = qnaService.myQnaListAndView(startNum, endNum, id);
		else list = qnaService.qnaListAndView(startNum, endNum);
		
		// 데이터 공유, 화면 네비게이션
		if (list != null) {
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("list", list);
			request.setAttribute("pg", pg);
			
			if (my == 1) request.setAttribute("req","/member/myQnA.jsp");
			else request.setAttribute("req","/qna/qnaListAndView.jsp");

			return "../main/index.jsp";
		}
		return null;
	}
	
	@RequestMapping(value="/qna/qnaWrite.do")
	public String qnaWrite(HttpServletRequest request) {
		HttpSession session = request.getSession();
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String qna_type = request.getParameter("qna_type");
		String qna_category = request.getParameter("qna_category");
		String qna_subject = request.getParameter("qna_subject");
		String qna_content = request.getParameter("qna_content");
		int qna_public = Integer.parseInt(request.getParameter("qna_public"));
		
		String name = (String)session.getAttribute("memName");
		String id = (String)session.getAttribute("memId");
		int grade = (Integer)session.getAttribute("memGrade");
		
		// DB
		QnaDTO dto = new QnaDTO();
		dto.setQna_type(qna_type);
		dto.setQna_category(qna_category);
		dto.setQna_subject(qna_subject);
		dto.setQna_content(qna_content);
		dto.setQna_public(qna_public);
		dto.setName(name);
		dto.setId(id);
		dto.setGrade(grade);
		
		int su = qnaService.qnaWrite(dto);
		request.setAttribute("su", su);
		request.setAttribute("req", "/qna/qnaWrite.jsp");
		
		return "../main/index.jsp";
	}
	
	@RequestMapping(value = "/qna/qnaModifyForm.do")
	public String qnaModifyForm(HttpServletRequest request) {
		int qna_num = Integer.parseInt(request.getParameter("qna_num"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		QnaDTO dto = qnaService.qnaView(qna_num);
		
		request.setAttribute("dto", dto);
		request.setAttribute("pg", pg);
		
		request.setAttribute("req", "/qna/qnaModifyForm.jsp");
		
		return "../main/index.jsp";
	}
	
	@RequestMapping(value="/qna/qnaModify.do")
	public String qnaModify(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		int qna_num = Integer.parseInt(request.getParameter("qna_num"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		String qna_type = request.getParameter("qna_type");
		String qna_category = request.getParameter("qna_category");
		String qna_subject = request.getParameter("qna_subject");
		String qna_content = request.getParameter("qna_content");
		int qna_public = Integer.parseInt(request.getParameter("qna_public"));
		
		// DB
		QnaDTO dto = new QnaDTO();
		dto.setQna_type(qna_type);
		dto.setQna_category(qna_category);
		dto.setQna_subject(qna_subject);
		dto.setQna_content(qna_content);
		dto.setQna_public(qna_public);
		dto.setQna_num(qna_num);
		
		int su = qnaService.qnaModify(dto);
		
		request.setAttribute("pg", pg);
		request.setAttribute("su", su);
		
		request.setAttribute("req", "/qna/qnaModify.jsp");
		
		return "../main/index.jsp";
	}
	
	@RequestMapping(value = "/qna/qnaReplyForm.do")
	public String qnaReplyForm(HttpServletRequest request) {
		int qna_num = Integer.parseInt(request.getParameter("qna_num"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		QnaDTO dto = qnaService.qnaView(qna_num);
		
		request.setAttribute("dto", dto);
		request.setAttribute("pg", pg);
		
		request.setAttribute("req", "/qna/qnaReplyForm.jsp");
		
		return "../main/index.jsp";
	}
	
	@RequestMapping(value="/qna/qnaReply.do")
	public String qnaReply(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		int qna_num = Integer.parseInt(request.getParameter("qna_num"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		String qna_reply = request.getParameter("qna_reply");
		
		// DB
		QnaDTO dto = new QnaDTO();
		dto.setQna_reply(qna_reply);
		dto.setQna_num(qna_num);
		
		int su = qnaService.qnaReply(dto);
		
		request.setAttribute("pg", pg);
		request.setAttribute("su", su);
		
		request.setAttribute("req", "/qna/qnaReply.jsp");
		
		return "../main/index.jsp";
	}
	
	@RequestMapping(value = "/qna/qnaDelete.do")
	public String qnaDelete(HttpServletRequest request) {
		   int qna_num = Integer.parseInt(request.getParameter("qna_num"));
		   int pg = Integer.parseInt(request.getParameter("pg"));

		   int su = qnaService.delete(qna_num);
		   request.setAttribute("su", su);
		   request.setAttribute("pg", pg);
		   	
		   request.setAttribute("req", "/qna/qnaDelete.jsp");

		   return "../main/index.jsp";

	}
	
	@RequestMapping(value = "/qna/qnaView.do")
	public String qnaView(HttpServletRequest request) {
		int qna_num = Integer.parseInt(request.getParameter("qna_num"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		QnaDTO dto = qnaService.qnaView(qna_num);
		
		request.setAttribute("dto", dto);
		request.setAttribute("pg", pg);
		request.setAttribute("req", "/qna/qnaView.jsp");
		
		return "../main/index.jsp";
		
	}
}
