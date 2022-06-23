package notice.controller;

import java.util.List;

import notice.dto.NoticeDTO;

public interface NoticeService {
	
	// 10개씩 목록보기
	public List<NoticeDTO> noticeListAndView(int startNum, int endNum);
		
	// 총 데이터수 구하기
	public int getTotalA();
	
	// 글쓰기
	public int noticeWrite(NoticeDTO dto);
	
	// 게시글 삭제하기
	public int delete(int notice_num);

	// 글수정
	public int noticeModify(NoticeDTO dto);
	
	// 상세보기
	public NoticeDTO noticeView(int notice_num);
}
