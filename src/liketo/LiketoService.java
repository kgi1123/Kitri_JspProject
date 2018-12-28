package liketo;

import java.util.ArrayList;

public interface LiketoService {

	ArrayList<Liketo> liketoSelectList();

	Liketo liketoSelect(int preps_num, String m_id);

	void likeInsert(int preps_num, String m_id);

	void likeUpdate(int preps_num, String m_id);

	void liketoSub(int preps_num, String m_id);
}
