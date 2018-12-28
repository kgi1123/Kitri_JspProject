package productReps;

import java.util.ArrayList;

public interface ProductRepsService {

	void addProductReps(ProductReps pdr);

	ProductReps searchPdrCheck(int product_num, String p_writer);

	void updatePdr(ProductReps prd);

	void deleteReps(int num, String writer);

	int prepsRecSelect(int p_num);

	void prepsRecAdd(int preps_num, int preps_rec);

	ArrayList<ProductReps> pdrListSelect(int num);

}
