package productReps;

public interface ProductRepsDao {

	void addProductReps(ProductReps pdr);

	ProductReps selectReps(int product_num, String p_writer);

	void updatePdr(ProductReps pdr);

}
