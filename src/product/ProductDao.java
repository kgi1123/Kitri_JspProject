package product;

import java.util.ArrayList;

import productReps.ProductReps;

public interface ProductDao {
	void insert(Product p);	// ��ǰ���
	void delete(int p_num);	// ��ǰ����
	void update(Product p);	// ��ǰ����
	Product select(int p_num);	// ��ǰ �󼼺���
	ArrayList<Product> selectAll(int optionVal, int p_cate1, int p_cate2);	// ��ϼ� ����
	ArrayList<Product> selectByTitle(String p_title);	// ��ǰ �˻�
	ArrayList<Product> selectBySeller(String p_writer);	// �Ǹ��� �˻�
	void updateHits(int num);
}
