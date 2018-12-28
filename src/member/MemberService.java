package member;

import java.util.ArrayList;

public interface MemberService {
	void join(Member m);
	boolean login(String id, String pwd);
	Member getMember(String id);
	void editInfo(Member m);
	void changePwd(String id, String pwd);
	void out(String id);	
	boolean check_id(String id);
	boolean check_email(String email);
	int get_type(String id);
	String check_type(int m_type);
	ArrayList<Member> getAll();
}
