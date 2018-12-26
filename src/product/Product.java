package product;

import java.sql.Date;

public class Product {
	private int p_num;
	private String p_writer;
	private String p_name;
	private Date p_date;
	private int p_hits;	// 조회수
	private String p_contents;
	private String p_img1;
	private int p_price;
	private int p_quantity;
	private double p_eval;		// 별점 평균값
	private int p_cate1;
	private int p_cate2;
	private String p_img2;
	
	public Product() {}
	public Product(int p_num, String p_writer, String p_name, Date p_date, 
					int p_hits, String p_contents, String p_img1, int p_price, 
					int p_quantity, double p_eval, int p_cate1, int p_cate2, 
					String p_img2) {
		this.p_num = p_num;
		this.p_writer = p_writer;
		this.p_name = p_name;
		this.p_date = p_date;
		this.p_hits = p_hits;
		this.p_contents = p_contents;
		this.p_img1 = p_img1;
		this.p_price = p_price;
		this.p_quantity = p_quantity;
		this.p_eval = p_eval;
		this.p_cate1 = p_cate1;
		this.p_cate2 = p_cate2;
		this.p_img2 = p_img2;
	}
	
	@Override
	public String toString() {
		return "Product [p_num=" + p_num + ", p_writer=" + p_writer + ", p_name=" + p_name + ", p_date=" + p_date
				+ ", p_hits=" + p_hits + ", p_contents=" + p_contents + ", p_img1=" + p_img1 + ", p_price=" + p_price
				+ ", p_quantity=" + p_quantity + ", p_eval=" + p_eval + ", p_cate1=" + p_cate1 + ", p_cate2=" + p_cate2
				+ ", p_img2=" + p_img2 + "]";
	}
	
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public String getP_writer() {
		return p_writer;
	}
	public void setP_writer(String p_writer) {
		this.p_writer = p_writer;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public Date getP_date() {
		return p_date;
	}
	public void setP_date(Date p_date) {
		this.p_date = p_date;
	}
	public int getP_hits() {
		return p_hits;
	}
	public void setP_hits(int p_hits) {
		this.p_hits = p_hits;
	}
	public String getP_contents() {
		return p_contents;
	}
	public void setP_contents(String p_contents) {
		this.p_contents = p_contents;
	}
	public String getP_img1() {
		return p_img1;
	}
	public void setP_img1(String p_img1) {
		this.p_img1 = p_img1;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public int getP_quantity() {
		return p_quantity;
	}
	public void setP_quantity(int p_quantity) {
		this.p_quantity = p_quantity;
	}
	public double getP_eval() {
		return p_eval;
	}
	public void setP_eval(double p_eval) {
		this.p_eval = p_eval;
	}
	public int getP_cate1() {
		return p_cate1;
	}
	public void setP_cate1(int p_cate1) {
		this.p_cate1 = p_cate1;
	}
	public int getP_cate2() {
		return p_cate2;
	}
	public void setP_cate2(int p_cate2) {
		this.p_cate2 = p_cate2;
	}
	public String getP_img2() {
		return p_img2;
	}
	public void setP_img2(String p_img2) {
		this.p_img2 = p_img2;
	}
	
	
}
