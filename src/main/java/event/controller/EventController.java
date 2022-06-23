package event.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import event.dto.EventDTO;

@Controller
public class EventController {
	
	@Autowired
	private EventService eventService;
	
	@RequestMapping(value = "/event/eventList.do")
	public String eventList(HttpServletRequest request) {
		// 데이터 처리
		int pg = 1;
		if (request.getParameter("pg") != null) {
			pg = Integer.parseInt(request.getParameter("pg"));
		}

		// DB
		int totalA = eventService.getTotalA();
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

		List<EventDTO> list = eventService.eventList(startNum, endNum);
		
		
		// 데이터 공유 & 화면 네비게이션
		if (list != null) {
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("list", list);
			request.setAttribute("pg", pg);
			
			request.setAttribute("req","/event/eventList.jsp");

			return "../main/index.jsp";
		}
		return null;
	}
	
	@RequestMapping(value= "/event/eventWriteForm.do")
	public String eventWriteForm(HttpServletRequest request) {
		request.setAttribute("req", "../event/eventWriteForm.jsp");

		return "/main/index.jsp";
	}
	
	@RequestMapping(value="/event/eventWrite.do")
	public String eventWrite(HttpServletRequest request, MultipartFile event_image) {
		HttpSession session = request.getSession();
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String filePath = request.getSession().getServletContext().getRealPath("/storage");
		String fileName = event_image.getOriginalFilename();
		
		// 파일 저장
		File file = new File(filePath, fileName);
			try {
				FileCopyUtils.copy(event_image.getInputStream(), new FileOutputStream(file));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		
		String event_subject = request.getParameter("event_subject");
		String event_start = request.getParameter("event_start");
		String event_end = request.getParameter("event_end");
		String event_content = request.getParameter("event_content");
		
		String name = (String)session.getAttribute("memName");
		String id = (String)session.getAttribute("memId");
		int grade = (Integer)session.getAttribute("memGrade");
		
		// DB
		EventDTO dto = new EventDTO();
		dto.setEvent_subject(event_subject);
		dto.setEvent_start(event_start);
		dto.setEvent_end(event_end);
		dto.setEvent_content(event_content);
		dto.setEvent_image(fileName);
		dto.setName(name);
		dto.setId(id);
		dto.setGrade(grade);
		
		int su = eventService.eventWrite(dto);
		request.setAttribute("su", su);
		request.setAttribute("req", "/event/eventWrite.jsp");
		
		return "../main/index.jsp";
	}
	
	@RequestMapping(value = "/event/eventView.do")
	public String eventView(HttpServletRequest request) {
		int event_num = Integer.parseInt(request.getParameter("event_num"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		EventDTO dto = eventService.eventView(event_num);
		
		request.setAttribute("dto", dto);
		request.setAttribute("pg", pg);
		request.setAttribute("req", "/event/eventView.jsp");
		
		return "../main/index.jsp";
		
	}
	
	@RequestMapping(value = "/event/eventModifyForm.do")
	public String eventModifyForm(HttpServletRequest request) {
		int event_num = Integer.parseInt(request.getParameter("event_num"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		EventDTO dto = eventService.eventView(event_num);
		
		request.setAttribute("dto", dto);
		request.setAttribute("pg", pg);
		
		request.setAttribute("req", "/event/eventModifyForm.jsp");
		
		return "../main/index.jsp";
	}
	
	@RequestMapping(value="/event/eventModify.do")
	public String eventModify(HttpServletRequest request, MultipartFile event_image) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		
		String filePath = request.getSession().getServletContext().getRealPath("/storage");
		String fileName = event_image.getOriginalFilename();
		
		// 파일 저장
		File file = new File(filePath, fileName);
			try {
				FileCopyUtils.copy(event_image.getInputStream(), new FileOutputStream(file));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		
		int event_num = Integer.parseInt(request.getParameter("event_num"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		String event_subject = request.getParameter("event_subject");
		String event_start = request.getParameter("event_start");
		String event_end = request.getParameter("event_end");
		String event_content = request.getParameter("event_content");
		
		// DB
		EventDTO dto = new EventDTO();
		dto.setEvent_subject(event_subject);
		dto.setEvent_start(event_start);
		dto.setEvent_end(event_end);
		dto.setEvent_content(event_content);
		dto.setEvent_image(fileName);
		dto.setEvent_num(event_num);
		
		int su = eventService.eventModify(dto);
		
		request.setAttribute("event_num", event_num);
		request.setAttribute("pg", pg);
		request.setAttribute("su", su);
		request.setAttribute("req", "/event/eventModify.jsp");
		
		return "../main/index.jsp";
	}
	
	@RequestMapping(value = "/event/eventDelete.do")
	public ModelAndView eventDelete(HttpServletRequest request) {
		   int event_num = Integer.parseInt(request.getParameter("event_num"));
		   int pg = Integer.parseInt(request.getParameter("pg"));

		   int su = eventService.delete(event_num);
		   
		   ModelAndView modelAndView = new ModelAndView();
		   modelAndView.addObject("su", su);
		   modelAndView.addObject("pg", pg);
		   modelAndView.addObject("req", "/event/eventDelete.jsp");
		   modelAndView.setViewName("/main/index.do");
		   
		   return modelAndView;
	}
}
