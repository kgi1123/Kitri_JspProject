package cate;

import java.util.ArrayList;

public interface Service {
	ArrayList<Cate> getCates(int parent, String table);
	Cate getCate(int num, String table);
	void delCate(int num, String table);
}
