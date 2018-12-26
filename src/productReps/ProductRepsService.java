package productReps;

public interface ProductRepsService {

	void addProductReps(ProductReps pdr);

	ProductReps searchPdrCheck(int product_num, String p_writer);

	void updatePdr(ProductReps prd);

}
