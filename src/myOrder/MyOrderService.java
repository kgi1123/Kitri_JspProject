package myOrder;

import java.util.ArrayList;

public interface MyOrderService {
	void addMyOrder(MyOrder mo);
	ArrayList<MyOrder> selectByO_Buyer(String o_buyer);
}
