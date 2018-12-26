package notice;

import java.sql.Date;

public class Notice {
	private int n_num; //공지사항 글번호
	private String n_writer; //공지사항 작성자
	private String n_title; //공지사항 제목
	private Date n_date; //날짜
	private int n_hits; //조회수
	private String n_content; //공지사항 내용
	private String n_img; //이미지
	
	public Notice() {}
	public Notice(int n_num, String n_writer, String n_title, Date n_date, 
					int n_hits, String n_content, String n_img) {
		this.n_num = n_num;
		this.n_writer = n_writer;
		this.n_title = n_title;
		this.n_date = n_date;
		this.n_hits = n_hits;
		this.n_content = n_content;
		this.n_img = n_img;
	}
	@Override
	public String toString() {
		return "Notice [n_num=" + n_num + ", n_writer=" + n_writer 
				+ ", n_title=" + n_title + ", n_date=" + n_date
				+ ", n_hits=" + n_hits + ", n_content=" + n_content 
				+ ", n_img=" + n_img + "]";
	}
	public int getN_num() {
		return n_num;
	}
	public void setN_num(int n_num) {
		this.n_num = n_num;
	}
	public String getN_writer() {
		return n_writer;
	}
	public void setN_writer(String n_writer) {
		this.n_writer = n_writer;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public Date getN_date() {
		return n_date;
	}
	public void setN_date(Date n_date) {
		this.n_date = n_date;
	}
	public int getN_hits() {
		return n_hits;
	}
	public void setN_hits(int n_hits) {
		this.n_hits = n_hits;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public String getN_img() {
		return n_img;
	}
	public void setN_img(String n_img) {
		this.n_img = n_img;
	}
	
	
}
