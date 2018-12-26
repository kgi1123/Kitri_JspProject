package notice;

import java.util.ArrayList;

public class NoticeServiceImpl implements NoticeService {
	private NoticeDAO dao;
	public NoticeServiceImpl(NoticeDAO dao) {
		this.dao = dao;
	}
	@Override
	public void addNotice(Notice n) {
		// TODO Auto-generated method stub
		dao.insert(n);
	}

	@Override
	public Notice getNotice(int num) {
		// TODO Auto-generated method stub
		return dao.select(num);
	}

	@Override
	public ArrayList<Notice> getAll() {
		// TODO Auto-generated method stub
		return dao.selectAll();
	}

	@Override
	public void editNotice(Notice n) {
		// TODO Auto-generated method stub
		dao.update(n);
	}

	@Override
	public void delNotice(int num) {
		// TODO Auto-generated method stub
		dao.delete(num);
	}

	@Override
	public int countUseImg(String path, int num) {
		// TODO Auto-generated method stub
		return dao.countUseImg(path, num);
	}
	@Override
	public void updateHits(int num) {
		// TODO Auto-generated method stub
		dao.updateHits(num);
	}

}
