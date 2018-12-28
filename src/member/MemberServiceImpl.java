package member;

import java.util.ArrayList;

public class MemberServiceImpl implements MemberService {
	private MemberDao dao;

	public MemberServiceImpl(MemberDao dao) {
		this.dao = dao;
	}
	@Override
	public void join(Member m) {
		// TODO Auto-generated method stub
		dao.insert(m);
	}

	@Override
	public boolean login(String id, String pwd) {
		// TODO Auto-generated method stub
		Member m = getMember(id);
		if(m!=null && m.getM_pwd().equals(pwd)) {
			return true;
		}
		return false;
	}

	@Override
	public Member getMember(String id) {
		// TODO Auto-generated method stub
		return dao.select(id);
	}

	@Override
	public void editInfo(Member m) {
		// TODO Auto-generated method stub
		dao.update(m);
	}

	@Override
	public void changePwd(String id, String pwd) {
		// TODO Auto-generated method stub
		dao.updatePwd(id, pwd);
	}
	
	@Override
	public void out(String id) {
		// TODO Auto-generated method stub
		dao.delete(id);
	}
	@Override
	public boolean check_id(String id) {
		// TODO Auto-generated method stub
		return dao.check_id(id);
	}
	@Override
	public String check_type(int m_type) {
		// TODO Auto-generated method stub
		return dao.check_type(m_type);
	}
	@Override
	public boolean check_email(String email) {
		// TODO Auto-generated method stub
		return dao.check_email(email);
	}
	@Override
	public int get_type(String id) {
		// TODO Auto-generated method stub
		return dao.get_type(id);
	}
	@Override
	public ArrayList<Member> getAll() {
		// TODO Auto-generated method stub
		return dao.selectAll();
	}
}
