package yangdo.bean;

public class YangdoDTO {
	private int seq;					// -- 글번호
    private String id;            		// -- 아이디
    private String res_start_date;      // -- 예약 시작 일자
    private String res_end_date;      	// -- 예약 종료 일자
    private String res_region;    		// -- 예약 지역
    private String yangdo_kind;			// -- 예약 종류
    private String res_spot;      		// -- 예약한 장소
    private String res_seat;      		// -- 예약 좌석 or 방 종류 등
    private String res_price;        		// -- 원래 예약한 금액
    private String res_total;        		// -- 총 이용금액
    private String yangdo_due_date;        		// -- 양도 마감일
    private String yangdo_price;     		// -- 양도 금액
    private String yangdo_fee;				// -- 양도 수수료(5%)
    private String yangdo_total_price;		// -- 양도 성사시 환불금액
    private String yangdo_status; 		// -- 양도 상태
    private String yangdo_reason; 		// -- 양도 사유
    private String yangdo_res_count; 	// -- 예약 수
    private String yangdo_people;  		//-- 예약 인원
    
    
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRes_start_date() {
		return res_start_date;
	}
	public void setRes_start_date(String res_start_date) {
		this.res_start_date = res_start_date;
	}
	public String getRes_end_date() {
		return res_end_date;
	}
	public void setRes_end_date(String res_end_date) {
		this.res_end_date = res_end_date;
	}
	public String getRes_region() {
		return res_region;
	}
	public void setRes_region(String res_region) {
		this.res_region = res_region;
	}
	public String getYangdo_kind() {
		return yangdo_kind;
	}
	public void setYangdo_kind(String yangdo_kind) {
		this.yangdo_kind = yangdo_kind;
	}
	public String getRes_spot() {
		return res_spot;
	}
	public void setRes_spot(String res_spot) {
		this.res_spot = res_spot;
	}
	public String getRes_seat() {
		return res_seat;
	}
	public void setRes_seat(String res_seat) {
		this.res_seat = res_seat;
	}
	public String getRes_price() {
		return res_price;
	}
	public void setRes_price(String res_price) {
		this.res_price = res_price;
	}
	public String getRes_total() {
		return res_total;
	}
	public void setRes_total(String res_total) {
		this.res_total = res_total;
	}
	public String getYangdo_due_date() {
		return yangdo_due_date;
	}
	public void setYangdo_due_date(String yangdo_due_date) {
		this.yangdo_due_date = yangdo_due_date;
	}
	public String getYangdo_price() {
		return yangdo_price;
	}
	public void setYangdo_price(String yangdo_price) {
		this.yangdo_price = yangdo_price;
	}
	public String getYangdo_fee() {
		return yangdo_fee;
	}
	public void setYangdo_fee(String yangdo_fee) {
		this.yangdo_fee = yangdo_fee;
	}
	public String getYangdo_total_price() {
		return yangdo_total_price;
	}
	public void setYangdo_total_price(String yangdo_total_price) {
		this.yangdo_total_price = yangdo_total_price;
	}
	public String getYangdo_status() {
		return yangdo_status;
	}
	public void setYangdo_status(String yangdo_status) {
		this.yangdo_status = yangdo_status;
	}
	public String getYangdo_reason() {
		return yangdo_reason;
	}
	public void setYangdo_reason(String yangdo_reason) {
		this.yangdo_reason = yangdo_reason;
	}
	public String getYangdo_res_count() {
		return yangdo_res_count;
	}
	public void setYangdo_res_count(String yangdo_res_count) {
		this.yangdo_res_count = yangdo_res_count;
	}
	public String getYangdo_people() {
		return yangdo_people;
	}
	public void setYangdo_people(String yangdo_people) {
		this.yangdo_people = yangdo_people;
	}
	
}
