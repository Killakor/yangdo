package faq.dto;

public class FaqDTO {
    private int faq_num;                 // FAQ 글번호
    private String name;                 // 이름 
    private String id;                   // 아이디
    private int grade;                   // 회원 등급(0: 관리자, 1: 일반회원)
    private int faq_category;         	 // FAQ 분류
    private String faq_subject;          // FAQ 제목
    private String faq_content;          // FAQ 내용
    
	public int getFaq_num() {
		return faq_num;
	}
	public void setFaq_num(int faq_num) {
		this.faq_num = faq_num;
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
	public int getFaq_category() {
		return faq_category;
	}
	public void setFaq_category(int faq_category) {
		this.faq_category = faq_category;
	}
	public String getFaq_subject() {
		return faq_subject;
	}
	public void setFaq_subject(String faq_subject) {
		this.faq_subject = faq_subject;
	}
	public String getFaq_content() {
		return faq_content;
	}
	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}
    
}
