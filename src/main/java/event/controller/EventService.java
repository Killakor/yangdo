package event.controller;

import java.util.List;

import event.dto.EventDTO;

public interface EventService {
	// 10개씩 목록보기
	public List<EventDTO> eventList(int startNum, int endNum);
	
	// 총 데이터수 구하기
	public int getTotalA();
	
	// 상세보기
	public EventDTO eventView(int event_num);
	
	// 글쓰기
	public int eventWrite(EventDTO dto);
	
	// 게시글 삭제하기
	public int delete(int event_num);
	
	// 글 수정
	public int eventModify(EventDTO dto);
	
}
