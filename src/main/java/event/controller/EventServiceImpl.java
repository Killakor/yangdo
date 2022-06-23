package event.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import event.dao.EventDAO;
import event.dto.EventDTO;

@Service
public class EventServiceImpl implements EventService{
	
	@Autowired
	private EventDAO eventDAO;

	@Override
	public List<EventDTO> eventList(int startNum, int endNum) {
		return eventDAO.eventList(startNum, endNum);
	}

	@Override
	public int getTotalA() {
		return eventDAO.getTotalA();
	}

	@Override
	public EventDTO eventView(int event_num) {
		return eventDAO.eventView(event_num);
	}

	@Override
	public int eventWrite(EventDTO dto) {
		return eventDAO.eventWrite(dto);
	}

	@Override
	public int delete(int event_num) {
		return eventDAO.delete(event_num);
	}

	@Override
	public int eventModify(EventDTO dto) {
		return eventDAO.eventModify(dto);
	}
}
