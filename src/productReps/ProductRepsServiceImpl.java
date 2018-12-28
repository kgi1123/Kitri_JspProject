package productReps;

import java.util.ArrayList;

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

	@Override
	public void deleteReps(int num, String writer) {
		dao.deleteReps(num, writer);
	}

	@Override
	public int prepsRecSelect(int p_num) {
		return dao.prepsRecSelect(p_num);
	}

	@Override
	public void prepsRecAdd(int preps_num, int preps_rec) {
		dao.prepsRecAdd(preps_num, preps_rec);
	}

	@Override
	public ArrayList<ProductReps> pdrListSelect(int num) {
		return dao.pdrListSelect(num);
	}
}
