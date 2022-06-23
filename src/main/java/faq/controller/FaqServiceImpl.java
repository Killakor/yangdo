package faq.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import faq.dao.FaqDAO;
import faq.dto.FaqDTO;

@Service
public class FaqServiceImpl implements FaqService{
	@Autowired
	private FaqDAO faqDAO;

	@Override
	public List<FaqDTO> faqListAndView() {
		return faqDAO.faqListAndView();
	}

	@Override
	public int getTotalA() {
		return faqDAO.getTotalA();
	}

	@Override
	public int faqWrite(FaqDTO dto) {
		return faqDAO.faqWrite(dto);
	}

	@Override
	public int delete(int faq_num) {
		return faqDAO.delete(faq_num);
	}

	@Override
	public int faqModify(FaqDTO dto) {
		return faqDAO.faqModify(dto);
	}

	@Override
	public FaqDTO faqView(int faq_num) {
		return faqDAO.faqView(faq_num);
	}

}
