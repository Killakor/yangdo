package qna.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import qna.dao.QnaDAO;
import qna.dto.QnaDTO;

@Service
public class QnaServiceImpl implements QnaService{
	@Autowired
	private QnaDAO qnaDAO;

	@Override
	public List<QnaDTO> qnaListAndView(int startNum, int endNum) {
		return qnaDAO.qnaListAndView(startNum, endNum);
	}

	@Override
	public int getTotalA() {
		return qnaDAO.getTotalA();
	}

	@Override
	public int qnaWrite(QnaDTO dto) {
		return qnaDAO.qnaWrite(dto);
	}

	@Override
	public int qnaReply(QnaDTO dto) {
		return qnaDAO.QnaReply(dto);
	}

	@Override
	public int delete(int qna_num) {
		return qnaDAO.delete(qna_num);
	}

	@Override
	public int qnaModify(QnaDTO dto) {
		return qnaDAO.qnaModify(dto);
	}

	@Override
	public QnaDTO qnaView(int qna_num) {
		return qnaDAO.qnaView(qna_num);
	}

	@Override
	public int getMyTotalA(String id) {
		return qnaDAO.getMyTotalA(id);
	}

	@Override
	public List<QnaDTO> myQnaListAndView(int startNum, int endNum, String id) {
		return qnaDAO.myQnaListAndView(startNum, endNum, id);
	}

}
