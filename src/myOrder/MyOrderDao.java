package myOrder;

import java.util.ArrayList;

public interface MyOrderDao {
	void insert(MyOrder mo);
	ArrayList<MyOrder> selectByO_buyer(String o_buyer);
}
