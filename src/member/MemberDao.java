package member;

import java.util.ArrayList;

public interface MemberDao {
	void insert(Member m);
	Member select(String id);
	void update(Member m);
	void delete(String id);
	boolean check_id(String id);
	String check_type(int m_type);
	int get_type(String id);
	ArrayList<Member> selectAll();
}
