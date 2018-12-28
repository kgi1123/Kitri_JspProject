package liketo;

import java.util.ArrayList;

public class LiketoServiceImpl implements LiketoService{
	private LiketoDao dao;
	
	public LiketoServiceImpl(LiketoDao dao) {
		this.dao = dao;
	}

	@Override
	public ArrayList<Liketo> liketoSelectList() {
		// TODO Auto-generated method stub
		return dao.liketoSelectList();
	}

	@Override
	public Liketo liketoSelect(int preps_num, String m_id) {
		return dao.liketoSelect(preps_num, m_id);
	}

	@Override
	public void likeInsert(int preps_num, String m_id) {
		dao.likeInsert(preps_num, m_id);
	}

	@Override
	public void likeUpdate(int preps_num, String m_id) {
		dao.likeUpdate(preps_num, m_id);
	}

	@Override
	public void liketoSub(int preps_num, String m_id) {
		dao.liketoSub(preps_num, m_id);
	}
}
