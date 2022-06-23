package event.dto;

public class EventDTO {
    private int event_num;            // 이벤트 글번호
    private String name;              // 이름 
    private String id;                // 아이디
    private int grade;                // 회원 등급(0: 관리자, 1: 일반회원)
    private String event_image;       // 이벤트 이미지
    private String event_subject;     // 이벤트 제목
    private String event_start;       // 이벤트 시작일
    private String event_end;         // 이벤트 종료일
    private String event_content;     // 이벤트 내용
    private String event_logtime;     // 이벤트 작성일
    
	public int getEvent_num() {
		return event_num;
	}
	public void setEvent_num(int event_num) {
		this.event_num = event_num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getEvent_image() {
		return event_image;
	}
	public void setEvent_image(String event_image) {
		this.event_image = event_image;
	}
	public String getEvent_subject() {
		return event_subject;
	}
	public void setEvent_subject(String event_subject) {
		this.event_subject = event_subject;
	}
	public String getEvent_start() {
		return event_start;
	}
	public void setEvent_start(String event_start) {
		this.event_start = event_start;
	}
	public String getEvent_end() {
		return event_end;
	}
	public void setEvent_end(String event_end) {
		this.event_end = event_end;
	}
	public String getEvent_content() {
		return event_content;
	}
	public void setEvent_content(String event_content) {
		this.event_content = event_content;
	}
	public String getEvent_logtime() {
		return event_logtime;
	}
	public void setEvent_logtime(String event_logtime) {
		this.event_logtime = event_logtime;
	}
    
}
