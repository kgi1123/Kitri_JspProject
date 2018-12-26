package notice;

import java.util.ArrayList;


public interface NoticeDAO {
	void insert(Notice n);
	Notice select(int num);
	ArrayList<Notice> selectAll();
	void update(Notice n); // title, content¸¸ ¼öÁ¤
	void delete(int num);
	int countUseImg(String path, int num);
	void updateHits(int num);
}
