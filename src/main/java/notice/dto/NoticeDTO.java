package notice.dto;

public class NoticeDTO {
    private int notice_num;				// 공지사항 글번호
    private String name;                // 이름 
    private String id;                  // 아이디
    private int grade;                  // 회원 등급(0: 관리자, 1: 일반회원)
    private String notice_subject;		// 공지사항 제목
    private String notice_content;		// 공지사항 내용
    private String notice_logtime;		// 공지사항 등록일
    
	public int getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
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
	public String getNotice_subject() {
		return notice_subject;
	}
	public void setNotice_subject(String notice_subject) {
		this.notice_subject = notice_subject;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getNotice_logtime() {
		return notice_logtime;
	}
	public void setNotice_logtime(String notice_logtime) {
		this.notice_logtime = notice_logtime;
	}
    
}
