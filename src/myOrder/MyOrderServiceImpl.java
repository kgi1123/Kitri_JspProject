package myOrder;

import java.util.ArrayList;

public class MyOrderServiceImpl implements MyOrderService{
	private MyOrderDao dao;
	
	public MyOrderServiceImpl(MyOrderDao dao) {
		this.dao = dao;
	}
	
	@Override
	public void addMyOrder(MyOrder mo) {
		dao.insert(mo);
	}

	@Override
	public ArrayList<MyOrder> selectByO_Buyer(String o_buyer) {
		return dao.selectByO_buyer(o_buyer);
	}

}
