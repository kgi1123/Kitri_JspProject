package notice;

import java.util.ArrayList;

public interface NoticeService {
	void addNotice(Notice n);
	Notice getNotice(int num);
	ArrayList<Notice> getAll();
	void editNotice(Notice n);
	void delNotice(int num);
	int countUseImg(String path, int num);
	void updateHits(int num);
}
