package cart;

import java.util.ArrayList;

public interface CartDao {
	void insert(Cart c);
	void delete(int cart_num);
	ArrayList<Cart> selectAll();
}
