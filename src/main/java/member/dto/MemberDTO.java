package member.dto;

public class MemberDTO {
    private String name;		//-- 이름 
    private String id;    		//-- 아이디
    private String pwd;      	//-- 비밀번호
    private String nickname; 	//-- 닉네임
    private String email1;       //-- 이메일
    private String email2;       //-- 이메일
    private String tel;         //-- 전화번호
    private String post;        //-- 우편
    private String addr1;       //-- 도로명 주소
    private String addr2;       //-- 세부 주소
    private int grade;          //-- 회원 등급(0: 관리자, 1: 일반회원, 99: 관리회원)
    private String logtime;     //-- 가입 날짜
	
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
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getLogtime() {
		return logtime;
	}
	public void setLogtime(String logtime) {
		this.logtime = logtime;
	}
	
      
    
    
}
