package productReps;

public class ProductRepsServiceImpl implements ProductRepsService {
	private ProductRepsDao dao;
	
	public ProductRepsServiceImpl(ProductRepsDao dao) {
		this.dao = dao;
	}

	@Override
	public void addProductReps(ProductReps pdr) {
		dao.addProductReps(pdr);
	}

	@Override
	public ProductReps searchPdrCheck(int product_num, String p_writer) {
		return dao.selectReps(product_num, p_writer);
	}

	@Override
	public void updatePdr(ProductReps pdr) {
		dao.updatePdr(pdr);
	}
}
