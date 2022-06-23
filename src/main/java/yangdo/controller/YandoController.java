package yangdo.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import yangdo.bean.YangdoDTO;

@Controller
public class YandoController {
	@Autowired
	private YangdoService yangdoService;
	
	@RequestMapping(value= "/yangdo/yangdoWriteForm.do")
	public String yangdoWriteForm(HttpServletRequest request) {
		request.setAttribute("req", "../yangdo/yangdoWriteForm.jsp");

		return "/main/index.jsp";
	}
	
	@RequestMapping(value= "/yangdo/yangdoWrite.do")
	public String yangdoWrite(HttpServletRequest request) {
		HttpSession session = request.getSession();
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	    String id = (String)session.getAttribute("memId");
	    String res_start_date = request.getParameter("res_start_date");
	    String res_end_date = request.getParameter("res_end_date");
	    String res_region = request.getParameter("res_region");
	    String res_spot = request.getParameter("res_spot");
	    String yangdo_kind = request.getParameter("yangdo_kind");
	    String res_seat = request.getParameter("res_seat");
	    String res_price = request.getParameter("res_price");
	    String res_total = request.getParameter("res_total");
	    String yangdo_due_date = request.getParameter("yangdo_due_date");
	    String yangdo_price = request.getParameter("yangdo_price");
	    String yangdo_fee = request.getParameter("yangdo_fee");
	    String yangdo_total_price = request.getParameter("yangdo_total_price");
	    String yangdo_reason = request.getParameter("yangdo_reason");
	    String yangdo_res_count = request.getParameter("yangdo_res_count");
	    String yangdo_people = request.getParameter("yangdo_people");
	   
	    // DB
	    YangdoDTO dto = new YangdoDTO();
	    dto.setId(id);
	    dto.setRes_start_date(res_start_date);
	    dto.setRes_end_date(res_end_date);
	    dto.setRes_region(res_region);
	    dto.setRes_spot(res_spot);
	    dto.setYangdo_kind(yangdo_kind);
	    dto.setRes_seat(res_seat);
	    dto.setRes_price(res_price);
	    dto.setRes_total(res_total);
	    dto.setYangdo_due_date(yangdo_due_date);
	    dto.setYangdo_price(yangdo_price);
	    dto.setYangdo_fee(yangdo_fee);
	    dto.setYangdo_total_price(yangdo_total_price);
	    dto.setYangdo_reason(yangdo_reason);
	    dto.setYangdo_res_count(yangdo_res_count);
	    dto.setYangdo_people(yangdo_people);
	    
	    int su = yangdoService.yangdoWrite(dto);
	    
	    request.setAttribute("su", su);
	    request.setAttribute("yangdo_kind", yangdo_kind);

	    request.setAttribute("req","/yangdo/yangdoWrite.jsp");
	    
	    return "../main/index.jsp";
	}
	
	@RequestMapping(value = "/yangdo/yangdoList.do")
	public String yangdoList(HttpServletRequest request) {
		// 데이터 처리
		int pg = 1;
		if (request.getParameter("pg") != null) {
			pg = Integer.parseInt(request.getParameter("pg"));
		}
		String yangdo_kind = "모텔";
		if (request.getParameter("yangdo_kind") != null) {
			yangdo_kind = request.getParameter("yangdo_kind");
		}
		int my = 0;
		String id = "";
		if (request.getParameter("my") != null) {
			my = Integer.parseInt(request.getParameter("my"));
			HttpSession session = request.getSession();
			id = (String) session.getAttribute("memId");
		}
		String yangdo_due_date = request.getParameter("yangdo_due_date");
		
		// DB
		int totalA = 0;
		if (my == 1) totalA = yangdoService.getMyTotalA(id);
		else totalA = yangdoService.getTotalA(yangdo_kind);
		
		int totalPage = (totalA + 4) / 5;
		if (pg > totalPage)
			pg = totalPage;

		int startPage = (pg - 1) / 3 * 3 + 1;
		int endPage = startPage + 2;
		if (endPage > totalPage) {
			endPage = totalPage;
		}
		
		int endNum = pg * 5;
		int startNum = endNum - 4;
		
		List<YangdoDTO> list = null;
		if (my == 1) list = yangdoService.myYangdoList(startNum, endNum, id);
		else list = yangdoService.yangdoList(startNum, endNum, yangdo_kind);
		
		int result = yangdoService.ListRerrange();
		
		
		// 데이터 공유 & 화면 네비게이션
		if (list != null) {
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("list", list);
			request.setAttribute("pg", pg);
			request.setAttribute("yangdo_kind", yangdo_kind);

			if (my == 1) request.setAttribute("req","../member/myYangdoList.jsp");
			else {
				request.setAttribute("req","/yangdo/yangdoList.jsp");
				if (totalA == 0) {
					request.setAttribute("req", "/yangdo/yangdoEmptyList.jsp");
				}
			}
			
			return "../main/index.jsp";
		}
		return null;
	}
	
