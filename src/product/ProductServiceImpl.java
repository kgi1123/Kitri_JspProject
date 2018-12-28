package product;

import java.util.ArrayList;

import productReps.ProductReps;

public class ProductServiceImpl implements ProductService{
	private ProductDao dao;
	public ProductServiceImpl(ProductDao dao) {
		this.dao = dao;
	}
	
	@Override
	public void addProduct(Product p) {
		dao.insert(p);
	}
	@Override
	public void editProduct(Product p) {
		dao.update(p);
	}
	@Override
	public void delProduct(int p_num) {
		dao.delete(p_num);
	}
	@Override
	public Product getProduct(int p_num) {
		return dao.select(p_num);
	}
	@Override
	public ArrayList<Product> getAll(int optionVal, int p_cate1, int p_cate2) {		// option value ���ڰ����� �;ߵ�
		return dao.selectAll(optionVal, p_cate1, p_cate2);
	}
	@Override
	public ArrayList<Product> getByTitle(String p_title) {
		return dao.selectByTitle(p_title);
	}
	@Override
	public ArrayList<Product> getBySeller(String p_writer) {
		return dao.selectBySeller(p_writer);
	}

	@Override
	public void updateHits(int num) {
		// TODO Auto-generated method stub
		dao.updateHits(num);
	}
}
