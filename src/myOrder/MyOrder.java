package myOrder;

import java.sql.Date;

public class MyOrder {
	private int o_num;	// 주문번호
	private Date o_date;	// 주문날짜
	private String o_buyer;	// 구매자 아이디
	private String o_phone;	// 구매자 전화번호
	private String o_name;	// 구매자 이름(주문자 정보)
	private String o_recipient;	// 받는 사람
	private String o_address;	// 받는 사람 주소(우편번호 + 도로명 주소)
	private String o_goods;		// 물품명
	private String o_req;		// 배송시 요구사항
	private String o_pay;	// 결제상태
	private int o_qty;		// 주문수량
	private int o_p_num;	// 물품번호
	private int o_postnum;	// 받는 사람 우편번호
	private String o_seller; // 판매자
	private String p_img1;
	
	
	public MyOrder() {}
	public MyOrder(int o_num, Date o_date, String o_buyer, String o_phone, String o_name, String o_recipient,
			String o_address, String o_goods, String o_req, String o_pay, int o_qty, int o_p_num, int o_postnum, String o_seller) {
		this.o_num = o_num;
		this.o_date = o_date;
		this.o_buyer = o_buyer;
		this.o_phone = o_phone;
		this.o_name = o_name;
		this.o_recipient = o_recipient;
		this.o_address = o_address;
		this.o_goods = o_goods;
		this.o_req = o_req;
		this.o_pay = o_pay;
		this.o_qty = o_qty;
		this.o_p_num = o_p_num;
		this.o_postnum = o_postnum;
		this.o_seller = o_seller;
	}
	public MyOrder(String p_img1, String o_goods, String o_seller, String o_pay, Date o_date, int o_p_num) {
		this.p_img1 = p_img1;
		this.o_goods = o_goods;
		this.o_seller = o_seller;
		this.o_pay = o_pay;
		this.o_date = o_date;
		this.o_p_num = o_p_num;
	}
	
	public int getO_num() {
		return o_num;
	}
	public void setO_num(int o_num) {
		this.o_num = o_num;
	}
	public Date getO_date() {
		return o_date;
	}
	public void setO_date(Date o_date) {
		this.o_date = o_date;
	}
	public String getO_buyer() {
		return o_buyer;
	}
	public void setO_buyer(String o_buyer) {
		this.o_buyer = o_buyer;
	}
	public String getO_phone() {
		return o_phone;
	}
	public void setO_phone(String o_phone) {
		this.o_phone = o_phone;
	}
	public String getO_name() {
		return o_name;
	}
	public void setO_name(String o_name) {
		this.o_name = o_name;
	}
	public String getO_recipient() {
		return o_recipient;
	}
	public void setO_recipient(String o_recipient) {
		this.o_recipient = o_recipient;
	}
	public String getO_address() {
		return o_address;
	}
	public void setO_address(String o_address) {
		this.o_address = o_address;
	}
	public String getO_goods() {
		return o_goods;
	}
	public void setO_goods(String o_goods) {
		this.o_goods = o_goods;
	}
	public String getO_req() {
		return o_req;
	}
	public void setO_req(String o_req) {
		this.o_req = o_req;
	}
	public String getO_pay() {
		return o_pay;
	}
	public void setO_pay(String o_pay) {
		this.o_pay = o_pay;
	}
	public int getO_qty() {
		return o_qty;
	}
	public void setO_qty(int o_qty) {
		this.o_qty = o_qty;
	}
	public int getO_p_num() {
		return o_p_num;
	}
	public void setO_p_num(int o_p_num) {
		this.o_p_num = o_p_num;
	}
	public int getO_postnum() {
		return o_postnum;
	}
	public void setO_postnum(int o_postnum) {
		this.o_postnum = o_postnum;
	}
	public String getO_seller() {
		return o_seller;
	}
	public void setO_seller(String o_seller) {
		this.o_seller = o_seller;
	}
	public String getP_img1() {
		return p_img1;
	}
	public void setP_img1(String p_img1) {
		this.p_img1 = p_img1;
	}
	@Override
	public String toString() {
		return "MyOrder [o_num=" + o_num + ", o_date=" + o_date + ", o_buyer=" + o_buyer + ", o_phone=" + o_phone
				+ ", o_name=" + o_name + ", o_recipient=" + o_recipient + ", o_address=" + o_address + ", o_goods="
				+ o_goods + ", o_req=" + o_req + ", o_pay=" + o_pay + ", o_qty=" + o_qty + ", o_p_num=" + o_p_num
				+ ", o_postnum=" + o_postnum + ", o_seller=" + o_seller + "]";
	}
	
}
