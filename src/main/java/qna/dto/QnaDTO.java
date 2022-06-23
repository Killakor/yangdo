package qna.dto;

public class QnaDTO {
    private int qna_num;				// QnA 글번호
    private String name;         		// 이름 
    private String id;              	// 아이디
    private int grade;					// 회원 등급(0: 관리자, 1: 일반회원)
    private String qna_type;	    	// QnA 문의 유형
    private String qna_category;    	// QnA 카테고리
    private int qna_result;           	// QnA 답변 여부
    private String qna_subject;         // QnA 제목
    private String qna_content;     	// QnA 내용
    private String qna_logtime;         // QnA 작성일
    private String qna_reply;           // QnA 답변
    private String qna_redate;          // QnA 답변 작성일
    private int qna_public;             // QnA 공개여부
    
	public int getQna_num() {
		return qna_num;
	}
	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;
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
	public String getQna_type() {
		return qna_type;
	}
	public void setQna_type(String qna_type_1d) {
		this.qna_type = qna_type_1d;
	}
	public String getQna_category() {
		return qna_category;
	}
	public void setQna_category(String qna_category) {
		this.qna_category = qna_category;
	}
	public int getQna_result() {
		return qna_result;
	}
	public void setQna_result(int qna_result) {
		this.qna_result = qna_result;
	}
	public String getQna_subject() {
		return qna_subject;
	}
	public void setQna_subject(String qna_subject) {
		this.qna_subject = qna_subject;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public String getQna_logtime() {
		return qna_logtime;
	}
	public void setQna_logtime(String qna_logtime) {
		this.qna_logtime = qna_logtime;
	}
	public String getQna_reply() {
		return qna_reply;
	}
	public void setQna_reply(String qna_reply) {
		this.qna_reply = qna_reply;
	}
	public String getQna_redate() {
		return qna_redate;
	}
	public void setQna_redate(String qna_redate) {
		this.qna_redate = qna_redate;
	}
	public int getQna_public() {
		return qna_public;
	}
	public void setQna_public(int qna_public) {
		this.qna_public = qna_public;
	}
    
}
