package productReps;

public class ProductReps {
	private int preps_num ;
	private int preps_p_num;
	private String preps_writer;
	private int preps_rec;
	private int preps_star;
	private String preps_img;
	private String preps_content;
	
	public ProductReps(int preps_num, int preps_p_num, String preps_writer, int preps_rec, int preps_star,
			String preps_img, String preps_content) {
		super();
		this.preps_num = preps_num;
		this.preps_p_num = preps_p_num;
		this.preps_writer = preps_writer;
		this.preps_rec = preps_rec;
		this.preps_star = preps_star;
		this.preps_img = preps_img;
		this.preps_content = preps_content;
	}

	public int getPreps_num() {
		return preps_num;
	}

	public void setPreps_num(int preps_num) {
		this.preps_num = preps_num;
	}

	public int getPreps_p_num() {
		return preps_p_num;
	}

	public void setPreps_p_num(int preps_p_num) {
		this.preps_p_num = preps_p_num;
	}

	public String getPreps_writer() {
		return preps_writer;
	}

	public void setPreps_writer(String preps_writer) {
		this.preps_writer = preps_writer;
	}

	public int getPreps_rec() {
		return preps_rec;
	}

	public void setPreps_rec(int preps_rec) {
		this.preps_rec = preps_rec;
	}

	public int getPreps_star() {
		return preps_star;
	}

	public void setPreps_star(int preps_star) {
		this.preps_star = preps_star;
	}

	public String getPreps_img() {
		return preps_img;
	}

	public void setPreps_img(String preps_img) {
		this.preps_img = preps_img;
	}

	public String getPreps_content() {
		return preps_content;
	}

	public void setPreps_content(String preps_content) {
		this.preps_content = preps_content;
	}

	@Override
	public String toString() {
		return "ProductReps [preps_num=" + preps_num + ", preps_p_num=" + preps_p_num + ", preps_writer=" + preps_writer
				+ ", preps_rec=" + preps_rec + ", preps_star=" + preps_star + ", preps_img=" + preps_img
				+ ", preps_content=" + preps_content + "]";
	}
}