	@RequestMapping(value = "/yangdo/yangdoView.do")
	public String yangdoView(HttpServletRequest request) {
		int seq = Integer.parseInt(request.getParameter("seq"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		yangdoService.yangdoView(seq);
		YangdoDTO dto = yangdoService.yangdoView(seq);
		
		request.setAttribute("dto", dto);
		request.setAttribute("pg", pg);
		
		request.setAttribute("req","/yangdo/yangdoView.jsp");
		
		return "../main/index.jsp";
	}
	
	@RequestMapping(value= "/yangdo/yangdoModifyForm.do")
	public String yangdoModifyForm(HttpServletRequest request) {
		int seq = Integer.parseInt(request.getParameter("seq"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
	   	YangdoDTO dto = yangdoService.yangdoView(seq);
	   	
	   	request.setAttribute("dto", dto);
		request.setAttribute("pg", pg);
	   	
		request.setAttribute("req", "/yangdo/yangdoModifyForm.jsp");

		return "../main/index.jsp";
	}
	
	@RequestMapping(value= "/yangdo/yangdoModify.do")
	public String yangdoModify(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		int seq = Integer.parseInt(request.getParameter("seq"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
	    //String id = (String)session.getAttribute("memId");
	    String res_start_date = request.getParameter("res_start_date");
	    String res_end_date = request.getParameter("res_end_date");
	    String res_region = request.getParameter("res_region");
	    String res_spot = request.getParameter("res_spot");
	    String yangdo_kind = request.getParameter("yangdo_kind");
	    String res_seat = request.getParameter("res_seat");
	    String res_price = request.getParameter("res_price");
	    String res_total = request.getParameter("res_total");
	    String yangdo_due_date = request.getParameter("yangdo_due_date");
	    String yangdo_price = request.getParameter("yangdo_price");
	    String yangdo_fee = request.getParameter("yangdo_fee");
	    String yangdo_total_price = request.getParameter("yangdo_total_price");
	    String yangdo_reason = request.getParameter("yangdo_reason");
	    String yangdo_res_count = request.getParameter("yangdo_res_count");
	    String yangdo_people = request.getParameter("yangdo_people");
	    
	    // DB
	    YangdoDTO dto = new YangdoDTO();
	    //dto.setId(id);
	    dto.setSeq(seq);
	    dto.setRes_start_date(res_start_date);
	    dto.setRes_end_date(res_end_date);
	    dto.setRes_region(res_region);
	    dto.setRes_spot(res_spot);
	    dto.setYangdo_kind(yangdo_kind);
	    dto.setRes_seat(res_seat);
	    dto.setRes_price(res_price);
	    dto.setRes_total(res_total);
	    dto.setYangdo_due_date(yangdo_due_date);
	    dto.setYangdo_price(yangdo_price);
	    dto.setYangdo_fee(yangdo_fee);
	    dto.setYangdo_total_price(yangdo_total_price);
	    dto.setYangdo_reason(yangdo_reason);
	    dto.setYangdo_res_count(yangdo_res_count);
	    dto.setYangdo_people(yangdo_people);
	    
	    int su = yangdoService.yangdoModify(dto);
	    
	    request.setAttribute("seq", seq);
	    request.setAttribute("pg", pg);
	    request.setAttribute("su", su);

	    request.setAttribute("req","/yangdo/yangdoModify.jsp");
	    
	    return "../main/index.jsp";
	}
	
	@RequestMapping(value= "/yangdo/yangdoPayForm.do")
	public String yangdoPayForm(HttpServletRequest request) {
		int seq = Integer.parseInt(request.getParameter("seq"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		String id = request.getParameter("id");
		
		YangdoDTO dto = yangdoService.yangdoView(seq);
		
		request.setAttribute("dto", dto);
		request.setAttribute("pg", pg);
		request.setAttribute("id", id);
		request.setAttribute("seq", seq);

	    request.setAttribute("req","/yangdo/yangdoPayForm.jsp");
	    
	    return "../main/index.jsp";
	}
	
	@RequestMapping(value= "/yangdo/yangdoPay.do")
	public String yangdoPay(HttpServletRequest request) {
		int seq = Integer.parseInt(request.getParameter("seq"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
	    //String id = (String)session.getAttribute("memId");
		String id = request.getParameter("id");
	    String res_start_date = request.getParameter("res_start_date");
	    String res_end_date = request.getParameter("res_end_date");
	    String res_region = request.getParameter("res_region");
	    String res_spot = request.getParameter("res_spot");
	    String yangdo_kind = request.getParameter("yangdo_kind");
	    String res_seat = request.getParameter("res_seat");
	    String res_price = request.getParameter("res_price");
	    String res_total = request.getParameter("res_total");
	    String yangdo_due_date = request.getParameter("yangdo_due_date");
	    String yangdo_price = request.getParameter("yangdo_price");
	    String yangdo_fee = request.getParameter("yangdo_fee");
	    String yangdo_total_price = request.getParameter("yangdo_total_price");
	    String yangdo_reason = request.getParameter("yangdo_reason");
	    String yangdo_res_count = request.getParameter("yangdo_res_count");
	    String yangdo_people = request.getParameter("yangdo_people");
	    
	    // DB
	    YangdoDTO dto = new YangdoDTO();
	    dto.setId(id);
	    dto.setSeq(seq);
	    dto.setRes_start_date(res_start_date);
	    dto.setRes_end_date(res_end_date);
	    dto.setRes_region(res_region);
	    dto.setRes_spot(res_spot);
	    dto.setYangdo_kind(yangdo_kind);
	    dto.setRes_seat(res_seat);
	    dto.setRes_price(res_price);
	    dto.setRes_total(res_total);
	    dto.setYangdo_due_date(yangdo_due_date);
	    dto.setYangdo_price(yangdo_price);
	    dto.setYangdo_fee(yangdo_fee);
	    dto.setYangdo_total_price(yangdo_total_price);
	    dto.setYangdo_reason(yangdo_reason);
	    dto.setYangdo_res_count(yangdo_res_count);
	    dto.setYangdo_people(yangdo_people);
		
	    int su_take = yangdoService.yangdoPayTake(dto);
	   	int su_give = yangdoService.yangdoPayGive(seq);
	   	
	   	request.setAttribute("su_give", su_give);
	   	request.setAttribute("su_take", su_take);
		request.setAttribute("pg", pg);
	   	
		request.setAttribute("req", "/yangdo/yangdoPay.jsp");

		return "../main/index.jsp";
	}
	
	@RequestMapping(value= "/yangdo/yangdoPayGive.do")
	public String yangdoPayGive(HttpServletRequest request) {
		
		int seq = Integer.parseInt(request.getParameter("seq"));
				
	    int su_give = yangdoService.yangdoPayGive(seq);
	   	
	   	request.setAttribute("su_give", su_give);
	   	request.setAttribute("seq", seq);
	   	
		request.setAttribute("req", "/yangdo/yangdoPay.jsp");

		return "../main/index.jsp";
	}
	
	@RequestMapping(value= "/yangdo/yangdoPayTake.do")
	public String yangdoPayTake(HttpServletRequest request) {
		int seq = Integer.parseInt(request.getParameter("seq"));
		
	    //String id = (String)session.getAttribute("memId");
		String id = request.getParameter("id");
	    String res_start_date = request.getParameter("res_start_date");
	    String res_end_date = request.getParameter("res_end_date");
	    String res_region = request.getParameter("res_region");
	    String res_spot = request.getParameter("res_spot");
	    String yangdo_kind = request.getParameter("yangdo_kind");
	    String res_seat = request.getParameter("res_seat");
	    String res_price = request.getParameter("res_price");
	    String res_total = request.getParameter("res_total");
	    String yangdo_due_date = request.getParameter("yangdo_due_date");
	    String yangdo_price = request.getParameter("yangdo_price");
	    String yangdo_fee = request.getParameter("yangdo_fee");
	    String yangdo_total_price = request.getParameter("yangdo_total_price");
	    String yangdo_reason = request.getParameter("yangdo_reason");
	    String yangdo_res_count = request.getParameter("yangdo_res_count");
	    String yangdo_people = request.getParameter("yangdo_people");
	    	    
	    // DB
	    YangdoDTO dto = new YangdoDTO();
	    dto.setId(id);
	    dto.setSeq(seq);
	    dto.setRes_start_date(res_start_date);
	    dto.setRes_end_date(res_end_date);
	    dto.setRes_region(res_region);
	    dto.setRes_spot(res_spot);
	    dto.setYangdo_kind(yangdo_kind);
	    dto.setRes_seat(res_seat);
	    dto.setRes_price(res_price);
	    dto.setRes_total(res_total);
	    dto.setYangdo_due_date(yangdo_due_date);
	    dto.setYangdo_price(yangdo_price);
	    dto.setYangdo_fee(yangdo_fee);
	    dto.setYangdo_total_price(yangdo_total_price);
	    dto.setYangdo_reason(yangdo_reason);
	    dto.setYangdo_res_count(yangdo_res_count);
	    dto.setYangdo_people(yangdo_people);
		
	    int su_take = yangdoService.yangdoPayTake(dto);
	   	
	   	request.setAttribute("su_take", su_take);
	   	request.setAttribute("dto", dto);
	   	request.setAttribute("seq", seq);
	   	
	   	
		request.setAttribute("req", "/yangdo/yangdoPayGive.jsp");

		return "../main/index.jsp";
	}
	
	@RequestMapping(value= "/yangdo/yangdoDelete.do")
	public String yangdoDelete(HttpServletRequest request) {
		int seq = Integer.parseInt(request.getParameter("seq"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
	   	int su = yangdoService.yangdoDelete(seq);
	   	
	   	request.setAttribute("su", su);
		request.setAttribute("pg", pg);
	   	
		request.setAttribute("req", "/yangdo/yangdoDelete.jsp");

		return "../main/index.jsp";
	}
}
