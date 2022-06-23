package notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import notice.dao.NoticeDAO;
import notice.dto.NoticeDTO;

@Service
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	private NoticeDAO noticeDAO;

	@Override
	public List<NoticeDTO> noticeListAndView(int startNum, int endNum) {
		return noticeDAO.noticeListAndView(startNum, endNum);
	}
	
	@Override
	public int getTotalA() {
		return noticeDAO.getTotalA();
	}

	@Override
	public int noticeWrite(NoticeDTO dto) {
		return noticeDAO.noticeWrite(dto);
	}

	@Override
	public int delete(int notice_num) {
		return noticeDAO.delete(notice_num);
	}

	@Override
	public int noticeModify(NoticeDTO dto) {
		return noticeDAO.noticeModify(dto);
	}

	@Override
	public NoticeDTO noticeView(int notice_num) {
		return noticeDAO.noticeView(notice_num);
	}

}
