package cate;

import java.util.ArrayList;

public interface Dao {
	Cate selectCate(int num, String table);
	ArrayList<Cate> selectAll(int parent, String table);
	void deleteCate(int num, String table);
}
