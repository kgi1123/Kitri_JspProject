package member;

public class Member {
	private String m_id;
	private String m_pwd;
	private String m_name;
	private String m_phone;
	private int m_postNum;
	private String m_address;
	private String m_email;
	private int m_type;
	
	public Member() {}
	public Member(String m_id, String m_pwd, String m_name, String m_phone, int m_postNum, String m_address, String m_email, int m_type) {
		this.m_id = m_id;
		this.m_pwd = m_pwd;
		this.m_name = m_name;
		this.m_phone = m_phone;
		this.m_postNum = m_postNum;
		this.m_address = m_address;
		this.m_email = m_email;
		this.m_type = m_type;
	}
	
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pwd() {
		return m_pwd;
	}
	public void setM_pwd(String m_pwd) {
		this.m_pwd = m_pwd;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public int getM_postNum() {
		return m_postNum;
	}
	public void setM_postNum(int m_postNum) {
		this.m_postNum = m_postNum;
	}
	public String getM_address() {
		return m_address;
	}
	public void setM_address(String m_address) {
		this.m_address = m_address;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public int getM_type() {
		return m_type;
	}
	public void setM_type(int m_type) {
		this.m_type = m_type;
	}
	
	@Override
	public String toString() {
		return "Member [m_id=" + m_id + ", m_pwd=" + m_pwd + ", m_name=" + m_name + ", m_phone=" + m_phone
				+ ", m_address=" + m_address + ", m_email=" + m_email + "]";
	}
}
