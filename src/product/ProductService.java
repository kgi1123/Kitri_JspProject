package product;

import java.util.ArrayList;

public interface ProductService {
	void addProduct(Product p);
	void editProduct(Product p);
	void delProduct(int p_num);
	void updateHits(int num);
	Product getProduct(int p_num);
	ArrayList<Product> getAll(int optionVal, int p_cate1, int p_cate2);
	ArrayList<Product> getByTitle(String p_title);
	ArrayList<Product> getBySeller(String p_writer);
	
}
