package liketo;

public class Liketo {
	int like_num;
	int like_preps_num;
	String like_m_id;
	int like_check;
	
	public Liketo(int like_num, int like_preps_num, String like_m_id, int like_check) {
		super();
		this.like_num = like_num;
		this.like_preps_num = like_preps_num;
		this.like_m_id = like_m_id;
		this.like_check = like_check;
	}

	public int getLike_num() {
		return like_num;
	}

	public void setLike_num(int like_num) {
		this.like_num = like_num;
	}

	public int getLike_preps_num() {
		return like_preps_num;
	}

	public void setLike_preps_num(int like_preps_num) {
		this.like_preps_num = like_preps_num;
	}

	public String getLike_m_id() {
		return like_m_id;
	}

	public void setLike_m_id(String like_m_id) {
		this.like_m_id = like_m_id;
	}

	public int getLike_check() {
		return like_check;
	}

	public void setLike_check(int like_check) {
		this.like_check = like_check;
	}

	@Override
	public String toString() {
		return "Liketo [like_num=" + like_num + ", like_preps_num=" + like_preps_num + ", like_m_id=" + like_m_id
				+ ", like_check=" + like_check + "]";
	}
}
